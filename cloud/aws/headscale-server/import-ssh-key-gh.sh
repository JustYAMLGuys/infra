#!/bin/bash

organization="JustYAMLGuys"
authorizedKeysFile="/home/ubuntu/.ssh/authorized_keys"

# Function to check for required dependencies and install them if missing
check_dependencies() {
    local dependencies=("jq" "ssh-import-id-gh")
    local missing_dependencies=()

    for dependency in "${dependencies[@]}"; do
        if ! command -v "$dependency" &> /dev/null; then
            missing_dependencies+=("$dependency")
        fi
    done

    if [ ${#missing_dependencies[@]} -gt 0 ]; then
        echo "The following dependencies are required but missing: ${missing_dependencies[*]}"
        echo "Installing missing dependencies..."

        if command -v apt-get &> /dev/null; then
            sudo apt-get update
            sudo apt-get install -y "${missing_dependencies[@]}"
        elif command -v yum &> /dev/null; then
            sudo yum install -y "${missing_dependencies[@]}"
        else
            echo "Unsupported package manager. Please install the missing dependencies manually."
            exit 1
        fi
    fi
}

# Function to create the authorized_keys file if it doesn't exist
create_authorized_keys_file() {
    if [ ! -f "$authorizedKeysFile" ]; then
        echo "Creating authorized_keys file..."
        sudo -u "$SUDO_USER" touch "$authorizedKeysFile"
        sudo -u "$SUDO_USER" chmod 600 "$authorizedKeysFile"
    fi
}

# Function to copy SSH keys to the authorized_keys file
copy_keys_to_authorized_keys() {
    local accounts=$1

    for account in $accounts; do
        echo "Importing SSH keys for account $account..."
        
        # Check if running as root or normal user
        if [ $(id -u) -eq 0 ]; then
            local keys=$(sudo -u "$SUDO_USER" ssh-import-id-gh "$account")
            echo "$keys" | while IFS= read -r key; do
                local comment="# Key Owner: $account"
                echo -e "$comment\n$key" | sudo -u "$SUDO_USER" tee -a "$authorizedKeysFile" > /dev/null
            done
        else
            local keys=$(ssh-import-id-gh "$account")
            echo "$keys" | while IFS= read -r key; do
                local comment="# Key Owner: $account"
                echo -e "$comment\n$key" >> "$authorizedKeysFile"
            done
        fi
    done
}

# Check dependencies
check_dependencies

# Create the authorized_keys file if it doesn't exist
create_authorized_keys_file

# Get the list of GitHub accounts from the organization
accounts=$(curl -s "https://api.github.com/orgs/$organization/members" | jq -r '.[].login')



# Copy SSH keys to the authorized_keys file
copy_keys_to_authorized_keys "$accounts"

echo "SSH keys for all accounts have been successfully imported to $authorizedKeysFile"
