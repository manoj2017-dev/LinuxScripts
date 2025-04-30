#!/bin/bash

# File to store usernames, passwords, and group names
CREDENTIAL_FILE="user_credentials.txt"

# Start fresh by adding headers to the credentials file
echo "Username,Password,Group" > "$CREDENTIAL_FILE"

echo "🔧 Creating groups..."

# Create 20 groups named group1 to group20
for i in $(seq 1 20); do
    group_name="group$i"

    if ! getent group "$group_name" > /dev/null; then
        groupadd "$group_name"
        echo "✅ Created group: $group_name"
    else
        echo "ℹ️ Group $group_name already exists"
    fi
done

# Function to generate a secure 12-character password
generate_password() {
    < /dev/urandom tr -dc 'A-Za-z0-9!@#$%&*' | head -c12
}

echo "👥 Creating users and assigning to groups..."

# Create 100 users and evenly assign them across 20 groups (5 users per group)
for i in $(seq 1 100); do
    username="user$i"
    group_number=$(( (i - 1) / 5 + 1 ))
    group_name="group$group_number"
    password=$(generate_password)

    if ! id "$username" > /dev/null 2>&1; then
        useradd -m -s /bin/bash -g "$group_name" "$username"
        echo "$username:$password" | chpasswd
        echo "$username,$password,$group_name" >> "$CREDENTIAL_FILE"
        echo "✅ Created user: $username and assigned to $group_name"
    else
        echo "⚠️ User $username already exists"
    fi
done

echo ""
echo "🎉 All users and groups created successfully."
echo "📄 Credentials saved in: $CREDENTIAL_FILE"
