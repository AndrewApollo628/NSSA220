#!/bin/bash

file_system_writer () {
  cd ..
  cd $username 
  mkdir Desktop
  mkdir Documents
  mkdir Downloads
  mkdir Pictures  

  cp /home/student/ackbar.png /home/$username/Pictures 
}

letter_writer () {
  cd Documents
  echo "Dear $fname," > welcome.txt
  echo >> welcome.txt
  echo "Welcome to Initec Corporation! We're so happy to have you in the $department Department as a $jobtitle.Please don't forget to complete your TPS Reports in a timely mannor" >> welcome.txt
  echo >> welcome.txt
  echo "Sincerely," >> welcome.txt
  echo >> welcome.txt
  echo "Bill Lumbergh" >> welcome.txt
  cd ..   
}

permission_editor () {
 chown -R $username:$username /home/$username
 chmod 444 Documents/welcome.txt
 ls -lR /home/$username
 cat Documents/welcome.txt
}


while true 
do
read -p "Enter Username: " username 

read -p "Enter Name (First Last): " fname lname 

read -p "Enter Department: " department

read -p "Enter Job Title: " jobtitle

echo "User $username added!" 

useradd -m $username 

file_system_writer
letter_writer
permission_editor

read -p "Do you want to enter a new user (y/n): " new
echo "$new"

if [ $new == "n" ]
then
 break
else 
continue 
fi
done
