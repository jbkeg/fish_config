function global_update
    # Define colors for output
    set bold (tput bold)
    set green (tput setaf 2)
    set reset (tput sgr0)

    # Function to print a formatted message
    function print_message
        set color $argv[1]
        set message $argv[2]
        echo "$bold$color$message$reset"
    end

    # Function to print a separator line
    function print_separator
        echo ----------------------------------------
    end

    # Function to update Homebrew
    function update_homebrew
        print_message "$green" "Updating Homebrew..."
        brew update
        print_message "$green" "Upgrading installed formula and cask..."
        brew upgrade --greedy
        print_message "$green" "Cleaning up Homebrew..."
        brew cleanup -s --prune=all
        print_message "$green" "Removing outdated packages..."
        brew autoremove
        print_separator
    end

    # Function to update Fisher plugins (instead of OMZ)
    function update_fisher
        print_message "$green" "Updating Fisher plugins..."
        fisher update
        print_separator
    end

    # Function to update NPM packages globally
    function update_npm
        print_message "$green" "Updating NPM packages globally..."
        npm update -g
        print_separator
    end

    # Function to update gcloud CLI
    function update_gcloud
        print_message "$green" "Updating gcloud CLI..."
        gcloud components update --quiet
        print_separator
    end

    # Function to update flutter
    function update_flutter
        print_message "$green" "Upgrading flutter..."
        fvm flutter upgrade
        print_separator
    end

    # Function to update Rust-up
    function update_rust
        print_message "$green" "Updating Rust-up..."
        rustup self update
        rustup update
        print_separator
    end

    # Function to update apps from the Mac App Store
    function update_app_store
        print_message "$green" "Updating app store apps"
        mas upgrade
        print_separator
    end

    # Function to organize the launchpad
    function organize_launchpad
        print_message "$green" "Organizing Launchpad..."
        defaults write com.apple.dock ResetLaunchPad -bool true
        killall Dock
        print_separator
    end

    # Run all updates
    update_homebrew
    update_fisher # Updates Fisher instead of OMZ
    update_npm
    update_gcloud
    update_flutter
    update_rust
    update_app_store
    organize_launchpad
    print_message "$green" "Global update completed."
end
