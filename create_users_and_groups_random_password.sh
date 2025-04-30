#!/bin/bash

# Output file
CREDENTIAL_FILE="user_credentials.txt"

# Clear the file and add header
echo "Username,Password,Group" > "$CREDENTIAL_FILE"

# Create 20 groups
for i in $(seq 1 20); do
    groupname="group$i"
    if ! getent group "$groupname" > /dev/null; then
        groupadd "$groupname"
        echo "Created group: $groupname"
    else
        echo "Group $groupname already exists"
    fi
done

# Function to generate a random 12-character password
generate_password() {
    < /dev/urandom tr -dc 'A-Za-z0-9!@#$%&*' | head -c12
}

# Create 100 users, assign to groups, and set random passwords
for i in $(seq 1 100); do
    username="user$i"
    group_number=$(( (i - 1) / 5 + 1 ))
    groupname="group$group_number"
    password=$(generate_password)

    if ! id "$username" > /dev/null 2>&1; then
        useradd -m -s /bin/bash -g "$groupname" "$username"
        echo "$username:$password" | chpasswd
        echo "$username,$password,$groupname" >> "$CREDENTIAL_FILE"
        echo "Created user: $username in group: $groupname"
    else
        echo "User $username already exists"
    fi
done

echo "✅ User and group creation complete."
echo "🔐 Credentials saved to $CREDENTIAL_FILE"
