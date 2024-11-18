function fish_greeting --description "Welcome message and system info for Fish shell"

    # Color definitions
    set -l COLOR_RESET "\033[0m"
    set -l COLOR_BLUE "\033[1;34m"
    set -l COLOR_GREEN "\033[1;32m"
    set -l COLOR_YELLOW "\033[1;33m"
    set -l COLOR_CYAN "\033[1;36m"

    # ASCII Banner
    echo -e "$COLOR_BLUE"
    echo "=================================================="
    echo "████████╗██╗  ██╗███████╗██╗  ██╗███████╗ ██████╗"
    echo "╚══██╔══╝██║  ██║██╔════╝██║ ██╔╝██╔════╝██╔════╝"
    echo "   ██║   ███████║█████╗  █████╔╝ █████╗  ██║  ███╗"
    echo "   ██║   ██╔══██║██╔══╝  ██╔═██╗ ██╔══╝  ██║   ██║"
    echo "   ██║   ██║  ██║███████╗██║  ██╗███████╗╚██████╔╝"
    echo "   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝ ╚═════╝"
    echo "=================================================="
    echo -e "$COLOR_RESET"

    # Welcome messages
    set -l messages \
        "Welcome back, $(whoami)! Ready to conquer the day? 💪" \
        "Hello, $(whoami)! Let's make today productive! 🚀" \
        "Hey, $(whoami)! You're looking sharp today! 😎" \
        "Greetings, $(whoami)! Let's get things done! 🔥"

    # Select a random message
    set -l welcome_message (printf "%s\n" $messages | shuf -n1)
    echo -e "$COLOR_CYAN$welcome_message$COLOR_RESET"
    echo

    # System info
    if type -q fastfetch
        fastfetch
        echo
    end

    # Display a random motivational quote
    set -l quotes \
        "Believe you can and you're halfway there." \
        "Your limitation—it’s only your imagination." \
        "Push yourself, because no one else is going to do it for you." \
        "Sometimes later becomes never. Do it now." \
        "Great things never come from comfort zones." \
        "Dream it. Wish it. Do it." \
        "Stay positive, work hard, make it happen."

    set -l random_quote (printf "%s\n" $quotes | shuf -n1)
    echo -e "$COLOR_CYAN💡 Quote of the Session: \"$random_quote\"$COLOR_RESET"
    echo

    echo -e "$COLOR_GREEN You're all set! Have a fantastic session!$COLOR_RESET"
end
