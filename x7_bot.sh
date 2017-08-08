#!/usr/bin/env bash

token_="372561263:AAEvPVDnGkfV3D7TGm0xVwY3dtJc5v3_Drc"

function print_logo() {

 echo -e "\e[38;5;77m" 

echo -e "يـعـ๋͜مل الـبوت ع مـجموعـات  10k🌝💋
مـ๋͜ن تـطـ๋͜وير 🌝👇
<@Team_Skype> 
تـابـ๋͜عـنـ๋͜ا 😸❤️
<@Ch_Dev>"

echo -e "  "

echo -e "  "

echo -e "  ____ _         ____             
 / ___| |__     |  _ \  _____   __
| |   | '_ \    | | | |/ _ \ \ / /
| |___| | | |   | |_| |  __/\ V / 
 \____|_| |_|___|____/ \___| \_/  "

echo -e "  \e[38;5;88m"

echo -e ""

echo -e ""

echo -e ""

echo -e "\e[33m  _____                      ____  _                     
|_   _|__  __ _ _ __ ___   / ___|| | ___   _ _ __   ___ 
  | |/ _ \/ _` | '_ ` _ \  \___ \| |/ / | | | '_ \ / _ \
  | |  __/ (_| | | | | | |  ___) |   <| |_| | |_) |  __/
  |_|\___|\__,_|_| |_| |_| |____/|_|\_\\__, | .__/ \___|
                                       |___/|_|         
\e[0m"

echo -e "\e[33m |_ _|__| |__ / \ | | _| ____| Dev @EMADOFFICAL\e[0m"

echo -e "\e[33m | |/ | '_ \ / _ \ | |/ / _| Dev @IX00XI\e[0m"

echo -e "\e[33m | |\ \ | | |/ _ \| <| |_ Dev @H_173\e[0m"

echo -e "\e[33m |_||___/_| |_/_/ \_\_|\_\_____| Dev @lIESIl\e[0m"

echo -e "\e[33m Dev @h_k_a\e[0m"

}


if [ ! -f ./tg/tgcli ]; then

echo -e ""

echo -e "\e[33m  _____                      ____  _                     
|_   _|__  __ _ _ __ ___   / ___|| | ___   _ _ __   ___ 
  | |/ _ \/ _` | '_ ` _ \  \___ \| |/ / | | | '_ \ / _ \
  | |  __/ (_| | | | | | |  ___) |   <| |_| | |_) |  __/
  |_|\___|\__,_|_| |_| |_| |____/|_|\_\\__, | .__/ \___|
                                       |___/|_|         
"

echo -e "\e[33m |_ _|__| |__ / \ | | _| ____| Dev @EMADOFFICAL"

echo -e "\e[33m | |/ | '_ \ / _ \ | |/ / _| Dev @IX00XI"

echo -e "\e[33m | |\ \ | | |/ _ \| <| |_ Dev @H_173"

echo -e "\e[33m |_||___/_| |_/_/ \_\_|\_\_____| Dev @lIESIl"

echo -e "\e[33m Dev @h_k_a"

    echo "\e[31;1mtg not found"

    echo "Run $0 install"

    exit 1

 fi

if [ ! $token_ ]; then

echo -e ""

echo -e "\e[33m  _____                      ____  _                     
|_   _|__  __ _ _ __ ___   / ___|| | ___   _ _ __   ___ 
  | |/ _ \/ _` | '_ ` _ \  \___ \| |/ / | | | '_ \ / _ \
  | |  __/ (_| | | | | | |  ___) |   <| |_| | |_) |  __/
  |_|\___|\__,_|_| |_| |_| |____/|_|\_\\__, | .__/ \___|
                                       |___/|_|         
"

echo -e "\e[33m |_ _|__| |__ / \ | | _| ____| Dev @EMADOFFICAL"

echo -e "\e[33m | |/ | '_ \ / _ \ | |/ / _| Dev @IX00XI"

echo -e "\e[33m | |\ \ | | |/ _ \| <| |_ Dev @H_173"

echo -e "\e[33m |_||___/_| |_/_/ \_\_|\_\_____| Dev @lIESIl"

echo -e "\e[33m Dev @h_k_a\e[0m"

  echo -e "\e[31;1mToken Not found\e"

 exit 1

 fi



  print_logo

   echo -e ""

echo -e ""

echo -e " \e[38;5;300mOperation | Starting Bot"

echo -e " Source | TSHAKE Version 28 March 2017"

echo -e " CH | @TshAkETEAM"

echo -e " Dev | @lIMyIl"

echo -e " Dev | @IX00XI"

echo -e " Dev | @lIESIl"

echo -e " Dev | @H_173"

echo -e " Dev | @EMADOFFICAL"

echo -e " Dev | @h_k_a"

echo -e " \e[38;5;40m"


curl "https://api.telegram.org/bot"$token_"/sendmessage" -F

./tg/tgcli -s ./bot/bot.lua $@ --bot=$token_
