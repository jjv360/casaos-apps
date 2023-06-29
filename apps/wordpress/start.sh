#!/bin/bash

# Colors
ColorReset="\e[0m"
ColorGreen="\e[32m"
ColorBlue="\e[34m"

echo -e "$ColorGreen"
echo " +----------------------------------+"
echo " |       WordPress Container        |"
echo " +----------------------------------+"
echo -e "$ColorReset"

# Start database
echo -e "$ColorBlue-\e[0m Starting MariaDB"
mysqld_safe > /dev/null &

# Start Apache server
echo -e "$ColorBlue-$ColorReset Starting web server"
apache2ctl start

# Done
echo -e "$ColorBlue-$ColorReset Ready! You can now log in to ${ColorGreen}http://localhost:8011/wp-admin${ColorReset}"

# Sleep forever to keep the server running
sleep infinity