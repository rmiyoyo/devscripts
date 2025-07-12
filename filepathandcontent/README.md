### README

#### **File Concatenator Script**

**Description**:  
Recursively scans all files in the current directory (excluding `node_modules`, `.git`, `.next`, `svelte-version`, and specific files like `.gitignore`), then combines their contents into `output.txt`.

**Usage**:  
1. Open **PowerShell** in the target directory  
2. Run:  
   ```powershell
   .\concat-files.ps1
   ```
   (If blocked by execution policy, use: `powershell -ExecutionPolicy Bypass -File .\concat-files.ps1`)

**Output**:  
Creates (or overwrites) `output.txt` in the same directory.

**Note**:
- Skips binary files (avoids encoding issues)  
- Handles read errors gracefully  

(15 lines, 3-second read)