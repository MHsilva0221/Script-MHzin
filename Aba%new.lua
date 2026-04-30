setDefaultTab("MH")
UI.Label("Script Basica MH"):setColor("red")
UI.Separator()
UI.Label("Curas"):setColor("yellow")
UI.Separator()
--
if storage.ShowIcons == nil then
  storage.ShowIcons = true
end

local function toggleIcons()
  for _, child in ipairs(modules.game_interface.getMapPanel():getChildren()) do
    if child:getStyleName() == "BotIcon" then
      if storage.ShowIcons then
        child:show()
      else
        child:hide()
      end
    end
  end
end

-- aplica ao iniciar
schedule(100, function()
  toggleIcons()
end)

-- botão
addButton("", "Mostrar/Ocultar Icons", function()
  storage.ShowIcons = not storage.ShowIcons
  toggleIcons()
end)

local hpCutoff = 90

-- KNIGHT
addIcon("Med Ico", {item={id=22889, count=1}, text="Med Ico"}, macro(200, function()
  if hppercent() <= hpCutoff then
    say("exura med ico")
    delay(200)
  end
end))

addIcon("Ico", {item={id=22889, count=1}, text="Ico"}, macro(200, function()
  if hppercent() <= hpCutoff then
    say("exura ico")
    delay(200)
  end
end))

-- MAGES
addIcon("Gran", {item={id=14760, count=1}, text="Gran"}, macro(200, function()
  if hppercent() <= hpCutoff then
    say("exura gran")
    delay(200)
  end
end))

addIcon("Vita", {item={id=14760, count=1}, text="Vita"}, macro(200, function()
  if hppercent() <= hpCutoff then
    say("exura vita")
    delay(200)
  end
end))

addIcon("Max Vita", {item={id=14760, count=1}, text="Max Vita"}, macro(200, function()
  if hppercent() <= hpCutoff then
    say("exura max vita")
    delay(200)
  end
end))

-- PALADIN
addIcon("San", {item={id=36994, count=1}, text="San"}, macro(200, function()
  if hppercent() <= hpCutoff then
    say("exura san")
    delay(200)
  end
end))

addIcon("Gran San", {item={id=36994, count=1}, text="Gran San"}, macro(200, function()
  if hppercent() <= hpCutoff then
    say("exura gran san")
    delay(200)
  end
end))

-- DRUID
addIcon("Gran Tio", {item={id=3418, count=1}, text="Gran Tio"}, macro(200, function()
  if hppercent() <= hpCutoff then
    say("exura gran tio")
    delay(200)
  end
end))

local sioHP = 70

addIcon("Sio VIP", {item={id=3160, count=1}, text="Sio"}, macro(200, function()
  for id, data in pairs(g_game.getVips()) do
    local name = data[1]
    local friend = getCreatureByName(name)

    if friend then
      local pos = friend:getPosition()
      local tile = g_map.getTile(pos)

      if tile and tile:canShoot() and friend:getHealthPercent() <= sioHP then
        say('exura sio "' .. name)
        delay(1000)
        return
      end
    end
  end
end))

addIcon("Sio Monk", {item={id=3160, count=1}, text="Tio"}, macro(200, function()
  for id, data in pairs(g_game.getVips()) do
    local name = data[1]
    local friend = getCreatureByName(name)

    if friend then
      local pos = friend:getPosition()
      local tile = g_map.getTile(pos)

      if tile and tile:canShoot() and friend:getHealthPercent() <= 70 then
        say('exura tio sio "' .. name)
        delay(1000)
        return
      end
    end
  end
end))

local hpCutoff = 60
local manaCutoff = 75

-- MANA
addIcon("Mana Pot", {item={id=268, count=1}, text="MP"}, macro(200, function()
  if manapercent() <= manaCutoff then
    useWith(268, player)
    delay(200)
  end
end))

addIcon("Strong Mana", {item={id=237, count=1}, text="SMP"}, macro(200, function()
  if manapercent() <= manaCutoff then
    useWith(237, player)
    delay(200)
  end
end))

addIcon("Great Mana", {item={id=238, count=1}, text="GMP"}, macro(200, function()
  if manapercent() <= manaCutoff then
    useWith(238, player)
    delay(200)
  end
end))

