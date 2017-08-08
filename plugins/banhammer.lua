--[[

 _____   _       _   _     
|_   _| | |     | \ | |    
  | |   | |     |  \| |    
  | |   | |___  | |\  |    
  |_|   |_____| |_| \_|    


]]--

local function II02II(msg)
chat = msg.chat_id_
user = msg.sender_user_id_
	local function check_newmember(arg, data)
		test = load_data(_config.moderation.data)
		lock_bots = test[arg.chat_id]['settings']['lock_bots']
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    if data.type_.ID == "UserTypeBot" then
      if not is_owner(arg.msg) and lock_bots == 'yes' then
kick_user(data.id_, arg.chat_id)
end
end
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if is_banned(data.id_, arg.chat_id) then
   if not lang then
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, "*User has been* _blocked 🤖🏌🏻_ *[* "..user_name.." *]* ", 0, "md")
   else
		  tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, "_أݪـ๋͜ﻤسـ๋͜ݓـخدݦ ٺـ๋͜م حظـ๋͜ره مـݨ آلـمـ๋͜جـموعـ๋͜ة🏌🏻🤖_ *[* "..user_name.." *]*`", "md")
end
kick_user(data.id_, arg.chat_id)
end
if is_gbanned(data.id_) then
     if not lang then
		  		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, "_User_ *banned* _from groups 🤖❌_ *[* "..user_name.." *]*", 0, "md")
    else
             return tdcli.sendMessage(arg.chat_id, "", 0, "_أݪـ๋͜ﻤسـ๋͜ݓـخدݦ ٺـ๋͜م حظـ๋͜ره عـام 🏌🏻🤤_ *[*  "..user_name.."  *]*", "md")
   end
kick_user(data.id_, arg.chat_id)
     end
	end
	if msg.adduser then
			tdcli_function ({
	      ID = "GetUser",
      	user_id_ = msg.adduser
    	}, check_newmember, {chat_id=chat,msg_id=msg.id_,user_id=user,msg=msg})
	end
	if msg.joinuser then
			tdcli_function ({
	      ID = "GetUser",
      	user_id_ = msg.joinuser
    	}, check_newmember, {chat_id=chat,msg_id=msg.id_,user_id=user,msg=msg})
	end
if is_silent_user(user, chat) then
del_msg(msg.chat_id_, msg.id_)
end
if is_banned(user, chat) then
del_msg(msg.chat_id_, tonumber(msg.id_))
    kick_user(user, chat)
   end
if is_gbanned(user) then
del_msg(msg.chat_id_, tonumber(msg.id_))
    kick_user(user, chat)
   end
end
function kick_user(user_id, chat_id)
if not tonumber(user_id) then
return false
end
  tdcli.changeChatMemberStatus(chat_id, user_id, 'Kicked', dl_cb, nil)
end

function del_msg(chat_id, message_ids)
local msgid = {[0] = message_ids}
  tdcli.deleteMessages(chat_id, msgid, dl_cb, nil)
end
-------[ silent_users_list ]-------
-------------[ قائمة الكتم ]------------
function silent_users_list(chat_id)
local hash = "gp_lang:"..chat_id
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
-------[ The menu is empty ]-------
------------[ القائمة فارغة ]-----------
if next(data[tostring(chat_id)]['is_silent_users']) == nil then --fix way
        if not lang then
        return "*Silent list*  _is empty 😸📍_"
   else
        return "_قـائـ๋͜مـة آلـ๋͜كـتـ๋͜م فـارغـ๋͜ة 😸❌_"
             end
				end
      if not lang then
	    Ch_Dev = "_List of_  *silent users 😺🤐:-*\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n"
   else
        Ch_Dev = "_قائـ✥ـٍمـﮥ المــ๋͜كـتومـيـ✥ـٍن 😼🤐 :-_\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n"
    end
  for k,v in pairs(data[tostring(chat_id)]['is_silent_users']) do
              Ch_Dev = Ch_Dev..'*'..i..'* - _'..k..'_\n'
   i = i + 1
end
  return Ch_Dev
end
-------[ ban_users_list ]-------
-----------[ قائمة الحظر ]----------
function banned_list(chat_id)
local hash = "gp_lang:"..chat_id
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
-------[ The menu is empty ]-------
------------[ القائمة فارغة ]-----------
  if next(data[tostring(chat_id)]['banned']) == nil then --fix way
     if not lang then
					return "_The_  *ban list is empty 😼❌*"
            else
					return "_قـائـ๋͜مـة الـحـ๋͜ظـر فـارغـ๋͜ة 😼❌_"
              end
				end
       if not lang then
	    Ch_Dev = "_List of_  *ban users 😺✌️:-*\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n"
         else
        Ch_Dev = "_قائـ✥ـٍمـﮥ المــ๋͜حـظـوريـ✥ـٍن 😺💃  :-_\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n"
     end
  for k,v in pairs(data[tostring(chat_id)]['banned']) do
              Ch_Dev = Ch_Dev..'*'..i..'* - _'..k..'_\n'
   i = i + 1
