do

local function run(msg, matches)
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
return "سـ✥ـٍاقــ๋͜ط بـخـ✥ـٍدݦـ✥ـٍتك ﮔــ๋͜ول ݦــ๋͜ولاﯤ😼📿"
elseif matches[1]=="شلونك" then 
return  "ﮊﻳـ✥ـٍݩ ﯠانـ✥ـٍته/ي😺✨"
elseif matches[1]=="جاو" then 
return  "ﷲ ﯠﻳـ✥ـٍاك/ج بحـ✥ـٍي😼🙌"
elseif matches[1]=="باي" then 
return  "ﺗـ✥ـٍريــ๋͜له ݑـݪآ ݛقـ✥ـٍم😽👐"
elseif matches[1]=="اكرهك" then 
return  "آﯠﮔ ﯠانـ✥ـٍي ۿـݥ😹🙌"
elseif matches[1]=="تكرهني" then 
return  " طـبعاً مـا اكـرهك ¦ 😹✨'ء "
elseif matches[1]=="اعشقك" then 
return  " اؤوؤف شۿـال جفـاف ¦ 😹😻'ء "
elseif matches[1]=="شخباركم" then 
return  " انـي الحمـد ﻟﻟـﮧ'ه شـوف البقيـﮧ'ه┋💝'ء "
elseif matches[1]=="مطور" then 
return  " راسـل المطـور ¦ 😻☄️ء \n💡¦ المطـور : @JJ97JJ "
elseif matches[1]=="تمام" then 
return  " عســاها دو{مـو يـوم}وم┋💜'ء  "
else
return  "وآنـي ۿـم احبـك ياعيـن عيـني ¦ 😻🍃ء"
end

end

return {
  patterns = {
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
"^(مطور)$",
"^(تمام)$",
"(سلام عليكم)$",
"(السلام عليكم)$",
"(ساقط)$",
"(شلونك)$",
    },
  run = run
}
end
