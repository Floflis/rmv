To use the script, you can save it to a file (e.g. rmv) and make it executable with chmod +x rmv. Then you can use it like this:
# move a single file to the recycle bin
./rmv file.txt

# move multiple files to the recycle bin
./rmv file1.txt file2.txt file3.txt

This should provide a safer alternative to the rm command, since it moves files to the recycle bin instead of deleting them permanently.
