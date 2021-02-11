// Read an INI file into easy-to-access name/value pairs.

// inih and INIReader are released under the New BSD license (see LICENSE.txt).
// Go to the project home page for more info:
//
// https://github.com/benhoyt/inih

#pragma once

//Nonzero to allow multi-line value parsing, in the style of Python's
//configparser. If allowed, ini_parse() will call the handler with the same
//name for each subsequent line parsed.
#ifndef INI_ALLOW_MULTILINE
#define INI_ALLOW_MULTILINE 1
#endif

//Nonzero to allow a UTF-8 BOM sequence (0xEF 0xBB 0xBF) at the start of
//the file. See http://code.google.com/p/inih/issues/detail?id=21
#ifndef INI_ALLOW_BOM
#define INI_ALLOW_BOM 1
#endif

//Nonzero to allow inline comments (with valid inline comment characters
//specified by INI_INLINE_COMMENT_PREFIXES). Set to 0 to turn off and match
//Python 3.2+ configparser behaviour.
#ifndef INI_ALLOW_INLINE_COMMENTS
#define INI_ALLOW_INLINE_COMMENTS 1
#endif
#ifndef INI_INLINE_COMMENT_PREFIXES
#define INI_INLINE_COMMENT_PREFIXES ";#"
#endif

//Stop parsing on first error (default is to keep parsing).
#ifndef INI_STOP_ON_FIRST_ERROR
#define INI_STOP_ON_FIRST_ERROR 0
#endif

#if defined(_MSC_VER) && !defined(_CRT_SECURE_NO_WARNINGS)
#define _CRT_SECURE_NO_WARNINGS
#endif

#include <algorithm>
#include <map>
#include <string>
#include <vector>

// Read an INI file into easy-to-access name/value pairs. (Note that I've gone
// for simplicity here rather than speed, but it should be pretty decent.)
template <class COM1, class COM2>
class INIReader
{
private:
    enum
    {
        READ = 0,
        WRITE = 1,
    };
#ifdef _WIN32
    std::string line_break_ = "\r\n";
#else
    std::string line_break_ = "\n";
#endif
    std::vector<std::string> lines_, lines_section_;    //lines of the files, sections the lines belong to
    using values_type = std::map<std::string, std::map<std::string, std::string, COM2>, COM1>;
    int error_ = 0;
    values_type values_;

    //return value: the key has existed, 0 means it is a new key
    int valueHandler(const std::string& section, const std::string& key, const std::string& value)
    {
        int ret = values_[section].count(key);
        values_[section][key] = value;
        return ret;
    }

public:
    INIReader() {}

    // parse a given filename
    void loadFile(const std::string& filename)
    {
        FILE* fp = fopen(filename.c_str(), "rb");
        if (!fp)
        {
            fprintf(stderr, "Cannot open file %s\n", filename.c_str());
            return;
        }
        fseek(fp, 0, SEEK_END);
        int length = ftell(fp);
        fseek(fp, 0, 0);
        std::string str;
        str.resize(length, '\0');
        fread((void*)str.c_str(), length, 1, fp);
        fclose(fp);
        loadString(str);
    }

    // parse an ini string
    void loadString(const std::string& content)
    {
        line_break_ = "\n";
        int pos = content.find(line_break_, 1);
        if (pos != std::string::npos && pos < content.size())
        {
            if (content[pos - 1] == '\r')
            {
                line_break_ = "\r\n";
            }
            else if (content[pos + 1] == '\r')
            {
                line_break_ = "\n\r";
            }
        }
        error_ = ini_parse_content(content);
    }

    // Return the result of ini_parse(), i.e., 0 on success, line number of
    // first error on parse error, or -1 on file open error.
    int parseError() const
    {
        return error_;
    }

    // Get a string value from INI file, returning default_value if not found.
    std::string getString(const std::string& section, const std::string& key, const std::string& default_value = "") const
    {
        if (values_.count(section) == 0)
        {
            return default_value;
        }
        if (values_.at(section).count(key) > 0)
        {
            return values_.at(section).at(key);
        }
        else
        {
            return default_value;
        }
    }

    // Get an integer (long) value from INI file, returning default_value if
    // not found or not a valid integer (decimal "1234", "-1234", or hex "0x4d2").
    long getInt(const std::string& section, const std::string& key, long default_value = 0) const
    {
        auto valstr = getString(section, key, "");
        const char* value = valstr.c_str();
        char* end;
        // This parses "1234" (decimal) and also "0x4D2" (hex)
        long n = strtol(value, &end, 0);
        return end > value ? n : default_value;
    }

