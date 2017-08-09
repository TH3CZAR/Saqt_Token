--[[

 _____   _       _   _     
|_   _| | |     | \ | |    
  | |   | |     |  \| |    
  | |   | |___  | |\  |    
  |_|   |_____| |_| \_|    


]]--

local function Team_Skype(msg, matches)
------- ملف موقعي او شنو اني -------
if matches[1]=="شنو اني" and is_sudo(msg) then
return  "انـ๋͜تـﮧ تـجـ๋͜راسي ابـ๋͜ويـٍة آلـ๋͜مـٍطـ๋͜ور 😽❤️"
elseif matches[1]=="شنو اني" and is_admin(msg) then
return "انـ๋͜تـﮧ مـسـ๋͜اعـد ألـ๋͜مطور 😼👏\n يـعـ๋͜ني عـ๋͜مـ๋͜و الـ๋͜مشـ๋͜رف 😻🏅"
elseif matches[1]=="شنو اني" and is_owner(msg) then
return "انـ๋͜تـﮧ خـ๋͜الـٍو آلـ๋͜مـٍديـ๋͜ر 😻👳🏻"
elseif matches[1]=="شنو اني" and is_mod(msg) then
return "انـ๋͜تـﮧ آبـ๋͜ن خـ๋͜الـٍيے اݪأدمـ๋͜ن 😼✌️"
elseif matches[1]=="شنو اني" then
return " انـ๋͜تـﮧ عـ๋͜ظـو ݪأ تـ๋͜حـٍل وݪأ تـ๋͜ربـط 😹🙌"

------- ملف معلوماتي -------
	elseif matches[1]:lower() == 'معلوماتي' then
		function get_id(arg, data)
			local username
			if data.first_name_ then
				if data.username_ then
					username = '@'..data.username_
				else
                   username = 'ݪأ تـمـ๋͜لـك مـ๋͜عـٍرف😿💔'
				end
				local lastName
				if data.last_name_ then
					lastName = data.last_name_
				else
					lastName = 'ݪأ تـمـ๋͜لـك اسـ๋͜م ثـانـ๋͜يے 😿🖊'
				end
				local Your_site
				if is_sudo(msg) then
					Your_site = 'انـ๋͜تـﮧ تـجـ๋͜راسي ابـ๋͜ويـٍة آلـ๋͜مـٍطـ๋͜ور 😽❤️'
				elseif is_admin(msg) then
                   	Your_site = 'انـ๋͜تـﮧ مـسـ๋͜اعـد ألـ๋͜مطور 😼👏\n يـعـ๋͜ني عـ๋͜مـ๋͜و الـ๋͜مشـ๋͜رف 😻🏅'
				elseif is_owner(msg) then
					Your_site = 'انـ๋͜تـﮧ خـ๋͜الـٍو آلـ๋͜مـٍديـ๋͜ر 😻👳🏻'
				elseif is_mod(msg) then
					Your_site = 'انـ๋͜تـﮧ آبـ๋͜ن خـ๋͜الـٍيے اݪأدمـ๋͜ن 😼✌️'
				else
					Your_site = ' انـ๋͜تـﮧ عـ๋͜ظـو ݪأ تـ๋͜حـٍل وݪأ تـ๋͜ربـط 😹🙌'
				end
				local Dev_Tln 
	 			if is_mod(msg) then
					Dev_Tln = '@Ch_Dev'
				else
					Dev_Tln = '@Ch_Dev'
				end
     local Ch_Dev = ' <b>مـٍعـ๋͜لـومـ๋͜اتـك حـ๋͜بـيـ๋͜قـيے 🤤💖 :- \n➖🔷➖🔺{T.L.N}🔺➖🔷➖</b>\n\n<code>أسـ๋͜مـك آݪأول 😻💋:- </code> \n\n <i>[</i> <b> '..data.first_name_..' </b> <i>]</i>\n\n<code>أسـ๋͜مـك الـثـ๋͜انـيے 😺🖊 :- </code> \n\n <i>[</i> <b> '..lastName..' </b> <i>]</i>\n\n<code>مـٍعـ๋͜رفـك📍😼 :-</code> \n<i>[</i> '..username..' <i>]</i>\n<code>أيـ๋͜ديـك 🆔🌝 :-</code> \n <i>[</i> <b> '..data.id_..' </b><i>]</i>\n\n<code>أيـ๋͜ديے آلـٍكـ๋͜روبـﮧ 👥🆔 :- </code> \n <i>[</i> <b> '..arg.chat_id..' </b> <i>]</i>\n\n<code>مـ๋͜وقـٍعـ๋͜ك عـمـ๋͜قـيے 😺✨:- </code> \n <i>[</i> <b> '..Your_site..'</b> <i>]</i>\n\n<b>➖🔷➖🔻{T.L.N}🔻➖🔷➖</b>\n<b>تـيـ๋͜م ألـرئـ๋͜اسـة 🌝💫</b> \n <i>[</i> '..Dev_Tln..' <i>]</i>'
				tdcli.sendMessage(arg.chat_id, msg.id_, 1, Ch_Dev, 1, 'html')
			end
		end
		tdcli_function({ ID = 'GetUser', user_id_ = msg.sender_user_id_, }, get_id, {chat_id=msg.chat_id_, user_id=msg.sendr_user_id_})
	end
	
-------plugin site-------
if matches[1]=="me" and is_sudo(msg) then
return  "You are developer 😻💋"
elseif matches[1]=="me" and is_admin(msg) then
return "You are an admin 😸👄"
elseif matches[1]=="me" and is_owner(msg) then
return "You are owner 😽❤️"
elseif matches[1]=="me" and is_mod(msg) then
return "You are the host 😸✌️"
elseif matches[1]=="me" then
return  "You are a user 😹🙌"

