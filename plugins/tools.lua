--[[

 _____   _       _   _     
|_   _| | |     | \ | |    
  | |   | |     |  \| |    
  | |   | |___  | |\  |    
  |_|   |_____| |_| \_|    


]]--

local SUDO = 162961370 -- حـط ايـديك<===
local function index_function(user_id)
  for k,v in pairs(_config.admins) do
    if user_id == v[1] then
    	print(k)
      return k
    end
  end
  -- If not found
  return false
end

local function getindex(t,id) 
for i,v in pairs(t) do 
if v == id then 
return i 
end 
end 
return nil 
end 

local function already_sudo(user_id)
  for k,v in pairs(_config.sudo_users) do
    if user_id == v then
      return k
    end
  end
  -- If not found
  return false
end

local function reload_plugins( ) 
  plugins = {} 
  load_plugins() 
end

local function sudolist(msg)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
local sudo_users = _config.sudo_users
  if not lang then
 Ch_Dev = "*List of* _developers_ *😽❤️ :- *\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n"
   else
 Ch_Dev = "* قائـ✥ـٍمـﮥ المطــ๋͜وريـ✥ـٍن 😻💋 :-* \n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n"
  end
for i=1,#sudo_users do
    Ch_Dev = Ch_Dev..i.." - "..sudo_users[i].."\n"
end
return Ch_Dev
end

local function adminlist(msg)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
local sudo_users = _config.sudo_users
  if not lang then
 Ch_Dev = "*List of admins in albot 😸👇 :- *\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n"
   else
 Ch_Dev = "*قائـ✥ـٍمـﮥ المشـ✥ـٍــرفـ✥ـٍين 😸✌️ :- *\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n"
  end
		  	local compare = Ch_Dev
		  	local i = 1
		  	for v,user in pairs(_config.admins) do
			    Ch_Dev = Ch_Dev..i..'- '..(user[2] or '')..' ➢ ('..user[1]..')\n'
		  	i = i +1
		  	end
		  	if compare == Ch_Dev then
   if not lang then
      Ch_Dev = '*There are* _ no Admins 😾🕵🏻️‍♀️_'
      else
      Ch_Dev = '*ݪا يـﯡجـ✥ـٍﮃ المشـ✥ـٍــرفـ✥ـٍين 😾🙌*'
           end
		  	end
		  	return Ch_Dev
    end
local function action_by_reply(arg, data)
    local cmd = arg.cmd
if not tonumber(data.sender_user_id_) then return false end
    if data.sender_user_id_ then
    if cmd == "ارفع مشرف" then
local function adminprom_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if is_admin1(tonumber(data.id_)) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* he is already* _admin 😸🕹_ *[*"..user_name.." *]*", 0, "md")
  else
    return  tdcli.sendMessage(arg.chat_id, "", 0, "* وآلـ๋͜لـه ۿــ๋͜و مـ๋͜شـ✥ـٍــرف 😾☑️* `[` "..user_name.." `]`", 0, "md")
      end
   end
	    table.insert(_config.admins, {tonumber(data.id_), user_name})
		save_config()
     if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*Done* _promoted to admin 😺✌️_  `[` "..user_name.." `]`", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "*تـ✥ـٍم رف✥ـٍع رتبـ๋͜تك مشـ✥ـٍرف 😽* `[` "..user_name.." `]`", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, adminprom_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "نزل مشرف" then