addIcon("Ult Mana", {item={id=23373, count=1}, text="UMP"}, macro(200, function()
  if manapercent() <= manaCutoff then
    useWith(23373, player)
    delay(200)
  end
end))

-- HEALTH
addIcon("Great Health", {item={id=239, count=1}, text="GHP"}, macro(200, function()
  if hppercent() <= hpCutoff then
    useWith(239, player)
    delay(200)
  end
end))

addIcon("Ult Health", {item={id=7643, count=1}, text="UHP"}, macro(200, function()
  if hppercent() <= hpCutoff then
    useWith(7643, player)
    delay(200)
  end
end))

-- SPIRIT
addIcon("Great Spirit", {item={id=7642, count=1}, text="GSP"}, macro(200, function()
  if hppercent() <= hpCutoff then
    useWith(7642, player)
    delay(200)
  end
end))

addIcon("Ult Spirit", {item={id=23374, count=1}, text="USP"}, macro(200, function()
  if hppercent() <= hpCutoff then
    useWith(23374, player)
    delay(200)
  end
end))
--
UI.Separator()

UI.Label("Target"):setColor("yellow")
UI.Separator()

-- SD (Target)
addIcon("SDicon", {item={id=3155, count=1}, text="SDMAX"}, macro(200, function(m)
  if g_game.isAttacking() then
    useWith(3155, g_game.getAttackingCreature())
    delay(200)
  end
end))

-- Exori (Colado + Safe Player)
addIcon("ExoriIcon", {item={id=7389, count=1}, text="Exori"}, macro(200, function(m)
  for _, spec in ipairs(getSpectators(false)) do
    if spec:isPlayer() and spec ~= player then return end
  end
  if g_game.isAttacking() and getDistanceBetween(g_game.getAttackingCreature():getPosition(), pos()) == 1 then
    say("exori")
    delay(200)
  end
end))

-- Exori Gran (Colado + Safe Player)
addIcon("ExoriGranIcon", {item={id=7434, count=1}, text="Exori Gran"}, macro(200, function(m)
  for _, spec in ipairs(getSpectators(false)) do
    if spec:isPlayer() and spec ~= player then return end
  end
  if g_game.isAttacking() and getDistanceBetween(g_game.getAttackingCreature():getPosition(), pos()) == 1 then
    say("exori gran")
    delay(400)
  end
end))

-- Exori Hur (Distância + Safe Player)
addIcon("ExoriHurIcon", {item={id=7389, count=1}, text="Exori Hur"}, macro(200, function(m)
  for _, spec in ipairs(getSpectators(false)) do
    if spec:isPlayer() and spec ~= player then return end
  end
  if g_game.isAttacking() then
    say("exori hur")
    delay(500)
  end
end))

-- Exori Ico (Colado + Safe Player)
addIcon("ExoriIcoIcon", {item={id=7434, count=1}, text="Exori Ico"}, macro(200, function(m)
  for _, spec in ipairs(getSpectators(false)) do
    if spec:isPlayer() and spec ~= player then return end
  end
  local target = g_game.getAttackingCreature()
  if target and getDistanceBetween(target:getPosition(), pos()) <= 1 then
    say("exori ico")
    delay(500)
  end
end))

-- Exori Con (Distância)
addIcon("ExoriConIcon", {item={id=5907, count=1}, text="Con"}, macro(200, function(m)
  if g_game.isAttacking() then
    say("exori con")
    delay(200)
  end
end))

-- Exori Gran Con (Distância)
addIcon("ExoriGranConIcon", {item={id=5907, count=1}, text="Gran Con"}, macro(200, function(m)
  if g_game.isAttacking() then
    say("exori gran con")
    delay(400)
  end
end))

-- Exevo Mas San (Área + Safe Player)
addIcon("MasSanIcon", {item={id=3241, count=1}, text="Mas San"}, macro(200, function(m)
  for _, spec in ipairs(getSpectators(false)) do
    if spec:isPlayer() and spec ~= player then return end
  end
  if g_game.isAttacking() then
    say("exevo mas san")
    delay(500)
  end
end))



function comma_value(amount)
  local formatted = amount
  while true do  
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
    if (k==0) then
      break
    end
  end
  return formatted
