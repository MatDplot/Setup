#!/bin/bash

# Function to check for package updates and apply them
update_packages() {
    echo "Checking for package updates..."

    # Update package lists
    sudo apt update

    # Check for upgrades
    UPGRADES=$(apt list --upgradable 2>/dev/null | grep -c 'upgradable from')

    if [ "$UPGRADES" -gt 0 ]; then
        echo "$UPGRADES packages can be upgraded."
        echo "Upgrading packages..."
        
        # Upgrade packages
        sudo apt upgrade -y
        echo "Packages have been upgraded."
    else
        echo "No updates available."
    fi
}

# Function to check for snap updates and apply them
update_snap() {
    echo "Checking for snap updates..."

    # Check for snap updates
    SNAP_UPDATES=$(sudo snap refresh --list | grep -c 'available')

    if [ "$SNAP_UPDATES" -gt 0 ]; then
        echo "$SNAP_UPDATES snap packages can be updated."
        echo "Updating snap packages..."
        
        # Update snap packages
        sudo snap refresh
        echo "Snap packages have been updated."
    else
        echo "No snap updates available."
    fi
}

# Function to check for flatpak updates and apply them
update_flatpak() {
    echo "Checking for Flatpak updates..."

    # Check for flatpak updates
    FLATPAK_UPDATES=$(flatpak update --appstream --non-interactive --assumeyes 2>&1 | grep -c 'updates')

    if [ "$FLATPAK_UPDATES" -gt 0 ]; then
        echo "$FLATPAK_UPDATES Flatpak packages can be updated."
        echo "Updating Flatpak packages..."
        
        # Update Flatpak packages
        flatpak update -y
        echo "Flatpak packages have been updated."
    else
        echo "No Flatpak updates available."
    fi
}

# Main script execution
echo "Starting the update check..."

# Update apt packages
update_packages

# Update snap packages
update_snap

# Update flatpak packages
update_flatpak

echo "Update check completed."