    // Get a real (floating point double) value from INI file, returning
    // default_value if not found or not a valid floating point value
    // according to strtod().
    double getReal(const std::string& section, const std::string& key, double default_value = 0.0) const
    {
        auto valstr = getString(section, key, "");
        const char* value = valstr.c_str();
        char* end;
        double n = strtod(value, &end);
        return end > value ? n : default_value;
    }

    // Get a boolean value from INI file, returning default_value if not found or if
    // not a valid true/false value. Valid true values are "true", "yes", "on", "1",
    // and valid false values are "false", "no", "off", "0" (not case sensitive).
    bool getBoolean(const std::string& section, const std::string& key, bool default_value) const
    {
        auto valstr = getString(section, key, "");
        // Convert to lower case to make string comparisons case-insensitive
        std::transform(valstr.begin(), valstr.end(), valstr.begin(), ::tolower);
        if (valstr == "true" || valstr == "yes" || valstr == "on" || valstr == "1")
        {
            return true;
        }
        else if (valstr == "false" || valstr == "no" || valstr == "off" || valstr == "0")
        {
            return false;
        }
        else
        {
            return default_value;
        }
    }

    //check one section exist or not
    int hasSection(const std::string& section)
    {
        return values_.count(section);
    }

    //check one section and one key exist or not
    int hasKey(const std::string& section, const std::string& key)
    {
        return values_.count(section) > 0 ? values_.at(section).count(key) : 0;
    }

    std::vector<std::string> getAllSections()
    {
        std::vector<std::string> ret;
        for (auto& value : values_)
        {
            ret.push_back(value.first);
        }
        return ret;
    }

    std::vector<std::string> getAllKeys(const std::string& section)
    {
        std::vector<std::string> ret;
        if (values_.count(section) == 0)
        {
            return ret;
        }
        for (auto& kv : values_.at(section))
        {
            ret.push_back(kv.first);
        }
        return ret;
    }

    void setKey(const std::string& section, const std::string& key, const std::string& value)
    {
        valueHandler(section, key, value);
    }

    void eraseKey(const std::string& section, const std::string& key)
    {
        values_[section].erase(key);
    }

    void print()
    {
        for (auto& skv : values_)
        {
            fprintf(stdout, "[%s]\n", skv.first.c_str());
            for (auto& kv : skv.second)
            {
                fprintf(stdout, "%s = %s\n", kv.first.c_str(), kv.second.c_str());
            }
            fprintf(stdout, "\n");
        }
        for (int i = 0; i < lines_.size(); i++)
        {
            fprintf(stdout, "%s %s\n", lines_section_[i].c_str(), lines_[i].c_str());
        }
    }

private:
    int ini_parse_content(const std::string& content)
    {
        //split the content into lines
        auto splitString = [](std::string str, std::string pattern)
        {
            std::string::size_type pos;
            std::vector<std::string> result;
            str += pattern[0];
            int size = str.size();
            char pre_pattern = '\0';
            for (int i = 0; i < size; i++)
            {
                pos = str.find_first_of(pattern, i);
                if (pos < size)
                {
                    std::string s = str.substr(i, pos - i);
                    if (s.empty() && pre_pattern != '\0' && pre_pattern != str[pos])    //a pair of different patterns are omitted,
                    {
                        pre_pattern = '\0';
                    }
                    else
                    {
                        result.push_back(s);
                        pre_pattern = str[pos];
                    }
                    i = pos;
                }
            }
            return result;
        };
        lines_ = splitString(content, "\n\r");
        return ini_parse_lines(lines_, lines_section_, READ);
    }

