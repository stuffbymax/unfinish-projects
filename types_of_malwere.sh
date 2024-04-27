#!/bin/bash

# Function to display information about viruses
function display_virus_info() {
    # Information about viruses
    echo "Viruses are malicious programs that infect other files or programs by attaching themselves to them. They can cause damage to data or disrupt normal computer operations."

    # Simulating a fake virus process
    simulate_virus_process
}

# Function to simulate a virus process
function simulate_virus_process() {
    # Simulating the process of a virus
    echo "Simulating virus process..."
    sleep 2
    echo "Virus is executing malicious process..."
    sleep 2
    echo "Deleting system files..."
    sleep 2
    echo "Injecting malicious code..."
    sleep 2
    echo "Sending spam emails..."
    sleep 2
    echo "Your system has been compromised!"
}

# Function to display information about worms
function display_worm_info() {
    # Information about worms
    echo "Worms are self-replicating malware that spread across networks and computers by exploiting vulnerabilities. They can cause network congestion, consume bandwidth, and disrupt services."

    # Simulating a fake worm spread
    simulate_worm_spread
}

# Function to simulate a worm spreading
function simulate_worm_spread() {
    # Simulating the spread of a worm
    echo "Simulating worm spread..."
    sleep 2
    echo "Worm is exploiting vulnerabilities to spread across the network..."
    sleep 2
    echo "Infecting other computers and devices connected to the network..."
    sleep 2
    echo "Causing network slowdowns and disruptions..."
    sleep 2
    echo "Your network has been compromised!"
}

# Function to display information about trojans
function display_trojan_info() {
    # Information about trojans
    echo "Trojans are disguised as legitimate software but contain malicious code. They trick users into executing them, allowing attackers to gain unauthorized access to systems or steal sensitive information."

    # Simulating a fake trojan execution
    simulate_trojan_execution
}

# Function to simulate a trojan execution
function simulate_trojan_execution() {
    # Simulating the execution of a trojan
    echo "Simulating trojan execution..."
    sleep 2
    echo "User unknowingly executes trojan..."
    sleep 2
    echo "Trojan gains access to sensitive data, such as passwords and financial information..."
    sleep 2
    echo "Sending stolen data to remote server controlled by attackers..."
    sleep 2
    echo "Your system has been compromised!"
}

# Function to display information about ransomware
function display_ransomware_info() {
    # Information about ransomware
    echo "Ransomware encrypts files on a victim's system and demands payment (usually in cryptocurrency) in exchange for the decryption key. It can result in data loss, financial loss, and operational disruption."

    # Simulating a fake ransomware attack
    simulate_ransomware_attack
}

# Function to simulate a ransomware attack
function simulate_ransomware_attack() {
    # Simulating a ransomware attack
    echo "Simulating ransomware attack..."
    sleep 2
    echo "Ransomware encrypts your files, making them inaccessible..."
    sleep 2
    echo "Demanding payment for decryption key, typically in cryptocurrency..."
    sleep 2
    echo "Displaying ransom note with instructions for payment..."
    sleep 2
    echo "Your files are locked! Pay the ransom to regain access."
}

# Function to display information about spyware
function display_spyware_info() {
    # Information about spyware
    echo "Spyware secretly gathers information about a user's activities without their knowledge or consent. It can capture keystrokes, record browsing habits, and steal personal information."

    # Simulating fake spyware activity
    simulate_spyware_activity
}

# Function to simulate spyware activity
function simulate_spyware_activity() {
    # Simulating spyware activity
    echo "Simulating spyware activity..."
    sleep 2
    echo "Spyware captures keystrokes, including passwords and sensitive information..."
    sleep 2
    echo "Recording browsing history and search queries..."
    sleep 2
    echo "Collecting personal information, such as credit card details and social security numbers..."
    sleep 2
    echo "Your privacy has been compromised!"
}

# Function to display information about adware
function display_adware_info() {
    # Information about adware
    echo "Adware displays unwanted advertisements to users, often in the form of pop-up ads or browser redirects. While not necessarily harmful, it can be annoying and invasive."

    # Simulating fake adware popup
    simulate_adware_popup
}

# Function to simulate adware popup
function simulate_adware_popup() {
    # Simulating adware popup
    echo "Simulating adware popup..."
    sleep 2
    echo "Adware displays annoying pop-up ads on your screen..."
    sleep 2
    echo "Ads disrupt your browsing experience and cover important content..."
    sleep 2
    echo "Your system is flooded with advertisements!"
}

# Function to display information about rootkits
function display_rootkit_info() {
    # Information about rootkits
    echo "Rootkits are stealthy malware that provide attackers with privileged access to a computer system. They can hide their presence and activities from antivirus software and system administrators."

    # Simulating fake rootkit stealth
    simulate_rootkit_stealth
}

# Function to simulate rootkit stealth
function simulate_rootkit_stealth() {
    # Simulating rootkit stealth
    echo "Simulating rootkit stealth..."
    sleep 2
    echo "Rootkit hides its presence on the system, making it difficult to detect..."
    sleep 2
    echo "Concealing malicious activities from antivirus and system administrators..."
    sleep 2
    echo "Your system has been compromised without detection!"
}

# Main menu
while true; do
    clear
    echo "Types of Malware:"
    echo "1. Virus"
    echo "2. Worm"
    echo "3. Trojan"
    echo "4. Ransomware"
    echo "5. Spyware"
    echo "6. Adware"
    echo "7. Rootkit"
    echo "8. Exit"

    # Read user input for option
    read -n 1 option

    case $option in
        "1") display_virus_info ;;
        "2") display_worm_info ;;
        "3") display_trojan_info ;;
        "4") display_ransomware_info ;;
        "5") display_spyware_info ;;
        "6") display_adware_info ;;
        "7") display_rootkit_info ;;
        "8") echo "Goodbye!"; exit ;;
        *) ;;
    esac

    echo "Press Enter to return to the main menu..."
    read -n 1
done
