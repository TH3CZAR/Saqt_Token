local function modadd(msg)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
    if not is_admin(msg) then
   if not lang then
        return '*You are not a bot admin 😾🙌*'
else
     return '_انـ๋͜ﺖ لسـٍت مـ๋͜طـور الـ๋͜بـوت 😾❌_'
    end
end
    local data = load_data(_config.moderation.data)
  if data[tostring(msg.chat_id_)] then
if not lang then
   return '*Bot* _ is already activated 😿💡_'
else
return '_والـلـ๋͜ه الـبـ๋͜وت مـفـ๋͜عـل  😼💖_'
  end
end
        -- create data array in moderation.json
      data[tostring(msg.chat_id_)] = {
              owners = {},
      mods ={},
      banned ={},
      is_silent_users ={},
            filterlist ={},
      settings = {
          lock_link = 'yes',
          lock_tag = 'yes',
          lock_spam = 'yes',
          lock_webpage = 'no',
          lock_markdown = 'no',
          flood = 'yes',
          lock_bots = 'yes'
          },
   mutes = {
                  mute_fwd = 'no',
                  mute_audio = 'no',
                  mute_video = 'no',
                  mute_contact = 'no',
                  mute_text = 'no',
                  mute_photos = 'no',
                  mute_gif = 'no',
                  mute_loc = 'no',
                  mute_doc = 'no',
                  mute_sticker = 'no',
                  mute_voice = 'no',
                   mute_all = 'no'
          }
      }
  save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.chat_id_)] = msg.chat_id_
      save_data(_config.moderation.data, data)
    if not lang then
  return '*Bot* _has been activated 😽❤️_'
else
  return '_تـ๋͜م تفـ๋͜فـيل الـ๋͜بـوت😽❤️_'
end
end

local function modrem(msg)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
      if not is_admin(msg) then
     if not lang then
        return '*You are not a bot admin 😾🙌*'
else
     return '_انـ๋͜ﺖ لسـٍت مـ๋͜طـور الـ๋͜بـوت 😾❌_'
    end
   end
    local data = load_data(_config.moderation.data)
    local receiver = msg.chat_id_
  if not data[tostring(msg.chat_id_)] then
  if not lang then
    return '*bot* _is disabled here 😿❌_'
else
    return '_وآلـ๋͜لـه آلـ๋͜بـوت مـ๋͜عـطـ๋͜ل 😿❌_'
   end
  end

  data[tostring(msg.chat_id_)] = nil
  save_data(_config.moderation.data, data)
     local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end data[tostring(groups)][tostring(msg.chat_id_)] = nil
      save_data(_config.moderation.data, data)
 if not lang then
  return '*Bot* _has been disabled 😿⚒_'
 else
  return '_تـ๋͜م تـعـ๋͜طـيـ๋͜ل الـبــ๋͜وت👍😿_'
end
end
local function filter_word(msg, word)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
  if not data[tostring(msg.chat_id_)]['filterlist'] then
    data[tostring(msg.chat_id_)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
if data[tostring(msg.chat_id_)]['filterlist'][(word)] then
   if not lang then
 return "*word is really filtered 😼👊* _["..word.."]_"
 else
 return  "_وآلـ๋͜لـه الـ๋͜كـلـ๋͜مة مـمـ๋͜نوعـ๋͜ة 😾🙌_  *["..word.."]*"
    end
end
   data[tostring(msg.chat_id_)]['filterlist'][(word)] = true
     save_data(_config.moderation.data, data)
   if not lang then
return "*The word has been blocked 👏😽* _["..word.."]_"
            else
 return  "_تـ๋͜م منـ๋͜ع الـ๋͜كـلـ๋͜مة 😺✌️_ *["..word.."]*"
    end
end

local function unfilter_word(msg, word)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 local data = load_data(_config.moderation.data)
  if not data[tostring(msg.chat_id_)]['filterlist'] then
    data[tostring(msg.chat_id_)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
      if data[tostring(msg.chat_id_)]['filterlist'][word] then
      data[tostring(msg.chat_id_)]['filterlist'][(word)] = nil
       save_data(_config.moderation.data, data)
       if not lang then
         return "*The word has been canceled 😸👄* _["..word.."]_"
       elseif lang then
 return  "_تـ๋͜م الـ๋͜غـاء منـ๋͜ع الـ๋͜كـلـ๋͜مة  😺✌️_  *["..word.."]*"
     end
      else
       if not lang then
         return "*The word really unblocked 😾🖕* _["..word.."]_"
       elseif lang then
 return  "_وآلـ๋͜لـه الـ๋͜كـلـ๋͜مة غيـ๋͜ر مـمـ๋͜نوعـ๋͜ة 😼🤝_  *["..word.."]*"
      end
   end
end

 function filter_list(msg)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
  if not data[tostring(msg.chat_id_)]['filterlist'] then
    data[tostring(msg.chat_id_)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
  if not data[tostring(msg.chat_id_)] then
  if not lang then
  return '*Bot has been disabled 😿⚒*'
else
  return '_تـ๋͜م تعـ๋͜طـ✥ـٍيل البــ๋͜وت👍😿_'
   end
  end
  -- determine if table is empty
  if next(data[tostring(msg.chat_id_)]['filterlist']) == nil then --fix way
      if not lang then
    return "*block words list* _is empty 😿❌_"
      else
    return "_قـ๋͜ائـمـ๋͜ة الـمـ๋͜نـع فـ๋͜ارغـ๋͜ةة 😿❗️_"
     end
  end
  if not data[tostring(msg.chat_id_)]['filterlist'] then
    data[tostring(msg.chat_id_)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
      if not lang then
      Ch_Dev = "*Block words List 🤖🛡:-*\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n"
         else
      Ch_Dev = "*قـ๋͜ائـمـ๋͜ة الـمـ๋͜نـع 😺✔️ :-*\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n"
    end
 local i = 1
   for k,v in pairs(data[tostring(msg.chat_id_)]['filterlist']) do
              Ch_Dev = Ch_Dev..'*'..i..'* - _'..k..'_\n'
             i = i + 1
         end
     return Ch_Dev
   end

local function modlist(msg)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.chat_id_)] then
  if not lang then
    return "*The bot is not activated 😾🙌*"
 else
    return '_وآلـ๋͜لـه آلـ๋͜بـوت مـ๋͜عـطـ✥ـٍل 😼❌_'
  end
 end
  -- determine if table is empty
  if next(data[tostring(msg.chat_id_)]['mods']) == nil then --fix way
  if not lang then
    return "*There are* _moderator_ *in the group 😼🤳*"
else
   return "_ݪا يوجـ✥ـٍد ادمـ๋͜يـ✥ـٍة فــ๋͜ي المجمــ๋͜وعه 😾❌_"
  end
end
if not lang then
 Ch_Dev = "*List of block words 😸👄 :-\n➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n"
else
 Ch_Dev = "_ قائـ✥ـٍمـﮥ آلآدمـ๋͜نيـة 😽❤️ :- _\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n"
end
  for k,v in pairs(data[tostring(msg.chat_id_)]['mods'])
do
    Ch_Dev = Ch_Dev ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return Ch_Dev
end

local function ownerlist(msg)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.chat_id_)] then
if not lang then
    return "*The bot is not activated 😾🙌*"
else
    return '_وآلـ๋͜لـه آلـ๋͜بـوت مـ๋͜عـطـ✥ـٍل 😼❌_'
  end
end
  -- determine if table is empty
  if next(data[tostring(msg.chat_id_)]['owners']) == nil then --fix way
 if not lang then
    return "*There is no owner in bot 😾👎*"
else
    return "_ݪا يوجـ✥ـٍد مديـ✥ـٍر فـ๋͜ي آلـ๋͜بـوت 😾❌_"
  end
end
if not lang then
 Ch_Dev = "*List of owners 😺✨ :-\n➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n"
else
 Ch_Dev = "_ قائـ✥ـٍمـﮥ آلمـ๋͜دراء 😺🌪 :- _\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n"
end
  for k,v in pairs(data[tostring(msg.chat_id_)]['owners']) do
    Ch_Dev = Ch_Dev ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return Ch_Dev
end

