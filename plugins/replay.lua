--[[

 _____   _       _   _     
|_   _| | |     | \ | |    
  | |   | |     |  \| |    
  | |   | |___  | |\  |    
  |_|   |_____| |_| \_|    


]]--

do
local function Team_Skype(msg, matches)
if matches[1]=="احبك" and is_sudo(msg) then
return  "ﯠآݩـ✥ـٍﻲ ﻫـݥ يأڸݦـ✥ـٍ؏ـذبــ๋͜ني😻❣"
elseif matches[1]=="احبك" and is_owner(msg) then
return "واﻧـ✥ـٍي ۿݥ احبـ✥ـٍك ݢـبـ✥ـٍد😽💘"
elseif matches[1]=="احبك" and is_mod(msg) then
return "وانـ✥ـٍي ۿـݦ حـ✥ـٍيآﺗــ๋͜ي😸💛"
elseif matches[1]=="احبك" then
return "اﯠڪ بـ✥ـٍحــ๋͜ي😼🖤"
elseif matches[1]=="هلو" then 
return  "هــ๋͜ݪآﯠآت يـ✥ـٍاپ😻🍃"
elseif matches[1]=="السلام عليكم" or matches[1]== "سلام عليكم" then
return  "ﯠݞـلـ✥ـٍيكــ๋͜م ݩـﯡرﻳــ๋͜ت😽👏"
elseif matches[1]=="الحمدلله" or matches[1]== "الحمد لله" then 
return  "ݟـسـ✥ـٍاڪ ﮔلـ✥ـٍﻴــ๋͜بي😸👊"
elseif matches[1]=="مرحبا" then 
return  "ݥـݛاحـ✥ـٍب ۿـݪأ ﯠﷲ🙀💙"
elseif matches[1]=="هاي" then 
return  "ۿـآيـ✥ـٍات بحــ๋͜ي😼👀"
elseif matches[1]=="شلونكم" then 
return  "ٻـﺨــ๋͜يـݛ وآݩـ✥ـٍݓ ڜلــ๋͜وݨك😽🙌"
elseif matches[1]=="بوت" then 
return  "آيي گــ๋͜وڸ/ي حـ✥ـٍبي راﻳـ✥ـٍد/ه ﺷـ✥ـٍيي😼👏"
elseif matches[1]=="هلاو" then  
return  "هــ๋͜ݪآﯠآت يـ✥ـٍاپ😻🍃"
elseif matches[1]=="ساقط" then
return "ۿـ✥ـٍا ۺـتݛﻳـد😼🤞"
elseif matches[1]=="شلونك" then 
return  "ﮊﻳـ✥ـٍݩ ﯠانـ✥ـٍته/ي😺✨"
elseif matches[1]=="جاو" then 
return  "ﷲ ﯠﻳـ✥ـٍاك/ج بحـ✥ـٍي😼🙌"
elseif matches[1]=="باي" then 
return  "ﺗـ✥ـٍريــ๋͜له ݑـݪآ ݛقـ✥ـٍم😽👐"
elseif matches[1]=="اكرهك" then 
return  "آﯠﮔ ﯠانـ✥ـٍي ۿـݥ😹🙌"
elseif matches[1]=="تكرهني" then 
return  "ݦــ๋͜آدݬي😹💔"
elseif matches[1]=="اعشقك" then 
return  "الـ✥ـٍظاۿر ݥـعــ๋͜وز/ة😹💔"
elseif matches[1]=="شخباركم" then 
return  "تـ✥ـٍماݥ ݥــ๋͜ـاۺي الحـ✥ـٍال وانتـ✥ـٍ/ي😼🙌"
elseif matches[1]=="اكلك" then
return "ۿـآ ڜـ✥ـٍكو ﮔوڷ🙀⚡️"
elseif matches[1]=="شوف" then
return "ۺـڜــ๋͜وف😼🤞؟"
elseif matches[1]=="ها" then
return "ﯠجعـ✥ـٍآ وﻃـآﮔر حـ✥ـٍا😹🙌"
elseif matches[1]=="تمام" then
return "ډﯠمـ✥ـٍك حُب ۶ـمـ✥ـٍري😽💞"
elseif matches[1]=="🙄" then
return "۶ـينڪ ﯠلـ✥ـٍك😼👊"
elseif matches[1]=="😒" then
return "ډﻳﻴﻴﻴﻴﻴـ✥ـٍﻲ😼🐎"
elseif matches[1] =="🚶🏻🍃" then
return "بـ✥ـٍا؏ الۿــ๋͜يبـﮩﮧ😽💗"

end
----------------------------------------
-- ملف shut خاص للمدراء والادمنيه والمطورين

if matches[1]=="انجب" and is_sudo(msg) then
return "ﺻـ✥ـٍاݛ اپــ๋͜وﻳـﮥ المـطــ๋͜ور😽❤️🍃"
elseif matches[1]=="انجب" and is_owner(msg) then
return "أﯠﮔ صـ✥ـٍار حبـ✥ـٍي😾☄z"
elseif matches[1]=="انجب" and is_mod(msg) then
return "ݛآح آحـتــ๋͜رمڪ ڷخاطـ✥ـٍر اݪݥديــ๋͜ر😼☝️"
elseif matches[1]=="انجب" then
return "ݪڪ ۿـ✥ـٍم ۶ـضــ๋͜و وۿـ✥ـٍم تڜـمــ๋͜ر😾🖕"

end

end

return {
  patterns = {
  "^(انجب)$",
  "^(احبك)$",
  "^(احبك)$",
  "^(احبك)$",
  "^(احبك)$",
"^(هلو)$",
"^(الحمدلله)$",
"^(الحمد لله)$",
"^(مرحبا)$",
"^(هاي)$",
"^(شلونكم)$",
"^(بوت)$",
"^(هلاو)$",
"^(صلو ع النبي)$",
"^(سلام)$",
"^(جاو)$",
"^(باي)$",
"^(اكرهك)$",
"^(تكرهني)$",
"^(اعشقك)$",
"^(شخباركم)$",
"^(تمام)$",
"^(سلام عليكم)$",
"^(السلام عليكم)$",
"^(ساقط)$",
"^(شلونك)$",
"^(ها)$",
"^(شوف)$",
"^(🙄)$",
"^(😒)$",
"^(انجب)$",

    },
  run = Team_Skype
}
end