end

addIcon("Avaicon", {item={id=3161, count=1}, text="AVA"}, macro(200, function(m)
  for _, spec in ipairs(getSpectators(false)) do
    if spec:isPlayer() and spec ~= player then return end
  end

  if g_game.isAttacking() then
    usewith(3161, g_game.getAttackingCreature())
    delay(200)
  end
end))
--
addIcon("Thundericon", {item={id=3202, count=1}, text="THU"}, macro(200, function(m)
  for _, spec in ipairs(getSpectators(false)) do
    if spec:isPlayer() and spec ~= player then return end
  end

  if g_game.isAttacking() then
    usewith(3202, g_game.getAttackingCreature())
    delay(200)
  end
end))
--
addIcon("Stoneicon", {item={id=3175, count=1}, text="STO"}, macro(200, function(m)
  for _, spec in ipairs(getSpectators(false)) do
    if spec:isPlayer() and spec ~= player then return end
  end

  if g_game.isAttacking() then
    usewith(3175, g_game.getAttackingCreature())
    delay(200)
  end
end))
--
addIcon("Bombicon", {item={id=3191, count=1}, text="BOMB"}, macro(200, function(m)
  for _, spec in ipairs(getSpectators(false)) do
    if spec:isPlayer() and spec ~= player then return end
  end

  if g_game.isAttacking() then
    usewith(3191, g_game.getAttackingCreature())
    delay(200)
  end
end))
--
local i_exp = nil
i_exp = addIcon("expIcon", {item={id=112, count=1}, text="Enable For Exp/h"}, macro(100, function(m)
  if player.expSpeed then
    local expHour = comma_value(math.floor(player.expSpeed * 3600))
    i_exp.text:setText(expHour.." exp/h")
  else
    i_exp.text:setText("Waiting Exp...")
  end
end))

i_exp:setWidth(150)

local BlessConfig = {
    buyAtLogin = true,
    buyCommand = "!bless"
}

BlessConfig.hasBought = false
addIcon("BlessIcon", {item={id=23678, count=1}, text="Bless"}, macro(1000, function(m)
    if BlessConfig.buyAtLogin and not BlessConfig.hasBought then
        say(BlessConfig.buyCommand)
        BlessConfig.hasBought = true
    end
    if g_game.getClientVersion() > 1000 and player:getBlessings() == 0 then
        say(BlessConfig.buyCommand)
    end
end))

local config = {
    AOLId = 3057
}

addIcon("AolIcon", {item={id=config.AOLId, count=1}, text="Aol"}, macro(200, function(m)
    local hasAol = getNeck() and getNeck():getId() == config.AOLId
    if hasAol then return end

    local aol = findItem(config.AOLId)
    if aol then
        moveToSlot(aol, SlotNeck, 1)
    else
        say("!aol")
        delay(1000)
    end
end))

macro(200, "Exeta Res", function()
    if g_game.isAttacking() and 
    distanceFromPlayer(g_game.getAttackingCreature():getPosition()) <= 1 and 
    manapercent() > 30 then
        say("Exeta Res")
        delay(5000)
    end
end)
--
-- Função para calcular a distância entre o jogador e a posição de um inimigo
function distanceFromPlayer(position)
    local playerPos = pos() -- posição do jogador
    local targetPos = position
    return math.sqrt((playerPos.x - targetPos.x)^2 + (playerPos.y - targetPos.y)^2)
end

macro(200, "Exeta amp res", function()
    if g_game.isAttacking() and 
       distanceFromPlayer(g_game.getAttackingCreature():getPosition()) > 1 and 
       manapercent() > 30 then
        say("Exeta Amp Res")
        -- delay(5000) -- removido para evitar erro
    end
end)
--
macro(200, "Face Target", function()
    local target = g_game.getAttackingCreature()
    if not target then return end
    local xDiff = target:getPosition().x > posx()
    local yDiff = target:getPosition().y > posy()
    local isXBigger = math.abs(target:getPosition().x - posx()) > math.abs(target:getPosition().y - posy())

    local dir = player:getDirection()
    if xDiff and isXBigger then  
        if dir ~= 1 then turn(1) end
        return
    elseif not xDiff and isXBigger then 
        if dir ~= 3 then turn(3) end
        return
    elseif yDiff and not isXBigger then  
        if dir ~= 2 then turn(2) end
        return
    elseif not yDiff and not isXBigger  then 
        if dir ~= 0 then turn(0) end
        return
    end
end)

