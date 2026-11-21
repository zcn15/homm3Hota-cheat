-- HotA Trainer UI prototype
-- Uses symbols exported by the user's existing Cheat Engine table.
-- Load the CT, enable its main AOB script, then execute this file in CE's Lua engine.

if HotATrainerForm and HotATrainerForm.destroy then
  pcall(function() HotATrainerForm:destroy() end)
end

local artifactOptions = {
  {1, "Spell Scroll↓↓↓"},
  {7, "Centaur's Axe"},
  {8, "Blackshard of the Dead Knight"},
  {9, "Greater Gnoll's Flail"},
  {10, "Ogre's Club of Havoc"},
  {11, "Sword of Hellfire"},
  {12, "Titan's Gladius"},
  {13, "Shield of the Dwarven Lords"},
  {14, "Shield of the Yawning Dead"},
  {15, "Buckler of the Gnoll King"},
  {16, "Targ of the Rampaging Ogre"},
  {17, "Shield of the Damned"},
  {18, "Sentinel's Shield"},
  {19, "Helm of the Alabaster Unicorn"},
  {20, "Skull Helmet"},
  {21, "Helm of Chaos"},
  {22, "Crown of the Supreme Magi"},
  {23, "Hellstorm Helmet"},
  {24, "Thunder Helmet"},
  {25, "Breastplate of Petrified Wood"},
  {26, "Rib Cage"},
  {27, "Scales of the Greater Basilisk"},
  {28, "Tunic of the Cyclops King"},
  {29, "Breastplate of Brimstone"},
  {30, "Titan's Cuirass"},
  {31, "Armor of Wonder"},
  {32, "Sandals of the Saint"},
  {33, "Celestial Necklace of Bliss"},
  {34, "Lion's Shield of Courage"},
  {35, "Sword of Judgement"},
  {36, "Helm of Heavenly Enlightenment"},
  {37, "Quiet Eye of the Dragon"},
  {38, "Red Dragon Flame Tongue"},
  {39, "Dragon Scale Shield"},
  {40, "Dragon Scale Armor"},
  {41, "Dragonbone Greaves"},
  {42, "Dragon Wing Tabard"},
  {43, "Necklace of Dragonteeth"},
  {44, "Crown of Dragontooth"},
  {45, "Still Eye of the Dragon"},
  {46, "Clover of Fortune"},
  {47, "Cards of Prophecy"},
  {48, "Ladybird of Luck"},
  {49, "Badge of Courage"},
  {50, "Crest of Valor"},
  {51, "Glyph of Gallantry"},
  {52, "Speculum"},
  {53, "Spyglass"},
  {54, "Amulet of the Undertaker"},
  {55, "Vampire's Cowl"},
  {56, "Dead Man's Boots"},
  {57, "Garniture of Interference"},
  {58, "Surcoat of Counterpoise"},
  {59, "Boots of Polarity"},
  {60, "Bow of Elven Cherrywood"},
  {61, "Bowstring of the Unicorn's Mane"},
  {62, "Angel Feather Arrows"},
  {63, "Bird of Perception"},
  {64, "Stoic Watchman"},
  {65, "Emblem of Cognizance"},
  {66, "Stateman's Medal"},
  {67, "Diplomat's Ring"},
  {68, "Ambassador's Sash"},
  {69, "Ring of the Wayfarer"},
  {70, "Equestrian's Gloves"},
  {71, "Necklace of Ocean Guidance"},
  {72, "Angel Wings"},
  {73, "Charm of Mana"},
  {74, "Talisman of Mana"},
  {75, "Mystic Orb of Mana"},
  {76, "Collar of Conjuring"},
  {77, "Ring of Conjuring"},
  {78, "Cape of Conjuring"},
  {79, "Orb of Firmament"},
  {80, "Orb of Silt"},
  {81, "Orb of Tempestuous Fire"},
  {82, "Orb of Driving Rain"},
  {83, "Recanter's Cloak"},
  {84, "Spirit of Oppression"},
  {85, "Hourglass of the Evil Hour"},
  {86, "Tome of Fire Magic"},
  {87, "Tome of Wind Magic"},
  {88, "Tome of Water Magic"},
  {89, "Tome of Earth Magic"},
  {90, "Boots of Levitation"},
  {91, "Golden Bow"},
  {92, "Sphere of Permanence"},
  {93, "Orb of Vulnerability"},
  {94, "Ring of Vitality"},
  {95, "Ring of Life"},
  {96, "Vial of Lifeblood"},
  {97, "Necklace of Swiftness"},
  {98, "Boots of Speed"},
  {99, "Cape of Velocity"},
  {100, "Pendant of Dispassion"},
  {101, "Pendant of Second Sight"},
  {102, "Pendant of Holiness"},
  {103, "Pendant of Life"},
  {104, "Pendant of Death"},
  {105, "Pendant of Free Will"},
  {106, "Pendant of Negativity"},
  {107, "Pendant of Total Recall"},
  {108, "Pendant of Courage"},
  {109, "Everflowing Crystal Cloak"},
  {110, "Ring of Infinite Gems"},
  {111, "Everpouring Vial of Mercury"},
  {112, "Inexhaustable Cart of Ore"},
  {113, "Eversmoking Ring of Sulfur"},
  {114, "Inexhaustable Cart of Lumber"},
  {115, "Endless Sack of Gold"},
  {116, "Endless Bag of Gold"},
  {117, "Endless Purse of Gold"},
  {118, "Legs of Legion"},
  {119, "Loins of Legion"},
  {120, "Torso of Legion"},
  {121, "Arms of Legion"},
  {122, "Head of Legion"},
  {123, "Sea Captain's Hat"},
  {124, "Spellbinder's Hat"},
  {125, "Shackles of War"},
  {126, "Orb of Inhibition"},
  {127, "Dragon Blood"},
  {128, "Armageddon's Blade"},
  {129, "Angelic Alliance"},
  {130, "Cloak of the Undead King"},
  {131, "Elixir of Life"},
  {132, "Armor of the Damned"},
  {133, "Statue of Legion"},
  {134, "Power of the Dragon Father"},
  {135, "Titan's Thunder"},
  {136, "Admiral's Hat"},
  {137, "Bow of the Sharpshooter"},
  {138, "Wizard's Well"},
  {139, "Ring of the Magi"},
  {140, "Cornucopia"},
  {141, "Diplomat's Cloak"},
  {142, "Pendant of Reflection"},
  {143, "Ironfist of the Ogre"},
  {147, "Trident of Dominion"},
  {148, "Shield of Naval Glory"},
  {149, "Royal Armor of Nix"},
  {150, "Crown of the Five Seas"},
  {151, "Boots of the Wayfarer"},
  {153, "Demon's Horseshoe"},
  {154, "Shaman's Puppet"},
  {155, "Hideous Mask"},
  {156, "Ring of Suppression"},
  {157, "Pedant of Downfall"},
  {158, "Ring of Oblivion"},
  {159, "Cape of Silence"},
  {160, "Golden Goose"},
  {161, "Horn of the Abyss"},
  {162, "Charm of the Eclipse"},
  {163, "Seal of Sunset"},
  {164, "Plate of Dying Light"},
  {4294967295, "---Empty slot---"},
}

