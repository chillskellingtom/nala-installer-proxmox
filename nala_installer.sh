#!/bin/bash

# Function to check if Nala repo is already added
is_nala_repo_added() {
    grep -q "deb.volian.org/volian" /etc/apt/sources.list /etc/apt/sources.list.d/*
}

# Function to determine if the system is running Debian SID/testing or newer versions of Ubuntu
is_modern_system() {
    if grep -qE 'ID=debian' /etc/os-release; then
        if grep -qE 'sid|testing' /etc/debian_version; then
            return 0 # True, it is a modern Debian system
        fi
    elif grep -qE 'ID=ubuntu' /etc/os-release; then
        UBUNTU_VERSION=$(grep 'VERSION_ID' /etc/os-release | cut -d '"' -f 2)
        if (( $(echo "$UBUNTU_VERSION >= 22.04" | bc -l) )); then
            return 0 # True, it is a modern Ubuntu system
        fi
    fi
    return 1 # False, not a modern system
}

# Check if Nala repo needs to be added
if ! is_modern_system; then
  if is_nala_repo_added; then
    echo "Nala repository already added."
  else
    echo "Adding Nala repository..."
    echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
    wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg
  fi
fi

# Automatically decide to install Nala or Nala Legacy based on the system version
if is_modern_system; then
  echo "Installing Nala..."
  sudo apt update && sudo apt install nala
else
  echo "Installing Nala Legacy..."
  sudo apt update && sudo apt install nala-legacy
fi

# Update Mirrors
echo "Updating mirrors. Please follow instructions to select mirrors."
sudo nala fetch

# Instructions for Update History and Undo Feature
echo "To view update history, use: nala history"
echo "To undo an update, use: sudo nala history undo [ID]"

# Ask user if they want to convert APT to Nala
echo "Do you want to convert APT commands to Nala commands? (Y/N)"
read -r convert_choice
if [ "$convert_choice" = "Y" ] || [ "$convert_choice" = "y" ]; then
    echo "Converting APT commands to Nala in .bashrc and /root/.bashrc..."
    {
    echo 'apt() { 
      command nala "$@"
    }'
    echo 'sudo() {
      if [ "$1" = "apt" ]; then
        shift
        command sudo nala "$@"
      else
        command sudo "$@"
      fi
    }'
    } >> ~/.bashrc
    sudo cp ~/.bashrc /root/.bashrc
    echo "Conversion complete!"
else
    echo "No conversion made. Keeping APT commands as is."
fi

echo "Nala installation and setup complete!"