local function admindem_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
	local nameid = index_function(tonumber(data.id_))
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not is_admin1(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* He is not* _admin 😿🤳 _ `[` "..user_name.." `]`", 0, "md")
   else
    return  tdcli.sendMessage(arg.chat_id, "", 0, "* وآلـ๋͜لـه ۿــ๋͜و ليـ✥ـٍس مـ๋͜شـ✥ـٍـرف 😾❌ `[` "..user_name.." `]`", 0, "md")
    end
   end
		table.remove(_config.admins, nameid)
		save_config()
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*Your rank has been* _lowered to user 😼👊_ `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "*تـ✥ـٍم خفـ✥ـٍض رتبـ๋͜تك الـ๋͜ى عـ๋͜ضـ๋͜و 😺☂️* `[` "..user_name.." `]`", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, admindem_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "ارفع مطور" then
local function visudo_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if already_sudo(tonumber(data.id_)) then
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* he is already* _ Sudo(Dev) 😻💋 _ *[* "..user_name.." *]*", 0, "md")
   else
    return  tdcli.sendMessage(arg.chat_id, "", 0, "* وآلـ๋͜لـه ۿــ๋͜و مـ๋͜طـ✥ـور 😽☑️* `[` "..user_name.." `]`", 0, "md")
      end
   end
          table.insert(_config.sudo_users, tonumber(data.id_))
		save_config()
     reload_plugins(true)
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*You have been* _promoted to Dev 😻💋_  `[` "..user_name.." `]`", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "*تـ✥ـٍم رف✥ـٍع رتبـ๋͜تك مطــ๋͜ور 😻👏* `[` "..user_name.." `]`", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, visudo_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "نزل مطور" then
local function desudo_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
     if not already_sudo(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* he is n't * _Sudo 😿❌_ *[* "..user_name.." *]*", 0, "md")
  else
    return  tdcli.sendMessage(arg.chat_id, "", 0, "* وآلـ๋͜لـه ۿــ๋͜و ليـ๋͜س مطــ๋͜ور 😼❌* `[` "..user_name.." `]`", 0, "md")
      end
   end
          table.remove(_config.sudo_users, getindex( _config.sudo_users, tonumber(data.id_)))
		save_config()
     reload_plugins(true) 
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*Your rank has been* _lowered User 😼👊_ `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "*تـ✥ـٍم خفـ✥ـٍض رتبـ๋͜تك الـ๋͜ى عـ๋͜ظـ๋͜و 😺🌹* `[` "..user_name.." `]`", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, desudo_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
else
    if lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*لـ✥ـٍم يتـ✥ـٍم العثــ๋͜ور علـﯽ أݪـﻤـ✥ـٍسݓـخدم هـ๋͜ذآ 😿⚠️*", 0, "md")
   else
  return tdcli.sendMessage(data.chat_id_, "", 0, "*This username was* _not found 😾❌_", 0, "md")
      end
   end
end

local function action_by_username(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local cmd = arg.cmd
if not arg.username then return false end
    if data.id_ then
if data.type_.user_.username_ then
user_name = '@'..check_markdown(data.type_.user_.username_)
else
user_name = check_markdown(data.title_)
end
    if cmd == "ارفع مشرف" then
if is_admin1(tonumber(data.id_)) then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* he is already* _admin 😸🕹_ *[* "..user_name.." *]*", 0, "md")
  else
    return  tdcli.sendMessage(arg.chat_id, "", 0, "* وآلـ๋͜لـه ۿــ๋͜و مـ๋͜شـ✥ـٍــرف 😾☑️* `[` "..user_name.." `]`", 0, "md")
      end
   end
		table.remove(_config.admins, nameid)
		save_config()
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*You have been* _promoted to admin 😺✌️_  `[` "..user_name.." `]`", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "*تـ✥ـٍم رف✥ـٍع رتبـ๋͜تك مشـ✥ـٍرف 😽* `[` "..user_name.." `]`", 0, "md")
   end
end
    if cmd == "نزل مشرف" then
	local nameid = index_function(tonumber(data.id_))
if not is_admin1(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* He is not* _admin 😿🤳 _ `[` "..user_name.." `]`", 0, "md")
   else
    return  tdcli.sendMessage(arg.chat_id, "", 0, "* وآلـ๋͜لـه ۿــ๋͜و ليـ✥ـٍس مـ๋͜شـ✥ـٍـرف 😾❌* `[` "..user_name.." `]`", 0, "md")
      end
   end
		table.remove(_config.admins, nameid)
		save_config()
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*Your rank has been* _lowered to user 😼👊_ `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "*تـ✥ـٍم خفـ✥ـٍض رتبـ๋͜تك الـ๋͜ى عـ๋͜ضـ๋͜و 😺☂️* `[` "..user_name.." `]`", 0, "md")
   end
end
    if cmd == "ارفع مطور" then
if already_sudo(tonumber(data.id_)) then
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* he is already* _ Sudo(Dev) 😻💋 _ *[* "..user_name.." *]*", 0, "md")
   else
    return  tdcli.sendMessage(arg.chat_id, "", 0, "* وآلـ๋͜لـه ۿــ๋͜و مـ๋͜طـ✥ـور 😾☑️* `[` "..user_name.." `]`", 0, "md")
      end
   end
          table.insert(_config.sudo_users, tonumber(data.id_))
		save_config()
     reload_plugins(true)
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*You have been* _promoted to Dev(Sudo) 😻💋_  `[` "..user_name.." `]`", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "*تـ✥ـٍم رف✥ـٍع رتبـ๋͜تك مطــ๋͜ور 😻👏* `[` "..user_name.." `]`", 0, "md")
   end
end
    if cmd == "نزل مطور" then
     if not already_sudo(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* he is n't * _Sudo 😿❌_ *[ "..user_name.." ]*", 0, "md")
  else
    return  tdcli.sendMessage(arg.chat_id, "", 0, "* وآلـ๋͜لـه ۿــ๋͜و ليـ๋͜س مطــ๋͜ور 😼❌* `[` "..user_name.." `]`", 0, "md")
      end
   end
          table.remove(_config.sudo_users, getindex( _config.sudo_users, tonumber(data.id_)))
		save_config()
     reload_plugins(true) 
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*Your rank has been* _lowered User 😼👊_ `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "*تـ✥ـٍم خفـ✥ـٍض رتبـ๋͜تك الـ๋͜ى عـ๋͜ظـ๋͜و 😺🌹* `[` "..user_name.." `]`", 0, "md")
      end
   end
else
    if lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*لـ✥ـٍم يتـ✥ـٍم العثــ๋͜ور علـﯽ أݪـﻤـ✥ـٍسݓـخدم هـ๋͜ذآ 😿⚠️*", 0, "md")
   else
  return tdcli.sendMessage(data.chat_id_, "", 0, "*This username was* _not found 😾❌_", 0, "md")
      end
   end
end

local function action_by_id(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local cmd = arg.cmd
if not tonumber(arg.user_id) then return false end
   if data.id_ then
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
    if cmd == "ارفع مشرف" then
if is_admin1(tonumber(data.id_)) then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* he is already* _admin 😸🕹_ *[* "..user_name.." *]*", 0, "md")
  else
    return tdcli.sendMessage(arg.chat_id, "", 0, "* وآلـ๋͜لـه ۿــ๋͜و مـ๋͜شـ✥ـٍــرف 😾☑️* `[` "..user_name.." `]`", 0, "md")
      end
   end
		table.remove(_config.admins, nameid)
		save_config()
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*You have been* _promoted to admin 😺✌️_  `[` "..user_name.." `]`", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "*تـ✥ـٍم رف✥ـٍع رتبـ๋͜تك مشـ✥ـٍرف 😽👏* `[` "..user_name.." `]`", 0, "md")
   end
end
    if cmd == "نزل مشرف" then
	local nameid = index_function(tonumber(data.id_))
if not is_admin1(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* He is not* _admin 😿🤳 _ `[`  "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "* وآلـ๋͜لـه ۿــ๋͜و ليـ✥ـٍس مـ๋͜شـ✥ـٍـرف 😾❌* `[`  "..user_name.." `]`", 0, "md")
      end
   end
		table.remove(_config.admins, nameid)
		save_config()
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*Your rank has been* _lowered to user 😼👊_ `[`  "..user_name.."  `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "*تـ✥ـٍم خفـ✥ـٍض رتبـ๋͜تك الـ๋͜ى عـ๋͜ضـ๋͜و 😺☂️* `[`  "..user_name.."  `]`", 0, "md")
   end
end
    if cmd == "ارفع مطور" then
if already_sudo(tonumber(data.id_)) then
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* he is already* _ Sudo(Dev) 😻💋 _ *[* "..user_name.." *]*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "* وآلـ๋͜لـه ۿــ๋͜و مـ๋͜طـ✥ـور 😾☑️* `[` "..user_name.." `]`", 0, "md")
      end
   end
          table.insert(_config.sudo_users, tonumber(data.id_))
		save_config()
     reload_plugins(true)
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*You have been* _promoted to Dev 😻💋_  `[` "..user_name.." `]`", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "*تـ✥ـٍم رف✥ـٍع رتبـ๋͜تك مطــ๋͜ور 😻👏* `[` "..user_name.." `]`", 0, "md")
   end
end
    if cmd == "نزل مطور" then
     if not already_sudo(data.id_) then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* he is n't * _Sudo 😿❌_ *[* "..user_name.." *]*", 0, "md")
  else
    return tdcli.sendMessage(arg.chat_id, "", 0, "* وآلـ๋͜لـه ۿــ๋͜و ليـ๋͜س مطــ๋͜ور 😼❌* `[` "..user_name.." `]`", 0, "md")
      end
   end
          table.remove(_config.sudo_users, getindex( _config.sudo_users, tonumber(data.id_)))
		save_config()
     reload_plugins(true) 
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*Your rank has been* _lowered User 😼👊_ `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "*تـ✥ـٍم خفـ✥ـٍض رتبـ๋͜تك الـ๋͜ى عـ๋͜ظـ๋͜و 😺🌹* `[` "..user_name.." `]`", 0, "md")
      end
   end
else
    if lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*لـ✥ـٍم يتـ✥ـٍم العثــ๋͜ور علـﯽ أݪـﻤـ✥ـٍسݓـخدم هـ๋͜ذآ 😿⚠️*", 0, "md")
   else
  return tdcli.sendMessage(data.chat_id_, "", 0, "*This username was* _not found 😾❌_", 0, "md")
      end
   end
end

local function Team_Skype(msg, matches)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if tonumber(msg.sender_user_id_) == SUDO then
if matches[1] == "ارفع مطور" or matches[1] == "setsudo" then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="ارفع مطور"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="ارفع مطور"})
    end
  end
if matches[1] == "نزل مطور" or matches[1] == "remsudo" then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="نزل مطور"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="نزل مطور"})
    end
   end
