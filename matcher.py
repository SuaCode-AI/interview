# Importing libraries
import re

# Link to processing sketch
file_dir = "interview_assignment.pde"

# Reading file
def clean_file(file_dir):
    with open(file_dir) as file:
        file_lines = file.readlines()
    #Filter single line comments
    filtered_list = [line for line in file_lines if line != "\n" and not line.startswith("//")]
    #Filter comments in lines
    filtered_list = [line.split("//")[0] for line in filtered_list]
    filtered_list = [line.split("\n")[0].strip() for line in filtered_list]
    return filtered_list


def detect_increment(lines):
    increments = []
    pattern = r'[a-zA-Z_][\w\.-]+\s*=\s*[a-zA-Z_][\w\.-]+\s*\+\s*[a-zA-Z_][\w\.-]+;'
    for line in lines:
        inc = re.search(pattern, line)
        if inc:
            increments.append(inc.string)
    return increments

def detect_declarations(lines):
    increments = []
    pattern = r'[a-zA-Z]+ [a-zA-Z_][\w\.-]+\s*\=\s*[\w\.-]+;'
    for line in lines:
        inc = re.search(pattern, line)
        if inc:
            increments.append(inc.string)
    return increments

def detect_function_calls(lines):
    increments = []
    pattern = r'[a-zA-Z_][\w\.-]+\s*\([^\)]*\)(\.[^\)]*\))?;'
    for line in lines:
        inc = re.search(pattern, line)
        if inc:
            increments.append(inc.string)
    return increments


filtered_list = clean_file(file_dir)

print(detect_increment(filtered_list))
print(detect_declarations(filtered_list))
print(detect_function_calls(filtered_list))