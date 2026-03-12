import os
import glob
import re

def parse_cartocss(file_path):
    with open(file_path, 'r') as f:
        content = f.read()
    
    depth = 0
    in_comment_slash_star = False
    in_comment_double_slash = False
    
    variables = []
    new_content_parts = []
    
    i = 0
    last_idx = 0
    
    while i < len(content):
        # Handle multi-line comments /* ... */
        if not in_comment_double_slash and content[i:i+2] == '/*':
            in_comment_slash_star = True
            i += 2
            continue
        if in_comment_slash_star and content[i:i+2] == '*/':
            in_comment_slash_star = False
            i += 2
            continue
        
        # Handle single-line comments // ...
        if not in_comment_slash_star and content[i:i+2] == '//':
            in_comment_double_slash = True
            i += 2
            continue
        if in_comment_double_slash and content[i] == '\n':
            in_comment_double_slash = False
            i += 1
            continue
            
        if in_comment_slash_star or in_comment_double_slash:
            i += 1
            continue
            
        # Track depth
        if content[i] == '{':
            depth += 1
        elif content[i] == '}':
            depth -= 1
        
        # Identify variables at depth 0
        if depth == 0 and content[i] == '@':
            # Found potential start of global variable
            # Find the next semicolon
            semicolon_idx = content.find(';', i)
            if semicolon_idx != -1:
                # Check if there is any { between here and the semicolon
                brace_idx = content.find('{', i, semicolon_idx)
                if brace_idx == -1:
                    # It's a global variable!
                    # Find end of line to include trailing comments
                    eol_idx = content.find('\n', semicolon_idx)
                    if eol_idx == -1:
                        eol_idx = len(content)
                    
                    start_of_line = content.rfind('\n', 0, i) + 1
                    var_def = content[start_of_line:eol_idx]
                    
                    # Store everything before this variable that hasn't been added yet
                    new_content_parts.append(content[last_idx:start_of_line])
                    
                    variables.append(var_def)
                    last_idx = eol_idx + 1 # Skip the newline too
                    i = eol_idx + 1
                    continue
        
        i += 1
    
    new_content_parts.append(content[last_idx:])
    new_content = "".join(new_content_parts)
    new_content = re.sub(r'\n{3,}', '\n\n', new_content)
    
    return variables, new_content

def main():
    style_dir = 'openstreetmap-carto/style'
    mss_files = glob.glob(os.path.join(style_dir, '*.mss'))
    
    all_variables = []
    
    for file_path in sorted(mss_files):
        if 'road-colors-generated.mss' in file_path:
            # We should probably keep this one as is if it's meant to be generated
            # but the task says ALL. Let's see.
            # Actually, it contains variable definitions.
            pass
            
        vars_found, updated_content = parse_cartocss(file_path)
        if vars_found:
            print(f"Found {len(vars_found)} variables in {file_path}")
            all_variables.append(f"/* From {os.path.basename(file_path)} */")
            all_variables.extend([v for v in vars_found])
            all_variables.append("") # spacer
            
            with open(file_path, 'w') as f:
                f.write(updated_content)

    themes_dir = os.path.join(style_dir, 'themes')
    os.makedirs(themes_dir, exist_ok=True)
    
    default_mss = os.path.join(themes_dir, 'default.mss')
    with open(default_mss, 'w') as f:
        f.write("\n".join(all_variables))
        f.write("\n")

if __name__ == "__main__":
    main()
