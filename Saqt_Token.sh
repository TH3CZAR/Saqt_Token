#!/usr/bin/env bash

THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR

install() {
	    cd tg
		sudo add-apt-repository ppa:ubuntu-toolchain-r/test
		sudo apt-get install g++-4.7 c++-4.7
		sudo apt-get update		
        sudo apt-get upgrade
         sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev make unzip git redis-server autoconf g++ libjansson-dev libpython-dev expat libexpat1-dev
		sudo apt-get install lua-lgi
		sudo apt-get install libnotify-dev
		sudo apt-get install screen
		sudo apt-get install tmux
		wget https://valtman.name/files/telegram-cli-1222
		mv telegram-cli-1222 tgcli
		chmod +x tgcli
		cd ..
		chmod +x Saqt
		chmod +x tg
        sudo redis-server
}

if [ "$1" = "install" ]; then
  install
  else

if [ ! -f ./tg/tgcli ]; then
    echo "tg not found"
    echo "Run $0 install"
    exit 1
fi
   echo -e "\033[38;5;208m"
   echo -e "يـعـ๋͜مل الـبوت ع مـجموعـات  k10🌝💋
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

  ./tg/tgcli -s ./Saqt/SaqtBot.lua $@
fi