    int ini_parse_lines(std::vector<std::string>& lines, std::vector<std::string>& lines_section, int mode)
    {
        /* Return pointer to first non-whitespace char in given string. */
        auto lskip = [](const std::string& s) -> std::string
        {
            auto pre = s.find_first_not_of(" ");
            if (pre != std::string::npos)
            {
                return s.substr(pre);
            }
            else
            {
                return "";
            }
        };

        /* Strip whitespace chars off end of given string, in place. Return s. */
        auto rstrip = [](const std::string& s) -> std::string
        {
            auto suf = s.find_last_not_of(" ");
            if (suf != std::string::npos)
            {
                return s.substr(0, suf + 1);
            }
            else
            {
                return "";
            }
        };

        /* Uses a fair bit of stack (use heap instead if you need to) */
        std::string section = "";
        std::string prev_key = "";
        int lineno = 0;
        int error = 0;
        lines_section.clear();
        /* Scan all lines */
        auto it = lines.begin();
        while (it != lines.end())
        {
            lineno++;
            std::string line = *it;
#if INI_ALLOW_BOM
            if (lineno == 1 && line.size() >= 3 && (unsigned char)line[0] == 0xEF && (unsigned char)line[1] == 0xBB && (unsigned char)line[2] == 0xBF)
            {
                line = line.substr(3);
            }
#endif
            line = rstrip(line);    //remove spaces on two sides

            if (line.size() < 2)    //a line should contains at least two letters such as "a=", "[]"
            {
            }
            else if (line[0] == ';' || line[0] == '#')
            {
                /* Per Python configparser, allow both ; and # comments at the start of a line */
            }
#if INI_ALLOW_MULTILINE
            else if (prev_key != "" && line[0] == ' ')
            {
                /* Non-blank line with leading whitespace, treat as continuation of previous name's value (as per Python config parser). */
                std::string value = getString(section, prev_key, "") + line_break_ + rstrip(line);
                valueHandler(section, prev_key, value);
                if (error == 0)
                {
                    //error = lineno;
                }
            }
#endif
            else if (line[0] == '[')
            {
                /* A "[section]" line */
                auto end = line.find_first_of("]");
                if (end != std::string::npos)
                {
                    section = line.substr(1, end - 1);    //found a new section
                    prev_key = "";
                }
                else if (error == 0)
                {
                    /* No ']' found on section line */
                    error = lineno;
                }
            }
            else
            {
                /* Not a comment, must be a name[=]value pair */
                auto assign_char = line.find_first_of("=");
                if (assign_char != std::string::npos)
                {
                    std::string key = rstrip(line.substr(0, assign_char));
                    std::string value = lskip(line.substr(assign_char + 1));
                    int quote = 0;    //0: no quote, 1: single quote, 2: double quote
                    int quote_end_pos = value.size() - 1;
                    if (value.find_first_of("\'") == 0)
                    {
                        quote = 1;
                        quote_end_pos = value.find_first_of("\'", 1);
                    }
                    else if (value.find_first_of("\"") == 0)
                    {
                        quote = 2;
                        quote_end_pos = value.find_first_of("\"", 1);
                    }
                    if (quote)
                    {
                        if (quote_end_pos >= 0)
                        {
                            value = value.substr(1, quote_end_pos - 1);
                        }
                        else
                        {
                            value = value.substr(1);
                        }
                    }
                    std::string comment = "";
#if INI_ALLOW_INLINE_COMMENTS
                    if (quote == 0)
                    {
                        int comment_pos = value.find_first_of(INI_INLINE_COMMENT_PREFIXES);
                        if (comment_pos != std::string::npos)
                        {
                            comment = value.substr(comment_pos);
                            value = value.substr(0, comment_pos);
                        }
                    }
#endif
                    auto blanks = value.substr(value.find_last_not_of(" ") + 1);
                    value = rstrip(value);

                    /* Valid name[=:]value pair found, call handler */
                    prev_key = key;

                    if (mode == READ)
                    {
                        int key_exist = valueHandler(section, key, value);
                        if (key_exist > 0)
                        {
                            //repeat defined, how to deal it?
                        }
                    }
                    else if (mode == WRITE)
                    {
                        if (hasKey(section, key))
                        {
                            auto value1 = getString(section, key, value);
                            if (value1 != value)
                            {
                                //rewrite the line
                                *it = key + " = " + value1 + blanks + comment;
                            }
                            eraseKey(section, key);
                        }
                        else
                        {
                            //key has been erased
                            it = lines.erase(it);
                            continue;
                        }
                    }
                    if (!error)
                    {
                        //error = lineno;
                    }
                }
                else if (error == 0)
                {
                    /* No '=' or ':' found on name[=:]value line */
                    error = lineno;
                    prev_key = "";
                }
            }
            lines_section.push_back(section);
            it++;
#if INI_STOP_ON_FIRST_ERROR
            if (error)
            {
                break;
            }
#endif
        }
        return error;
    }

