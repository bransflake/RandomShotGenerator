# RandomShotGenarator
PowerShell script simulates random golf shots

Random Shot Generator (PowerShell)
📌 Overview
The Random Shot Generator is a PowerShell script that simulates realistic golf shots based on club profiles and logs each shot in NDJSON format. Perfect for testing golf analytics, building datasets, or practicing PowerShell scripting.

✅ Features

### Generate realistic shot metrics:

Ball speed, club speed, launch angle, spin rate, spin axis
Carry distance, total distance, side deviation
Impact point (horizontal & vertical)

Supports multiple clubs:
Driver, 7 Iron, PW

Interactive controls:
SPACEBAR → Generate a shot
ESC → Exit

Logs shots to shots_log.json (NDJSON: one JSON object per line)

### 🛠 Requirements
Windows PowerShell 5.1 or PowerShell 7+
No external modules required

### Quick Start
Clone the repository

1  git clone https://github.com/bransflake/RandomShotGenerator.git
2  cd RandomShotGenerator

Run Script
.\ShotGenerator.ps1

Optional: choose a club

.\ShotGenerator.ps1 -Club "7 Iron"
.\ShotGenerator.ps1 -Club "PW"

### 📂 Log File

Shots are appended to shots_log.json in NDJSON format.
Example entry:

{
  "shotId": 123456,
  "timestamp": "2025-12-24T14:30:00.0000000Z",
  "club": "Driver",
  "ballSpeed": 165,
  "clubSpeed": 112,
  "launchAngle": 12,
  "spinRate": 2800,
  "spinAxis": -3.2,
  "carryDistance": 275,
  "totalDistance": 300,
  "sideDeviation": 5,
  "impactPoint": {
    "horizontal": 0.12,
    "vertical": -0.08
  }
}

### ⚙️ Configuration

Edit $clubProfiles in the script to add clubs or adjust ranges.
Change $logFile to customize the log file path or name.


### 📁 Project Structure

RandomShotGenerator/
├─ ShotGenerator.ps1        # Main PowerShell script
├─ README.md                # Project documentation
├─ .gitignore               # Git ignore rules
└─ shots_log.json           # (Runtime) NDJSON log file


### 🚀 Roadmap

Add more club profiles (3W, 5 Iron, LW)
Export to CSV or Excel
Visualize shot dispersion and metrics
Batch mode: generate multiple shots automatically


📜 License
MIT License — free to use, modify, and share.