-------plugin info-------
	elseif matches[1]:lower() == 'info' then
		function get_id(arg, data)
			local username
			if data.first_name_ then
				if data.username_ then
					username = '@'..data.username_
				else
					username = 'No user name 😾✨'
				end
				local lastName
				if data.last_name_ then
					lastName = data.last_name_
				else
					lastName = 'No nickname 😿💔'
				end
				local Your_site
				if is_sudo(msg) then
					Your_site = 'You are developer 😻💋'
				elseif is_admin(msg) then
					Your_site = 'u are an admin 😸👄'
				elseif is_owner(msg) then
					Your_site = 'u are owner 😽❤️'
				elseif is_mod(msg) then
					Your_site = 'You are the host 😸✌️'
				else
					Your_site = 'You are a user 😹🙌'
				end
				local Dev_Tln 
	 			if is_mod(msg) then
					Dev_Tln = '@Ch_Dev'
				else
					Dev_Tln = '@Ch_Dev'
				end
    local Ch_Dev = ' <i>Hello darling 😽❤️:- </i>\n<b>➖🔷➖🔺{T.L.N}🔺➖🔷➖</b>\n\n<b>First Name 😻💋 :- </b> \n\n <i>[</i> <code>'..data.first_name_..' </code> <i>]</i> \n..\n<b> last name 😺🌪:- </b> \n\n <i>[</i> <code> '..lastName..' </code> <i>]</i>\n\n<b>user name 😺📍:- </b>\n<i>[</i> '..username..' <i>]</i>\n<b>Your ID 😸🆔 :- </b> \n <i>[</i>  <code>'..data.id_..'</code><i>]</i> \n<b>Group ID 😼🆔 :- </b>\n <i>[</i> <code>'..arg.chat_id..'</code> <i>]</i>\n<b>Your site 😺✌️ :-</b> \n <i>[</i> <code> '..Your_site..' </code> <i>]</i>\n\n<b>➖🔷➖🔻{T.L.N}🔻➖🔷➖</b>\n<i>Team Tln 😼🔊 </i> \n <i>[</i> '..Dev_Tln..' <i>]</i>'
				tdcli.sendMessage(arg.chat_id, msg.id_, 1, Ch_Dev, 1, 'html')
			end
		end
		tdcli_function({ ID = 'GetUser', user_id_ = msg.sender_user_id_, }, get_id, {chat_id=msg.chat_id_, user_id=msg.sendr_user_id_})
	end
	
	if matches[1]:lower() == 'الاوامر' then
		function get_id(arg, data)
			if data.first_name_ then
			local username
				if data.username_ then
					username = '@'..data.username_
				else
                    username = check_markdown(data.first_name_)
				end
				local Dev_Tln 
	 			if is_mod(msg) then
					Dev_Tln = '@Ch_Dev'
				else
					Dev_Tln = '@Ch_Dev'
				end
				local Team_Skype 
	 			if is_mod(msg) then
					Team_Skype = '@Team_Skype'
				else
					Team_Skype = '@Team_Skype'
				end
				local ii02ii_bot 
	 			if is_mod(msg) then
					ii02ii_bot = '@Ii02iI_bot'
				else
					ii02ii_bot = '@Ii02iI_bot'
				end

    local Ch_Dev = ' <b>هــ๋͜لاو حـبـ๋͜يـقــ๋͜يے 😽❤️ :- </b> <i>[</i> '..username..' <i>]</i> \n\n<i>آوامـ๋͜ر مـسـ๋͜اعـدة آلـبـ๋͜وت هـ๋͜يے 😽🤖:-\n|#جـمـ๋͜يع آݪأوامـ๋͜ر ݪأ تـ๋ستـ๋͜خدم !/#|</i>\n\n<b>➖🔷➖🔺{T.L.N}🔺➖🔷➖\n\nآلآوامـ๋͜ر آلعـربـ๋͜ية 😺🖋\n\nم1 :- </b><i>لـعـ๋͜رض آوامـ๋͜ر آلحـ๋͜مآية 😺🕹</i>\n<b>▎  - اقفل _ افتح - ▎🔐 /🔓</b>\n\n<b>م2 :- </b><i>لـعـ๋͜رض آوامـ๋͜ر آلمجـ๋͜مـوعـة 🛡</i>\n<b>▎- امسح _ ضع  -▎ ❌ _📌</b> \n\n<b>م3 :- </b><i>لـعـ๋͜رض آوامـ๋͜ر آلادارة 😼🎏</i>\n<b>▎- ارفع _ نزل_ احظر_اكتم -▎😼👏</b> \n\n<b>م4 :- </b><i>لـعـ๋͜رض آوامـ๋͜ر آلـمـ๋͜طـور 😻🥁</i>\n\n▂▂▂▂▂▂▂▂▂✟▂▂▂▂▂▂▂▂▂\n\n <b>commands English 😸⚙️</b>\n<i>|All Commands n’t need to !/#|</i>\n\n<b>m1 :-</b>\n<i>show protection commands 📲</i>\n<b>▎lock_unlock  ▎🔐 /🔓</b>\n\n<b>m2 :-</b>\n<i>show group commands 😼🕹</i>\n<b>▎del_set ▎ ❌ _📌</b>\n\n<b>m3 :-</b>\n<i>show helm commands 😻⚙️</i>\n<b>▎- promote_Lower_Mute -▎</b> \n\n<b>m4 :- </b>\n<i>show dev commands 😽❤️</i>\n\n<b>➖🔷➖🔻{T.L.N}🔻➖🔷➖</b>\n<b>تــ๋͜يــ๋͜م ألــ๋͜رئـ✥ـآســ๋͜ة 🌝💫</b> \n <i>[</i> '..Dev_Tln..' <i>]</i>\n <b> آلـمـ๋͜طـوريـ๋͜ن 😿👈 </b>\n<i>[</i> '..Team_Skype..' <i>]</i>\n<b>تـ๋͜وآصــ๋͜ل الـمـ๋͜طـٍوريـ๋͜ن😽❤️</b>\n<i>[</i> '..ii02ii_bot..' <i>]</i> '
				tdcli.sendMessage(arg.chat_id, msg.id_, 1, Ch_Dev, 1, 'html')
			end
		end
		tdcli_function({ ID = 'GetUser', user_id_ = msg.sender_user_id_, }, get_id, {chat_id=msg.chat_id_, user_id=msg.sendr_user_id_})
	end
 
 	if matches[1]:lower() == 'help' then
		function get_id(arg, data)
			if data.first_name_ then
			local username
				if data.username_ then
					username = '@'..data.username_
				else
                    username = check_markdown(data.first_name_)
				end
				local Dev_Tln 
	 			if is_mod(msg) then
					Dev_Tln = '@Ch_Dev'
				else
					Dev_Tln = '@Ch_Dev'
				end
				local Team_Skype 
	 			if is_mod(msg) then
					Team_Skype = '@Team_Skype'
				else
					Team_Skype = '@Team_Skype'
				end
				local ii02ii_bot 
	 			if is_mod(msg) then
					ii02ii_bot = '@Ii02iI_bot'
				else
					ii02ii_bot = '@Ii02iI_bot'
				end

    local Ch_Dev = ' <b>Hello darling😽❤️ :- </b> <i>[</i> '..username..' <i>]\n\nBot Help commands are🤖:-\n|All Commands not need to !/#|</i>\n\n<b>➖🔷➖🔺{T.L.N}🔺➖🔷➖</b>\n<b>commands English 😸⚙️</b> \n\n<b>m1 :-</b>\n<i>show protection commands 📲</i>\n<b>▎lock_unlock  ▎🔐 /🔓</b>\n\n<b>m2 :-</b>\n<i>show group commands 😼🕹</i>\n<b>▎del_set ▎ ❌ _📌</b>\n\n<b>m3 :-</b>\n<i>show helm commands 😻⚙️</i>\n<b>▎- promote_Lower_Mute -▎</b> \n\n<b>m4 :- </b>\n<i>show dev commands 😽❤️</i>\n\n▂▂▂▂▂▂▂▂▂✟▂▂▂▂▂▂▂▂▂\n\n<b>آلآوامـ๋͜ر آلعـربـ๋͜ية 😺🖋</b>\n<i>#جـمـ๋͜يع آݪأوامـ๋͜ر ݪأ تـ๋ستـ๋͜خدم !/#❗️</i>\n\n<b>م1 :- </b><i>لـعـ๋͜رض آوامـ๋͜ر آلحـ๋͜مآية 😺🕹</i>\n<b>▎  - اقفل _ افتح - ▎🔐 /🔓</b>\n\n<b>م2 :- </b><i>لـعـ๋͜رض آوامـ๋͜ر آلمجـ๋͜مـوعـة 🛡</i>\n<b>▎- امسح _ ضع  -▎ ❌ _📌</b> \n\n<b>م3 :- </b><i>لـعـ๋͜رض آوامـ๋͜ر آلادارة 😼🎏</i>\n<b>▎- ارفع _ نزل_ احظر_اكتم -▎😼👏</b> \n\n<b>م4 :- </b><i>لـعـ๋͜رض آوامـ๋͜ر آلـمـ๋͜طـور 😻🥁</i>\n\n<b>➖🔷➖🔻{T.L.N}🔻➖🔷➖</b>\n<b> Team_TLN🌝💫</b> \n <i>[</i> '..Dev_Tln..' <i>]</i>\n <b> Developer 😿✌️ </b>\n<i>[</i> '..Team_Skype..' <i>]</i>\n<b>To talk to developers 😽❤️</b>\n<i>[</i> '..ii02ii_bot..' <i>]</i> '
				tdcli.sendMessage(arg.chat_id, msg.id_, 1, Ch_Dev, 1, 'html')
			end
		end
		tdcli_function({ ID = 'GetUser', user_id_ = msg.sender_user_id_, }, get_id, {chat_id=msg.chat_id_, user_id=msg.sendr_user_id_})
	end

