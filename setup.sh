#!/bin/bash

# 1. Update package list
echo "--- Updating system packages ---"
apt-get update

# 2. Install Python 3 and Pip (if not present)
echo "--- Installing Python 3 and Pip ---"
apt-get install -y python3 python3-pip python3-venv

# 3. Create a Virtual Environment (Best practice for Python development)
echo "--- Creating Virtual Environment ---"
python3 -m venv venv

# 4. Activate the Virtual Environment
echo "--- Activating Virtual Environment ---"
source venv/bin/activate

# 5. Install required packages
echo "--- Installing discord.py, requests, and python-dotenv ---"
pip install --upgrade pip
pip install "discord.py>=2.3.0" "requests>=2.31.0" "python-dotenv>=1.0.0"

# 6. Run the bot
echo "--- Starting the Bot ---"
if [ -f "bot/main.py" ]; then
    python3 bot/main.py
else
    echo "Error: bot/main.py not found!"
    exit 1
fi