local function action_by_reply(arg, data)
local hash = "gp_lang:"..data.chat_id_
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
if not tonumber(data.sender_user_id_) then return false end
  if not administration[tostring(data.chat_id_)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "*The bot is not activated 😾❌*", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_وآلـ๋͜لـه آلـ๋͜بـوت مـ๋͜عـطـ✥ـٍل 😼❌_", 0, "md")
     end
  end
if cmd == "setowner" then
local function owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*He Is Already* _Owner 😾🆔_ `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_والـلــ๋͜ه هـ๋͜و مـ๋͜ديـ✥ـٍر 😾🆔_ *[* "..user_name.." *]*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*You have been* _promoted to Owner 😻💋_  `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_تـ✥ـٍم رف✥ـٍع رتبـ๋͜تك مديـ๋͜ر مجمــ๋͜وعه 😻👏_ *[* "..user_name.." *]*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "promote" then
local function promote_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*He Is Already* _moderator 😾🆔_ `[` "..user_name.." `]`", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_والـلــ๋͜ه هـ๋͜و ادمـ๋͜ن 😾🆔_ *[* "..user_name.." *]*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*You have been* _promoted to moderator 😻💋_  `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_تـ✥ـٍم رف✥ـٍع رتبـ๋͜تك ادمـ๋͜ن 😻👏_ *[* "..user_name.." *]*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, promote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
     if cmd == "remowner" then
local function rem_owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*He Is not* _Owner 😼🆔_ `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_والـلــ๋͜ه هـ๋͜و لــ๋͜س آلـمـ๋͜ديـ✥ـٍر 😼🆔_ *[* "..user_name.." *]*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*Your rank has been* _lowered to user 👊😼_ `[`  "..user_name.."  `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_تـ✥ـٍم خفـ✥ـٍض رتبـ๋͜تك الـ๋͜ى عـ๋͜ضـ๋͜و 🎻😺_ *[* "..user_name.." *]*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, rem_owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "demote" then
local function demote_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*He Is not* _moderator 😼🆔_ `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_والـلــ๋͜ه هـ๋͜و عضــ๋͜و 😼🆔_ *[* "..user_name.." *]*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*Your rank has been* _lowered to user 👊😼_ `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_تـ✥ـٍم خفـ✥ـٍض رتبـ๋͜تك الـ๋͜ى عـ๋͜ضـ๋͜و 🎻😺_ *[* "..user_name.." *]*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, demote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "ايدي" then
local function id_cb(arg, data)
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, id_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
end

local function action_by_username(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "*The bot is not activated 😾❌*", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_وآلـ๋͜لـه آلـ๋͜بـوت مـ๋͜عـطـ✥ـٍل 😼❌_", 0, "md")
     end
  end
if data.type_.user_.username_ then
user_name = '@'..check_markdown(data.type_.user_.username_)
else
user_name = check_markdown(data.title_)
end
if not arg.username then return false end
if cmd == "setowner" then
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*He Is Already* _Owner 😾🆔_ `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_والـلــ๋͜ه هـ๋͜و مـ๋͜ديـ✥ـٍر 😾🆔_ *[* "..user_name.." *]*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*You have been* _promoted to Owner 😻💋_  `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_تـ✥ـٍم رف✥ـٍع رتبـ๋͜تك مديـ๋͜ر مجمــ๋͜وعه 😻👏_ *[* "..user_name.." *]*", 0, "md")
   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*He Is Already* _moderator 😾🆔_ `[` "..user_name.." `]`", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_والـلــ๋͜ه هـ๋͜و ادمـ๋͜ن 😾🆔_ *[* "..user_name.." *]*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*You have been* _promoted to moderator 😻💋_  `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_تـ✥ـٍم رف✥ـٍع رتبـ๋͜تك ادمـ๋͜ن 😻👏_ *[* "..user_name.." *]*", 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*He Is not* _Owner 😼🆔_ `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_والـلــ๋͜ه هـ๋͜و لــ๋͜س آلـمـ๋͜ديـ✥ـٍر 😼🆔_ *[* "..user_name.." *]*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*Your rank has been* _lowered to user 👊😼_ `[`  "..user_name.."  `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_تـ✥ـٍم خفـ✥ـٍض رتبـ๋͜تك الـ๋͜ى عـ๋͜ضـ๋͜و 🎻😺_ *[* "..user_name.." *]*", 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*He Is not* _moderator 😼🆔_ `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_والـلــ๋͜ه هـ๋͜و عضــ๋͜و 😼🆔_ *[* "..user_name.." *]*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*Your rank has been* _lowered to user 👊😼_ `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_تـ✥ـٍم خفـ✥ـٍض رتبـ๋͜تك الـ๋͜ى عـ๋͜ضـ๋͜و 🎻😺_ *[* "..user_name.." *]*", 0, "md")
   end
end
   if cmd == "ايدي" then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
    if cmd == "res" then
    if not lang then
     text = "Result for [ ".. check_markdown(data.type_.user_.username_) .." ] :\n"
    .. "".. check_markdown(data.title_) .."\n"
    .. " [".. data.id_ .."]"
  else
     text = " Result for [ ".. check_markdown(data.type_.user_.username_) .." ] :\n"
    .. "".. check_markdown(data.title_) .."\n"
    .. " [".. data.id_ .."]"
       return tdcli.sendMessage(arg.chat_id, 0, 1, text, 1, 'md')
      end
   end
end
local function action_by_id(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "*The bot is not activated 😾❌*", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_وآلـ๋͜لـه آلـ๋͜بـوت مـ๋͜عـطـ✥ـٍل 😼❌_", 0, "md")
     end
  end
if not tonumber(arg.user_id) then return false end
if data.first_name_ then
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if cmd == "setowner" then
  if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*He Is Already* _Owner 😾🆔_ `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_والـلــ๋͜ه هـ๋͜و مـ๋͜ديـ✥ـٍر 😾🆔_ *[* "..user_name.." *]*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*You have been* _promoted to Owner 😻💋_  `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_تـ✥ـٍم رف✥ـٍع رتبـ๋͜تك مديـ๋͜ر مجمــ๋͜وعه 😻👏_ *[* "..user_name.." *]*", 0, "md")
   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*He Is Already* _moderator 😾🆔_ `[` "..user_name.." `]`", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_والـلــ๋͜ه هـ๋͜و ادمـ๋͜ن 😾🆔_ *[* "..user_name.." *]*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*You have been* _promoted to moderator 😻💋_  `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_تـ✥ـٍم رف✥ـٍع رتبـ๋͜تك ادمـ๋͜ن 😻👏_ *[* "..user_name.." *]*", 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*He Is not* _Owner 😼🆔_ `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_والـلــ๋͜ه هـ๋͜و لــ๋͜س آلـمـ๋͜ديـ✥ـٍر 😼🆔_ *[* "..user_name.." *]*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "*Your rank has been* _lowered to user 👊😼_ `[`  "..user_name.."  `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_تـ✥ـٍم خفـ✥ـٍض رتبـ๋͜تك الـ๋͜ى عـ๋͜ضـ๋͜و 🎻😺_ *[* "..user_name.." *]*", 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*He Is not* _moderator 😼🆔_ `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_والـلــ๋͜ه هـ๋͜و عضــ๋͜و 😼🆔_ *[* "..user_name.." *]*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*Your rank has been* _lowered to user 👊😼_ `[` "..user_name.." `]`", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_تـ✥ـٍم خفـ✥ـٍض رتبـ๋͜تك الـ๋͜ى عـ๋͜ضـ๋͜و 🎻😺_ *[* "..user_name.." *]*", 0, "md")
   end
end
    if cmd == "معلومات" then
if data.username_ then
Ch_Dev = '@'..check_markdown(data.username_)
else
if not lang then
Ch_Dev = '*username* _not found 😾🆔_'
 else
Ch_Dev = '_ݪأ يـ✥ـٍوجـ๋͜د مـ✥ـٍعــ๋͜رف😿💔_'
  end
end
     if not lang then
       return tdcli.sendMessage(arg.chat_id, 0, 1, '➖🔷➖🔺{T.L.N}🔺➖🔷➖\n\n* Info for :- 😽❤️*  _[ '..data.id_..' ]_ \n*UserName 😺🆔 :- * _[ '..username..' ]_ \n*Your Name 😸👄 :-* '..data.first_name_, 1)
   else
       return tdcli.sendMessage(arg.chat_id, 0, 1, '➖🔷➖🔺{T.L.N}🔺➖🔷➖\n\n _معلــ๋͜ومات عـ✥ـٍن :- 😻✨_ *[ '..data.id_..' ]*\n_المـ๋͜عـ✥ـٍرف :- 🆔😺_ *[ '..username..' ]*\n_الاسـ✥ـٍم :- 😽☄️_ *[ '..data.first_name_..' ]*\n\n➖🔷➖🔺{T.L.N}🔺➖🔷➖\nتــ๋͜يــ๋͜م ألــ๋͜رئـ✥ـآســ๋͜ة 🌝💫\n@Ch_Dev', 1)
      end
   end
 else
    if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_User not founded_", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_خطـ✥ـٍﺄ فـي اليــ๋͜وزر ❌_", 0, "md")
    end
  end
end


local function lock_link(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local lock_link = data[tostring(target)]["settings"]["lock_link"] 
if lock_link == "yes" then
if not lang then
 return "*Links is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه الـ๋͜روابـ✥ـٍط  مقـ๋͜فـ✥ـٍلة 😾🔐🖇_"
end
else
data[tostring(target)]["settings"]["lock_link"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
  return '*Link* _has been_ *Locked 😸👄*'
else
 return "_تـ๋͜م قـ๋͜فـ✥ـٍل الـ๋͜روابـ✥ـٍط 😸🔐_"
end
end
end

local function unlock_link(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end 

local lock_link = data[tostring(target)]["settings"]["lock_link"]
 if lock_link == "no" then
if not lang then
 return "*Links is really* _unlocked 😼🔓_"
elseif lang then
 return "_وآلـ๋͜لـه الـ๋͜روابـ✥ـٍط  مفـ๋͜تـوحـ๋͜ة 😼🔓🖇_"
end
else 
data[tostring(target)]["settings"]["lock_link"] = "no" save_data(_config.moderation.data, data) 
if not lang then
  return '*Link* _has been_ *unLocked 🤝😽*'
else
 return "_تـ๋͜م فـ๋͜تـح الـ๋͜روابـ✥ـٍط 🤝😽_"
end
end
end

local function lock_tag(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local lock_tag = data[tostring(target)]["settings"]["lock_tag"] 
if lock_tag == "yes" then
if not lang then
 return "*Tag is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه التـ๋͜اكات  مقـ๋͜فـ✥ـٍلة 😼🔓_"
end
else
 data[tostring(target)]["settings"]["lock_tag"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
  return '*Tags* _has been_ *Locked 😸🔐*'
else
 return "_تـ๋͜م قـ๋͜فـ✥ـٍل التـ๋͜اكـات 😸🔐_"
end
end
end

local function unlock_tag(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end 
end

local lock_tag = data[tostring(target)]["settings"]["lock_tag"]
 if lock_tag == "no" then
if not lang then
return "*Tags is really* _unlocked 😼🔓_" 
elseif lang then
return "_وآلـ๋͜لـه التـ๋͜اكـات مفـ๋͜تـوحـ๋͜ة 😼🔓_"
end
else 
data[tostring(target)]["settings"]["lock_tag"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*Tags* _has been_ *unLocked 🤝😽*" 
else
return "_تـ๋͜م فـ๋͜تـح التـ๋͜اكـات 🤝😽_"
end
end
end

 local function lock_mention(msg, data, target)
 local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local lock_mention = data[tostring(target)]["settings"]["lock_mention"] 
if lock_mention == "yes" then
if not lang then
 return "*username is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه الـ๋͜مـعـ๋͜رفـات مقـ๋͜فـ✥ـٍلة 😾🔐🆔_"
end
else
 data[tostring(target)]["settings"]["lock_mention"] = "yes"
save_data(_config.moderation.data, data)
if not lang then 
  return '*username* _has been_ *Locked 😸🔐*'
else 
 return "_تـ๋͜م قـ๋͜فـ✥ـٍل الـ๋͜مـعـ๋͜رفـات 😸🔐_"
end
end
end

local function unlock_mention(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end 

local lock_mention = data[tostring(target)]["settings"]["lock_mention"]
 if lock_mention == "no" then
if not lang then
return "*username is really* _unlocked 😼🔓_" 
elseif lang then
return "_وآلـ๋͜لـه الـ๋͜مـعـ๋͜رفـات مفـ๋͜تـوحـ๋͜ة 😼🔓_"
end
else 
data[tostring(target)]["settings"]["lock_mention"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*username* _has been_ *unLocked 🤝😽*" 
else
return "_تـ๋͜م فـ๋͜تـح الـ๋͜مـعـ๋͜رفـات 🤝😽_"
end
end
end


local function lock_edit(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local lock_edit = data[tostring(target)]["settings"]["lock_edit"] 
if lock_edit == "yes" then
if not lang then
 return "*Edit is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه التـ๋͜عديـل مقـ๋͜فـ✥ـٍل 😾🔐🖌_"
end
else
 data[tostring(target)]["settings"]["lock_edit"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
  return '*Edit* _has been_ *Locked 😸👄*'
else
 return "_تـ���͜م قـ๋͜فـ✥ـٍل التـ๋͜عديـل 😸🔐🖌_"
end
end
end

local function unlock_edit(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end 

local lock_edit = data[tostring(target)]["settings"]["lock_edit"]
 if lock_edit == "no" then
if not lang then
 return "*Edit is really* _unlocked 😼🔓✒️_"
elseif lang then
 return "_وآلـ๋͜لـه التـ๋͜عديـل  مفـ๋͜تـوح 😼🔓🖌_"
end
else 
data[tostring(target)]["settings"]["lock_edit"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return '*Edit* _has been_ *unLocked 🤝😽*'
else
 return "_تـ๋͜م فـ๋͜تـح التـ๋͜عديل 🤝😽_"
end
end
end


local function lock_spam(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local lock_spam = data[tostring(target)]["settings"]["lock_spam"] 
if lock_spam == "yes" then
if not lang then
 return "*Spam is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه الكـ๋͜لايـش  مقـ๋͜فـ✥ـٍلة 😾🔐🗞_"
end
else
 data[tostring(target)]["settings"]["lock_spam"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
  return '*Spam* _has been_ *Locked 😸👄*'
else
 return "_تـ๋͜م قـ๋͜فـ✥ـٍل الكـ๋͜لايـش 😸🔐🗞_"
end
end
end

local function unlock_spam(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end 

local lock_spam = data[tostring(target)]["settings"]["lock_spam"]
 if lock_spam == "no" then
if not lang then
 return "*Spam is really* _unlocked 😼🔓📋_"
elseif lang then
 return "_وآلـ๋͜لـه الكـ๋͜لايـش مفـ๋͜تـوحـ๋͜ة 😼🔓📋_"
end
else 
data[tostring(target)]["settings"]["lock_spam"] = "no" save_data(_config.moderation.data, data)
if not lang then 
  return '*Spam* _has been_ *unLocked 🤝😽*'
else
 return "_تـ๋͜م فـ๋͜تـح الكـ๋͜لايش 🤝😽_"
end
end
end


local function lock_flood(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local lock_flood = data[tostring(target)]["settings"]["flood"] 
if lock_flood == "yes" then
if not lang then
return "*Flood is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه التـ๋͜كـرار  مقـ๋͜فـ✥ـٍلـة 😾🔐_"
end
else
 data[tostring(target)]["settings"]["flood"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
  return '*Flood* _has been_ *Locked 😸👄*'
else
 return "_تـ๋͜م قـ๋͜فـ✥ـٍل التـ๋͜كـرار 😸🔐_"
end
end
end

local function unlock_flood(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end 

local lock_flood = data[tostring(target)]["settings"]["flood"]
 if lock_flood == "no" then
if not lang then
 return "*Flood is really* _unlocked 😼🔓_"
elseif lang then
 return "_وآلـ๋͜لـه التـ๋͜كـرار  مفـ๋͜تـوحـ๋͜ة 😼🔓_"
end
else 
data[tostring(target)]["settings"]["flood"] = "no" save_data(_config.moderation.data, data) 
if not lang then
  return '*Flood* _has been_ *unLocked 🤝😽*'
else
 return "_تـ๋͜م فـ๋͜تـح التـ๋͜كـرار 🤝😽_"
end
end
end


local function lock_bots(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"] 
if lock_bots == "yes" then
if not lang then
return "*Bots is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه البـ๋͜وتـات مقـ๋͜فـ✥ـٍلـة 😾🤖🔐_"
end
else
 data[tostring(target)]["settings"]["lock_bots"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
  return '*Bots* _has been_ *Locked 😸👄*'
else
 return "_تـ๋͜م قـ๋͜فـ✥ـٍل البـ๋͜وتـات 😸🤖🔐_"
end
end
end

local function unlock_bots(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end 
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"]
 if lock_bots == "no" then
if not lang then
 return "*Bots is really* _unlocked 😼🔓_"
elseif lang then
 return "_وآلـ๋͜لـه البـ๋͜وتـات مفـ๋͜تـوحـ๋͜ة 😼🤖🔓_"
end
else 
data[tostring(target)]["settings"]["lock_bots"] = "no" save_data(_config.moderation.data, data) 
if not lang then
  return '*Bots* _has been_ *unLocked 🤝😽*'
else
 return "_تـ๋͜م فـ๋͜تـح البـ๋͜وتـات 🤝😽_"
end
end
end


local function lock_markdown(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"] 
if lock_markdown == "yes" then
if not lang then 
return "*Markdown is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه الـمـ๋͜اركدوݩ  مقـ๋͜فـ✥ـٍل 😾🔐_"
end
else
 data[tostring(target)]["settings"]["lock_markdown"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
  return '*Markdown* _has been_ *Locked 😸👄*'
else
 return "_تـ๋͜م قـ๋͜فـ✥ـٍل الـمـ๋͜اركدوݩ 😸🔐_"
end
end
end

local function unlock_markdown(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end 
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"]
 if lock_markdown == "no" then
if not lang then
 return "*Markdown is really* _unlocked 😼🔓_"
elseif lang then
 return "_وآلـ๋͜لـه الـمـ๋͜اركدوݩ  مفـ๋͜تـوح 😼🔓_"
end
else 
data[tostring(target)]["settings"]["lock_markdown"] = "no" save_data(_config.moderation.data, data) 
if not lang then
  return '*Markdown* _has been_ *unLocked 🤝😽*'
else
 return "_تـ๋͜م فـ๋͜تـح الـمـ๋͜اركدوݩ 🤝😽_"
end
end
end

---------------------------------------------
local function lock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"] 
if lock_arabic == "yes" then
if not lang then
return "*arabic is really* _locked 😾📝_"
elseif lang then
 return "_وآلـ๋͜لـه اللـ๋͜غـ๋ة آلـ๋͜عـربـ๋͜يـ๋ة مقـ๋͜فـ✥ـٍلة 😾📝_"
end
else
 data[tostring(target)]["settings"]["lock_arabic"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
  return '*arabic* _has been_ *Locked 😸👄*'
else
 return "_تـ๋͜م قـ๋͜فـ✥ـٍل اللـ๋͜غـ๋ة آلـ๋͜عـربـ๋͜يـ๋ة 😸🔐_"
end
end
end

local function unlock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end 
end

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"]
 if lock_arabic == "no" then
if not lang then
 return "*arabic is really* _unlocked 😼🔓_"
elseif lang then
 return "_وآلـ๋͜لـه اللـ๋͜غـ๋ة آلـ๋͜عـربـ๋͜يـ๋ة مفـ๋͜تـوحة 😼🔓_"
end
else 
data[tostring(target)]["settings"]["lock_arabic"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
  return '*arabic* _has been_ *unLocked 🤝😽*'
else
 return "_تـ๋͜م فـ๋͜تـح اللـ๋͜غـ๋ة آلـ๋͜عـربـ๋͜يـ๋ة 🤝😽_"
end
end
end

 local function lock_webpage(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"] 
if lock_webpage == "yes" then
if not lang then
return "*Webpage is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه صـفـ๋͜حـة آلـ๋͜ويـ๋͜ب مقـ๋͜فـ✥ـٍلة 😾🔐_"
end
else
 data[tostring(target)]["settings"]["lock_webpage"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
  return '*Webpage* _has been_ *Locked 😸👄*'
else
 return "_تـ๋͜م قـ๋͜فـ✥ـٍل صـفـ๋͜حـة آلـ๋͜ويـ๋͜ب 😸🔐_"
end
end
end

local function unlock_webpage(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end 
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"]
 if lock_webpage == "no" then
if not lang then
 return "*Webpage is really* _unlocked 😼🔓_"
elseif lang then
 return "_وآلـ๋͜لـه صـفـ๋͜حـة آلـ๋͜ويـ๋͜ب  مفـ๋͜تـوحة 😼🔓_"
end
else 
data[tostring(target)]["settings"]["lock_webpage"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
  return '*Webpage* _has been_ *unLocked 🤝😽*'
else
 return "_تـ๋͜م فـ๋͜تـح صـفـ๋͜حـة آلـ๋͜ويـ๋͜ب 🤝😽_"
end
end
end

function group_settings(msg, target) 	
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end
local data = load_data(_config.moderation.data)
local target = msg.chat_id_ 
if data[tostring(target)] then 	
if data[tostring(target)]["settings"]["num_msg_max"] then 	
NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['num_msg_max'])
	print('custom'..NUM_MSG_MAX) 	
else 	
NUM_MSG_MAX = 5
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_link"] then			
data[tostring(target)]["settings"]["lock_link"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_tag"] then			
data[tostring(target)]["settings"]["lock_tag"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_mention"] then			
data[tostring(target)]["settings"]["lock_mention"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_edit"] then			
data[tostring(target)]["settings"]["lock_edit"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_spam"] then			
data[tostring(target)]["settings"]["lock_spam"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_flood"] then			
data[tostring(target)]["settings"]["lock_flood"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_bots"] then			
data[tostring(target)]["settings"]["lock_bots"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_markdown"] then			
data[tostring(target)]["settings"]["lock_markdown"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_arabic"] then			
data[tostring(target)]["settings"]["lock_arabic"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_webpage"] then			
data[tostring(target)]["settings"]["lock_webpage"] = "no"		
end
end

if not lang then
local settings = data[tostring(target)]["settings"] 
text = "*⚙️ Group Settings ⚙️*\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n\n*|* _Lock links 🖇_ *| ➫*_[_ *"..settings.lock_link.."* _]_\n*|* _Lock flood 🛡_ *| ➫*_[_ *"..settings.flood.."* _]_\n*|* _Flood sensitivity🕹 _ *| ➫* _[_ *"..NUM_MSG_MAX.."* _]_\n\n*|*  _Lock spam 🔖_  *| ➫* _[_ *"..settings.lock_spam.."* _]_\n*|* _Lock webpage 📡 _  *| ➫* _[_ *"..settings.lock_webpage.."* _]_\n*|* _Lock tags #️⃣_ *| ➫*_[_ *"..settings.lock_tag.."* _]_\n*|* _lock Bots 🤖_ *| ➫* _[_ *"..settings.lock_bots.."* _]_\n\n*|*_Lock markdown  🖋_  *| ➫* _[_ *"..settings.lock_markdown.."* _]_\n*|* _Lock mention 🆔 _ *| ➫* _[_ *"..settings.lock_mention.."* _]_\n*|* _Lock edit 📝_ *| ➫* _[_ *"..settings.lock_edit.."* _]_\n*|* _Lock arabic 📖_ *| ➫* _[_ *"..settings.lock_arabic.."* _]_\n\n*➖🔷➖🔻{T.L.N}🔻➖🔷➖*\n*Music Channel 😸❤️ :-*\n @ii02ii"
else
local settings = data[tostring(target)]["settings"] 
 text = "_⚙️اعـ✥ـٍدادات المجمــ๋͜وعه⚙️_".."\n".."*➖🔷➖🔺{T.L.N}🔺➖🔷➖*".."\n\n".."| الــ๋͜روآبــ๋͜ط 🖇 | ➫ *[*_   "..settings.lock_link.."  _*]* ".."\n".."| الـتــ๋͜كرار 🛡 | ➫ *[*_  "..settings.flood.."  _*]*".."\n".."| عــ๋͜دد الـتــ๋͜كرا 🕹 |➫ *[*_   "..NUM_MSG_MAX.."  _*]*".."\n\n".."| الـكــ๋͜لايـش 🔖 | ➫ *[*_  "..settings.lock_spam.."  _*]*".."\n".."|  آلـويـ๋͜ب 📡 | ➫ *[*_ "..settings.lock_webpage.."  _*]* ".."\n".."|  آلـتـ๋͜اكـات #️⃣ | ➫ *[*_  "..settings.lock_tag.."  _*]* ".."\n".."|  آلـبـ๋͜وتـات 🤖 | ➫ *[*_ "..settings.lock_bots.."  _*]* ".."\n\n".."|  آلـمـ๋͜اركـدون 🖋 | ➫ *[*_  "..settings.lock_markdown.."  _*]*".."\n".."|  آلـمـ๋͜عرفـات 🆔 | ➫ *[*_ "..settings.lock_mention.."  _*]*".."\n".."|  آلـتـ๋͜عديل 📝 | ➫ *[*_  "..settings.lock_edit.."  _*]* ".."\n".."|  آلـعـ๋͜ربـيـ๋͜ة 📖 | ➫ *[*_  "..settings.lock_arabic.."  _*]* ".."\n\n".."*➖🔷➖🔻{T.L.N}🔻➖🔷➖*".."\n".."*قـنـ๋͜اة أغـ✥ـانـ๋͜يے 😸❤️*\n @ii02ii"
end
return text
end



local function mute_all(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then 
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local mute_all = data[tostring(target)]["mutes"]["mute_all"] 
if mute_all == "yes" then 
if not lang then
return "*Mute All is really* _locked 😾🔐🔇_"
elseif lang then
 return "_وآلـ๋͜لـه جـمـ๋͜يع الـوسـ๋͜ائـط مقـ๋͜فـ✥ـٍلة 😾🔐🔇_"
end
else 
data[tostring(target)]["mutes"]["mute_all"] = "yes"
 save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute All* _has been_ *Locked 😸🔇*'
else
 return "_تـ๋͜م قـ๋͜فـ✥ـٍل جـمـ๋͜يع الـوسـ๋͜ائـط 😸🔐🔇_"
end
end
end

local function unmute_all(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then 
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ���͜�� مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local mute_all = data[tostring(target)]["mutes"]["mute_all"] 
if mute_all == "no" then 
if not lang then
 return "*Mute All is really* _unlocked 😼🔓🔊_"
elseif lang then
 return "_وآلـ๋͜لـه جـمـ๋͜يع الـوسـ๋͜ائـط مفـ๋͜تـوحـ๋͜ة 😼🔓🔊_"
end
else 
data[tostring(target)]["mutes"]["mute_all"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute All* _has been_ *unLocked 😽🔊*'
else
 return "تـ๋͜م فـ๋͜تـح جـمـ๋͜يع الـوسـ๋͜ائـط 😽🔊"
end 
end
end

---------------Mute Gif-------------------
local function mute_gif(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local mute_gif = data[tostring(target)]["mutes"]["mute_gif"] 
if mute_gif == "yes" then
if not lang then
return "*Mute Gif is really* _locked 😾🔐🎑_"
elseif lang then
 return "_وآلـ๋͜لـه الصـ๋͜ور المـ๋͜تحـركـ๋͜ة مقـ๋͜فـ✥ـٍلة 😾����🎑_"
end
else
 data[tostring(target)]["mutes"]["mute_gif"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then 
  return '*Mute Gif* _has been_ *Locked 😸🎑*'
else
 return "تـ๋͜م قـ๋͜فـ✥ـٍل الصـ๋͜ور المـ๋͜تحـركـ๋͜ة 😸🔐🎑"
end
end
end

local function unmute_gif(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end 

local mute_gif = data[tostring(target)]["mutes"]["mute_gif"]
 if mute_gif == "no" then
if not lang then
 return "*Mute Gif is really* _unlocked 😼🔓🎆_"
elseif lang then
 return "_وآلـ๋͜لـه الصـ๋͜ور المـ๋͜تحـركـ๋͜ة مفـ๋͜تـوحـ๋͜ة 😼🔓🎆_"
end
else 
data[tostring(target)]["mutes"]["mute_gif"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute Gif* _has been_ *unLocked 😽🎆*'
else
 return "تـ๋͜م فـ๋͜تـح الصـ๋͜ور المـ๋͜تحـركـ๋͜ة 😽🎆"
end
end
end
---------------Mute Game-------------------
local function mute_game(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local mute_game = data[tostring(target)]["mutes"]["mute_game"] 
if mute_game == "yes" then
if not lang then
return "*Mute Game is really* _locked 😾🔐🎮_"
elseif lang then
 return "_وآلـ๋͜لـه الالـعـ๋͜اب مقـ๋͜فـ✥ـٍلة 😾🔐🎮_"
end
else
 data[tostring(target)]["mutes"]["mute_game"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute Game* _has been_ *Locked 😸🎮*'
else
 return "تـ๋͜م قـ๋͜فـ✥ـٍل الالـعـ๋͜اب 😸🔐🎮"
end
end
end

local function unmute_game(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end 
end

local mute_game = data[tostring(target)]["mutes"]["mute_game"]
 if mute_game == "no" then
if not lang then
 return "*Mute Game is really* _unlocked 😼🔓🎰_"
elseif lang then
 return "_وآلـ๋͜لـه الالـعـ๋͜اب مفـ๋͜تـوحـ๋͜ة 😼🔓🎰_"
end
else 
data[tostring(target)]["mutes"]["mute_game"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
  return '*Mute Game* _has been_ *unLocked 😽🎰*'
else
 return "تـ๋͜م فـ๋͜تـح الالـعـ๋͜اب 😽🎰"
end
end
end
---------------Mute Inline-------------------
local function mute_inline(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local mute_inline = data[tostring(target)]["mutes"]["mute_inline"] 
if mute_inline == "yes" then
if not lang then
return "*Mute Inline is really* _locked ��🔐_"
elseif lang then
 return "_وآلـ๋͜لـه الايـنـ๋͜لايـن مقـ๋͜فـ✥ـٍل 😾🔐_"
end
else
 data[tostring(target)]["mutes"]["mute_inline"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute Inline* _has been_ *Locked 😸*'
else
 return "تـ๋͜م قـ๋͜فـ✥ـٍل الايـنـ๋͜لايـن 😸🔐"
end
end
end

local function unmute_inline(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end 

local mute_inline = data[tostring(target)]["mutes"]["mute_inline"]
 if mute_inline == "no" then
if not lang then
 return "*Mute Inline is really* _unlocked 😼🔓_"
elseif lang then
 return "_وآلـ๋͜لـه الايـنـ๋͜لايـن مفـ๋͜تـوح 😼🔓_"
end
else 
data[tostring(target)]["mutes"]["mute_inline"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute Inline* _has been_ *unLocked 😽*'
else
 return "_تـ๋͜م فـ๋͜تـح الايـنـ๋͜لايـن 😽_"
end
end
end
---------------Mute Text-------------------
local function mute_text(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local mute_text = data[tostring(target)]["mutes"]["mute_text"] 
if mute_text == "yes" then
if not lang then
return "*Mute Text is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه الـ๋͜دردشـ๋͜ة مقـ๋͜فـ✥ـٍلة 😾🔐_"
end
else
 data[tostring(target)]["mutes"]["mute_text"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute Text* _has been_ *Locked 😸*'
else
 return "تـ๋͜م قـ๋͜فـ✥ـٍل الـ๋͜دردشـ๋͜ة 😸🔐"
end
end
end

local function unmute_text(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end 
end

local mute_text = data[tostring(target)]["mutes"]["mute_text"]
 if mute_text == "no" then
if not lang then
 return "*Mute Text is really* _unlocked 😼🔓_"
elseif lang then
 return "_وآلـ๋͜لـه الـ๋͜دردشـ๋͜ة مفـ๋͜تـوحة 😼🔓_"
end
else 
data[tostring(target)]["mutes"]["mute_text"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute Text* _has been_ *unLocked 😽🥁*'
else
 return "_تـ๋͜م فـ๋͜تـح الـ๋͜دردشـ๋͜ة 😽🥁_"
end
end
end

local function mute_photo(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local mute_photo = data[tostring(target)]["mutes"]["mute_photo"] 
if mute_photo == "yes" then
if not lang then
return "*Mute Photo is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه الـصـ๋͜ور مقـ๋͜فـ✥ـٍلة 😾🔐_"
end
else
 data[tostring(target)]["mutes"]["mute_photo"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute Photo* _has been_ *Locked 😸��*'
else
 return "تـ๋͜م قـ๋͜فـ✥ـٍل الـصـ๋͜ور 😸📷"
end
end
end

local function unmute_photo(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end
 
local mute_photo = data[tostring(target)]["mutes"]["mute_photo"]
 if mute_photo == "no" then
if not lang then
 return "*Mute Photo is really* _unlocked ����🔓_"
elseif lang then
 return "_وآلـ๋͜لـه الـصـ๋͜ور مفـ๋͜تـوحة 😼🔓_"
end
else 
data[tostring(target)]["mutes"]["mute_photo"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute Photo* _has been_ *unLocked 😽📸*'
else
 return "_تـ๋͜م فـ๋͜تـح الـصـ๋͜ور 😽📸_"
end
end
end

local function mute_video(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local mute_video = data[tostring(target)]["mutes"]["mute_video"] 
if mute_video == "yes" then
if not lang then
return "*Mute Video is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه الـفـ๋͜ديـ๋͜وات مقـ๋͜فـ✥ـٍلة 😾🔐_"
end
else
 data[tostring(target)]["mutes"]["mute_video"] = "yes" 
save_data(_config.moderation.data, data)
if not lang then 
  return '*Mute Video* _has been_ *Locked 😸🎞*'
else
 return "تـ๋͜م قـ๋͜فـ✥ـٍل الـفـ๋͜ديـ๋͜وات 😸🎞"
end
end
end

local function unmute_video(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end 

local mute_video = data[tostring(target)]["mutes"]["mute_video"]
 if mute_video == "no" then
if not lang then
 return "*Mute Video is really* _unlocked 😼🔓_"
elseif lang then
 return "_وآلـ๋͜لـه الـفـ๋͜ديـ๋͜وات مفـ๋͜تـوحة 😼🔓_"
end
else 
data[tostring(target)]["mutes"]["mute_video"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute Video* _has been_ *unLocked 😽📹*'
else
 return "_تـ๋͜م فـ๋͜تـح الـفـ๋͜ديـ๋͜وات 😽📹_"
end
end
end

local function mute_audio(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local mute_audio = data[tostring(target)]["mutes"]["mute_audio"] 
if mute_audio == "yes" then
if not lang then
return "*Mute Audio is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه الـصـ๋͜وت مقـ๋͜فـ✥ـٍل 😾🔐_"
end
else
 data[tostring(target)]["mutes"]["mute_audio"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute Audio* _has been_ *Locked 😸🔕*'
else 
 return "تـ๋͜م قـ๋͜فـ✥ـٍل الـصـ๋͜وت 😸🔕"
end
end
end

local function unmute_video(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end 

local mute_audio = data[tostring(target)]["mutes"]["mute_audio"]
 if mute_audio == "no" then
if not lang then
 return "*Mute Audio is really* _unlocked 😼🔓_"
elseif lang then
 return "_وآلـ๋͜لـه الـصـ๋͜وت مفـ๋͜تـوح 😼🔓_"
end
else 
data[tostring(target)]["mutes"]["mute_audio"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
  return '*Mute Audio* _has been_ *unLocked 😽🎶*'
else
 return "_تـ๋͜م فـ๋͜تـح الـصـ๋͜وت 😽🎶_"
end
end
end

local function mute_voice(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local mute_voice = data[tostring(target)]["mutes"]["mute_voice"] 
if mute_voice == "yes" then
if not lang then
return "*Mute voice is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه الـبـ๋͜صمـات مقـ๋͜فـ✥ـٍلة 😾🔐_"
end
else
 data[tostring(target)]["mutes"]["mute_voice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute voice* _has been_ *Locked 😸🎧*'
else
 return "تـ๋͜م قـ๋͜فـ✥ـٍل الـبـ๋͜صمـات 😸🎧"
end
end
end

local function unmute_voice(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end 

local mute_voice = data[tostring(target)]["mutes"]["mute_voice"]
 if mute_voice == "no" then
if not lang then
 return "*Mute voice is really* _unlocked 😼🔓_"
elseif lang then
 return "_وآلـ๋͜لـه الـبـ๋͜صمـات مفـ๋͜تـوحة 😼🔓_"
end
else 
data[tostring(target)]["mutes"]["mute_voice"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
  return '*Mute voice* _has been_ *unLocked 😽🎙*'
else
 return "_تـ๋͜م فـ๋͜تـح الـبـ๋͜صمـات 😽🎙_"
end
end
end

local function mute_sticker(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local mute_sticker = data[tostring(target)]["mutes"]["mute_sticker"] 
if mute_sticker == "yes" then
if not lang then
return "*Mute Sticker is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه الـملـ๋͜صـقات مقـ๋͜فـ✥ـٍلة 😼🔐_"
end
else
 data[tostring(target)]["mutes"]["mute_sticker"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute Sticker* _has been_ *Locked 😸🎨*'
else
 return "تـ๋͜م قـ๋͜فـ✥ـٍل الـملـ๋͜صـقات 😸🎨"
end
end
end

local function unmute_sticker(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end 
end

local mute_sticker = data[tostring(target)]["mutes"]["mute_sticker"]
 if mute_sticker == "no" then
if not lang then
 return "*Mute Sticker is really* _unlocked 😼🔓_"
elseif lang then
 return "_وآلـ๋͜لـه الـملـ๋͜صـقات مفـ๋͜تـوحة 😼🔓_"
end
else 
data[tostring(target)]["mutes"]["mute_sticker"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
  return '*Mute Sticker* _has been_ *unLocked 😽🏙*'
else
 return "_تـ๋͜م فـ๋͜تـح الـملـ๋͜صـقات 😽🏙_"
end 
end
end

local function mute_contact(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local mute_contact = data[tostring(target)]["mutes"]["mute_contact"] 
if mute_contact == "yes" then
if not lang then
return "*Mute Contact is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه جـ๋͜هـات آلأتـ๋͜صـال مقـ๋͜فـ✥ـٍلة 😾🔐_"
end
else
 data[tostring(target)]["mutes"]["mute_contact"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute Contact* _has been_ *Locked 😸🎻*'
else
 return "تـ๋͜م قـ๋͜فـ✥ـٍل جـ๋͜هـات آلأتـ๋͜صـال 🎻😸"
end
end
end

local function unmute_contact(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end 

local mute_contact = data[tostring(target)]["mutes"]["mute_contact"]
 if mute_contact == "no" then
if not lang then
 return "*Mute Contact is really* _unlocked 😼🔓_"
elseif lang then
 return "_وآلـ๋͜لـه جـ๋͜هـات آلأتـ๋͜صـال مفـ๋͜تـوحة 😼🔓_"
end
else 
data[tostring(target)]["mutes"]["mute_contact"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute Contact* _has been_ *unLocked 😽☎️*'
else
 return "_تـ๋͜م فـ๋͜تـح جـ๋͜هـات آلأتـ๋͜صـال 😽☎️_"
end
end
end

local function mute_forward(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local mute_forward = data[tostring(target)]["mutes"]["mute_forward"] 
if mute_forward == "yes" then
if not lang then
return "*Mute Forward is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه آلتـ๋͜وجـيـ๋͜ه مقـ๋͜فـ✥ـٍل 😾🔐_"
end
else
 data[tostring(target)]["mutes"]["mute_forward"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute Forward* _has been_ *Locked 😸🎻*'
else
 return "تـ๋͜م قـ๋͜فـ✥ـٍل آلتـ๋͜وجـيـ๋͜ه 🎻😸"
end
end
end

local function unmute_forward(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end 

local mute_forward = data[tostring(target)]["mutes"]["mute_forward"]
 if mute_forward == "no" then
if not lang then
 return "*Mute Forward is really* _unlocked 😼🔓_"
elseif lang then
 return "_وآلـ๋͜لـه آلتـ๋͜وجـيـ๋͜ه مفـ๋͜تـوح 😼🔓_"
end 
else 
data[tostring(target)]["mutes"]["mute_forward"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
  return '*Mute Forward* _has been_ *unLocked 😽🔄*'
else
 return "_تـ๋͜م فـ๋͜تـح آلتـ๋͜وجـيـ๋͜ه 😽🔄_"
end
end
end

local function mute_location(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local mute_location = data[tostring(target)]["mutes"]["mute_location"] 
if mute_location == "yes" then
if not lang then
return "*Mute Location is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه آلمـ๋͜وقـع مقـ๋͜فـ✥ـٍل 😾🔐_"
end
else
 data[tostring(target)]["mutes"]["mute_location"] = "yes" 
save_data(_config.moderation.data, data)
if not lang then
  return '*Mute Location* _has been_ *Locked 😸❌*'
else
 return "تـ๋͜م قـ๋͜فـ✥ـٍل آلمـ๋͜وقـع 😸❌"
end
end
end

local function unmute_location(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end 

local mute_location = data[tostring(target)]["mutes"]["mute_location"]
 if mute_location == "no" then
if not lang then
 return "*Mute Location is really* _unlocked 😼🔓_"
elseif lang then
 return "_وآلـ๋͜لـه آلمـ๋͜وقـع مفـ๋͜تـوح 😼🔓_"
end
else 
data[tostring(target)]["mutes"]["mute_location"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute Location* _has been_ *unLocked 😽📍*'
else
 return "_تـ๋͜م فـ๋͜تـح آلمـ๋͜وقـع 😽📍_"
end
end
end

local function mute_document(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local mute_document = data[tostring(target)]["mutes"]["mute_document"] 
if mute_document == "yes" then
if not lang then
return "*Mute Document is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه آلمـ๋͜لفـات مقـ๋͜فـ✥ـٍلة 😾🔐_"
 end
else
 data[tostring(target)]["mutes"]["mute_document"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute Document* _has been_ *Locked 😸🗂*'
else
 return "_تـ๋͜م قـ๋͜فـ✥ـٍل آلمـ๋͜لفـات 😸🗂_"
end
end
end

local function unmute_document(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end 

local mute_document = data[tostring(target)]["mutes"]["mute_document"]
 if mute_document == "no" then
if not lang then
 return "*Mute Document is really* _unlocked 😼🔓_"
elseif lang then
 return "_وآلـ๋͜لـه آلمـ๋͜لفـات مفـ๋͜تـوحة 😼🔓_"
end
else 
data[tostring(target)]["mutes"]["mute_document"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute Document* _has been_ *unLocked 😽📂*'
else
 return "_تـ๋͜م فـ๋͜تـح آلمـ๋͜لفـات 😽📂_"
end
end
end

local function mute_tgservice(msg, data, target) 
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end

local mute_tgservice = data[tostring(target)]["mutes"]["mute_tgservice"] 
if mute_tgservice == "yes" then
if not lang then
return "*Mute TgService is really* _locked 😾🔐_"
elseif lang then
 return "_وآلـ๋͜لـه آشـعـ๋͜ارات آلدخـ๋͜ول مقـ๋͜فـ✥ـٍلة 😾🔐_"
end
else
 data[tostring(target)]["mutes"]["mute_tgservice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*Mute TgService* _Has Been Enabled_"
else
return "تـ✥ـٍم قفـ✥ـٍل الاشـ✥ـٍعارات 🚫"
end
end
end

local function unmute_tgservice(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end 
end

local mute_tgservice = data[tostring(target)]["mutes"]["mute_tgservice"]
 if mute_tgservice == "no" then
if not lang then
 return "*Mute TgService is really* _unlocked 😼🔓_"
elseif lang then
 return "_وآلـ๋͜لـه آشـعـ๋͜ارات آلدخـ๋͜ول مفـ๋͜تـوحة 😼🔓_"
end 
else 
data[tostring(target)]["mutes"]["mute_tgservice"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
  return '*Mute TgService* _has been_ *unLocked 😽📌*'
else
 return "_تـ๋͜م فـ๋͜تـح آشـعـ๋͜ارات آلدخـ๋͜ول 😽📌_"
end 
end
end

local function mutes(msg, target) 	
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*You're n't* _Moderator😼💦_"
else
 return "_هـ๋͜ذا آلامـ๋͜ر لݪادمـ๋͜نـ✥ـٍية 😾🌈_ \n_ وانـ๋͜ت مـجـ๋͜رد عـضـ๋͜و 😹🙌_"
end
end
local data = load_data(_config.moderation.data)
local target = msg.chat_id_ 
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_all"] then			
data[tostring(target)]["mutes"]["mute_all"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_gif"] then			
data[tostring(target)]["mutes"]["mute_gif"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_text"] then			
data[tostring(target)]["mutes"]["mute_text"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_photo"] then			
data[tostring(target)]["mutes"]["mute_photo"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_video"] then			
data[tostring(target)]["mutes"]["mute_video"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_audio"] then			
data[tostring(target)]["mutes"]["mute_audio"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_voice"] then			
data[tostring(target)]["mutes"]["mute_voice"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_sticker"] then			
data[tostring(target)]["mutes"]["mute_sticker"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_contact"] then			
data[tostring(target)]["mutes"]["mute_contact"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_forward"] then			
data[tostring(target)]["mutes"]["mute_forward"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_location"] then			
data[tostring(target)]["mutes"]["mute_location"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_document"] then			
data[tostring(target)]["mutes"]["mute_document"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_tgservice"] then			
data[tostring(target)]["mutes"]["mute_tgservice"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_inline"] then			
data[tostring(target)]["mutes"]["mute_inline"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_game"] then			
data[tostring(target)]["mutes"]["mute_game"] = "no"		
end
end

if not lang then
local mutes = data[tostring(target)]["mutes"] 

 text = "*🔊 Group Mutes 🔊*".."\n".."*➖🔷➖🔺{T.L.N}🔺➖🔷➖*".."\n\n".."*|* _Mute photo 📸_ *| ➫* _[_ *"..mutes.mute_photo.."* _]_\n*|* _Mute video 📹_ *| ➫* _[_ *"..mutes.mute_video.."* _]_\n*|* _Mute gif 🎑_ *| ➫* _[_ *"..mutes.mute_gif.."* _]_\n\n*|* _Mute audio 🔔_ *| ➫* _[_ *"..mutes.mute_audio.."* _]_\n*|* _Mute voice 🎙_ *| ➫* _[_ *"..mutes.mute_voice.."* _]_\n*|* _Mute document 🗂_ *| ➫* _[_ *"..mutes.mute_document.."* _]_\n*|* _Mute sticker 🎨_ *| ➫* _[_ *"..mutes.mute_sticker.."* _]_\n\n*|* _Mute inline 📍_ *| ➫* _[_ *"..mutes.mute_inline.."* _]_\n*|* _Mute text 🔖_ *| ➫* _[_ *"..mutes.mute_text.."* _]_\n\n*|* _Mute forward 🔄_ *| ➫* _[_ *"..mutes.mute_forward.."* _]_\n*|* _Mute TgService 📊_ *| ➫* _[_ *"..mutes.mute_tgservice.."* _]_\n*|* _Mute contact 👤_ *| ➫* _[_ *"..mutes.mute_contact.."* _]_\n*|* _Mute game 🎮_ *| ➫* _[_ *"..mutes.mute_game.."* _]_\n*|* _Mute location 📡_ *| ➫* _[_ *"..mutes.mute_location.."* _]_\n*|* _Mute all 🔕_ *| ➫* _[_ *"..mutes.mute_all.."* _]_\n\n".."*➖🔷➖🔻{T.L.N}🔻➖🔷➖*\n*Music Channel 😸❤️ :-*\n @ii02ii"
 else
local mutes = data[tostring(target)]["mutes"] 
 text = "_🔇 اعـ✥ـٍدادات الــ๋͜كـ✥ـٍتم 🔇_".."\n".."*➖🔷➖🔺{T.L.N}🔺➖🔷➖*".."\n\n".."| آلـصـ๋͜ور 📸 | ➫ *[*_  "..mutes.mute_photo.."  _*]*\n| آلـفـ๋͜ديـو 📽 | ➫ *[*_  "..mutes.mute_video.."  _*]*\n| آلـمـ๋͜تـحـ๋͜ركـ๋͜ة 🎑 | ➫ *[*_  "..mutes.mute_gif.."  _*]*\n\n| آلـصـ๋͜وت 🎼 | ➫ *[*_  "..mutes.mute_audio.."  _*]*\n| آلـبـ๋͜صمات 🎤 | ➫ *[*_  "..mutes.mute_voice.."  _*]*\n| الـملـ๋͜فـات 🗂 | ➫ *[*_  "..mutes.mute_document.."  _*]*\n\n| آلاونـ๋͜لآيـن 📍 | ➫ *[*_  "..mutes.mute_inline.."  _*]*\n| آلـملـ๋͜صقـات 🎨 | ➫ *[*_  "..mutes.mute_sticker.."  _*]*\n| آلـدردشـ๋͜ة 🔖 | ➫ *[*_  "..mutes.mute_text.."  _*]*\n\n| الـ๋͜تـوجـ๋͜يـه 🔄 | ➫ *[*_  "..mutes.mute_forward.."  _*]*\n| اشـعـ๋͜ارات آلـدخـ๋͜ول 📲 | ➫ *[*_  "..mutes.mute_tgservice.."  _*]*".."\n".."| جـهـ๋͜ات آلأتـ๋͜صـال 👤 | ➫ *[*_  "..mutes.mute_contact.."  _*]*\n\n| آلالـ๋͜عـاب 🎮 | ➫ *[*_  "..mutes.mute_game.."  _*]*\n| الـمـ๋͜وقـع 📡 | ➫ *[*_  "..mutes.mute_location.."  _*]*\n\n| كـتـ๋͜م آلـ๋͜كـل 🔕 | ➫ *[*_   "..mutes.mute_all.."  _*]*".."\n".."*➖🔷➖🔻{T.L.N}🔻➖🔷➖*".."\n".."*قـنـ๋͜اة أغـ✥ـانـ๋͜يے 😸❤️*\n @ii02ii"
end
return text
end

local function Team_Skype(msg, matches)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
   local chat = msg.chat_id_
   local user = msg.sender_user_id_
   
if matches[1] == "id" or matches[1] == "ايدي" then
if not matches[2] and tonumber(msg.reply_to_message_id_) == 0 then
   if not lang then
return "*Your Id 😸🆔 \n↳╣*_"..user.."_ *╠*\n*Group Id 😼📍\n↳╣* _"..chat.."_ *╠*\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n\n*Music Channel 😸❤️*\n @ii02ii"
   else
return "*أيــ๋͜ديـك 😸🆔 \n↳╣*_"..user.."_ *╠*\n*أيــ๋͜ديے آلـ๋͜كـ✥ـٍروبـﮧ 😼📍\n↳╣* _"..chat.."_ *╠*\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n\n*قـنـ๋͜اة أغـ✥ـانـ๋͜يے  😸❤️*\n @ii02ii"
   end
end
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="ايدي"})
      end
   end
 if matches[1] == "pin" or matches[1] == "تثبيت" and is_mod(msg) then
tdcli.pinChannelMessage(msg.chat_id_, msg.reply_to_message_id_, 1)
if not lang then
return "*Msg* _Has Been Pinned 😺📍_"
else
return "_تـ๋͜م تثـ✥ـٍبيـ๋͜ت الـ๋͜رسـ๋͜الـة  😺📍_"
end
end
if matches[1] == 'unpin' or matches[1] == "الغي التثبيت" and is_mod(msg) then
tdcli.unpinChannelMessage(msg.chat_id_)
if not lang then
return "*Msg* _has been_ *unpinned 👊😼*"
else
return "_تـ๋͜م آلـ๋͜غـآء تثـ✥ـٍبيـ๋͜ت الـ๋͜رسـ๋͜الـة  💃😺_"
end
end
if matches[1] == "add" or matches[1] == "فعل" then
return modadd(msg)
end
if matches[1] == "rem" or matches[1] == 'عطل' then
return modrem(msg)
end
if matches[1] == "setowner" or matches[1] == 'ارفع المدير' and is_admin(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="setowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="setowner"})
      end
   end
if matches[1] == "remowner" or matches[1] == 'نزل المدير' and is_admin(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="remowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="remowner"})
      end
   end
if matches[1] == "promote" or matches[1] == 'ارفع ادمن' and is_owner(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="promote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="promote"})
      end
   end
if matches[1] == "demote" or matches[1] == 'نزل ادمن' and is_owner(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
 tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="demote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="demote"})
      end
   end

if matches[1] == "lock" or matches[1] == "اقفل" and is_mod(msg) then
local target = msg.chat_id_
if matches[2] == "links" or matches[2] == "الروابط" then
return lock_link(msg, data, target)
end
if matches[2] == "tag" or matches[2] == "التاك" then
return lock_tag(msg, data, target)
end
if matches[2] == "usename" or matches[2] == "المعرف" then
return lock_mention(msg, data, target)
end
if matches[2] == "arabic" or matches[2] == "العربية" then
return lock_arabic(msg, data, target)
end
if matches[2] == "edit" or matches[2] == "التعديل" then
return lock_edit(msg, data, target)
end
if matches[2] == "spam" or matches[2] == "الكلايش" then
return lock_spam(msg, data, target)
end
if matches[2] == "flood" or matches[2] == "التكرار" then
return lock_flood(msg, data, target)
end
if matches[2] == "bots" or matches[2] == "البوتات" then
return lock_bots(msg, data, target)
end
if matches[2] == "markdown" or matches[2] == "الماركدون" then
return lock_markdown(msg, data, target)
end
if matches[2] == "web" or matches[2] == "الويب" then
return lock_webpage(msg, data, target)
end
end

if matches[1] == "unlock" or matches[1] == "افتح" and is_mod(msg) then
local target = msg.chat_id_
if matches[2] == "links" or matches[2] == "الروابط" then
return unlock_link(msg, data, target)
end
if matches[2] == "tag" or matches[2] == "التاك" then
return unlock_tag(msg, data, target)
end
if matches[2] == "username" or matches[2] == "المعرف" then
return unlock_mention(msg, data, target)
end
if matches[2] == "arabic" or matches[2] == "العربية" then
return unlock_arabic(msg, data, target)
end
if matches[2] == "edit" or matches[2] == "التعديل" then
return unlock_edit(msg, data, target)
end
if matches[2] == "spam" or matches[2] == "الكلايش" then
return unlock_spam(msg, data, target)
end
if matches[2] == "flood" or matches[2] == "التكرار" then
return unlock_flood(msg, data, target)
end
if matches[2] == "bots" or matches[2] == "البوتات" then
return unlock_bots(msg, data, target)
end
if matches[2] == "markdown" or matches[2] == "الماركدون" then
return unlock_markdown(msg, data, target)
end
if matches[2] == "web" or matches[2] == "الويب" then
return unlock_webpage(msg, data, target)
end
end
if matches[1] == "اقفل" or matches[1] == "lock" and is_mod(msg) then
local target = msg.chat_id_
if matches[2] == "all" or matches[2] == "الكل" then
return mute_all(msg, data, target)
end
if matches[2] == "gif" or matches[2] == "المتحركة" then
return mute_gif(msg, data, target)
end
if matches[2] == "text" or matches[2] == "الدردشة" then
return mute_text(msg ,data, target)
end
if matches[2] == "photos" or matches[2] == "الصور" then
return mute_photo(msg ,data, target)
end
if matches[2] == "video" or matches[2] == "الفديو" then
return mute_video(msg ,data, target)
end
if matches[2] == "audio" or matches[2] == "الصوت" then
return mute_audio(msg ,data, target)
end
if matches[2] == "voice" or matches[2] == "البصمات" then
return mute_voice(msg ,data, target)
end
if matches[2] == "sticker" or matches[2] == "الملصقات" then
return mute_sticker(msg ,data, target)
end
if matches[2] == "contact" or matches[2] == "الجهات" then
return mute_contact(msg ,data, target)
end
if matches[2] == "fwd" or matches[2] == "التوجيه" then
return mute_forward(msg ,data, target)
end
if matches[2] == "location" or matches[2] == "الموقع" then
return mute_location(msg ,data, target)
end
if matches[2] == "document" or matches[2] == "الملفات" then
return mute_document(msg ,data, target)
end
if matches[2] == "tgservice" or matches[2] == "الاشعارات" then
return mute_tgservice(msg ,data, target)
end
if matches[2] == "inline" or matches[2] == "الانلاين" then
return mute_inline(msg ,data, target)
end
if matches[2] == "games" or matches[2] == "الالعاب" then
return mute_game(msg ,data, target)
end
end

if matches[1] == "افتح" or matches[1] == "unlock" and is_mod(msg) then
local target = msg.chat_id_
if matches[2] == "all" or matches[2] == "الكل" then
return unmute_all(msg, data, target)
end
if matches[2] == "gif" or matches[2] == "المتحركة" then
return unmute_gif(msg, data, target)
end
if matches[2] == "text" or matches[2] == "الدردشة" then
return unmute_text(msg, data, target)
end
if matches[2] == "photos" or matches[2] == "الصور" then
return unmute_photo(msg ,data, target)
end
if matches[2] == "video" or matches[2] == "الفديو" then
return unmute_video(msg ,data, target)
end
if matches[2] == "audio" or matches[2] == "الصوت" then
return unmute_audio(msg ,data, target)
end
if matches[2] == "voice" or matches[2] == "البصمات" then
return unmute_voice(msg ,data, target)
end
if matches[2] == "sticker" or matches[2] == "الملصقات" then
return unmute_sticker(msg ,data, target)
end
if matches[2] == "contact" or matches[2] == "الجهات" then
return unmute_contact(msg ,data, target)
end
if matches[2] == "fwd" or matches[2] == "التوجيه" then
return unmute_forward(msg ,data, target)
end
if matches [2] == "location" or matches[2] == "الموقع" then
return unmute_location(msg ,data, target)
end
if matches[2] == "document" or matches[2] == "الملفات" then
return unmute_document(msg ,data, target)
end
if matches[2] == "tgservice" or matches[2] == "الاشعارات" then
return unmute_tgservice(msg ,data, target)
end
if matches[2] == "inline" or matches[2] == "الانلاين" then
return unmute_inline(msg ,data, target)
end
if matches[2] == "games" or matches[2] == "الالعاب" then
return unmute_game(msg ,data, target)
end
end
if matches[1] == "معلومات المجموعة" or matches[1] == "group info" and is_mod(msg) and msg.to.type == "channel" then
local function group_info(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if not lang then
ginfo = "*Group Info 😺⚙️*\n\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n\n|_Number of members_ 😸👥 |∇\n *[*_  "..data.member_count_.."  _*]* \n|_Number of administrators_ 😽👮🏻‍♀️ | ∇\n *[*_  "..data.administrator_count_.."  _*]*\n|_Number of Kicked_ 😼🏌🏻 |∇  \n *[*_  "..data.kicked_count_.."  _*]* \n| _Group ID_ 🆔😻 |∇\n *[*_  "..data.channel_.id_.."  _*]* \n\n*➖🔷➖🔻{T.L.N}🔻➖🔷➖*\n\n*Music Channel 😸❤️ :-*\n @ii02ii"
print(serpent.block(data))
elseif lang then
ginfo = "*معلــ๋͜ومات المجمــ๋͜وعـ✥ـٍة 😺📲*\n\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n\n| عــ๋͜دد آلآعــ๋͜ضـاء  😸🚶🏻 |∇\n *[*_  "..data.member_count_.."  _*]* \n| عــ๋͜دد ألادمــ๋͜نـيــ๋͜ة  😽👷🏻 | ∇\n *[*_  "..data.administrator_count_.."  _*]*\n| عــ๋͜دد آلـ๋͜مـطـ๋͜روديـ๋͜ن 🏌🏻😼 |∇  \n *[*_  "..data.kicked_count_.."  _*]* \n| آيـ๋͜دي آلـ๋͜مـجـ๋͜مـوعـ๋ة 🆔😻 |∇\n *[*_  "..data.channel_.id_.."  _*]* \n\n*➖🔷➖🔻{T.L.N}🔻➖🔷➖*\n\n*قـنـ๋͜اة أغـ✥ـانـ๋͜يے 😸❤️*\n @ii02ii"
print(serpent.block(data))
end
        tdcli.sendMessage(arg.chat_id, arg.msg_id, 1, ginfo, 1, 'md')
end
 tdcli.getChannelFull(msg.chat_id_, group_info, {chat_id=msg.chat_id_,msg_id=msg.id_})
end
		if matches[1] == 'set link' or matches[1] == 'ضع رابط' and is_owner(msg) then
			data[tostring(chat)]['settings']['linkgp'] = 'waiting'
			save_data(_config.moderation.data, data)
      if not lang then
   return '*Please Send me* _the link 😺🚀_'
    else 
         return 'ارسـ๋͜ل الـ๋͜رابـ✥ـٍط آلـ๋͜جديـ✥ـٍد😽🔗'
       end
		end

		if msg.content_.text_ then
   local is_link = msg.content_.text_:match("^([https?://w]*.?telegram.me/joinchat/%S+)$") or msg.content_.text_:match("^([https?://w]*.?t.me/joinchat/%S+)$")
			if is_link and data[tostring(chat)]['settings']['linkgp'] == 'waiting' and is_owner(msg) then
				data[tostring(chat)]['settings']['linkgp'] = msg.content_.text_
				save_data(_config.moderation.data, data)
            if not lang then
	return "*Your* _new link_ *has been saved*"
           else
         return '_تـ๋͜م حـفـ๋͜ظ الـ๋͜رابـط آلـ๋͜جديـٍد😺✨_\n _ارسـ๋͜ل_ *[ الرابط ]* _لـتـ๋͜راه 😻💋_'
		 	end
       end
		end
    if matches[1] == 'link' or matches[1] == 'الرابط' and is_mod(msg) then
      local linkgp = data[tostring(chat)]['settings']['linkgp']
      if not linkgp then
      if not lang then
        return "*You must first place* _the link via 😼🎻 _  \n *[setlink]*"
     else
        return "_يـجـ๋͜ب عـلـ๋͜يك ان تـ๋͜ضع الرابط 😿📎_\n _قـ๋͜م بآرسـ๋͜ال_ *[ ضع رابط ]*"
      end
      end
     if not lang then
       text = "<b> Group link 😽🖇 </b>\n<b>➖🔷➖🔺{T.L.N}🔺➖🔷➖</b>\n"..linkgp
     else
      text = "<b> رابـ✥ـٍط المـجمــ๋͜وعـة 😸⚙️</b>\n<b>➖🔷➖🔺{T.L.N}🔺➖🔷➖</b>\n"..linkgp
         end
        return tdcli.sendMessage(chat, msg.id_, 1, text, 1, 'html')
     end
  if matches[1] == "set rules" or matches[1] == 'ضع قوانين' and matches[2] and is_mod(msg) then
    data[tostring(chat)]['rules'] = matches[2]
	  save_data(_config.moderation.data, data)
     if not lang then
    return "*Laws* _have been saved 😺🔖_"
   else 
  return "تـ๋͜م حـفـ๋͜ظ الـقـ๋͜وانـيـ๋͜ن 😻💋"
   end
  end
  if matches[1] == "rules" or matches[1] == 'القوانين' then
 if not data[tostring(chat)]['rules'] then
   if not lang then
       rules = "*Group Rules😽🔰* \n\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n\n_⓵ - Do not repeat messages😼🛡_\n_⓶ -Do not send links 😾🖇_\n_⓷ - Do not send long messages 😺🔖_\n_⓸ - Do not send porn messages😼🔞_\n_⓹ - Do not talk in politics 😸❌_\n\n*To stay here, save these laws😸🌝*\n\n*➖🔷➖🔻{T.L.N}🔻➖🔷➖*\n\n*Music Channel😸❤️*\n @ii02ii" 
    elseif lang then
       rules = "*قــ๋͜وانيـن المجمــ๋͜وعـ✥ـٍة 😽🔰* \n\n*➖🔷➖🔺{T.L.N}🔺➖🔷➖*\n\n_⓵ - عـ๋͜دم تـ๋͜كـرار آلـ๋͜رسـائل 😼🛡_\n_⓶ - عـ๋͜دم ارسـ๋͜ال الـ๋͜روابـط 😾🖇_\n_⓷ - لا تـ๋͜رسـل كـ๋͜لايـ๋͜ش 😺🔖_\n_⓸ - لا تـ๋͜رسـل صـ๋͜ور ابـ๋͜احـيـ๋͜ة 😼🔞_\n_⓹ - لا تـتـ๋͜حـدث عـ๋͜ن السـ๋͜ياسـ๋͜ية 😸❌_\n\n*لــ๋͜كـي لا تــ๋͜طرد من المــ๋͜جـمــ๋͜وعـة احــ๋͜فـظ هــ๋͜ذه ألـقــ๋͜وانــ๋͜ين 😸🌝*\n\n*➖🔷➖🔻{T.L.N}🔻➖🔷➖*\n\n*قـنـ๋͜اة أغـ✥ـانـ๋͜يے 😸❤️*\n @ii02ii" 
 end
        else
     rules = "*قــ๋͜وانيـن المجمــ๋͜وعـ✥ـٍة 😽🔰:- *\n"..data[tostring(chat)]['rules']
      end
    return rules
  end
  if matches[1] == 'set flood' or matches[1] == 'ضع تكرار' and is_mod(msg) then
			if tonumber(matches[2]) < 1 or tonumber(matches[2]) > 50 then
			     if not lang then
				return "*Repetition* _is not less than_*< 1 >* _and not more than_*< 50 > 😽🛡*"
				else
				return "_الـتـ๋͜كرار يـجـ๋͜ب ان لآ يـ๋͜قـل\nعـ๋͜ن_*< 1 > 😼✔️* \n _وآكـ๋͜ثر مـن_  *<50> 😽🛡*"
			end
			end
			local flood_max = matches[2]
			data[tostring(chat)]['settings']['num_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
    if not lang then
    return "*Flood* _no more than 😼❌_ *:-*  _[_  *"..matches[2].."*  _]_"
				else
    return " _تــ๋͜م وضـع الـتــ๋͜كـرار 😽🕹_ *:-*  _[_  *"..matches[2].."*  _]_"
			end
		end
		if matches[1] == 'امسح' or matches[1] == 'del' and is_mod(msg) then
   tdcli.deleteMessages(msg.chat_id_, {[0] = msg.reply_to_message_id_})
end
		if matches[1]:lower() == 'امسح' or matches[1] == 'del' and is_owner(msg) then
			if matches[2] == 'الادمنية' or matches[2] == 'mods' then
				if next(data[tostring(chat)]['mods']) == nil then
            if not lang then
                return "_There is no_ *mods* _in group 🤖_"
             else
                return "_لايـ๋͜ﯡجـد ادمـ๋͜نـيـ๋͜ة فـيے الـمجـ๋͜مـوعـ๋͜ة ❌_"
			     	end
            end
				for k,v in pairs(data[tostring(chat)]['mods']) do
					data[tostring(chat)]['mods'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            if not lang then
            return "_All_ *mods*_ Done deleted 😿🕹_"
	      			else
            return "_تـ๋͜م حـذف جـ๋͜مـيـ๋͜ع الادمـنـ๋͜يـة 😺✌️_"
		    	end
         end
			if matches[2] == 'القوانين' or matches[2] == 'rules' then
				if not data[tostring(chat)]['rules'] then
            if not lang then
            return "*No rules* _in the group 😼📝_"
          else
            return "_لا يـوجـ๋͜د قـوانـ๋͜يـن فـي الـمـ๋͜جـمـ๋͜وعـة 😽❌_"
       end
		      		end
					data[tostring(chat)]['rules'] = nil
					save_data(_config.moderation.data, data)
             if not lang then
            return "*rules* _has been deleted 😼⚙️_"
          else
            return "_تـ๋͜م حـ๋͜ذف قـوانـ๋͜ين الـمـ๋͜جـمـ๋وعة😾👏_"
		    	end
          end
			if matches[2] == 'الوصف' or matches[2] == 'about' then
        if gp_type(chat) == "chat" then
				if not data[tostring(chat)]['about'] then
            if not lang then
           return "*No description* _in the group 😿🚦_"
        else
           return "_لا يـوجـ๋͜د وصـ๋͜ف فـي الـمـ๋͜جـمـ๋͜وعـة 🙀📝_"
     end
	     		end
					data[tostring(chat)]['about'] = nil
					save_data(_config.moderation.data, data)
        elseif gp_type(chat) == "channel" then
   tdcli.changeChannelAbout(chat, "", dl_cb, nil)
             end
             if not lang then
             	return "*description* _Done deleted 😸📍_"
           else
              return "_تـ๋͜م حـٍذف وصـ๋͜ف الـ๋͜مـجـٍمـ๋͜وعه 😼📍_"
             end
		   	end
        end
		if matches[1]:lower() == 'del' or matches[1] == 'امسح' and is_admin(msg) then
			if matches[2] == 'المدراء'or matches[2] == 'owners' then
				if next(data[tostring(chat)]['owners']) == nil then
             if not lang then
                return "*No owners* _in this group 😾❌_"
            else
                return "_لايـ๋͜ﯡجـد مـ๋͜دراء فيے الـمـ๋͜جـمـ๋͜وعـة ❌_"
            end
				end
				for k,v in pairs(data[tostring(chat)]['owners']) do
					data[tostring(chat)]['owners'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            if not lang then
				return "*owners* _has been deleted 😸🥁_"
           else
    return "_تـ๋͜م حـٍذف جـ๋͜مـيـ๋͜ع آلـ๋͜مـدراء 😺🥁_"
          end
			end
     end
if matches[1] == "set name" or matches[1] == 'ضع اسم' and matches[2] and is_mod(msg) then
local gp_name = matches[2]
tdcli.changeChatTitle(chat, gp_name, dl_cb, nil)
end
  if matches[1] == "set about" or matches[1] == 'ضع وصف' and matches[2] and is_mod(msg) then
     if gp_type(chat) == "channel" then
   tdcli.changeChannelAbout(chat, matches[2], dl_cb, nil)
    elseif gp_type(chat) == "chat" then
    data[tostring(chat)]['about'] = matches[2]
	  save_data(_config.moderation.data, data)
     end
     if not lang then
       return "_Group_ *description* _saved 😽📃_"
   else
       return "_تـ๋͜م حـفـ๋͜ظ وصـف الـ๋͜مـجـ๋͜مـوعـ๋͜ة 😻❤️_"
      end
  end
if matches[1] == "settings" or matches[1] == 'الاعدادات' and is_mod(msg) then
return group_settings(msg, target)
end
if matches[1] == "mutelist" or matches[1] == 'الوسائط' and is_mod(msg) then
return mutes(msg, target)
end
if matches[1] == "modlist" or matches[1] == 'الادمنية' and is_mod(msg) then
return modlist(msg)
end
if matches[1] == "ownerlist" or matches[1] == 'المدراء' and is_owner(msg) then
return ownerlist(msg)
end
if matches[1] == 'block' or matches[1] == "منع" and is_mod(msg) then
return filter_word(msg, matches[2])
end
if matches[1] == 'unblock' or matches[1] == "الغي منع" and is_mod(msg) then
return unfilter_word(msg, matches[2])
end
if matches[1] == 'block list' or matches[1] == "قائمة المنع" and is_mod(msg) then
return filter_list(msg)
end
if matches[1] == "language" or matches[1] == 'لغة' and is_owner(msg) then
			if matches[2] == 'انكلش' or matches[2] == 'English' then
  local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 redis:del(hash)
   if not lang then
return "_لـغـ๋͜ة آلـ๋͜بـوت الأن انـ๋͜كـليـ๋͜زيـة 😺🔠_"
else
return "*Bot* _language_  *is English 😺🔠*"
   end
end
			if matches[2] == 'عربي' or matches[2] == 'Arabic' then
redis:set(hash, true)
   if not lang then
return "_لـغـ๋͜ة آلـ๋͜بـوت الأن عـربـ๋͜يـة 😺👏_"
else
return "*Bot* _language_  *is Arabic 😺✌️*"
   end
end
end
--------------------- Welcome -----------------------
local lang = redis:get("gp_lang:"..msg.chat_id_)
----------------------------------------
	if matches[1] == "ضع ترحيب" or matches[1] == 'set wlc' and is_mod(msg) then
	if not lang then
		welcome = check_markdown(matches[2])
		redis:hset('تــ๋͜يــ๋͜م ألــ๋͜رئـ✥ـآســ๋͜ة 🌝💫\n@Ch_Dev',msg.chat_id_,tostring(welcome))
		tdcli.sendMessage(msg.chat_id_, msg.id_, 1, '*You placed* _the welcome 😽💃_ *:-*\n\n'..matches[2], 1, 'md')
	else
		welcome = check_markdown(matches[2])
		redis:hset('تــ๋͜يــ๋͜م ألــ๋͜رئـ✥ـآســ๋͜ة 🌝💫\n@Ch_Dev',msg.chat_id_,tostring(welcome))
		tdcli.sendMessage(msg.chat_id_, msg.id_, 1, '_تـ๋͜م وضـ๋͜ع الـتـ๋͜رحـيـ๋͜ب 😸📍_ *:-*\n\n'..matches[2], 1, 'md')
	end
end
-----------------------------------------
		if matches[1]:lower() == 'امسح' or matches[1] == 'del' and is_owner(msg) then
	if matches[2] == "الترحيب" or matches[2] == 'wlc' then
	if not lang then
		if not redis:hget('تــ๋͜يــ๋͜م ألــ๋͜رئـ✥ـآســ๋͜ة 🌝💫\n@Ch_Dev',msg.chat_id_) then
			tdcli.sendMessage(msg.chat_id_, msg.id_, 1, 'Already No welcome message available!', 1, 'md')
		else
			redis:hdel('تــ๋͜يــ๋͜م ألــ๋͜رئـ✥ـآســ๋͜ة 🌝💫\n@Ch_Dev',msg.chat_id_)
			tdcli.sendMessage(msg.chat_id_, msg.id_, 1, 'Weclome Message Deleted!', 1, 'md')
		end
	else
		if not redis:hget('تــ๋͜يــ๋͜م ألــ๋͜رئـ✥ـآســ๋͜ة 🌝💫\n@Ch_Dev',msg.chat_id_) then
			tdcli.sendMessage(msg.chat_id_, msg.id_, 1, '_لا يــ๋͜وجد ترحيـ✥ـٍب آمـسـ๋͜حـة 😿☹️_', 1, 'md')
		else
			redis:hdel('تــ๋͜يــ๋͜م ألــ๋͜رئـ✥ـآســ๋͜ة 🌝💫\n@Ch_Dev',msg.chat_id_)
			tdcli.sendMessage(msg.chat_id_, msg.id_, 1, 'تـ๋͜م مـسـ๋͜ح آلـتـ๋͜رحـيـ✥ـٍب 😸🥁', 1, 'md')
		end
	end
	end
end
end
-----------------------------------------
local function pre_process(msg)
	if msg.content_.members_ then
		if redis:hget('تــ๋͜يــ๋͜م ألــ๋͜رئـ✥ـآســ๋͜ة 🌝💫\n@Ch_Dev',msg.chat_id_) then
			if msg.content_.members_[0] then
				name = msg.content_.members_[0].first_name_
				if msg.content_.members_[0].type_.ID == 'UserTypeBot' then
					return nil
				else
					data = redis:hget('تــ๋͜يــ๋͜م ألــ๋͜رئـ✥ـآســ๋͜ة 🌝💫\n@Ch_Dev',msg.chat_id_)
					if data:match('{name}') then
						out = data:gsub('{name}',name)
					else
						out = data
					end
						tdcli.sendMessage(msg.chat_id_, msg.id_, 1, tostring(out:gsub('\\_','_')), 1, 'md')
				end
			end
		end
end
end
return {
patterns ={
"^(ايدي)$",
"^(ايدي) (.*)$",
"^(id)$",
"^(id) (.*)$",
--Team_Skype--
"^(تثبيت)$",
"^(الغي التثبيت)$",
"^(pin)$",
"^(unpin)$",
--Team_Skype--
"^(فعل)$",
"^(add)$",
"^(عطل)$",
"^(rem)$",
--Team_Skype--
"^(ارفع المدير)$",
"^(setowner)$",
"^(ارفع المدير) (.*)$",
"^(setowner) (.*)$",
"^(نزل المدير)$",
"^(remowner)$",
"^(نزل المدير) (.*)$",
"^(remowner) (.*)$",
"^(ارفع ادمن)$",
"^(promote)$",
"^(ارفع ادمن) (.*)$",
"^(promote) (.*)$",
"^(نزل ادمن)$",
"^(demote)$",
"^(نزل ادمن) (.*)$",
"^(demote) (.*)$",
--Team_Skype--
"^(اقفل) (.*)$",
"^(lock) (.*)$",
"^(افتح) (.*)$",
"^(unlock) (.*)$",
--Team_Skype--
"^(معلومات المجموعة)$",
"^(grop info)$",
--Team_Skype--
"^(تغيير الرابط)$",
"^(newlink)$",
"^(ضع رابط)$",
"^(set link)$",
"^(الرابط)$",
"^(link)$",
"^([https?://w]*.?t.me/joinchat/%S+)$",
"^([https?://w]*.?telegram.me/joinchat/%S+)$",
--Team_Skype--
"^(ضع قوانين) (.*)$",
"^(set rules) (.*)$",
"^(القوانين)$",
"^(rules)$",
--Team_Skype--
"^(ضع تكرار) (%d+)$",
"^(set flood) (%d+)$",
--Team_Skype--
"^(امسح)$",
"^(امسح) (.*)$",
"^(del)$",
"^(del) (.*)$",
--Team_Skype--
"^(ضع اسم) (.*)$",
"^(set name) (.*)$",
"^(ضع وصف) (.*)$",
"^(set about) (.*)$",
"^(الوصف)$",
"^(about)$",
--Team_Skype--
"^(الاعدادات)$",
"^(settings)$",
"^(الوسائط)$",
"^(mutelist)$",
"^(الادمنية)$",
"^(modlist)$",
"^(المدراء)$",
"^(ownerlist)$",
"^(منع) (.*)$",
"^(block) (.*)$",
"^(الغي منع) (.*)$",
"^(unblock) (.*)$",
"^(قائمة المنع)$",
"^(block list)$",
--Team_Skype--
"^(لغة) (.*)$",
"^(language) (.*)$",
--Team_Skype--
"^(ضع ترحيب) (.*)",
"^(set wlc) (.*)",
"^(الترحيب)$",
"^(wlc)$"

},
run=Team_Skype,
pre_process = pre_process
}
--end groupmanager.lua #X7
-- By Dev Memo (@ii02ii)
-- By Dev Advisor (@dev_XxMTxX) {زخرفه}