if matches[1]=="م1" and is_mod(msg) then
		function get_id(arg, data)
			if data.first_name_ then
			local username
				if data.username_ then
					username = '@'..data.username_
				else
                    username = check_markdown(data.first_name_)
				end
				local Dev_Tln 
	 			if is_mod(msg) then
					Dev_Tln = '@Ch_Dev'
				else
					Dev_Tln = '@Ch_Dev'
				end
				local Team_Skype 
	 			if is_mod(msg) then
					Team_Skype = '@Team_Skype'
				else
					Team_Skype = '@Team_Skype'
				end
				local ii02ii_bot 
	 			if is_mod(msg) then
					ii02ii_bot = '@Ii02iI_bot'
				else
					ii02ii_bot = '@Ii02iI_bot'
				end

    local Ch_Dev = ' <b>عـ๋͜زيـزيے 😺💋 :- </b> <i>[</i> '..username..' <i>]</i> \n\n<i>طـريـ๋͜قـة تـنـ๋͜فـيذ الاوامـ๋͜ر هــ๋͜يے 😸👇</i> \n\n<i>اقفل + الامر </i> <b>= ݪلـقـ๋͜فـل 😼⚙️</b>\n<i>افتح + الامر </i> <b>=لألـغـ๋͜اءالـقـ๋͜فـل 😻📊</b>\n\n<b>➖🔷➖🔺{T.L.N}🔺➖🔷➖</b>\n\n <b>⚙️🔓المـجـ✥ـمــ๋͜وعه 🔐⚙️</b>\n\n<i>الروابط  🔗 + البوتات 🤖</i> \n<i>الكلايش 🗞 + التكرار 🛡</i> \n<i>المعرف 🆔 + التاك #️⃣</i> \n<i>التعديل 📝 + الماركدون 🖋</i> \n<i>العربية 📚 + الويب 📡</i>\n\n<b> الاعدادت :- 😼⚙️</b>\n<i>لـرؤيـ๋͜ة اعـدادات آلـمـ๋͜جـموعـ๋͜ة 🌝👏</i>\n\n▂▂▂▂▂▂▂▂▂✟▂▂▂▂▂▂▂▂▂\n\n<b> آلـ๋͜وسـ✥ـٍائـ๋͜ط 🔊 </b>\n\n<i>الدردشة 📝 + التوجيه 🔄</i>\n<i>الصور 📸 + المتحركة 🎇</i>\n<i>الفديو 📽 + الملصقات 🎨</i>\n<i> الصوت 🎼 + البصمات 🎙</i>\n<i>الجهات 👥 + الموقع 📡</i>\n<i>الملفات 🗂 + الالعاب 🎮</i>\n<i>الاونلاين 📍 + الاشعارات 📊</i>\n<i>اقفل </i><b>او</b><i> افتح </i> <b>= الكل 🔕</b>\n\n<b> الوسائط :- 😿🥁</b>\n<i>لـرؤيـ๋͜ة وسـ๋͜ائـط آلـمـ๋͜جـموعـ๋͜ة 🌝🎧</i>\n\n<b>➖🔷➖🔻{T.L.N}🔻➖🔷➖\nتــ๋͜يــ๋͜م ألــ๋͜رئـ✥ـآســ๋͜ة 🌝💫</b> \n <i>[</i> '..Dev_Tln..' <i>]</i>\n <b> آلـمـ๋͜طـوريـ๋͜ن 🙀👇 </b>\n<i>[</i> '..Team_Skype..' <i>]</i>\n<b>تـ๋͜وآصــ๋͜ل الـمـ๋͜طـٍوريـ๋͜ن😽❤️</b>\n<i>[</i> '..ii02ii_bot..' <i>]</i> '
				tdcli.sendMessage(arg.chat_id, msg.id_, 1, Ch_Dev, 1, 'html')
			end
		end
		tdcli_function({ ID = 'GetUser', user_id_ = msg.sender_user_id_, }, get_id, {chat_id=msg.chat_id_, user_id=msg.sendr_user_id_})
	end