local function symbolAddress(name)
  local ok, addr = pcall(getAddressSafe, name)
  if ok then return addr end
  return nil
end

local function readPtr(name)
  local a = symbolAddress(name)
  if not a then return nil end
  local ok, v = pcall(readInteger, a)
  if ok then return v end
  return nil
end

local function readAt(addr, kind)
  if not addr then return nil end
  local fn = (kind == 'byte' and readBytes) or (kind == 'word' and readSmallInteger) or readInteger
  local ok, v = pcall(fn, addr)
  if ok then return v end
  return nil
end

local function writeAt(addr, kind, value)
  if not addr then return false end
  local fn = (kind == 'byte' and writeBytes) or (kind == 'word' and writeSmallInteger) or writeInteger
  local ok = pcall(fn, addr, value)
  return ok
end

local function num(text)
  local v = tonumber(text)
  if not v then return nil end
  return math.floor(v)
end

local form = createForm(false)
HotATrainerForm = form
form.Caption = 'Heroes III: HotA Trainer'
form.Width = 780
form.Height = 590
form.Position = poScreenCenter
form.BorderStyle = bsSizeable

local title = createLabel(form)
title.Caption = 'HORN OF THE ABYSS  |  MAP TESTING TOOL'
title.Left, title.Top, title.Width, title.Height = 18, 12, 720, 28
title.Font.Size = 14
title.Font.Style = '[fsBold]'

local status = createLabel(form)
status.Caption = 'Waiting for the table script…'
status.Left, status.Top, status.Width, status.Height = 20, 43, 720, 22

