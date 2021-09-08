# Bash Script for Mask URL Created by Syed Shoaib Raza

url_checker() {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            echo -e "\e[31m[!] Invalid URL. You should copy link from browser.\e[0m"
            echo -e "\e[31m[!] or use http or https at start of link.\e[0m"
            exit 1
        fi
    fi
}

echo -e "\n\e[1;31;42m######┌──────────────────────────┐##### \e[0m"
echo -e "\e[1;31;42m######         LinkMask           ##### \e[0m "
echo -e "\e[1;31;42m######└──────────────────────────┘##### \e[0m \n"
echo -e "\e[40;38;5;82m Please Visit \e[30;48;5;82m ( https://www.youtube.com/channel/UC6jPDgZKidpFlIpacQhij5Q ) \e[0m\n\n"
echo -e "\e[1;31;42m ### Type orignal URL ###\e[0m \n"
echo -n "Paste URL here (with http or https) ex. https://ngrok.io/ : "
read phish
url_checker $phish
sleep 1
echo "Processing and Modifing URL"
short=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${phish})
shorter=${short#https://}
echo -e "\n\e[1;31;42m ### Type link domain in which this link will be modified ###\e[0m"
echo -e " For Example: https://google.com/ , http://anything.org/ ) :"
echo -en "\e[32m=>\e[0m "
read mask
url_checker $mask
echo -e '\n Link invalid! Link Format must be like given Example '
echo -e "\e[31mDon't use space, just use '-' , also put '/' at end , and dont copy paste \e[0m"
echo -en "\e[32m=>\e[0m "
read words
if [[ -z "$words" ]]; then
echo -e "\e[31m[!] No words.\e[0m"
echo -e "\nGenerating Link...\n"
final=$mask@$shorter
echo -e "Here is the Masked URL:\e[32m ${final} \e[0m\n"
exit
fi
if [[ "$words" =~ " " ]]; then
echo -e "\e[31m[!] Invalid words. Please avoid space.\e[0m"
echo -e "\nGenerating LinkMask Link...\n"
final=$mask@$shorter
echo -e "Here is the Masked URL:\e[32m ${final} \e[0m\n"
exit
fi
echo -e "\nGenerating Masked Link...\n"
final=$mask-$words@$shorter
echo -e "Here is the Masked URL:\e[32m ${final} \e[0m\n"