end
  return Ch_Dev
end
-------[ banall_users_list ]-------
-----------[ قائمة الحظر العام ]----------
 function gbanned_list(msg)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data['gban_users'] then
    data['gban_users'] = {}
    save_data(_config.moderation.data, data)
  end
-------[ The menu is empty ]-------
------------[ القائمة فارغة ]-----------
  if next(data['gban_users']) == nil then 
    if not lang then
					return "_The_  *band list is empty 😸📍*"
   else
					return "_قـائـ๋͜مـة الـحـ๋͜ظـر الـعـ๋͜ام فـارغـ๋͜ة 😾❌_"
             end
				end
        if not lang then
        Ch_Dev = "*List of* _bandlist  users  :- 😺✌️_\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n"
   else
        Ch_Dev = "_ قائـ๋͜مـة المـ๋͜حـظـوريـ๋͜ن الـعـ๋͜ام 😼👏 :-_\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n"
   end
  for k,v in pairs(data['gban_users']) do
        
    Ch_Dev = Ch_Dev..'*'..i..'* - _'..k..'_\n'
   i = i + 1
end
  return Ch_Dev
end

local function action_by_reply(arg, data)
local hash = "gp_lang:"..data.chat_id_
local lang = redis:get(hash)
  local cmd = arg.cmd
if not tonumber(data.sender_user_id_) then return false end
if data.sender_user_id_ then
  if cmd == "احظر" then
