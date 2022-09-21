
local gumCore = {}
TriggerEvent("getCore",function(core)
	gumCore = core
end)

Inventory = exports.gum_inventory:gum_inventoryApi()
gum = exports.gum_core:gumAPI()


local items = {
    [1] = Necklace,
    [2] = Bracelet,
    [3] = Ring,
    [4] = Teeth,
    [5] = Pocket_Watch_1,
    [6] = Pocket_Watch_2,
    [7] = Pocket_Watch_3,
    [8] = Pocket_Watch_4,
    [9] = ammorepeaternormal,
    [10] = ammoriflenormal,
    [11] = ammorevolvernormal,
}

local money = {
    [1] = 0.5,
    [2] = 1,
    [3] = 1.5,
}

local gold = {
    [1] = 1,
    [2] = 2,
    [3] = 3,
}

local weapons = {
    [1] = WEAPON_REVOLVER_CATTLEMAN,
    [2] = WEAPON_REPEATER_CARBINE,
    [3] = WEAPON_RIFLE_VARMINT,
}

RegisterServerEvent('gum_npcloot:give_reward')
AddEventHandler('gum_npcloot:give_reward', function()
    local _source = source
    local chance = math.random(1,100)
    local User = gumCore.getUser(tonumber(_source))
    local Character = gumCore.getUser(tonumber(_source)).getUsedCharacter
    if chance < 2 then
        local ammo = {["nothing"] = 0}
        local components =  {}
        local wep_type = math.random(1,#weapons)
        gumInv.createWeapon(tonumber(_source), weapons[wep_type], ammo, components)
        TriggerClientEvent("gum_notify:notify", _source, "Lup", "Našel jsi u něj "..weapons[wep_type], "lup", 2000)
    end
    if chance < 60 then
        local item_type = math.random(1,#money)
        Character.addCurrency(tonumber(_source), 0, money[item_type])
        TriggerClientEvent("gum_notify:notify", _source, "Lup", "Našel jsi u něj "..money[item_type].."$", "lup", 2000)
    end
    if chance < 30 then
        local item_type = math.random(1,#gold)
        Character.addCurrency(tonumber(_source), 1, gold[item_type])
        TriggerClientEvent("gum_notify:notify", _source, "Lup", "Našel jsi u něj "..gold[item_type].." zlatých nugget.", "lup", 2000)
    end
    if chance < 80 then
        local item_type = math.random(1,#items)
        gumInv.addItem(tonumber(_source), items[item_type], 1)
        TriggerClientEvent("gum_notify:notify", _source, "Lup", "Našel jsi u něj 1x"..items[item_type].."", "lup", 2000)
    end
end)

