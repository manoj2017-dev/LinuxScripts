#!/bin/bash

# File to store usernames, passwords, and group names
CREDENTIAL_FILE="user_credentials.txt"

# Add header if file doesn't exist
if [ ! -f "$CREDENTIAL_FILE" ]; then
    echo "Username,Password,Group" > "$CREDENTIAL_FILE"
fi

# Function to generate a random 12-character secure password
generate_password() {
    < /dev/urandom tr -dc 'A-Za-z0-9!@#$%&*' | head -c12
}

echo "🔧 Welcome to Interactive User Creator"
echo "--------------------------------------"

while true; do
    # Ask for username
    read -p "Enter a username to create: " username

    if id "$username" &>/dev/null; then
        echo "⚠️  User $username already exists. Please choose another name."
        continue
    fi

    # Ask for group name
    read -p "Enter group name to assign this user to: " groupname

    # Create group if it doesn't exist
    if ! getent group "$groupname" > /dev/null; then
        groupadd "$groupname"
        echo "✅ Group $groupname created."
    else
        echo "ℹ️ Group $groupname already exists."
    fi

    # Ask if user wants to provide a password or generate one
    read -p "Do you want to enter a custom password? (y/n): " use_custom_password

    if [[ "$use_custom_password" == "y" || "$use_custom_password" == "Y" ]]; then
        read -s -p "Enter password: " password
        echo
    else
        password=$(generate_password)
        echo "🔐 Generated password: $password"
    fi

    # Create the user and set password
    useradd -m -s /bin/bash -g "$groupname" "$username"
    echo "$username:$password" | chpasswd

    # Save credentials
    echo "$username,$password,$groupname" >> "$CREDENTIAL_FILE"
    echo "✅ User $username created and assigned to $groupname"

    # Ask to continue
    read -p "Do you want to add another user? (y/n): " choice
    if [[ "$choice" != "y" && "$choice" != "Y" ]]; then
        break
    fi
    echo "--------------------------------------"
done

echo ""
echo "🎉 All requested users created."
echo "📄 Credentials saved to: $CREDENTIAL_FILE"
