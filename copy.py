import os
import shutil

def duplicate_directory(source_dir, dest_dir):
    # Copy the entire directory tree without the .git directory
    shutil.copytree(source_dir, dest_dir, ignore=shutil.ignore_patterns('.git*'))

# Get the current directory
current_dir = os.path.dirname(os.path.abspath(__file__))

# Get the parent directory
parent_dir = os.path.dirname(current_dir)

# Set the destination directory
dest_dir = os.path.join(parent_dir, "Project Caterpillar Playtest")
# Duplicate the parent directory
duplicate_directory(current_dir, dest_dir)
