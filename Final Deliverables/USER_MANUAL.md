===========================
README - SWISSBOT
===========================

1. Clone the Repo:
   git clone https://github.com/mcginntw/SeniorDesign.git

2. Run the Server:

   - Navigate to: SeniorDesign/sw_server
   - Run: run_server.bat

3. Launch TF2:

   - Start Team Fortress 2 through Steam
   - Open console (`~` key)
   - Type: connect 192.168.56.1 (default local server address)

4. Add a Bot:

   - In the console, type: rcbot addbot

5. View Bot Position Logs:
   - Check: sw_server/tf/logs/L\*.log
   - Look for lines starting with: [SWISSBOT]

Note: If `rcbot addbot` doesn’t work, make sure your Steam ID is listed in:
sw_server/rcbot2/config/accessclients.ini
