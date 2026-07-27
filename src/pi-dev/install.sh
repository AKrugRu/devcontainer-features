#!/bin/sh
set -eu

# Function to install pi CLI
install_pi() {
    echo "Installing pi CLI..."
    npm i -g --ignore-scripts @earendil-works/pi-coding-agent@${VERSION}

    if command -v pi >/dev/null; then
        echo "pi CLI installed successfully!"
        pi --version
        return 0
    else
        echo "ERROR: pi CLI installation failed!"
        return 1
    fi
}

# Main script starts here
main() {
    echo "Activating feature 'pi'"

    # Check node
    if ! command -v node >/dev/null || ! command -v npm >/dev/null; then
        echo "Node.js or npm not found"
    fi

    # Install pi
    install_pi || exit 1
}

# Execute main function
main