end
if matches[1] == "ارفع مشرف" or matches[1] == "setadmin" and is_sudo(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="ارفع مشرف"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="ارفع مشرف"})
    end
   end
if matches[1] == "نزل مشرف" or matches[1] == "remadmin" and is_sudo(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="نزل مشرف"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="نزل مشرف"})
    end
   end

if matches[1] == 'الماركدون' or matches[1] == "markdown" and is_mod(msg) then
if matches[2] == 'فعل' then
redis:set('markread','on')
   if not lang then
return '*Markread* _activated 😺📍_'
else
   return '*تـ๋͜م تـفـ✥ـٍعيـل آلـ๋͜مـاركـ๋͜دون 😸📍*'
   end
end

if matches[2] == 'عطل' then
redis:set('markread','off')
  if not lang then
return '*Markread* _disabled 😿❌_'
   else
   return '*تـ๋͜م تـعـ✥ـٍطيـل آلـ๋͜مـاركـ๋͜دون 😻🎺*'
      end
   end
end

if matches[1] == "انشر" or matches[1] == "print" and is_admin(msg) then
tdcli.sendMessage(matches[2], 0, 0, matches[3], 0)	end	

if matches[1] == "اذاعه" or matches[1] == "banewort" and is_sudo(msg) then
local data = load_data(_config.moderation.data)		
local bc = matches[2]			
for k,v in pairs(data) do				
tdcli.sendMessage(k, 0, 0, bc, 0)			
end	
end
if matches[1] == "المطورين" or matches[1] == "sudos" and is_sudo(msg) then
return sudolist(msg)
    end
