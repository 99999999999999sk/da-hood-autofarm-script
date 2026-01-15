-- from https://rscripts.net/script/da-hood-autofarm-oror-auto-break-atms-oror-auto-safetyrestart-Kjzc

_G.AutofarmSettings = {
    Fps = 60,
    AttackMode = 2, -- 1 = Click, 2 = Hold
    Webhook = '', --webhook for stat logging
    LogInterval = 15,
    CustomOffsets = { --atm offsets
        ['atm12'] = CFrame.new(-2, 0, 0),
        ['atm13'] = CFrame.new(2, 0, 0),
    },
    disableScreen = false --broken rn
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/frvaunted/Main/refs/heads/main/DaHoodAutofarm", true))() -- deobfuscated here -> #main.lua