-- Cheat Engine exposes tab pages through createPageControl(), not
-- createTabControl()/createTabSheet().
local tabs = createPageControl(form)
tabs.Left, tabs.Top, tabs.Width, tabs.Height = 16, 75, 735, 455
local overview = tabs.addTab(); overview.Caption = 'Overview'
local heroTab = tabs.addTab(); heroTab.Caption = 'Hero'
local inventoryTab = tabs.addTab(); inventoryTab.Caption = 'Inventory'

local function label(parent, caption, x, y, w)
  local c = createLabel(parent); c.Caption = caption; c.Left=x; c.Top=y; c.Width=w or 180; c.Height=22; return c
end
local function edit(parent, x, y, w)
  local c = createEdit(parent); c.Left=x; c.Top=y; c.Width=w or 120; c.Height=24; return c
end
local function button(parent, caption, x, y, w, callback)
  local c = createButton(parent); c.Caption=caption; c.Left=x; c.Top=y; c.Width=w or 120; c.Height=28; c.OnClick=callback; return c
end

-- Overview: toggles and resources
label(overview, 'GAMEPLAY TOGGLES', 18, 18, 300).Font.Style='[fsBold]'
local checks = {}
local function addToggle(caption, symbol, y)
  local c=createCheckBox(overview); c.Caption=caption; c.Left=22; c.Top=y; c.Width=260; c.Height=24
  c.OnChange=function(sender)
    local a=symbolAddress(symbol)
    if a then writeAt(a, 'int', sender.Checked and 1 or 0) end
  end
  checks[symbol]=c
end
addToggle('God mode (your army takes no losses)', 'bEnableGodMode', 48)
addToggle('Infinite hero movement', 'pEnableInfiniteMovementPts', 76)
addToggle('Infinite town building (hold CTRL)', 'bEnableInfiniteBuild', 104)

label(overview, 'PLAYER RESOURCES', 350, 18, 300).Font.Style='[fsBold]'
local resourceDefs = {
  {'Wood',0x9C}, {'Mercury',0xA0}, {'Ore',0xA4}, {'Sulfur',0xA8},
  {'Crystal',0xAC}, {'Gems',0xB0}, {'Gold',0xB4}
}
local resourceEdits={}
for i,d in ipairs(resourceDefs) do
  local col = (i <= 4) and 0 or 1
  local row = (i <= 4) and i or (i-4)
  local x = 350 + col*175
  local y = 48 + (row-1)*48
  label(overview, d[1], x, y, 90)
  resourceEdits[i] = edit(overview, x+78, y-3, 85)
end
local resourceRefresh
local resourceApply = button(overview, 'Apply resources', 490, 250, 140, function()
  local p=readPtr('pPlayer'); if not p or p==0 then status.Caption='Player pointer not ready — open a map and select a player.'; return end
  for i,d in ipairs(resourceDefs) do local v=num(resourceEdits[i].Text); if v then writeAt(p+d[2], 'int', v) end end
  status.Caption='Resource values written.'
end)

-- Hero tab
label(heroTab, 'CURRENTLY SELECTED HERO', 20, 18, 300).Font.Style='[fsBold]'
local heroFields = {
  {'Experience',0x51,'int'}, {'Level',0x55,'word'},
  {'Attack',0x476,'byte'}, {'Defence',0x477,'byte'},
  {'Spell Power',0x478,'byte'}, {'Knowledge',0x479,'byte'},
  {'Maximum movement',0x49,'word'}, {'Current movement',0x4D,'word'}
}
local heroEdits={}
for i,d in ipairs(heroFields) do
  local col=(i>4) and 1 or 0
  local row=(i-1)%4
  local x=22+col*330; local y=55+row*55
  label(heroTab,d[1],x,y,155)
  heroEdits[i]=edit(heroTab,x+160,y-4,110)
end
local heroName=label(heroTab,'Hero pointer: not detected',22,300,650)
button(heroTab,'Refresh hero',22,340,125,function()
  local h=readPtr('pPlayerCurrentHero')
  if not h or h==0 then heroName.Caption='No current hero pointer. Select a hero in-game first.'; return end
  heroName.Caption=string.format('Current hero address: 0x%X',h)
  for i,d in ipairs(heroFields) do local v=readAt(h+d[2],d[3]); heroEdits[i].Text=(v~=nil) and tostring(v) or '' end
  status.Caption='Hero values refreshed.'
end)
button(heroTab,'Apply hero edits',160,340,145,function()
  local h=readPtr('pPlayerCurrentHero')
  if not h or h==0 then status.Caption='No current hero pointer. Select a hero first.'; return end
  for i,d in ipairs(heroFields) do local v=num(heroEdits[i].Text); if v then writeAt(h+d[2],d[3],v) end end
  status.Caption='Hero values written.'
end)

