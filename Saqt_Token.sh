#!/usr/bin/env bash

token_="خلي التوكن اهنا حب"

function print_logo() {

 echo -e "\e[38;5;77m" 

echo -e "يـعـ๋͜مل الـبوت ع مـجموعـات  10k🌝💋
مـ๋͜ن تـطـ๋͜وير 🌝👇
<@Team_Skype> 
تـابـ๋͜عـنـ๋͜ا 😸❤️
<@Ch_Dev>"

echo -e "  "

echo -e "ادخل لقناة المطور"

echo -e "  ____ _         ____             
 / ___| |__     |  _ \  _____   __
| |   | '_ \    | | | |/ _ \ \ / /
| |___| | | |   | |_| |  __/\ V / 
 \____|_| |_|___|____/ \___| \_/  "

echo -e "\e[38;5;88m"

echo -e ""

echo -e ""

echo -e " تيم الرئاسة/ سكايب "

echo -e "
_______ _     _   _ 
|_   _|| |   | \ | |
  | |  | |   |  \| |
  | |  | |___| |\  |
  |_|  |_____|_| \_|
"

 echo -e "\e[38;5;77m" 

echo -e "  _____ _____    _    __  __   ____  _  ____   ______  _____ 
|_   _| ____|  / \  |  \/  | / ___|| |/ /\ \ / /  _ \| ____|
  | | |  _|   / _ \ | |\/| | \___ \| ' /  \ V /| |_) |  _|  
  | | | |___ / ___ \| |  | |  ___) | . \   | | |  __/| |___ 
  |_| |_____/_/   \_\_|  |_| |____/|_|\_\  |_| |_|   |_____|
                                                            
"

echo -e "\e[33m Developers :-\e[0m"

echo -e "\e[33m 1- @Owner_Sky\e[0m"

echo -e "\e[33m 2- @Sudo_Sky\e[0m"

echo -e "\e[33m 3- @d_y_b\e[0m"

}


if [ ! -f ./tg/tgcli ]; then

echo -e ""

echo -e "  ____ _         ____             
 / ___| |__     |  _ \  _____   __
| |   | '_ \    | | | |/ _ \ \ / /
| |___| | | |   | |_| |  __/\ V / 
 \____|_| |_|___|____/ \___| \_/  "


echo -e "\e[33m  _____ _____    _    __  __   ____  _  ____   ______  _____ 
|_   _| ____|  / \  |  \/  | / ___|| |/ /\ \ / /  _ \| ____|
  | | |  _|   / _ \ | |\/| | \___ \| ' /  \ V /| |_) |  _|  
  | | | |___ / ___ \| |  | |  ___) | . \   | | |  __/| |___ 
  |_| |_____/_/   \_\_|  |_| |____/|_|\_\  |_| |_|   |_____|
                                                            
"

echo -e "\e[33m"

echo -e "\e[33m"

echo -e "\e[33m"

echo -e "\e[33m"

    echo "\e[31;1mtg not found"

    echo "Run $0 install"

    exit 1

 fi

if [ ! $token_ ]; then

echo -e ""

echo -e "\e[33m"

echo -e "\e[33m  _____ _____    _    __  __   ____  _  ____   ______  _____ 
|_   _| ____|  / \  |  \/  | / ___|| |/ /\ \ / /  _ \| ____|
  | | |  _|   / _ \ | |\/| | \___ \| ' /  \ V /| |_) |  _|  
  | | | |___ / ___ \| |  | |  ___) | . \   | | |  __/| |___ 
  |_| |_____/_/   \_\_|  |_| |____/|_|\_\  |_| |_|   |_____|
                                                            
\e[0m"

echo -e "\e[33m[0m"

echo -e "\e[33m[0m"

echo -e "\e[33m[0m"

echo -e "\e[33m[0m"

  echo -e "\e[31;1mToken Not found || خطا في التوكن \e"

 exit 1

 fi



  print_logo

   echo -e ""

echo -e ""

echo -e " \e[38;5;300mOperation  Make a bot by"

echo -e "< Source Dev_Saqt Version 3 >"

echo -e " Chnnal Developers <Memo>Or<Salar> @Team_Skype </Murtaza & Yaser>"

echo -e " Dev | @ii02ii"

echo -e " Dev | @Sudo_Sky"

echo -e " Dev | @d_Y_b"

echo -e "Twasl Developers :- @Ii02iI_Bot"

echo -e "Chnaal Dev @Ch_DEv"

 echo -e "\e[38;5;77m" 


curl "https://api.telegram.org/bot"$token_"/sendmessage" -F

./tg/tgcli -s ./bot/bot.lua $@ --bot=$token_