local function ban_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
   if is_mod1(arg.chat_id, data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can not block_ *moderators & admins 😾❌*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_ݪأ يـمـ๋͜كنـ๋͜ك حـظـ๋͜ﮍ الـ๋͜مـشـ๋͜رڣـيـ๋͜ن ﯠ الادمنـيـ๋͜ه 😼👊_", 0, "md")
         end
     end
if administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*The user is already* `banned 😺🏌🏻` _[_ "..user_name.." _]_ ", 0, "md")
   else
       return tdcli.sendMessage(arg.chat_id, "", 0, "_وآلـ๋͜لـه_ *آلـعـ๋͜ضـ๋͜و_  *حظـ๋͜رتـ๋͜ه 🏌🏻😺_ *[* "..user_name.." *]*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
    if not lang then
	return tdcli.sendMessage(arg.chat_id, "", 0, "*User* _blocked 😸👉_ `[` "..user_name.." `]`", 0, "md")
    else
       return tdcli.sendMessage(arg.chat_id, "", 0, "_أݪـ๋͜ﻤسـ๋͜ݓـخدݦ ٺـ๋͜م حظـ๋͜ره مـݨ آلـمـ๋͜جـموعـ๋͜ة😸👈_*[* "..user_name.." *]*", "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, ban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
   if cmd == "الغي الحظر" then
local function unban_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User is_ *not banned* `[` "..user_name.." `]`😻💋 `", 0, "md")
   else
       return tdcli.sendMessage(arg.chat_id, "", 0, "_وآلـ๋͜لـه_  *أݪـﻤـ๋͜سـݓـ๋͜خدݦ* _ٺـ๋͜م آلـ๋͜غـ๋͜آء حظـ๋͜ره 😾🥁_ *[* "..user_name.." *]*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ *Block* _Canceled_ `[` "..user_name.." `]` 😿💋", 0, "md")
   else
   return tdcli.sendMessage(arg.chat_id, "", 0, "_ٺـ๋͜م آلـ๋͜غـ๋͜آء حظـ๋͜ر_  *أݪـﻤـ๋͜سـݓـ๋͜خدݦ 😽💋* *[* "..user_name.." *]*", 0, "md")

   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, unban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "اكتم" then
local function silent_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
   if is_mod1(arg.chat_id, data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't silent_ *moderators & admins 😺🏌🏻*", 0, "md")
    else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_ݪأ يـمـ๋͜كـنكٍ اسـ๋͜ڰات المـ๋͜شـٍرڣيـ๋͜ن ﯠ الآدمـنـ๋͜يه 🏌🏻😼_", 0, "md")
       end
     end
if administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "_The user is_ *already silent 😼🎻* `[` "..user_name.." `]`", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "_وآلـ๋͜لـه تـ๋͜م  إسـ๋͜كاٺـﮧ أݪـﻤـ๋͜سـݓـ๋͜خدݦ 🌞💥_ *[* "..user_name.." *]*", 0, "md")
     end
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
  if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "_The user is_ *silent now 🙀⛔️* `[` "..user_name.." `]`", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "*تـ๋͜م إسـ๋͜كاٺـﮧ أݪـ๋͜ﻤـسـݓـ๋͜خـدݦ 😽🎧* `[` "..user_name.." `]`", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, silent_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "الغي الكتم" then
local function unsilent_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "_silents_ *has been removed 😺🎤* `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_وآلـ๋͜لـه ٺـ๋͜م آلـ๋͜غـ๋͜آء كـ๋͜تـم أݪـﻤـ๋͜سـݓـ๋͜خدݦ 😾❌_ *[* "..user_name.." *]*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "_The user is_ *not silent now 😸❤️*️ `[` "..user_name.." `]`", 0, "md")
  else
return tdcli.sendMessage(arg.chat_id, "", 0, "_ٺـ๋͜م آلـ๋͜غـ๋͜آء كـ๋͜تـم أݪـﻤـ๋͜سـݓـ๋͜خدݦ 😻⛹🏻_  *[* "..user_name.." *]*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, unsilent_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "احظر عام" then
local function gban_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
   if is_admin1(data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*You can not* _block the admins_ *from bot 😼🔞*", 0, "md")
  else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_ݪأ يـمـ๋͜كنـ๋͜ك حـظـ๋͜ﮍ الـ๋͜مـشـ๋͜رڣـيـ๋͜ن ﯠ الادمنـيـ๋͜ه 😼👊_", 0, "md")
        end
     end
if is_gbanned(data.id_) then
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*User* _banned_ *from all groups 😺✌️* `[` "..user_name.." `]`", 0, "md")
    else
  return tdcli.sendMessage(msg.chat_id_, "", 0, "_وآلـ๋͜لـه ٺـ๋͜م حـظـ๋͜ر أݪـﻤـ๋͜سـݓـ๋͜خدݦ عـ๋͜آم 😼👏_ *[* "..matches[2].." *]*", 0, "md")
   end
   end
  administration['gban_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
     if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*User* _banned_ *from groups 😼👐* `[` "..user_name.." `]`", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0,"*ٺـ๋͜ـٍم حظــ๋͜ر أݪـﻤـ✥ـٍسݓـ๋͜خدݦ عـ๋͜آم😼💫* `[` "..user_name.." `]`", "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, gban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "الغي العام" then
local function ungban_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
if not is_gbanned(data.id_) then
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*User is _not banned_ *from all groups 😺💋* `[` "..user_name.." `]`", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "*وآلـ๋͜لـه ٺـ๋͜ـٍم آلـغـ๋͜آء آلـ๋͜عـآم مـݨ أݪـﻤـ✥ـٍسݓـ๋͜خدݦ 😾👊*`[` "..user_name.." `]`", 0, "md")
      end
   end
  administration['gban_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*User is _not banned_ *from all groups 😸❤️* `[` "..user_name.." `]`", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "_ٺـ๋͜م آلـغـ๋͜آء آلـ๋͜عـآم مـݨ أݪـﻤـ๋͜سـݓـ๋͜خدݦ 😽❤️_ *[* "..user_name.." *]*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, ungban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "اطرد" then
   if is_mod1(data.chat_id_, data.sender_user_id_) then
   if not lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*You can't kick* _owners and admins_ *From Bot 😿❌*", 0, "md")
    elseif lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_ݪأ يـ๋͜ﻤـكݩـ๋͜ڬ طــ๋͜ﮍد المـشــ๋͜رڣـيـ๋͜ن ﯠ الادمنـيـ๋͜ه 😼❌_", 0, "md")
   end
  else
     kick_user(data.sender_user_id_, data.chat_id_)
     end
  end
  if cmd == "امسح الرسائل" then
   if is_mod1(data.chat_id_, data.sender_user_id_) then
   if not lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*You can't Delete All messages* _owners and admins 😾🏋️_", 0, "md")
   elseif lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*ݪأ يـﻤـ✥ـٍكݩـڬ حــ๋͜ذف رسـ๋͜آئـ๋͜ل المـشــ๋͜رڣيـ✥ـٍن ﯠ الادمنـ✥ـٍيـ๋͜ه 🤥😹*", 0, "md")
   end
  else
tdcli.deleteMessagesFromUser(data.chat_id_, data.sender_user_id_, dl_cb, nil)
   if not lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*User messages have* _been deleted 😽✌️_ `[` "..data.sender_user_id_.." `]`", 0, "md")
      elseif lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*رسـ๋͜آئـٍل أݪـﻤـ✥ـٍسݓـخدم ٺـ๋͜ـٍم حـ๋͜ذفـ✥ـٍهـ๋͜ا 😽✔️* `[` "..data.sender_user_id_.." `]`", 0, "md")
end
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
local function action_by_username(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
  local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
if not arg.username then return false end
    if data.id_ then
if data.type_.user_.username_ then
user_name = '@'..check_markdown(data.type_.user_.username_)
else
user_name = check_markdown(data.title_)
end
  if cmd == "احظر" then
   if is_mod1(arg.chat_id, data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can not block_ *moderators & admins 😾❌*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_ݪأ يـ๋͜ﻤـكݩـ๋͜ڬ حــ๋͜ظـﮍ المـشــ๋͜رڣـيـ๋͜ن ﯠ الادمنـيـ๋͜ه 😼👊_", 0, "md")
         end
     end
if administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*The user is already* _banned 😺🏌🏻_ `[` "..user_name.." `]` ", 0, "md")
   else
       return tdcli.sendMessage(arg.chat_id, "", 0, "_وآلـ๋͜لـه_ *أݪـﻤـ๋͜سـݓـ๋͜خدݦ* _حظـ๋͜رتـ๋͜ه 🏌🏻😺_ *[* "..user_name.." *]*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
    if not lang then
	return tdcli.sendMessage(arg.chat_id, "", 0, "*User* _blocked 😸👉_ `[` "..user_name.." `]`", 0, "md")
    else
       return tdcli.sendMessage(arg.chat_id, "", 0, "_ٺـ๋͜م حـظـ๋͜ر أݪـﻤـ๋͜سـݓـ๋͜خدݦ مـݨ المـ๋͜جـمـوﻋـ๋͜ة 👉😸_ *[* "..user_name.." *]*", "md")
   end
end
   if cmd == "الغي الحظر" then
if not administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User is_ *not banned* `[` "..user_name.." `]`😻💋 `", 0, "md")
   else
       return tdcli.sendMessage(arg.chat_id, "", 0, "_وآلـ๋͜لـه_ *أݪـﻤـ๋͜سـݓـ๋͜خدݦ*_ٺـ๋͜ـٍم آلـ๋͜غـ๋͜آء حظـ๋͜ره 😾🥁_ *[* "..user_name.." *]*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ *Block* _Canceled_ `[` "..user_name.." `]` 😿💋", 0, "md")
   else
       return tdcli.sendMessage(arg.chat_id, "", 0, "*ٺـ๋͜ـٍم آلـ๋͜غـ๋͜آء حظـ๋͜ر* _أݪـﻤـ๋͜سـݓـ๋͜خدݦ 😽💋_ *[* "..user_name.." *]*", 0, "md")
   end
end
  if cmd == "اكتم" then
   if is_mod1(arg.chat_id, data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't silent_ *moderators & admins 😺🏌🏻*", 0, "md")
    else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_ݪأ يمـ๋͜كـنـ๋͜كٍ كـتـ๋͜م المـشــ๋͜رڣـيـ๋͜ن ﯠ الادمنـيـ๋͜ه 🏌🏻😼_", 0, "md")
       end
     end
if administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "_The user is_ *already silent 😼🎻* `[` "..user_name.." `]`", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "_وآلـ๋͜لـه تــ๋͜م  إسـ๋͜كاٺـﮧ أݪـﻤـ๋͜سـݓـ๋͜خدݦ🌞💥_ *[* "..user_name.." *]*", 0, "md")
     end
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
  if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "_The user is_ *silent now 🙀⛔️* `[` "..user_name.." `]`", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "_تــ๋͜م إسـ๋͜كاٺـﮧ أݪـﻤـ๋͜سـݓـ๋͜خدݦ 😽🎧_ *[* "..user_name.." *]*", 0, "md")
   end
end
  if cmd == "الغي الكتم" then
if not administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "_silents_ *has been removed 😺🎤* `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_وآلـ๋͜لـه ٺـ๋͜م آلـ๋͜غـ๋͜آء كـ๋͜تـم أݪـﻤـ๋͜سـݓـ๋͜خدݦ 😾❌_ *[* "..user_name.." *]*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "_The user is_ *not silent now 😸❤️*️ `[` "..user_name.." `]`", 0, "md")
  else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_ٺـ๋͜م آلـ๋͜غـ๋͜آء كـ๋͜تـم أݪـﻤـ๋͜سـݓـ๋͜خدݦ 😻⛹🏻_  *[* "..user_name.." *]*", 0, "md")
   end
end
  if cmd == "احظر عام" then
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
   if is_admin1(data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*You can not* _block the admins_ *from bot 😼🔞*", 0, "md")
  else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_ݪأ يـ๋͜ﻤـكݩـ๋͜ڬ حــ๋͜ظـﮍ المـشــ๋͜رڣـيـ๋͜ن ﯠ الادمنـيـ๋͜ه 😼👊_", 0, "md")
        end
     end
if is_gbanned(data.id_) then
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*User* _banned_ *from all groups 😺✌️* `[` "..user_name.." `]`", 0, "md")
    else
     return tdcli.sendMessage(arg.chat_id, "", 0,"_وآلـ๋͜لـه ٺـ๋͜م حـظـ๋͜ر أݪـﻤـ๋͜سـݓـ๋͜خدݦ عـ๋͜آم 😼👏_  *[* "..user_name.." *]*", "md")
      end
   end
  administration['gban_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
     if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*User* _banned_ *from groups 😼👐* `[` "..user_name.." `]`", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0,"_ٺـ๋͜م حـظـ๋͜ر أݪـﻤـ๋͜سـݓـ๋͜خدݦ عـ๋͜آم 🏌🏻😼_ *[* "..user_name.." *]*", "md")
   end
end
  if cmd == "الغي العام" then
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
if not is_gbanned(data.id_) then
     if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*User is _not banned_ *from all groups 😺💋* `[` "..user_name.." `]`", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "_وآلـ๋͜لـه ٺـ๋͜م آلـ๋͜غـ๋͜آء آلـ๋͜عـآم مـݨ أݪـﻤـ๋͜سـݓـ๋͜خدݦ 😾‼️_ *[* "..user_name.." *]*", 0, "md")
      end
   end
  administration['gban_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*User is _not banned_ *from all groups 😸❤️* `[` "..user_name.." `]`", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "_ٺـ๋͜م آلـغـ๋͜آء آلـ๋͜عـآم مـݨ أݪـﻤـ๋͜سـݓـ๋͜خدݦ 😽❤️_ *[* "..user_name.." *]*", 0, "md")
   end
end
  if cmd == "اطرد" then
   if is_mod1(arg.chat_id, data.id_) then
   if not lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*You can't kick* _owners and admins_ *From Bot 😿❌*", 0, "md")
    elseif lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_ݪأ يـ๋͜ﻤـكݩـ๋͜ڬ طــ๋͜ﮍد المـشــ๋͜رڣـيـ๋͜ن ﯠ الادمنـيـ๋͜ه 😼❌_", 0, "md")
   end
  else
     kick_user(data.id_, arg.chat_id)
     end
  end
  if cmd == "امسح الرسائل" then
   if is_mod1(arg.chat_id, data.id_) then
   if not lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*You can't Delete All messages* _owners and admins 😾🏋️_", 0, "md")
   elseif lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*ݪأ يـﻤـ✥ـٍكݩـڬ حــ๋͜ذف رسـ๋͜آئـ๋͜ل المـشــ๋͜رڣيـ✥ـٍن ﯠ الادمنـ✥ـٍيـ๋͜ه 😿⚠️*", 0, "md")
   end
  else
tdcli.deleteMessagesFromUser(arg.chat_id, data.id_, dl_cb, nil)
   if not lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*User messages have* _been deleted 😽✌️_ `[` "..data.sender_user_id_.." `]`", 0, "md")
      elseif lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*رسـ๋͜آئـٍل أݪـﻤـ✥ـٍسݓـخدم ٺـ๋͜ـٍم حـ๋͜ذفـ✥ـٍهـ๋͜ا 😽✔️* `[` "..data.sender_user_id_.." `]`", 0, "md")
       end
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
local data = load_data(_config.moderation.data)
chat = msg.chat_id_
user = msg.sender_user_id_
if matches[1] == "اطرد" or matches[1] == "kick" and is_mod(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="اطرد"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.chat_id_, matches[2]) then
   if not lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*You can't kick* _owners and admins_ *From Bot 😿❌*", 0, "md")
   elseif lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_ݪأ يـ๋͜ﻤـكݩـ๋͜ڬ طــ๋͜ﮍد المـشــ๋͜رڣـيـ๋͜ن ﯠ الادمنـيـ๋͜ه 😼❌_", 0, "md")
         end
     else
kick_user(matches[2], msg.chat_id_)
      end
   end
      end
if matches[1] == "احظر عام" or matches[1] == "banall" and is_admin(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="احظر عام"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_admin1(matches[2]) then
   if not lang then
    return tdcli.sendMessage(msg.chat_id_, "", 0, "_You can not block_ *moderators & admins 😾❌*", 0, "md")
else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_ݪأ يـ๋͜ﻤـكݩـ๋͜ڬ حــ๋͜ظـﮍ المـشــ๋͜رڣـيـ๋͜ن ﯠ الادمنـيـ๋͜ه 😼👊_", 0, "md")
        end
     end
   if is_gbanned(matches[2]) then
   if not lang then
  return tdcli.sendMessage(msg.chat_id_, "", 0, "*User* _banned_ *from all groups 😺✌️* `[` "..matches[2].." `]`", 0, "md")
    else
  return tdcli.sendMessage(msg.chat_id_, "", 0, "_وآلـ๋͜لـه ٺـ๋͜م حـظـ๋͜ر أݪـﻤـ๋͜سـݓـ๋͜خدݦ عـ๋͜آم 😼👏_ *[* "..matches[2].." *]*", 0, "md")
        end
     end
  data['gban_users'][tostring(matches[2])] = ""
    save_data(_config.moderation.data, data)
kick_user(matches[2], msg.chat_id_)
   if not lang then
 return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*User* _banned_ *from groups 😼👐* `[` "..matches[2].." `]`", 0, "md")
    else
 return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "_ٺـ๋͜م حـظـ๋͜ر أݪـﻤـ๋͜سـݓـ๋͜خدݦ عـ๋͜آم 😼💫_ *[* "..matches[2].." *]*", 0, "md")
      end
   end
      end
if matches[1] == "الغي العام" or matches[1] == "unbanall" and is_admin(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="الغي العام"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if not is_gbanned(matches[2]) then
     if not lang then
   return tdcli.sendMessage(msg.chat_id_, "", 0, "*User is _not banned_ *from all groups 😺💋* `[` "..matches[2].." `]`", 0, "md")
    else
   return tdcli.sendMessage(msg.chat_id_, "", 0, "_وآلـ๋͜لـه ٺـ๋͜م آلـ๋͜غـ๋͜آء آلـ๋͜عـآم مـݨ أݪـﻤـ๋͜سـݓـ๋͜خدݦ 😾‼️_ *[* "..matches[2].." *]*", 0, "md")
        end
     end
  data['gban_users'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
   if not lang then
return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*User is* _not banned_ *from all groups 😸❤️* `[` "..matches[2].." `]`", 0, "md")
   else
 return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "_ٺـ๋͜م آلـ๋͜غـ๋͜آء آلـ๋͜عـآم مـݨ أݪـﻤـ๋͜سـݓـ๋͜خدݦ 😽❤️_ *[* "..matches[2].." *]*", 0, "md")
      end
   end
   end
if matches[1] == "احظر" or matches[1] == "ban" and is_mod(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="احظر"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.chat_id_, matches[2]) then
     if not lang then
    return tdcli.sendMessage(msg.chat_id_, "", 0, "_You can not block_ *moderators & admins 😾❌*", 0, "md")
    else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_ݪأ يـ๋͜ﻤـكݩـ๋͜ڬ حــ๋͜ظـﮍ المـشــ๋͜رڣـيـ๋͜ن ﯠ الادمنـيـ๋͜ه 😼👊_", 0, "md")
        end
     end
   if is_banned(matches[2], msg.chat_id_) then
   if not lang then
  return tdcli.sendMessage(msg.chat_id_, "", 0, "*The user is already* _banned 😺🏌🏻_ `[` "..matches[2].." `]`", 0, "md")
  else
  return tdcli.sendMessage(msg.chat_id_, "", 0, "_وآلـ๋͜لـه_ *أݪـﻤـ๋͜سـݓـ๋͜خدݦ* _حظـ๋͜رتـ๋͜ه 🏌🏻😺_ *[* "..matches[2].." *]*", 0, "md")
        end
     end
data[tostring(chat)]['banned'][tostring(matches[2])] = ""
    save_data(_config.moderation.data, data)
kick_user(matches[2], msg.chat_id_)
   if not lang then
 return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*User* _blocked 😸👉_ `[` "..matches[2].." `]`", 0, "md")
  else
 return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "_ٺـ๋͜م حـظـ๋͜ر_ *أݪـﻤـ๋͜سـݓـ๋͜خدݦ* _مـݨ المـ๋͜جـمـوعـ๋͜ة 👉😸_ *[* "..matches[2].." *]*", 0, "md")
      end
   end
   end
if matches[1] == "الغي الحظر" or matches[1] == "unban" and is_mod(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="الغي الحظر"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if not is_banned(matches[2], msg.chat_id_) then
   if not lang then
   return tdcli.sendMessage(msg.chat_id_, "", 0, "_User_ *Block* _Canceled 😿💋_ `[` "..matches[2].." `]`", 0, "md")
  else
   return tdcli.sendMessage(msg.chat_id_, "", 0, "*ٺـ๋͜م* _آلـغـ๋͜آء حظـ๋͜ر_*أݪـﻤـ๋͜سـݓـ๋͜خدݦ 😽💋* `[` "..matches[2].." `]`", 0, "md")
        end
     end
data[tostring(chat)]['banned'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
   if not lang then
return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "_User is_ *not banned* `[` "..matches[2].." `]`", 0, "md")
   else
return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "_وآلـ๋͜لـه_ *أݪـﻤـ๋͜سـݓـ๋͜خدݦ* _ٺـ๋͜ـٍم آلـ๋͜غـ๋͜آء حظـ๋͜ره 😾🥁_ *[* "..matches[2].." *]*", 0, "md")
      end
   end
   end
if matches[1] == "اكتم" or matches[1] == "silent" and is_mod(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="اكتم"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.chat_id_, matches[2]) then
   if not lang then
   return tdcli.sendMessage(msg.chat_id_, "", 0, "_You can't silent_ *moderators & admins 😺🏌🏻*", 0, "md")
 else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_ݪأ يمـ๋͜كـنـ๋͜كٍ كـتـ๋͜م المـشــ๋͜رڣـيـ๋͜ن ﯠ الادمنـيـ๋͜ه 🏌🏻😼_", 0, "md")
        end
     end
   if is_silent_user(matches[2], chat) then
   if not lang then
   return tdcli.sendMessage(msg.chat_id_, "", 0, "_The user is_ *already silent 😼🎻* `[` "..matches[2].." `]`", 0, "md")
   else
   return tdcli.sendMessage(msg.chat_id_, "", 0, "_وآلـ๋͜لـه ٺـ๋͜م  إسـ๋͜كاٺـﮧ أݪـﻤـ๋͜سـݓـ๋͜خدݦ🌞💥_ *[* "..matches[2].." *]*", 0, "md")
        end
     end
data[tostring(chat)]['is_silent_users'][tostring(matches[2])] = ""
    save_data(_config.moderation.data, data)
    if not lang then
  return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "_The user is_ *silent now 🙀⛔️* `[` "..matches[2].." `]`", 0, "md")
  else
 return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "_ٺـ๋͜م إسـ๋͜كاٺـﮧ أݪـﻤـ๋͜سـݓـ๋͜خدݦ 😽🎧_ *[* "..matches[2].." *]*", 0, "md")
      end
   end
   end
if matches[1] == "الغي الكتم" or matches[1] == "unsilent" and is_mod(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="الغي الكتم"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if not is_silent_user(matches[2], chat) then
     if not lang then
     return tdcli.sendMessage(msg.chat_id_, "", 0, "_silents_ *has been removed 😺🎤* `[` "..matches[2].." `]`", 0, "md")
   else
     return tdcli.sendMessage(msg.chat_id_, "", 0, "_وآلـ๋͜لـه ٺـ๋͜م آلـ๋͜غـ๋͜آء كـ๋͜تـم أݪـﻤـ๋͜سـݓـ๋͜خدݦ 😾❌_  *[* "..matches[2].." *]*", 0, "md")
        end
     end
data[tostring(chat)]['is_silent_users'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
   if not lang then
 return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "_The user is_ *not silent now 😸❤️*️ `[` "..matches[2].." `]`", 0, "md")
  else
return tdcli.sendMessage(arg.chat_id, "", 0, "_ٺـ๋͜م آلـ๋͜غـ๋͜آء كـ๋͜تـم أݪـﻤـ๋͜سـݓـ๋͜خدݦ 😻⛹🏻_  *[* "..user_name.." *]*", 0, "md")
      end
   end
   end
   if matches[1]:lower() == 'امسح' or matches[1]:lower() == 'del' and is_mod(msg) then
			if matches[2] == 'قائمة الحظر' or matches[2] == 'banlist' then
				if next(data[tostring(chat)]['banned']) == nil then
     if not lang then
					return "*There are* _no banned users_ *in this group 😺❌*"
   else
                    return "*ݪا يوجـ✥ـٍد مستخــ๋͜دميـ✥ـٍن محظـ✥ـٍـ๋͜ورين فـﻲ هذ۵ المجمــ๋͜وعه😽❤️*"
              end
				end
				for k,v in pairs(data[tostring(chat)]['banned']) do
					data[tostring(chat)]['banned'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
     if not lang then
				return "*Done* _Unblock_ *all 😺✌️*"
    else
				return "*تـ✥ـٍم اݪغأء الحظـ✥ـٍر عن جميـ✥ـٍع اݪمستخـــ๋͜دميـ✥ـٍن فـﻲ هذ۵ المجمــ๋͜وعه 😻🥁*"
           end
			end
			if matches[2] == 'قائمة الكتم' or matches[2] == 'silentlist' then
				if next(data[tostring(chat)]['is_silent_users']) == nil then
        if not lang then
					return "*No users have been* _silenced 😾❌_"
   else
					return "*ݪا يوجـ✥ـٍد مستخــ๋͜دميـ✥ـٍن مسكتـ✥ـينٍ فـﻲ هذ۵ المجمــ๋͜وعه 🏌🏻😼*"
             end
				end
				for k,v in pairs(data[tostring(chat)]['is_silent_users']) do
					data[tostring(chat)]['is_silent_users'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				    end
       if not lang then
				return "*The* _muted list_ *has been deleted 😽👍*"
   else
				return "* تـ✥ـٍم مسـ✥ـٍﺢ قائــ๋͜مـﮥ الـ๋͜كـ✥ـٍتــ๋͜م 😽👏*"
               end
			    end
        end
    if matches[1]:lower() == 'امسح' or matches[1]:lower() == 'del' and is_admin(msg) then
			if matches[2] == 'قائمة العام' or matches[2] == 'bandlist' then
				if next(data['gban_users']) == nil then
    if not lang then
					return "*No* _users blocked_ *public 😿👊*"
   else
					return "*ݪا يوجـ✥ـٍد مستخــ๋͜دميـ✥ـٍن محظـ✥ـٍـ๋͜ورين ﻣـݩ اݪبــ๋͜ﯠټ 🏌🏻😾 *"
             end
				end
				for k,v in pairs(data['gban_users']) do
					data['gban_users'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
      if not lang then
				return "_Unblock all banned_ *users from bot 😻🥁*"
   else
				return "*تـ✥ـٍم اݪغأء الحظـ✥ـٍر عن جميـ✥ـٍع المحـ✥ـٍظـ๋͜ورين ﻣـݩ اݪبــ๋͜ﯠټ 😺❤️*"
          end
			end
     end
if matches[1] == "قائمة العام" or matches[1] == "bandlist" and is_admin(msg) then
  return gbanned_list(msg)
 end
if matches[1] == "قائمة الكتم" or matches[1] == "silentlist" and is_mod(msg) then
  return silent_users_list(chat)
 end
if matches[1] == "قائمة الحظر" or matches[1] == "banlist" and is_mod(msg) then
  return banned_list(chat)
 end
end
return {
	patterns = {
	    
"^(اطرد)$",
"^(kick)$",
"^(اطرد) (.*)$",
"^(kick) (.*)$",
--Team_Skype--
"^(احظر عام)$",
"^(banall)$",
"^(احظر عام) (.*)$",
"^(banall) (.*)$",
"^(الغي العام)$",
"^(unbanall)$",
"^(الغي العام) (.*)$",
"^(unbanall) (.*)$",
"^(قائمة العام)$",
"^(bandlist)$",
--[[Team_Skype--
"^(امسح الرسائل)$",
"^(delall)$",]]
"^(امسح الرسائل) (.*)$",
"^(delall) (.*)$",
--Team_Skype--
"^(احظر)$",
"^(ban)$",
"^(احظر) (.*)$",
"^(ban) (.*)$",
"^(الغي الحظر)$",
"^(unban)$",
"^(الغي الحظر) (.*)$",
"^(unban) (.*)$",
"^(قائمة الحظر)$",
"^(banlist)$",
--Team_Skype--
"^(اكتم)$",
"^(silent)$",
"^(اكتم) (.*)$",
"^(silent) (.*)$",
"^(الغي الكتم)$",
"^(unsilent)$",
"^(الغي الكتم) (.*)$",
"^(unsilent) (.*)$",
"^(قائمة الكتم)$",
"^(silentlist)$",
--Team_Skype--
"^(امسح) (.*)$",
"^(del) (.*)$",

},
run = Team_Skype,
pre_process = II02II
}
--[[
ملف البانهامر هو ملف يخص الحظر والكتم والطرد في المجموعة 
وكذلك يحتوي ع قوائم الكتم والحظر والباند (الحظر العام) ومسح هذه القوائم

الملف مو كتابتي بس ضفتلة النقص بي + الاوامر حولته للغتين 

ميمو_مشآكل_آلعراقي^#
المستشار^#
راسكو السامرائي^#

قناة الفريق 
@Ch_Dev
تواصل المطورين 
@ii02ii_bot
المطورين هنا 
@Team_Skype
]]