--
local exetaLootDelay = 1000

local m_main = macro(10000, "Exeta Loot", function(m)
  
end)

local nextExeta = 0
onCreatureDisappear(function(creature)
  if m_main.isOff() then return end
  if nextExeta > now  then return end
  if isInPz() then return end
  if not creature:isMonster() then return end

  local pos = player:getPosition()
  local mpos = creature:getPosition()
  local name = creature:getName()

  if pos.z ~= mpos.z or getDistanceBetween(pos, mpos) > 1 then return end

  schedule(100, function()
    local tile = g_map.getTile(mpos)
    if not tile then return end

    local container = tile:getTopUseThing()
    if not container or not container:isContainer() then return end

    nextExeta = now + exetaLootDelay
    say("exeta loot")
  end)
end)

UI.Label("Tools"):setColor("yellow")
UI.Separator()
UI.Label("Mages"):setColor("green")

local panelName = "mainRingPanel"

if not storage[panelName] then
  storage[panelName] = {
    main = 25698
  }
end

-- ==============================
-- UI (SOMENTE MAIN)
-- ==============================

local ui = setupUI([[
Panel
  height: 35
  margin-top: 2

  BotItem
    id: mainSlot
    anchors.left: parent.left
    anchors.top: parent.top

  BotLabel
    anchors.left: mainSlot.right
    anchors.top: mainSlot.top
    margin-left: 5
    text: "Principal Ring"
]])
ui:setId(panelName)

-- load
ui.mainSlot:setItemId(storage[panelName].main)

-- save
ui.mainSlot.onItemChange = function(widget)
  local item = widget:getItem()
  if item then
    storage[panelName].main = item:getId()
    saveStorage()
  end
end

-- ==============================
-- CONFIG (igual sua)
-- ==============================

local _HP_Percent_Main_Ring___00_ = 60
local _HP_Percent_Might_Ring__00_ = 60

local _MP_Percent_Energy_Ring_00_ = 50
local _MP_Percent_Might_Ring__00_ = 50
 
local _HP_Percent_Energy_Ring_00_ = 40
local _HP_Percent_EMight_Ring_00_ = 40

local _MP_Percent_Main_Ring___00_ = 30

-- ==============================
-- MACRO
-- ==============================

macro(100, "Triple Ring", function()

    local mainId = storage[panelName].main

    -- ENERGY (fixo)
    if (hppercent() <= _HP_Percent_Energy_Ring_00_ and manapercent() >= _MP_Percent_Energy_Ring_00_) then
        local ring = findItem(3051)
        if ring then
            g_game.move(ring, {x=65535, y=SlotFinger, z=0}, 1)
        end

    -- MIGHT LOW
    elseif (hppercent() <= _HP_Percent_EMight_Ring_00_ and manapercent() <= _MP_Percent_Might_Ring__00_) then
        local ring = findItem(3048)
        if ring then
            g_game.move(ring, {x=65535, y=SlotFinger, z=0}, 1)
        end

    -- MIGHT HP
    elseif (hppercent() <= _HP_Percent_Might_Ring__00_) then
        local ring = findItem(3048)
        if ring then
            g_game.move(ring, {x=65535, y=SlotFinger, z=0}, 1)
        end  

    -- MIGHT MP
    elseif (hppercent() >= _HP_Percent_Might_Ring__00_ and manapercent() <= _MP_Percent_Main_Ring___00_) then
        local ring = findItem(3048)
        if ring then
            g_game.move(ring, {x=65535, y=SlotFinger, z=0}, 1)
        end

    -- MAIN (slot)
    elseif (hppercent() >= _HP_Percent_Main_Ring___00_ and manapercent() >= _MP_Percent_Main_Ring___00_) then
        local ring = findItem(mainId)
        if ring then
            g_game.move(ring, {x=65535, y=SlotFinger, z=0}, 1)
        end
    end

end)