if matches[1] == 'المطور' or matches[1] == 'dev' then
return tdcli.sendMessage(msg.chat_id_, msg.id_, 1, _config.info_text, 1, 'html')
    end
if matches[1] == "المشرفين" or matches[1] == "admins" and is_admin(msg) then
return adminlist(msg)
    end
     if matches[1] == 'زحلك منا' and is_admin(msg) then
  tdcli.changeChatMemberStatus(chat, our_id, 'Left', dl_cb, nil)
   end
     if matches[1] == 'خروج البوت' and is_admin(msg) then
local hash = 'auto_leave_bot'
--Enable Auto Leave
     if matches[2] == 'فعل' then
    redis:del(hash)
   if not lang then
return '*Exit bot* _is activated 😿☹️_'
else
   return '*تـ๋͜م تـفـ✥ـٍعيـل خـآصيـ๋͜ة آلـ๋͜مـ✥ـٍغـ๋͜ادرة 😿🐿*'
   end
end

--Disable Auto Leave
 if matches[2] == 'عطل' then
    redis:set(hash, true)
   if not lang then
    return '*Exit bot* _is disabled 😸❤️_'
else
    return '*تـ๋͜م تـعـ✥ـٍطيـل خـآصيـ๋͜ة آلـ๋͜مـ✥ـٍغـ๋͜ادرة 😻🎺*'
  end
end

--Auto Leave Status
if matches[2] == 'الحاله' then
      if not redis:get(hash) then
   return '*خـ๋͜روج آلـ๋͜بـوت مـ✥ـٍفـعـ๋͜ل 😿✔️*'
       else
   return '*خـ๋͜روج آلـ๋͜بـوت مـ✥ـٍعـطـ๋͜ل 😸❌*'
         end
      end
   end
end
return { 
patterns = { 
"^(ارفع مطور)$", 
"^(setsudo)$", 
"^(نزل مطور)$",
"^(remsudo)$",
"^(ارفع مطور) (.*)$", 
"^(setsudo) (.*)$", 
"^(نزل مطور) (.*)$",
"^(remsudo) (.*)$",
"^(المطورين)$",
"^(sudos)$",
--Team_Skype--
"^(ارفع مشرف)$", 
"^(setadmin)$", 
"^(نزل مشرف)$",
"^(remadmin)$",
"^(ارفع مشرف) (.*)$", 
"^(setadmin) (.*)$", 
"^(نزل مشرف) (.*)$",
"^(setadmin) (.*)$",
"^(المشرفين)$",
"^(admins)$",
--Team_Skype--
"^(الماركدون) (.*)$",
"^(markdown) (.*)$",]]
--Team_Skype--
"^(انشر) (%d+) (.*)$",
"^(اذاعه) (.*)$",
--Team_Skype--
"^(المطورين)$",
"^(sudos)$",
"^(المطور)$",
"^(dev)$",
"^(المشرفين)$",
"^(admins)$",
--Team_Skype--
"^(زحلك منا)$",
"^(خروج البوت) (.*)$", 

}, 
run = Team_Skype 
}
-- By Dev Memo (@ii02ii)
-- By Dev Advisor (@dev_XxMTxX) {زخرفه}
