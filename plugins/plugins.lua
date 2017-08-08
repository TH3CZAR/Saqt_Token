do

-- Returns the key (index) in the config.enabled_plugins table
local function plugin_enabled( name )
  for k,v in pairs(_config.enabled_plugins) do
    if name == v then
      return k
    end
  end
  -- If not found
  return false
end

-- Returns true if file exists in plugins folder
local function plugin_exists( name )
  for k,v in pairs(plugins_names()) do
    if name..'.lua' == v then
      return true
    end
  end
  return false
end

local function list_all_plugins(only_enabled)
  local tmp = check_markdown('\n\n@Ch_Dev & @Team_Skype')
  local text = ''
  local nsum = 0
  for k, v in pairs( plugins_names( )) do
    --   ✅ enabled, 🚫❌ disabled
    local status = '*[*🚫❌*]*'
    nsum = nsum+1
    nact = 0
    -- Check if is enabled
    for k2, v2 in pairs(_config.enabled_plugins) do
      if v == v2..'.lua' then 
        status = '*[*✅*]*' 
      end
      nact = nact+1
    end
    if not only_enabled or status == '*[*✅*]>>*' then
      -- get the name
      v = string.match (v, "(.*)%.lua")
      text = text..nsum..'. '..v..'  '..status..'\n'
    end
  end
  local text = text..'\n`آلـ๋͜مـلـ✥ـٍفــ๋͜آتـﮧ آلـ๋͜مـ✥ـٍثـبـ๋͜تـة 😺⚒`    *[_ '..nsum..' _]*\n*آلـ๋͜مـلـ✥ـٍفــ๋͜آتـﮧ*  _آلـ๋͜مـ✥ـٍفـعـ๋͜لـة 😽✅_ `[_ '..nact..' _]`\n*آلـ๋͜مـلـ✥ـٍفــ๋͜آتـﮧ*  _آلـ๋͜غـ✥ـٍيـ๋͜ر_ *آلـ๋͜مـ✥ـٍفـعـ๋͜لـة 😼❌* `[_ '..nsum-nact..' _]`'
  return text
end


local function list_plugins(only_enabled)
  local text = ''
  local nsum = 0
  for k, v in pairs( plugins_names( )) do
    --  ✅ enabled,🚫 ❌ disabled
    local status = '*[*❌*]>>*'
    nsum = nsum+1
    nact = 0
    -- Check if is enabled
    for k2, v2 in pairs(_config.enabled_plugins) do
      if v == v2..'.lua' then 
        status = '*[*✅*]>>*' 
      end
      nact = nact+1
    end
    if not only_enabled or status == '*[✅]>>*'then
      -- get the name
      v = string.match (v, "(.*)%.lua")
      text = text..v..'  '..status..'\n'
    end
  end
  local text = text..'\n`ٺـ๋͜ـٍم تـ✥ـٍنـفـ๋͜يـذ آلامـ๋͜ر 📁` \n*آلـ๋͜مـلـ✥ـٍفــ๋͜آتـﮧ* _آلـ๋͜مـ✥ـٍفـعـ๋͜لـة 😺🥁_ *[* '..nact..' *]* \n`مـݨ آصـ๋͜ل 😽⛹🏻` *[* '..nsum..' *]*'
  return text  
  end

local function reload_plugins( )
  plugins = {}
  load_plugins()
  return list_plugins(true)
end


local function enable_plugin( plugin_name )
  print('checking if '..check_markdown(plugin_name)..' exists')
  -- Check if plugin is enabled
  if plugin_enabled(plugin_name) then
    return '*آلـ๋͜مـلـ✥ـٍف 📁*`[_ '..check_markdown(plugin_name)..' _]` *مـ✥ـٍفـعـ๋͜ل 😾☑️*'
  end
  -- Checks if plugin exists
  if plugin_exists(plugin_name) then
    -- Add to the config table
    table.insert(_config.enabled_plugins, plugin_name)
    print(plugin_name..' added to _config table')
    save_config()
    -- Reload the plugins
    return reload_plugins( )
  else
    return '`[_'..plugin_name..'_]`  ݪأ يـ๋͜وجـ๋͜د مـلـ๋͜✥ـٍف 📁 بـ๋͜هـ๋͜ذا اݪأسـ๋͜م 😼🍷'
  end
end

local function disable_plugin( name, chat )
  -- Check if plugins exists
  if not plugin_exists(name) then
  return '`[_'..check_markdown(name)..'_]` _ ݪأ يـ๋͜وجـ๋͜د مـلـ๋͜✥ـٍف_ *📁 بـ๋͜هـ๋͜ذا اݪأسـ๋͜م 😼🍷*'
  end
  local k = plugin_enabled(name)
  -- Check if plugin is enabled
  if not k then

    return '*آلـ๋͜مـلـ✥ـٍف *📁`[_'..check_markdown(name)..'_]` _غـ๋͜يـﮧر_ *مـ✥ـٍفـعـ๋͜ل  😿✖️*'
  end
  -- Disable and reload
  table.remove(_config.enabled_plugins, k)
  save_config( )
  return reload_plugins(true)    
