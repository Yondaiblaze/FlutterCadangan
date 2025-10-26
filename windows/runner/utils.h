#ifndef RUNNER_UTILS_H_
#define RUNNER_UTILS_H_

#include <string>
#include <vector>

// Creates a console for the process, and redirects stdout and stderr to it.
// This should be called if the process is not started from an existing
// console. The console will exist for the lifetime of the process.
void CreateAndAttachConsole();

// Takes a null-terminated wchar_t* encoded in UTF-16 and returns a std::string
// encoded in UTF-8. Returns an empty std::string on failure.
std::string Utf8FromUtf16(const wchar_t* utf16_string);

// Gets the command line arguments passed to the process as a vector of
// UTF-8 encoded strings.
std::vector<std::string> GetCommandLineArguments();

#endif  // RUNNER_UTILS_H_