-- Inventory tab: one selected slot at a time; table stores 21 8-byte records.
label(inventoryTab,'ARTIFACT / AUXILIARY SLOT EDITOR',20,18,400).Font.Style='[fsBold]'
label(inventoryTab,'Select one of the 21 records, choose an artifact, then apply.',22,45,650)
label(inventoryTab,'Inventory slot (1–21)',22,90,160)
local slotCombo=createComboBox(inventoryTab); slotCombo.Left=185; slotCombo.Top=86; slotCombo.Width=150
for i=1,21 do slotCombo.Items.add('Slot '..i) end
slotCombo.ItemIndex=0
label(inventoryTab,'Artifact',22,132,100)
local artifactCombo=createComboBox(inventoryTab); artifactCombo.Left=185; artifactCombo.Top=128; artifactCombo.Width=430
for _,v in ipairs(artifactOptions) do artifactCombo.Items.add(string.format('%d: %s',v[1],v[2])) end
artifactCombo.ItemIndex=0
label(inventoryTab,'Paired value (raw integer)',22,176,190)
local pairedEdit=edit(inventoryTab,215,172,120)
local currentItem=label(inventoryTab,'Current slot: not loaded',22,220,650)
button(inventoryTab,'Read selected slot',22,260,145,function()
  local h=readPtr('pPlayerCurrentHero'); if not h or h==0 then status.Caption='Select a hero first.'; return end
  local slot=slotCombo.ItemIndex; if slot<0 then slot=0 end
  local a=h+0x1D4+(slot*8)
  local item=readAt(a,'int'); local paired=readAt(a+4,'int')
  currentItem.Caption=string.format('Slot %d — artifact ID: %s | paired value: %s',slot+1,tostring(item),tostring(paired))
  pairedEdit.Text=tostring(paired or 0)
  for i,v in ipairs(artifactOptions) do if v[1]==item then artifactCombo.ItemIndex=i-1; break end end
end)
button(inventoryTab,'Apply selected slot',185,260,155,function()
  local h=readPtr('pPlayerCurrentHero'); if not h or h==0 then status.Caption='Select a hero first.'; return end
  local slot=slotCombo.ItemIndex; if slot<0 then slot=0 end
  local chosen=artifactCombo.ItemIndex+1; local item=artifactOptions[chosen] and artifactOptions[chosen][1]
  local paired=num(pairedEdit.Text) or 0
  if item==4294967295 then item=-1 end
  local a=h+0x1D4+(slot*8)
  local ok1=writeAt(a,'int',item or 0); local ok2=writeAt(a+4,'int',paired)
  status.Caption=(ok1 and ok2) and 'Inventory slot written.' or 'Could not write inventory slot.'
end)
label(inventoryTab,'Note: the CT exposes 21 paired records. Its dropdown names artifact IDs, while the paired field is kept raw; this is not a full spellbook editor.',22,320,680)

-- Refresh all visible values
local function refreshAll()
  local p=readPtr('pPlayer')
  local h=readPtr('pPlayerCurrentHero')
  if p and p~=0 then
    for i,d in ipairs(resourceDefs) do local v=readAt(p+d[2],'int'); resourceEdits[i].Text=(v~=nil) and tostring(v) or '' end
  end
  for symbol,c in pairs(checks) do local a=symbolAddress(symbol); if a then c.Checked=(readAt(a,'int') or 0)~=0 end end
  if h and h~=0 then
    heroName.Caption=string.format('Current hero address: 0x%X',h)
    for i,d in ipairs(heroFields) do local v=readAt(h+d[2],d[3]); heroEdits[i].Text=(v~=nil) and tostring(v) or '' end
  end
  if (not p or p==0) and (not h or h==0) then status.Caption='Symbols found, but no active player/hero yet. Open a map and select a hero.'
  else status.Caption='Connected to table symbols. Refresh after changing the selected hero.' end
end

button(overview,'Refresh all',350,295,130,refreshAll)

form.OnClose=function() HotATrainerForm=nil; return caFree end
refreshAll()
form.show()