end
local function disable_plugin_on_chat(receiver, plugin)
  if not plugin_exists(plugin) then
    return "*ݪأ تـ๋͜وجـ๋͜د م ـ๋͜لـ✥ـٍفــ๋͜آتـﮧ 🎻😼*"
  end

  if not _config.disabled_plugin_on_chat then
    _config.disabled_plugin_on_chat = {}
  end

  if not _config.disabled_plugin_on_chat[receiver] then
    _config.disabled_plugin_on_chat[receiver] = {}
  end

  _config.disabled_plugin_on_chat[receiver][plugin] = true

  save_config()
  return 'Plugin '..plugin..' disabled on this chat'
end

local function reenable_plugin_on_chat(receiver, plugin)
  if not _config.disabled_plugin_on_chat then
    return 'There aren\'t any disabled plugins'
  end

  if not _config.disabled_plugin_on_chat[receiver] then
    return 'There aren\'t any disabled plugins for this chat'
  end

  if not _config.disabled_plugin_on_chat[receiver][plugin] then
    return 'This plugin is not disabled'
  end

  _config.disabled_plugin_on_chat[receiver][plugin] = false
  save_config()
  return 'Plugin '..plugin..' is enabled again'
end

local function ii02ii(msg, matches)
  -- Show the available plugins 
    if matches[1] == 'الملفات' or matches[1] == 'plugins' and is_sudo(msg) then
    return list_all_plugins()
  end

  -- Re-enable a plugin for this chat
  if matches[1] == 'تفعيل ملف' or matches[1] == 'add' and matches[3] == 'chat' then
    local receiver = get_receiver(msg)
    local plugin = matches[2]
    print("enable "..plugin..' on this chat')
    return reenable_plugin_on_chat(receiver, plugin)
  end

  -- Enable a plugin
  if matches[1] == 'تفعيل ملف' or matches[1] == 'add' and is_sudo(msg) then
 -- if matches[1] == 'تفعيل ملف' and is_sudo(msg) then --after changed to moderator mode, set only sudo
    local plugin_name = matches[2]
    print("enable: "..matches[2])
    return enable_plugin(plugin_name)
  end

  -- Disable a plugin on a chat
  if matches[1] == 'تعطيل ملف' or matches[1] == 'rem' and matches[3] == 'chat' then
    local plugin = matches[2]
    local receiver = get_receiver(msg)
    print("disable "..plugin..' on this chat')
    return disable_plugin_on_chat(receiver, plugin)
  end

  -- Disable a plugin
  if matches[1] == 'تعطيل ملف' or matches[1] == 'rem' and is_sudo(msg) then
  --if matches[1] == 'تعطيل ملف' and is_sudo(msg) then --after changed to moderator mode, set only sudo
    if matches[2] == 'plugins' then
     return 'This plugin can\'t be disabled'
    end
    print("disable: "..matches[2])
    return disable_plugin(matches[2])
  end

  -- Reload all the plugins!
  if matches[1] == 'الملفات المفعلة' or matches[1] == 'plugins add' and is_sudo(msg) then
    return reload_plugins(true)
  end
end
return {
  description = "Plugin to manage other plugins. Enable, disable or reload.", 
  usage = {
      moderator = {
          "!plugins disable [plugin] chat : disable plugin only this chat.",
          "!plugins enable [plugin] chat : enable plugin only this chat.",
          },
      sudo = {
          "!plugins : list all plugins.",
          "!plugins enable [plugin] : enable plugin.",
          "!plugins disable [plugin] : disable plugin.",
          "!plugins reload : reloads all plugins." },
          },
  patterns = {
    "^الملفات$",
    "^plugins$",
    "^(تفعيل ملف) ([%w_%.%-]+)$",
    "^(add) ([%w_%.%-]+)$",
    "^(تعطيل ملف) ([%w_%.%-]+)$",
    "^(rem) ([%w_%.%-]+)$",
    "^(تفعيل ملف) ([%w_%.%-]+) (chat)",
    "^(add) ([%w_%.%-]+) (chat)",
    "^(تعطيل ملف) ([%w_%.%-]+) (chat)",
    "^(rem) ([%w_%.%-]+) (chat)",
    "^(الملفات المفعله)$",
    "^(plugins add)$",
  },
  
  run = ii02ii,
  moderated = true, -- set to moderator mode
  --privileged = true
}

end
-- By Dev Memo (@ii02ii)
-- By Dev Advisor (@dev_XxMTxX) {زخرفه}