if matches[1]=="m1" and is_mod(msg) then
		function get_id(arg, data)
			if data.first_name_ then
			local username
				if data.username_ then
					username = '@'..data.username_
				else
                    username = check_markdown(data.first_name_)
				end
				local Dev_Tln 
	 			if is_mod(msg) then
					Dev_Tln = '@Ch_Dev'
				else
					Dev_Tln = '@Ch_Dev'
				end
				local Team_Skype 
	 			if is_mod(msg) then
					Team_Skype = '@Team_Skype'
				else
					Team_Skype = '@Team_Skype'
				end
				local ii02ii_bot 
	 			if is_mod(msg) then
					ii02ii_bot = '@Ii02iI_bot'
				else
					ii02ii_bot = '@Ii02iI_bot'
				end


    local Ch_Dev = ' <b>My dear 😽❤️ :- </b> <i>[</i> '..username..' <i>]</i> \n\n<b>The way the commands are executed is 👇😸</b> \n\n<i>lock + Command </i> <b>= To Lock 😼🔐</b>\n<i>unlock + Command </i> <b>= To unLock 😻🔓</b>\n\n<b>➖🔷➖🔺{T.L.N}🔺➖🔷➖</b>\n\n <i>⚙️🔓Settings 🔐⚙️</i>\n\n<b>links 🔗✚ bots 🤖</b> \n<b>spam 🗞 ✚ flood 🛡</b> \n<b>username 🆔 ✚ tag #️⃣</b>\n<b>edit 📝✚ markdown 🖋</b> \n<b>arabic 📚 ✚ web 📡</b>\n<i>lock </i><b>or</b><i> unlock </i> <b>= all ⚙️</b>\n\n<b> settings :- 😼⚙️</b>\n<i>To see the group settings 🌝📡</i>\n\n▂▂▂▂▂▂▂▂▂✟▂▂▂▂▂▂▂▂▂\n\n<i>🔊 Mutelist 🔇 </i>\n\n<b>text 📝✚ fwd 🔄</b>\n<b>photos 📸 ✚ gif 🎇</b>\n<b>video 📽 ✚ sticker 🎨</b>\n<b> audio 🎼 ✚ voice 🎙</b>\n<b>contact 👥✚ location 📡</b>\n<b>document 🗂✚ games 🎮</b>\n<b>inline 📍 ✚ tgservice 📊</b>\n<i>lock </i><b>or</b><i> unlock </i> <b>= all 🔕</b>\n\n<b> mutelist :- 😿🥁</b>\n<i>To see the group Media 🌝🎧</i>\n\n<b>➖🔷➖🔻{T.L.N}🔻➖🔷➖</b>\n<b> Team_TLN🌝💫</b> \n <i>[</i> '..Dev_Tln..' <i>]</i>\n <b> Developer 😿👇 </b>\n<i>[</i> '..Team_Skype..' <i>]</i>\n<b>To talk to developers 😽❤️</b>\n<i>[</i> '..ii02ii_bot..' <i>]</i> '
                tdcli.sendMessage(arg.chat_id, msg.id_, 1, Ch_Dev, 1, 'html')
			end
		end
		tdcli_function({ ID = 'GetUser', user_id_ = msg.sender_user_id_, }, get_id, {chat_id=msg.chat_id_, user_id=msg.sendr_user_id_})
	end
	
     if matches[1]=="م2" and is_mod(msg) then
		function get_id(arg, data)
			if data.first_name_ then
			local username
				if data.username_ then
					username = '@'..data.username_
				else
                    username = check_markdown(data.first_name_)
				end
				local Dev_Tln 
	 			if is_mod(msg) then
					Dev_Tln = '@Ch_Dev'
				else
					Dev_Tln = '@Ch_Dev'
				end
				local Team_Skype 
	 			if is_mod(msg) then
					Team_Skype = '@Team_Skype'
				else
					Team_Skype = '@Team_Skype'
				end
				local ii02ii_bot 
	 			if is_mod(msg) then
					ii02ii_bot = '@Ii02iI_bot'
				else
					ii02ii_bot = '@Ii02iI_bot'
				end

    local Ch_Dev = ' <b>حـ๋͜ب قـلـ๋͜بيے 😸❤️ :-</b> <i>[</i> '..username..' <i>]</i> \n\n<i>طـريـ๋͜قـة تـنـ๋͜فـيذ الاوامـ๋͜ر هــ๋͜يے 😸👇\n\nامسح + الامر </i> <b>= ݪلـمـ๋͜سـح 😼⚙️</b>\n<i>ضع + الامر </i> <b>=ݪلـوضـ๋͜ع 😸📌</b>\n\n<b>➖🔷➖🔺{T.L.N}🔺➖🔷➖</b>\n\n <i>🗑 اوامـ๋͜ر الـ๋مـ๋͜سـ๋ح ✂️</i>\n\n<b>امسح 🗑✂️ :- (+) </b>\n<i>قائمة الحظر 🤖 + قائمة الكتم 🤐</i>\n\n<i>الترحيب 😿🔖 + القوانين 📝\nالوصف 😾⚙️ + الادمنية 😺👮🏻</i>\n\n<i>المدراء 👳🏻 + قائمة العام 🌝</i>\n\n<i>امسح  :- للـ๋͜مـسـ๋͜ح |بالرد |😸🗑\n</i>\n\n▂▂▂▂▂▂▂▂▂✟▂▂▂▂▂▂▂▂▂\n\n<b>😺 اوامـ๋͜ر الـ๋وضـ๋͜ع 📌</b>\n\n<i>ضع 😼📌 :- (+) </i>\n<i>رابط 😺🖇 + قوانين 😼📝 \n وصف #️⃣ + اسم 😿🖋 \n تكرار 🕹 + ترحيب 🔖</i>\n\n<b>➖🔷➖🔻{T.L.N}🔻➖🔷➖</b>\n<b>تــ๋͜يــ๋͜م ألــ๋͜رئـ✥ـآســ๋͜ة 🌝💫</b> \n <i>[</i> '..Dev_Tln..' <i>]</i>\n <b> آلـمـ๋͜طـوريـ๋͜ن 😿👇 </b>\n<i>[</i> '..Team_Skype..' <i>]</i>\n<b>تـ๋͜وآصــ๋͜ل الـمـ๋͜طـٍوريـ๋͜ن😽❤️</b>\n<i>[</i> '..ii02ii_bot..' <i>]</i> '
				tdcli.sendMessage(arg.chat_id, msg.id_, 1, Ch_Dev, 1, 'html')
			end
		end
		tdcli_function({ ID = 'GetUser', user_id_ = msg.sender_user_id_, }, get_id, {chat_id=msg.chat_id_, user_id=msg.sendr_user_id_})
	end

