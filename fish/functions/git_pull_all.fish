function git_pull_all
    # Define the parent directory as the current working directory
    set parent_directory (pwd)

    # Iterate through each subdirectory
    for directory in (ls -d */)
        # Check if it's a directory and a Git repository
        if test -d "$directory/.git"
            echo "Updating Git repository: $directory"
            # Change into the Git repository
            cd "$directory"
            # Fetch all branches and pull the latest changes
            git fetch --all
            git pull --all
            # Change back to the original directory
            cd "$parent_directory"
        else
            echo "$directory is not a Git repository"
        end
    end
end