    void resetLines()
    {
        auto values0 = values_;
        //rescan the file to modify existing keys
        ini_parse_lines(lines_, lines_section_, WRITE);

        for (auto& skv : values_)
        {
            if (skv.second.size() > 0)
            {
                auto section = skv.first;

                int pos = 0;
                if (section != "")
                {
                    for (int i = 0; i < lines_section_.size(); i++)
                    {
                        if (lines_section_[i] == section && lines_[i] != "")
                        {
                            pos = i + 1;
                        }
                    }
                }
                if (section == "" || (pos > 0 && section != ""))
                {
                    //insert key into sections
                    for (auto kv : skv.second)
                    {
                        lines_.insert(lines_.begin() + pos, 1, kv.first + " = " + kv.second);
                        lines_section_.insert(lines_section_.begin() + pos, 1, section);
                    }
                }
                if (pos == 0 && section != "")
                {
                    //append new lines
                    while (!lines_.empty() && lines_.back() == "")
                    {
                        lines_.pop_back();    //remove blank line first
                        lines_section_.pop_back();
                    }
                    if (!lines_.empty())
                    {
                        lines_.push_back("");
                    }
                    lines_.push_back("[" + section + "]");
                    if (!lines_section_.empty())
                    {
                        lines_section_.push_back(lines_section_.back());
                    }
                    lines_section_.push_back(section);
                    for (auto kv : skv.second)
                    {
                        lines_.push_back(kv.first + " = " + kv.second);
                        lines_section_.push_back(section);
                    }
                }
            }
        }
        values_ = values0;
    }

public:
    //write modified file
    void saveFile(const std::string& filename)
    {
        auto content = toString();
        FILE* fp = fopen(filename.c_str(), "wb");
        int length = content.length();
        fwrite(content.c_str(), length, 1, fp);
        fclose(fp);
    }

    //make a string with trying to keep the original style
    std::string toString()
    {
        resetLines();
        std::string content;
        for (int i = 0; i < lines_.size(); i++)
        {
            auto& line = lines_[i];
            content += line;
            if (i != lines_.size() - 1)
            {
                content += line_break_;
            }
        }
        return content;
    }

    //a pure string without comments or blank lines
    std::string toPureString()
    {
        std::string content;
        for (auto& section : getAllSections())
        {
            content += "[" + section + "]" + line_break_;
            for (auto& key : getAllKeys(section))
            {
                content += key + "=" + getString(section, key, "") + line_break_;
            }
        }
        return content;
    }
};

struct CompareCaseInsensitivity
{
    bool operator()(const std::string& l, const std::string& r) const
    {
        auto l1 = l;
        auto r1 = r;
        std::transform(l1.begin(), l1.end(), l1.begin(), ::tolower);
        std::transform(r1.begin(), r1.end(), r1.begin(), ::tolower);
        return l1 < r1;
    }
};

struct CompareNoUnderline
{
    bool operator()(const std::string& l, const std::string& r) const
    {
        auto l1 = l;
        auto r1 = r;
        auto erase = [](std::string& s, const std::string& oldstring)
        {
            auto pos = s.find(oldstring);
            while (pos != std::string::npos)
            {
                s.erase(pos, oldstring.length());
                pos = s.find(oldstring, pos);
            }
        };
        erase(l1, "_");
        erase(r1, "_");
        std::transform(l1.begin(), l1.end(), l1.begin(), ::tolower);
        std::transform(r1.begin(), r1.end(), r1.begin(), ::tolower);
        return l1 < r1;
    }
};

template <const char default_value[]>
struct CompareDefaultValue
{
    bool operator()(const std::string& l, const std::string& r) const
    {
        auto l1 = l;
        auto r1 = r;
        if (l1.empty())
        {
            l1 = default_value;
        }
        if (r1.empty())
        {
            r1 = default_value;
        }
        std::transform(l1.begin(), l1.end(), l1.begin(), ::tolower);
        std::transform(r1.begin(), r1.end(), r1.begin(), ::tolower);
        return l1 < r1;
    }
};

// The most widely used
using INIReaderNormal = INIReader<CompareCaseInsensitivity, CompareCaseInsensitivity>;
using INIReaderNoUnderline = INIReader<CompareNoUnderline, CompareNoUnderline>;