if matches[1]=="m2" and is_mod(msg) then
		function get_id(arg, data)
			if data.first_name_ then
			local username
				if data.username_ then
					username = '@'..data.username_
				else
                    username = check_markdown(data.first_name_)
				end
				local Dev_Tln 
	 			if is_mod(msg) then
					Dev_Tln = '@Ch_Dev'
				else
					Dev_Tln = '@Ch_Dev'
				end
				local Team_Skype 
	 			if is_mod(msg) then
					Team_Skype = '@Team_Skype'
				else
					Team_Skype = '@Team_Skype'
				end
				local ii02ii_bot 
	 			if is_mod(msg) then
					ii02ii_bot = '@Ii02iI_bot'
				else
					ii02ii_bot = '@Ii02iI_bot'
				end


    local Ch_Dev = ' <b>My age 😹🌝 :- </b><i>[</i> '..username..' <i>]</i> \n\n<b>The way the commands are executed is 👇😸</b> \n\n<i>del + Command </i> <b>= To delete 😼🗑</b>\n<i>set + Command </i> <b>= To put 😻📍</b>\n\n<b>➖🔷➖🔺{T.L.N}🔺➖🔷➖</b>\n\n <i>🗑  Cleaning Command  ✂️</i>\n\n<b>del 🗑✂️ :- (+) </b>\n<i>banlist 🤖 + silentlist 🤐</i>\n\n<i>wlc 😿🔖 + rules 📝\n about 😾⚙️ + mods 😺👮🏻</i>\n\n<i> owners 👳🏻 + bandlist 🌝❌</i>\n\n<i> del  :-  |Reply & id |😸🗑</i>\n\n▂▂▂▂▂▂▂▂▂✟▂▂▂▂▂▂▂▂▂\n\n<b>😺 put Command 📍</b>\n\n<i>set 😼📍 :- (+) </i>\n<i>link 😺🖇 + rules 😼📝 \nabout #️⃣ + name 😿🖋 \nflood 🕹 + wel 🔖</i>\n\n<b> ➖🔷➖🔻{T.L.N}🔻➖🔷➖ \n\nTeam_TLN 🌝💫</b> \n <i>[</i> '..Dev_Tln..' <i>]</i>\n <b> Developers 😿✌️ </b>\n<i>[</i> '..Team_Skype..' <i>]</i>\n<b>To talk to developers😽❤️</b>\n<i>[</i> '..ii02ii_bot..' <i>]</i> '
 				tdcli.sendMessage(arg.chat_id, msg.id_, 1, Ch_Dev, 1, 'html')
			end
		end
		tdcli_function({ ID = 'GetUser', user_id_ = msg.sender_user_id_, }, get_id, {chat_id=msg.chat_id_, user_id=msg.sendr_user_id_})
	end

      if matches[1]=="م3" and is_mod(msg) then
		function get_id(arg, data)
			if data.first_name_ then
			local username
				if data.username_ then
					username = '@'..data.username_
				else
                    username = check_markdown(data.first_name_)
				end
				local Dev_Tln 
	 			if is_mod(msg) then
					Dev_Tln = '@Ch_Dev'
				else
					Dev_Tln = '@Ch_Dev'
				end
				local Team_Skype 
	 			if is_mod(msg) then
					Team_Skype = '@Team_Skype'
				else
					Team_Skype = '@Team_Skype'
				end
				local ii02ii_bot 
	 			if is_mod(msg) then
					ii02ii_bot = '@Ii02iI_bot'
				else
					ii02ii_bot = '@Ii02iI_bot'
				end
				
       local Ch_Dev = ' <b>حـ๋͜تـاتـ๋͜يے 😹🌝 :-</b> <i>[</i> '..username..' <i>]</i> \n\n<i>آوامـ๋͜ر آلآدآرة هـ๋ي 😺✔️ :-</i>\n<b>عمل الاوامر |رد معرف ايدي 🤖</b>\n\n<b>➖🔷➖🔺{T.L.N}🔺➖🔷➖</b>\n\n<i> ارفع ادمن  🚁\nنزل ادمن 🛴 \n\nاحظر ⇎ الغي الحظر🏌🏻😼\n\nاكتم ⇎  الغي الكتم 🚫❗️\n\n تثبيت ⇎ الغي التثبيت 😻📍\n\n منع ⇎  الغي منع (+)  😾❌\n\nلغة :- عربي او انكلش </i>\n<b>لـتـ๋͜حـديـ๋͜د لـغـ๋͜ة آلـبـ๋͜وت 🌝❤️</b> \n\n <i> اطرد :- |رد + ايدي فقط |🏌🏻🌝</i>\n\n▂▂▂▂▂▂▂▂▂✟▂▂▂▂▂▂▂▂▂\n\n<b>قـ๋͜وائـ๋م الـبـ๋͜ان 🌝📍</b>\n\n<i>الادمنية 😸👲🏻:- \n لـرؤيـ๋͜ة آلادمـ๋͜نـ๋يـ๋͜ة 👀👮🏻\n قائمة الحظر 🏌🏻😼 :- \n لـرؤيـ๋͜ة آلـمـ๋͜حـ๋ظـ๋͜وريـ๋͜ن 👀⛔️  \nقائمة الكتم :-😹🤐 \n لـرؤيـ๋͜ة آلـمـ๋͜كـ๋تـ๋͜ومـ๋يـ๋͜ن 👀🚷\n قائمة المنع 😸❌:-\n لـرؤيـ๋͜ة الـكـ๋͜لـمات آلـمـ๋مـنوعـ๋͜ة 👀🥊</i>\n\n<b>➖🔷➖🔻{T.L.N}🔻➖🔷➖\n\n تــ๋͜يــ๋͜م ألــ๋͜رئـ✥ـآســ๋͜ة 🌝💫</b> \n<i>[</i> '..Dev_Tln..' <i>]</i>\n <b> آلـمـ๋͜طـوريـ๋͜ن 🙀👇 </b>\n<i>[</i> '..Team_Skype..' <i>]</i>\n<b>تـ๋͜وآصــ๋͜ل الـمـ๋͜طـٍوريـ๋͜ن😽❤️</b>\n<i>[</i> '..ii02ii_bot..' <i>]</i> '
				tdcli.sendMessage(arg.chat_id, msg.id_, 1, Ch_Dev, 1, 'html')
			end
		end
		tdcli_function({ ID = 'GetUser', user_id_ = msg.sender_user_id_, }, get_id, {chat_id=msg.chat_id_, user_id=msg.sendr_user_id_})
	end

     if matches[1]=="m3" and is_mod(msg) then
		function get_id(arg, data)
			if data.first_name_ then
			local username
				if data.username_ then
					username = '@'..data.username_
				else
                    username = check_markdown(data.first_name_)
				end
				local Dev_Tln 
	 			if is_mod(msg) then
					Dev_Tln = '@Ch_Dev'
				else
					Dev_Tln = '@Ch_Dev'
				end
				local Team_Skype 
	 			if is_mod(msg) then
					Team_Skype = '@Team_Skype'
				else
					Team_Skype = '@Team_Skype'
				end
				local ii02ii_bot 
	 			if is_mod(msg) then
					ii02ii_bot = '@Ii02iI_bot'
				else
					ii02ii_bot = '@Ii02iI_bot'
				end


    local Ch_Dev = ' <b>My life 😺👄 :-</b> <i>[</i> '..username..' <i>]</i> \n\n<i>Management Orders are ⚠️ :- </i>\n<b>How to use ? 🤖📡 \n | Reply & ID only |\n\n➖🔷➖🔺{T.L.N}🔺➖🔷➖\n\npromote 😺🛫\ndemote 😼🛬\n\nban ⇎ unban🏌🏻😼\n\nsilent ⇎  unsilent 🚫❗️\n\npin ⇎ unpin 😻📍\n\nblock ⇎  unblock</b><i> (+)  😾❌</i>\n\n<b>language :- </b><i>Arabic</i><b> Or  </b><i>English</i> <b>   |~ Select Language🌝💋 ~|</b>\n\n<b>kick :- </b><i>|Reply & ID only |🏌🏻🌝\n\n▂▂▂▂▂▂▂▂▂✟▂▂▂▂▂▂▂▂▂\n\nMenus Ban 🌝✨</i>\n\n<b> modlist 👲🏻📃 :- </b>\n<i> To Show moderators 👀👮🏻</i>\n<b>banlist 🏌🏻😼 :-</b>\n<i> To Show ban list  👀⛔️</i>\n<b>silentlist 😹🤐 :-</b>\n<i> To Show silent list 👀🚷</i>\n<b> blocklist 😸❌:-</b>\n<i> To Show ban words list 👀📈</i>\n\n<b>➖🔷➖🔻{T.L.N}🔻➖🔷➖</b>\n<b> Team_TLN🌝💫</b> \n <i>[</i> '..Dev_Tln..' <i>]</i>\n <b> Developer 🙀👇 </b>\n<i>[</i> '..Team_Skype..' <i>]</i>\n<b>To talk to developers 😽❤️</b>\n<i>[</i> '..ii02ii_bot..' <i>]</i> '
 				tdcli.sendMessage(arg.chat_id, msg.id_, 1, Ch_Dev, 1, 'html')
			end
		end
		tdcli_function({ ID = 'GetUser', user_id_ = msg.sender_user_id_, }, get_id, {chat_id=msg.chat_id_, user_id=msg.sendr_user_id_})
	end

      if matches[1]=="م4" and is_mod(msg) then
		function get_id(arg, data)
			if data.first_name_ then
			local username
				if data.username_ then
					username = '@'..data.username_
				else
                    username = check_markdown(data.first_name_)
				end
				local Dev_Tln 
	 			if is_mod(msg) then
					Dev_Tln = '@Ch_Dev'
				else
					Dev_Tln = '@Ch_Dev'
				end
				local Team_Skype 
	 			if is_mod(msg) then
					Team_Skype = '@Team_Skype'
				else
					Team_Skype = '@Team_Skype'
				end
				local ii02ii_bot 
	 			if is_mod(msg) then
					ii02ii_bot = '@Ii02iI_bot'
				else
					ii02ii_bot = '@Ii02iI_bot'
				end
				
    local Ch_Dev = ' <b>رويـ๋͜حـ๋تـ๋͜يے بـطـ๋͜وريے  😻💋:-</b> <i>[</i> '..username..' <i>]</i> \n\n<i>هـ๋͜نـ๋اك آوامـ๋͜ر لـ๋ك ولـ๋͜مـ๋سـاعـ๋͜دك 🌝📍</i>\n\n<b>➖🔷➖🔺{T.L.N}🔺➖🔷➖</b>\n\n<b>للـ๋͜مـ๋شـ๋͜رف 😻👷🏻</b>\n\n<i> فعل ↹ عطل 🌝🕹 :- \n|تـ๋͜فـعـ๋͜يـل وتـ๋͜عـطـ๋͜يـل آلـ๋͜بـ๋وت|\n\nارفع ↹ نزل = المدير 😼✔️:-\n|لـرفـ๋͜ع الـمـ๋نـ๋͜شـى في آلـ๋͜بـ๋وت|\n\nاحظر عام ↹ الغي العام 🏌🏻☹️ :- \n|لـ๋͜حـظـ๋ر والغـاءه من آلـ๋͜بـوت|\n\n قائمة العام 🚁 :-\n|لـرؤيـ๋͜ة آلـمـ๋͜حـظـ๋͜ورين عـ๋͜ام 👀📛|</i>\n\n▂▂▂▂▂▂▂▂▂✟▂▂▂▂▂▂▂▂▂\n\n<b>للـبـ๋͜طـور 😻🕵🏻</b>\n\n<i>ارفع ↹ نزل=مطور+مشرف 😼✔️ :- \n|لـرفـ๋͜ع البطور والمساعد في آلـ๋͜بـ๋وت|\n\nاذاعه ↹ انشر 🏌🏻☹️ :- \n|لنـ๋͜شـر رسـالـ๋͜ة فـ๋͜ي آلكـروبـ๋͜ات 🚁|\n\n المطورين + المشرفين 😺👄:- \n|لـرؤيـ๋͜ة قـوائـ๋͜م المطور والمشرف📛|</i>\n\n<b>➖🔷➖🔻{T.L.N}🔻➖🔷➖</b>\n<b>تــ๋͜يــ๋͜م ألــ๋͜رئـ✥ـآســ๋͜ة 🌝💫</b> \n <i>[</i> '..Dev_Tln..' <i>]</i>\n <b> آلـمـ๋͜طـوريـ๋͜ن 😿👈 </b>\n<i>[</i> '..Team_Skype..' <i>]</i>\n<b>تـ๋͜وآصــ๋͜ل الـمـ๋͜طـٍوريـ๋͜ن😽❤️</b>\n<i>[</i> '..ii02ii_bot..' <i>]</i> '
				tdcli.sendMessage(arg.chat_id, msg.id_, 1, Ch_Dev, 1, 'html')
			end
		end
		tdcli_function({ ID = 'GetUser', user_id_ = msg.sender_user_id_, }, get_id, {chat_id=msg.chat_id_, user_id=msg.sendr_user_id_})
	end

     if matches[1]=="m4" and is_mod(msg) then
		function get_id(arg, data)
			if data.first_name_ then
			local username
				if data.username_ then
					username = '@'..data.username_
				else
                    username = check_markdown(data.first_name_)
				end
				local Dev_Tln 
	 			if is_mod(msg) then
					Dev_Tln = '@Ch_Dev'
				else
					Dev_Tln = '@Ch_Dev'
				end
				local Team_Skype 
	 			if is_mod(msg) then
					Team_Skype = '@Team_Skype'
				else
					Team_Skype = '@Team_Skype'
				end
				local ii02ii_bot 
	 			if is_mod(msg) then
					ii02ii_bot = '@Ii02iI_bot'
				else
					ii02ii_bot = '@Ii02iI_bot'
				end


   local Ch_Dev = ' <b>My soul 😺👄 :-</b> <i>[</i> '..username..' <i>]\n\ncommands for u & the helper :-</i>\n\n<b>➖🔷➖🔺{T.L.N}🔺➖🔷➖</b>\n\n<b>For admin 😽👄\n\nadd ↹ rem 🌝🕹 :- </b>\n<i>|Activate and disable Bot 🤖🕹|</i>\n\n<b>setowner ↹ remowner</b>\n<i>|Raise The owner in Gp😼👍|</i>\n\n<b>banall ↹ unbanall 🏌🏻☹️ :-</b>\n<i>|For banning & unband of bot|</i>\n\n<b>bandlist ☃️ :-</b>\n<i>|To see blocked👀📛|</i>\n\n▂▂▂▂▂▂▂▂▂✟▂▂▂▂▂▂▂▂▂\n\n<b>For developer😻💋\n\nsetsudo ↹ remsudo 😺❤️ &\nsetadmin ↹ remadmin 😺👄 :-</b>\n\n<i>|raise the dev & remove|</i>\n\n<b>banewort ↹ print 😺👄 :-</b>\n<i>|To post a message in GP 🕹|</i>\n\n<b>sudos + admins 😺✌️:-</b>\n<i>|To see the sudo & admins 👀|</i>\n\n<b>➖🔷➖🔻{T.L.N}🔻➖🔷➖</b>\n<b> Team_TLN🌝💫</b> \n <i>[</i> '..Dev_Tln..' <i>]</i>\n <b> Developer 🙀👇 </b>\n<i>[</i> '..Team_Skype..' <i>]</i>\n<b>To talk to developers 😽❤️</b>\n<i>[</i> '..ii02ii_bot..' <i>]</i> '
 				tdcli.sendMessage(arg.chat_id, msg.id_, 1, Ch_Dev, 1, 'html')
			end
		end
		tdcli_function({ ID = 'GetUser', user_id_ = msg.sender_user_id_, }, get_id, {chat_id=msg.chat_id_, user_id=msg.sendr_user_id_})
	end

