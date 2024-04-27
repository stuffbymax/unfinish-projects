#!/bin/bash

# Function to initialize the game
function initialize_game() {
    # Terminal dimensions
    width=$(tput cols)
    height=$(tput lines)

    # Adjust terminal dimensions for border
    inner_width=$((width - 2))
    inner_height=$((height - 2))

    # Snake initialization
    snake_row=$((inner_height / 2))
    snake_col=$((inner_width / 2))
    snake_length=1
    snake_direction="right"
    snake_body=("$snake_row,$snake_col")

    # Food initialization
    generate_food
}

# Function to generate food at a random location
function generate_food() {
    food_row=$((RANDOM % (inner_height - 1) + 1))
    food_col=$((RANDOM % (inner_width - 1) + 1))
}

# Function to display the game board with border
function display_board() {
    clear

    # Define colors
    BLUE='\033[0;34m'
    GREEN='\033[0;32m'
    ORANGE='\033[0;33m'
    NC='\033[0m' # No Color

    # Print top border
    printf "${ORANGE}+%*s+${NC}\n" "$inner_width" | tr ' ' '-'

    # Print snake and border
    for ((row = 1; row <= inner_height; row++)); do
        printf "${ORANGE}|${NC}"
        for ((col = 1; col <= inner_width; col++)); do
            snake_segment="${row},${col}"
            if [[ $snake_segment == "${snake_body[0]}" ]]; then
                printf "${GREEN}*${NC}"
            elif [[ " ${snake_body[@]} " =~ " ${snake_segment} " ]]; then
                printf "${GREEN}*${NC}"
            elif [[ $row -eq $food_row && $col -eq $food_col ]]; then
                printf "${BLUE}@${NC}"
            else
                printf " "
            fi
        done
        printf "${ORANGE}|${NC}\n"
    done

    # Print bottom border
    printf "${ORANGE}+%*s+${NC}\n" "$inner_width" | tr ' ' '-'

    # Print score
    tput cup "$((height + 1))" 0
    printf "Score: %s" "$snake_length"
}

# Function to move the snake
function move_snake() {
    # Update snake's head position
    case $snake_direction in
        "up") snake_row=$((snake_row - 1)) ;;
        "down") snake_row=$((snake_row + 1)) ;;
        "left") snake_col=$((snake_col - 1)) ;;
        "right") snake_col=$((snake_col + 1)) ;;
    esac

    # Check if snake has collided with walls or itself
    if [[ $snake_row -le 0 || $snake_row -ge $inner_height || $snake_col -le 0 || $snake_col -ge $inner_width ]]; then
        game_over
    fi

    for segment in "${snake_body[@]}"; do
        if [[ "$segment" == "$snake_row,$snake_col" ]]; then
            game_over
        fi
    done

    # Add the new head position to the snake's body
    snake_body+=("$snake_row,$snake_col")

    # If the snake hasn't eaten food, remove the tail to maintain its length
    if [[ $snake_row -ne $food_row || $snake_col -ne $food_col ]]; then
        snake_body=("${snake_body[@]:1}")
    else
        # Generate new food if the snake has eaten food
        snake_length=$((snake_length + 1))
        generate_food
    fi
}

# Function to handle game over
function game_over() {
    clear
    tput cup "$((height / 2))" "$((width / 2 - 5))"
    printf "Game Over!"
    tput cup "$((height / 2 + 1))" "$((width / 2 - 7))"
    printf "Your score: %s" "$snake_length"
    exit 0
}

# Function to handle user input
function read_input() {
    read -rsn1 input
    if [[ "$input" == $'\x1b' ]]; then
        read -rsn2 input
        case $input in
            '[A'|w|W) snake_direction="up" ;;
            '[B'|s|S) snake_direction="down" ;;
            '[D'|a|A) snake_direction="left" ;;
            '[C'|d|D) snake_direction="right" ;;
        esac
    else
        case $input in
            "w"|"W") snake_direction="up" ;;
            "s"|"S") snake_direction="down" ;;
            "a"|"A") snake_direction="left" ;;
            "d"|"D") snake_direction="right" ;;
            "q") game_over ;;
        esac
    fi
}


# Main game loop
initialize_game
while true; do
    display_board
    read_input
    move_snake
done