UI.Separator()
UI.Label("Knight"):setColor("green")
local panelName = "ekRingPanel"

if not storage[panelName] then
  storage[panelName] = {
    main = 25698
  }
end

-- ==============================
-- UI (MAIN SLOT)
-- ==============================

local ui = setupUI([[
Panel
  height: 35
  margin-top: 2

  BotItem
    id: mainSlot
    anchors.left: parent.left
    anchors.top: parent.top

  BotLabel
    anchors.left: mainSlot.right
    anchors.top: mainSlot.top
    margin-left: 5
    text: "Pricipal Ring"
]])
ui:setId(panelName)

ui.mainSlot:setItemId(storage[panelName].main)

ui.mainSlot.onItemChange = function(widget)
  local item = widget:getItem()
  if item then
    storage[panelName].main = item:getId()
    saveStorage()
  end
end

-- ==============================
-- CONFIG
-- ==============================

local HP_MIGHT_ON  = 60  -- entra might
local HP_MAIN_ON   = 70  -- volta main

local MIGHT_ID = 3048

-- ==============================
-- MACRO
-- ==============================

macro(100, "EK Rings", function()

  local hp = hppercent()
  local current = getFinger()
  local mainId = storage[panelName].main

  -- se não tem ring equipado ainda
  if not current then return end

  local currentId = current:getId()

  -- ??? ENTRA MIGHT
  if hp <= HP_MIGHT_ON and currentId ~= MIGHT_ID then
    local ring = findItem(MIGHT_ID)
    if ring then
      g_game.move(ring, {x=65535, y=SlotFinger, z=0}, 1)
    end
    return
  end

  -- ?? VOLTA MAIN
  if hp >= HP_MAIN_ON and currentId ~= mainId then
    local ring = findItem(mainId)
    if ring then
      g_game.move(ring, {x=65535, y=SlotFinger, z=0}, 1)
    end
    return
  end

end)

UI.Separator()
local panelName = "ekAmuletPanel"

if not storage[panelName] then
  storage[panelName] = {
    main = 3081 -- exemplo: foxtail / garlic / etc
  }
end

-- ==============================
-- UI (MAIN AMULET SLOT)
-- ==============================

local ui = setupUI([[
Panel
  height: 35
  margin-top: 2

  BotItem
    id: mainSlot
    anchors.left: parent.left
    anchors.top: parent.top

  BotLabel
    anchors.left: mainSlot.right
    anchors.top: mainSlot.top
    margin-left: 5
    text: "Amuleto Principal"
]])
ui:setId(panelName)

ui.mainSlot:setItemId(storage[panelName].main)

ui.mainSlot.onItemChange = function(widget)
  local item = widget:getItem()
  if item then
    storage[panelName].main = item:getId()
    saveStorage()
  end
end

-- ==============================
-- CONFIG
-- ==============================

local HP_SSA_ON  = 60  -- entra SSA
local HP_MAIN_ON = 75  -- volta main

local SSA_ID = 3081 -- ?? MUDA se necessário (SSA correto do seu server)

-- ==============================
-- MACRO
-- ==============================

macro(100, "EK Amulet", function()

  local hp = hppercent()
  local current = getNeck() -- slot amulet
  local mainId = storage[panelName].main

  if not current then return end

  local currentId = current:getId()

  -- ??? ENTRA SSA
  if hp <= HP_SSA_ON and currentId ~= SSA_ID then
    local amulet = findItem(SSA_ID)
    if amulet then
      g_game.move(amulet, {x=65535, y=SlotNeck, z=0}, 1)
    end
    return
  end

  -- ?? VOLTA MAIN
  if hp >= HP_MAIN_ON and currentId ~= mainId then
    local amulet = findItem(mainId)
    if amulet then
      g_game.move(amulet, {x=65535, y=SlotNeck, z=0}, 1)
    end
    return
  end

end)

UI.Separator()


UI.Label("NAV"):setColor("yellow")
UI.Separator()


-- =========================================
-- AUTO FOLLOW STACK (MESMO TILE)
-- =========================================

UI.Separator()
UI.Label("Auto Follow (Stack)")

storage.followLeader = storage.followLeader or "NomeDoChar"