if matches[1] == "repeat" or matches[1] == "كول" and is_mod(msg) then   --  هذا ملف تكرار بامر كرر + الكلام = البوت يكتبة   
local Memo = matches[2]
return Memo
end
	if matches[1]:lower() == "ارسال ملف" and matches[2] and 
matches[3] then
		local send_file = 
"./"..matches[2].."/"..matches[3]
		tdcli.sendDocument(msg.chat_id_, msg.id_,0, 1, nil, send_file, 'تــ๋͜يــ๋͜م ألــ๋͜رئـ✥ـآســ๋͜ة 🌝💫\n@Ch_Dev', dl_cb, nil)
	end
	if matches[1]:lower() == "جلب ملف" and matches[2] then
	    local plug = "./plugins/"..matches[2]..".lua"
		tdcli.sendDocument(msg.chat_id_, msg.id_,0, 1, nil, plug, 'تــ๋͜يــ๋͜م ألــ๋͜رئـ✥ـآســ๋͜ة 🌝💫\n@Ch_Dev ', dl_cb, nil)
end
	
end 
return { 
	patterns ={
    --Team_Skype--
    "^(شنو اني)$",
    "^(معلوماتي)$",
    "^(me)$",
    "^(info)$",
    --Team_Skype--
    "^(الاوامر)$",
    "^(help)$",
    "^(م1)$",
    "^(m1)$",
    "^(م2)$",
    "^(m2)$",
    "^(م3)$",
    "^(m3)$",
    "^(م4)$",
    "^(m4)$",
    "^(كول)(.+)",
    "^(repeat)(.+)",
    "^(ارسال ملف) (.*)$",
    "^(جلب ملف) (.*)$",


               },
	run = Team_Skype
	}