FollowMacro = macro(200, "Follow Stack", function()
  local leader = getCreatureByName(storage.followLeader)
  if not leader then return end

  local lPos = leader:getPosition()
  if not lPos then return end

  -- se não estiver exatamente na mesma posição, anda para o tile dele
  if getDistanceBetween(pos(), lPos) > 0 then
    autoWalk(lPos)
  end
end)

addTextEdit("playerToFollow", storage.followLeader, function(widget, text)
  storage.followLeader = text
end)

-- salva última posição do leader (para escadas / teleport)
lastLeaderPos = lastLeaderPos or nil

onCreaturePositionChange(function(creature, newPos, oldPos)
  if FollowMacro:isOff() then return end
  if creature:getName() ~= storage.followLeader then return end

  -- leader desapareceu (subiu escada / teleporte)
  if not newPos and oldPos then
    lastLeaderPos = oldPos
    schedule(150, function()
      autoWalk(oldPos)
    end)
    return
  end

  if newPos then
    lastLeaderPos = newPos
  end
end)

if not storage.ComboUni then
    storage.ComboUni = {}
end

local settings = storage.ComboUni

--[Config]
settings.SDId = 3155
settings.SDEffectID = 32
local attackTarget = true

addSeparator()
local title = addLabel("title", "Combo Universal")
title:setColor("green")
addSeparator()

-- Macros
local comboSD = macro(200, "[SD] Usar SD", function() end)
local comboSpell = macro(200, "[SD] Usar Spell", function() end)
local comboSpellL = macro(200, "Combar UE", function() end)

addSeparator()

-- Labels com Tooltips
local lblLeader = addLabel("LabelLeader", "Leader Name")
lblLeader:setTooltip("Nome exato do jogador que voce quer seguir para o combo.")
addTextEdit("TxtEditLeader", settings.LeaderName or "nome do lider", function(widget, text)
    settings.LeaderName = text
end)

local lblLSpell = addLabel("LabelLeaderSpell", "Leader Spell (Para UE)")
lblLSpell:setTooltip("A magia que o Lider usa para te dar o sinal de soltar a sua UE.")
addTextEdit("TxtEditSpellLeader", settings.LeaderSpell or "Exevo Gran Mas Frigo", function(widget, text)
    settings.LeaderSpell = text
end)

local lblMySpell = addLabel("LabelSpell", "Sua Magia de Combo")
lblMySpell:setTooltip("A magia que voce vai usar junto com o tiro de SD do Lider.")
addTextEdit("TxtEditSpell", settings.Spell or "Exori Gran Con", function(widget, text)
    settings.Spell = text
end)

local lblMyUE = addLabel("LabelUE", "Sua UE")
lblMyUE:setTooltip("Sua magia de area principal para o combo sincronizado.")
addTextEdit("TxtEditUE", settings.UE or "Exevo Mas San", function(widget, text)
    settings.UE = text
end)

onMissle(function(missle)
    if not (comboSD.isOn() or comboSpell.isOn()) then return end
    local src = missle:getSource()
    if src.z ~= posz() then return end

    local from = g_map.getTile(src)
    local to = g_map.getTile(missle:getDestination())
    if not from or not to then return end

    local fromCreatures = from:getCreatures()
    local toCreatures = to:getCreatures()
    if #fromCreatures ~= 1 or #toCreatures ~= 1 then return end

    local c1 = fromCreatures[1]
    local t1 = toCreatures[1]

    if c1:getName():lower() == settings.LeaderName:lower() and missle:getId() == settings.SDEffectID then
        if attackTarget then
            local target = g_game.getAttackingCreature()
            if not target or target ~= t1 then
                g_game.attack(t1)
            end
        end
        if comboSD.isOn() then
            local SDRune = findItem(settings.SDId)
            if SDRune then 
                g_game.useWith(SDRune, t1)
            end
        end
        if comboSpell.isOn() then
            say(settings.Spell)
        end
    end
end)

onTalk(function(name, level, mode, text, channelId, pos) 
    if comboSpellL.isOn() and settings.LeaderName and name:lower() == settings.LeaderName:lower() and text:lower() == settings.LeaderSpell:lower() then
        say(settings.UE)
    end
end)

addLabel("info", "-- COMBO STATUS --"):setColor("green")

