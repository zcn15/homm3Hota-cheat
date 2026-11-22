-- HotA Trainer UI prototype
-- Uses symbols exported by the user's existing Cheat Engine table.
-- Load the CT, enable its main AOB script, then execute this file in CE's Lua engine.

if HotATrainerForm and HotATrainerForm.destroy then
  pcall(function() HotATrainerForm:destroy() end)
end
if HotASpellResetTimer and HotASpellResetTimer.destroy then
  pcall(function() HotASpellResetTimer:destroy() end)
  HotASpellResetTimer=nil
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
  local ok, result = pcall(fn, addr, value)
  return ok and result ~= false
end

local function num(text)
  local v = tonumber(text)
  if not v then return nil end
  return math.floor(v)
end

local form = createForm(false)
HotATrainerForm = form
form.Caption = 'Heroes III: HotA Trainer'
form.Width = 960
form.Height = 590
form.Position = poScreenCenter
form.BorderStyle = bsSizeable

local title = createLabel(form)
title.Caption = 'HORN OF THE ABYSS  |  MAP TESTING TOOL'
title.Left, title.Top, title.Width, title.Height = 18, 12, 900, 28
title.Font.Size = 14
title.Font.Style = '[fsBold]'

local status = createLabel(form)
status.Caption = 'Waiting for the table script…'
status.Left, status.Top, status.Width, status.Height = 20, 43, 900, 22

-- Cheat Engine exposes tab pages through createPageControl(), not
-- createTabControl()/createTabSheet().
local tabs = createPageControl(form)
tabs.Left, tabs.Top, tabs.Width, tabs.Height = 16, 75, 915, 455
local overview = tabs.addTab(); overview.Caption = 'Overview'
local heroTab = tabs.addTab(); heroTab.Caption = 'Hero Stats'
local armyTab = tabs.addTab(); armyTab.Caption = 'Army'
local inventoryTab = tabs.addTab(); inventoryTab.Caption = 'Inventory'
local skillsContainer = tabs.addTab(); skillsContainer.Caption = 'Skills'
local skillPages=createPageControl(skillsContainer)
skillPages.Left,skillPages.Top,skillPages.Width,skillPages.Height=0,0,915,430
local skillsTab=skillPages.addTab(); skillsTab.Caption='Mastery'
local skillAdditionTab=skillPages.addTab(); skillAdditionTab.Caption='Addition'
local dumpTab=skillPages.addTab(); dumpTab.Caption='Memory Dump'
local spellsTab = tabs.addTab(); spellsTab.Caption = 'Spells'
local battleTab=spellsTab
local toolsTab=spellsTab
local mapTab = tabs.addTab(); mapTab.Caption = 'Map'
local neutralTab=mapTab

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
  {'Experience',0x51,'int'}, {'Level',0x55,'word'}, {'Mana',0x18,'word'},
  {'Attack',0x476,'byte'}, {'Defence',0x477,'byte'},
  {'Spell Power',0x478,'byte'}, {'Knowledge',0x479,'byte'},
  {'Maximum movement',0x49,'word'}, {'Current movement',0x4D,'word'}
}
local heroEdits={}
for i,d in ipairs(heroFields) do
  local col=(i>5) and 1 or 0
  local row=(i-1)%5
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
button(heroTab,'Set mana to 9999',320,340,150,function()
  local h=readPtr('pPlayerCurrentHero')
  if not h or h==0 then heroName.Caption='No current hero pointer. Select a hero first.'; return end
  if writeAt(h+0x18,'word',9999) then
    for i,d in ipairs(heroFields) do
      if d[2]==0x18 then heroEdits[i].Text='9999'; break end
    end
    status.Caption='Current hero mana set to 9999.'
  else
    status.Caption='Could not write current hero mana.'
  end
end)

local creatureOptions={
  {0, 'Pikeman'},
  {1, 'Halberdier'},
  {2, 'Archer'},
  {3, 'Marksman'},
  {4, 'Griffin'},
  {5, 'Royal Griffin'},
  {6, 'Swordsman'},
  {7, 'Crusader'},
  {8, 'Monk'},
  {9, 'Zealot'},
  {10, 'Cavalier'},
  {11, 'Champion'},
  {12, 'Angel'},
  {13, 'Archangel'},
  {14, 'Centaur'},
  {15, 'Centaur Captain'},
  {16, 'Dwarf'},
  {17, 'Battle Dwarf'},
  {18, 'Wood Elf'},
  {19, 'Grand Elf'},
  {20, 'Pegasus'},
  {21, 'Silver Pegasus'},
  {22, 'Dendroid Guard'},
  {23, 'Dendroid Soldier'},
  {24, 'Unicorn'},
  {25, 'War Unicorn'},
  {26, 'Green Dragon'},
  {27, 'Gold Dragon'},
  {28, 'Gremlin'},
  {29, 'Master Gremlin'},
  {30, 'Stone Gargoyle'},
  {31, 'Obsidian Gargoyle'},
  {32, 'Stone Golem'},
  {33, 'Iron Golem'},
  {34, 'Mage'},
  {35, 'Arch Mage'},
  {36, 'Genie'},
  {37, 'Master Genie'},
  {38, 'Naga'},
  {39, 'Naga Queen'},
  {40, 'Giant'},
  {41, 'Titan'},
  {42, 'Imp'},
  {43, 'Familiar'},
  {44, 'Gog'},
  {45, 'Magog'},
  {46, 'Hell Hound'},
  {47, 'Cerberus'},
  {48, 'Demon'},
  {49, 'Horned Demon'},
  {50, 'Pit Fiend'},
  {51, 'Pit Lord'},
  {52, 'Efreeti'},
  {53, 'Efreet Sultan'},
  {54, 'Devil'},
  {55, 'Arch Devil'},
  {56, 'Skeleton'},
  {57, 'Skeleton Warrior'},
  {58, 'Walking Dead'},
  {59, 'Zombie'},
  {60, 'Wight'},
  {61, 'Wraith'},
  {62, 'Vampire'},
  {63, 'Vampire Lord'},
  {64, 'Lich'},
  {65, 'Power Lich'},
  {66, 'Black Knight'},
  {67, 'Dread Knight'},
  {68, 'Bone Dragon'},
  {69, 'Ghost Dragon'},
  {70, 'Troglodyte'},
  {71, 'Infernal Troglodyte'},
  {72, 'Harpy'},
  {73, 'Harpy Hag'},
  {74, 'Beholder'},
  {75, 'Evil Eye'},
  {76, 'Medusa'},
  {77, 'Medusa Queen'},
  {78, 'Minotaur'},
  {79, 'Minotaur King'},
  {80, 'Manticore'},
  {81, 'Scorpicore'},
  {82, 'Red Dragon'},
  {83, 'Black Dragon'},
  {84, 'Goblin'},
  {85, 'Hobgoblin'},
  {86, 'Wolf Rider'},
  {87, 'Wolf Raider'},
  {88, 'Orc'},
  {89, 'Orc Chieftain'},
  {90, 'Ogre'},
  {91, 'Ogre Mage'},
  {92, 'Roc'},
  {93, 'Thunderbird'},
  {94, 'Cyclops'},
  {95, 'Cyclops King'},
  {96, 'Behemoth'},
  {97, 'Ancient Behemoth'},
  {98, 'Gnoll'},
  {99, 'Gnoll Marauder'},
  {100, 'Lizardman'},
  {101, 'Lizard Warrior'},
  {102, 'Gorgon'},
  {103, 'Mighty Gorgon'},
  {104, 'Serpent Fly'},
  {105, 'Dragon Fly'},
  {106, 'Basilisk'},
  {107, 'Greater Basilisk'},
  {108, 'Wyvern'},
  {109, 'Wyvern Monarch'},
  {110, 'Hydra'},
  {111, 'Chaos Hydra'},
  {112, 'Air Elementa'},
  {113, 'Earth Elemental'},
  {114, 'Fire Elemental'},
  {115, 'Water Elemental'},
  {116, 'Gold Golem'},
  {117, 'Diamond Golem'},
  {118, 'Pixie'},
  {119, 'Sprite'},
  {120, 'Psychic Elemental'},
  {121, 'Magic Elemental'},
  {123, 'Ice Elemental'},
  {125, 'Magma Elemental'},
  {127, 'Storm Elemental'},
  {129, 'Energy Elemental'},
  {130, 'Firebird'},
  {131, 'Phoenix'},
  {132, 'Azure Dragon'},
  {133, 'Crystal Dragon'},
  {134, 'Faerie Dragon'},
  {135, 'Rust Dragon'},
  {136, 'Enchanter'},
  {137, 'Sharpshooter'},
  {138, 'Halfling'},
  {139, 'Peasant'},
  {140, 'Boar'},
  {141, 'Mummy'},
  {142, 'Nomad'},
  {143, 'Rogue'},
  {144, 'Troll'},
  {145, 'Catapult'},
  {146, 'Ballista'},
  {147, 'First Aid Tent'},
  {148, 'Ammo Cart'},
  {149, 'Arrow Towers'},
  {150, 'Cannon'},
  {-1, '--Empty--'},
  {153, 'Nymph'},
  {154, 'Oceanids'},
  {155, 'Crew Mates'},
  {156, 'Seamen'},
  {157, 'Pirates'},
  {158, 'Corsairs'},
  {151, 'Sea Dogs'},
  {159, 'Stormbirds'},
  {160, 'Ayssids'},
  {161, 'Sea Witches'},
  {162, 'Sorceresses'},
  {163, 'Nix'},
  {164, 'Nix Warriors'},
  {165, 'Sea Serpents'},
  {166, 'Haspids'},
  {167, 'Satyrs'},
  {168, 'Fangarms'},
  {169, 'Leprechauns'},
  {170, 'Steel golems'},
  {171, 'Halfling Grenadier'},
  {172, 'Mechanic'},
  {173, 'Engineer'},
  {174, 'Armadillo'},
  {175, 'Bellwether Armadillo'},
  {176, 'Automaton'},
  {177, 'Sentinel Automaton'},
  {178, 'Sandworm'},
  {179, 'Olgoi-Khorkhoi'},
  {180, 'Gunslinger'},
  {181, 'Bounty Hunter'},
  {182, 'Couatl'},
  {183, 'Crimson Couatl'},
  {184, 'Dreadnought'},
  {185, 'Juggernaut'},
  {186, 'Kobold'},
  {187, 'Kobold Foreman'},
  {188, 'Mountain Ram'},
  {189, 'Argali'},
  {190, 'Snow Elf'},
  {191, 'Steel Elf'},
  {192, 'Yeti'},
  {193, 'Yeti Runemaster'},
  {194, 'Shaman'},
  {195, 'Great Shaman'},
  {196, 'Mammoth'},
  {197, 'War Mammoth'},
  {198, 'Jotunn'},
  {199, 'Jotunn Warlord'},
}
local creatureIndexById={}
for index,entry in ipairs(creatureOptions) do creatureIndexById[entry[1]]=index end
-- Per-slot hero army editor. HotA table layout: types at +0x91, counts at +0xAD, four-byte stride.
label(armyTab,'EDIT HERO ARMY (7 SLOTS)',20,16,400).Font.Style='[fsBold]'
label(armyTab,'Read first. Empty slots use --Empty-- with amount 0. Counts are limited to signed 32-bit values.',22,40,700)
label(armyTab,'Slot',22,73,55); label(armyTab,'Creature',85,73,350); label(armyTab,'Amount',480,73,90)
local armyRows={}
for slot=1,7 do
  local y=96+(slot-1)*37
  label(armyTab,'Slot '..slot,22,y+3,55)
  local unit=createComboBox(armyTab); unit.Left=85; unit.Top=y; unit.Width=370
  for _,entry in ipairs(creatureOptions) do unit.Items.add(string.format('%d: %s',entry[1],entry[2])) end
  unit.ItemIndex=0
  local count=edit(armyTab,480,y,110); count.Text='0'
  armyRows[slot]={unit=unit,count=count}
end
local armyStatus=label(armyTab,'Read the selected hero before editing.',22,360,690)
local armySnapshot,armyHero,armyReadValid=nil,nil,false
local function readArmy()
  local h=readPtr('pPlayerCurrentHero')
  if not h or h==0 then armyStatus.Caption='Select a hero in-game first.'; armyReadValid=false; return false end
  local types,counts={},{}
  local issue=nil
  for slot=1,7 do
    local id=readAt(h+0x91+(slot-1)*4,'int')
    local count=readAt(h+0xAD+(slot-1)*4,'int')
    if id==4294967295 then id=-1 end
    if count==4294967295 then count=-1 end
    local itemIndex=id and creatureIndexById[id]
    if id==nil or count==nil then
      issue=issue or string.format('Slot %d could not be read (unit=%s, amount=%s).',slot,tostring(id),tostring(count))
      armyRows[slot].unit.ItemIndex=-1
      armyRows[slot].count.Text=''
    elseif itemIndex==nil then
      issue=issue or string.format('Slot %d has unit ID %s, which is missing from the creature list.',slot,tostring(id))
      armyRows[slot].unit.ItemIndex=-1
      armyRows[slot].count.Text=tostring(count)
    elseif count<0 and id~=-1 then
      issue=issue or string.format('Slot %d has a negative amount (%s) for unit ID %s.',slot,tostring(count),tostring(id))
      armyRows[slot].unit.ItemIndex=itemIndex-1
      armyRows[slot].count.Text=tostring(count)
    else
      armyRows[slot].unit.ItemIndex=itemIndex-1
      armyRows[slot].count.Text=tostring((id==-1 or count<0) and 0 or count)
    end
    types[slot],counts[slot]=id,count
  end
  local valid=issue==nil
  armySnapshot={types=types,counts=counts}; armyHero=h; armyReadValid=valid
  armyStatus.Caption=valid and string.format('Read 7 army slots from hero 0x%X.',h) or (issue..' Apply is blocked for safety.')
  return valid
end
button(armyTab,'Read hero army',22,395,140,readArmy)
button(armyTab,'Apply army edits',175,395,155,function()
  local h=readPtr('pPlayerCurrentHero')
  if not h or h==0 then armyStatus.Caption='Select a hero first.'; return end
  if not armyReadValid or h~=armyHero or not armySnapshot then armyStatus.Caption='Read the currently selected hero army before applying.'; return end
  local newTypes,newCounts={},{}
  for slot=1,7 do
    local row=armyRows[slot]; local index=row.unit.ItemIndex
    local amount=num(row.count.Text)
    if index<0 or not creatureOptions[index+1] or amount==nil or amount<0 or amount>2147483647 then
      armyStatus.Caption='Choose a creature and enter an amount from 0 to 2147483647 for every slot.'; return
    end
    local id=creatureOptions[index+1][1]
    if id==-1 then amount=0 elseif amount==0 then id=-1 end
    newTypes[slot],newCounts[slot]=id,amount
  end
  local success=true
  for slot=1,7 do
    if not writeAt(h+0x91+(slot-1)*4,'int',newTypes[slot]) or not writeAt(h+0xAD+(slot-1)*4,'int',newCounts[slot]) then success=false; break end
  end
  if not success then
    for slot=1,7 do
      writeAt(h+0x91+(slot-1)*4,'int',armySnapshot.types[slot])
      writeAt(h+0xAD+(slot-1)*4,'int',armySnapshot.counts[slot])
    end
    armyReadValid=false; armyStatus.Caption='A write failed; previous army values were restored. Read the army again before retrying.'; return
  end
  readArmy()
  armyStatus.Caption='Army written. Reopen the hero screen to refresh its display.'
end)

-- Battle spell recast toggle. Activates/deactivates its AA hook by table record ID.
label(battleTab,'INFINITE COMBAT SPELL CASTS',470,16,420).Font.Style='[fsBold]'
label(battleTab,'Clears the hero cast flag after each spell.',472,42,420)
label(battleTab,'The spellbook may update after the next unit action.',472,66,420)
local infiniteSpellToggle=createCheckBox(battleTab)
infiniteSpellToggle.Caption='Allow repeated hero spell casts'
infiniteSpellToggle.Left,infiniteSpellToggle.Top,infiniteSpellToggle.Width=472,96,360
local battleSpellStatus=label(battleTab,'Toggle is off.',472,128,420)
local battleToggleUpdating=false
local infiniteSpellTimer=createTimer(nil,false)
HotASpellResetTimer=infiniteSpellTimer
infiniteSpellTimer.Interval=50
local function battleSpellRecord()
  local ok,record=pcall(function() return getAddressList().getMemoryRecordByID(9001) end)
  return ok and record or nil
end
local function refreshBattleSpellToggle()
  local record=battleSpellRecord()
  local address=symbolAddress('combatMagicCastSwitchAddr')
  battleToggleUpdating=true
  infiniteSpellToggle.Enabled=record~=nil
  infiniteSpellToggle.Checked=record and record.Active or false
  infiniteSpellTimer.Enabled=infiniteSpellToggle.Checked
  battleToggleUpdating=false
  if not record then battleSpellStatus.Caption='Battle hook entry is missing from the loaded table.'
  elseif not infiniteSpellToggle.Checked then battleSpellStatus.Caption='Toggle is off.'
  elseif not address then battleSpellStatus.Caption='Hook is on. Cast a combat spell once to capture its flag address.'
  elseif (readPtr('combatMagicCastSwitchAddr') or 0)==0 then battleSpellStatus.Caption='Hook is on. Cast a combat spell once to capture its flag address.'
  else battleSpellStatus.Caption='Hook is on. Cast flag will be cleared after each spell.' end
end
infiniteSpellTimer.OnTimer=function()
  local record=battleSpellRecord()
  if not record or not record.Active or not infiniteSpellToggle.Checked then infiniteSpellTimer.Enabled=false; return end
  local pendingAddress=symbolAddress('bSpellCastPending')
  local base=readPtr('combatMagicCastSwitchAddr')
  if not pendingAddress or not base or base==0 or (readAt(pendingAddress,'int') or 0)~=1 then return end
  if writeAt(base+0x54B4,'int',0) then
    writeAt(pendingAddress,'int',0)
    battleSpellStatus.Caption='Cast flag cleared. The spellbook may update after the next unit action.'
  end
end
infiniteSpellToggle.OnChange=function(sender)
  if battleToggleUpdating then return end
  local record=battleSpellRecord()
  if not record then battleSpellStatus.Caption='Battle hook entry is missing from the loaded table.'; return end
  if sender.Checked then
    local ok=pcall(function() record.Active=true end)
    local address=symbolAddress('combatMagicCastSwitchAddr')
    if not ok or not address or not symbolAddress('bSpellCastPending') or not record.Active then
      battleToggleUpdating=true; sender.Checked=false; battleToggleUpdating=false
      battleSpellStatus.Caption='Could not install the battle hook. Check the CE error and game build.'
      return
    end
    infiniteSpellTimer.Enabled=true
    battleSpellStatus.Caption='Hook is on. Cast a combat spell once; its cast flag will then be cleared automatically.'
  else
    infiniteSpellTimer.Enabled=false
    pcall(function() record.Active=false end)
    battleSpellStatus.Caption='Toggle is off.'
  end
end
button(battleTab,'Reset spell flag now',472,170,155,function()
  local base=readPtr('combatMagicCastSwitchAddr')
  local pending=symbolAddress('bSpellCastPending')
  if not base or base==0 or not pending then
    battleSpellStatus.Caption='No battle flag captured yet. Turn the toggle on and cast a combat spell once.'
    return
  end
  if writeAt(base+0x54B4,'int',0) then
    writeAt(pending,'int',0)
    battleSpellStatus.Caption='Cast flag reset. The spellbook may update after the next unit action.'
  else
    battleSpellStatus.Caption='Could not reset the captured battle cast flag.'
  end
end)
button(battleTab,'Refresh hook status',640,170,160,refreshBattleSpellToggle)

local secondarySkills={
  'Pathfinding','Archery','Logistics','Scouting','Diplomacy','Navigation','Leadership',
  'Wisdom','Mysticism','Luck','Ballistics','Eagle Eye','Necromancy','Estates',
  'Fire Magic','Air Magic','Water Magic','Earth Magic','Scholar','Tactics',
  'Artillery','Learning','Offense','Armorer','Intelligence','Sorcery',
  'Resistance','First Aid'
}
label(skillsTab,'EDIT MASTERY OF EXISTING SKILLS',20,16,420).Font.Style='[fsBold]'
label(skillsTab,'Read first. This editor changes mastery only; it does not add, remove, or reorder skills.',22,40,700)
local skillEdits={}
for i,name in ipairs(secondarySkills) do
  local col=(i>14) and 1 or 0
  local row=(i-1)%14
  local x=22+col*355
  local y=54+row*20
  label(skillsTab,name,x,y,112)
  local level=createComboBox(skillsTab); level.Left=x+115; level.Top=y-3; level.Width=135
  level.Items.add('Not learned'); level.Items.add('Basic'); level.Items.add('Advanced'); level.Items.add('Expert')
  level.ItemIndex=0
  level.Enabled=false
  skillEdits[i]=level
end
local skillStatus=label(skillsTab,'Read a selected hero before applying. HotA Interference is not mapped here.',22,382,700)
local skillSnapshot,skillHero={},nil
local skillReadValid=false
local applyMasteryButton
local function readSkills()
  local h=readPtr('pPlayerCurrentHero')
  if not h or h==0 then skillStatus.Caption='Select a hero first.'; return false end
  local values,valid={},true
  for i=1,#secondarySkills do
    local value=readAt(h+0xC9+(i-1),'byte')
    if value==nil or value>3 then valid=false; value=0 end
    values[i]=value
    skillEdits[i].ItemIndex=value
    skillEdits[i].Enabled=value>0
  end
  skillSnapshot,skillHero=values,h
  skillReadValid=valid
  applyMasteryButton.Enabled=valid
  skillStatus.Caption=valid and string.format('Loaded skill levels for hero 0x%X.',h) or
    'Skill data did not match the supported range; applying is blocked.'
  return valid
end
button(skillsTab,'Read skills',22,350,125,readSkills)
applyMasteryButton=button(skillsTab,'Apply mastery changes',160,350,175,function()
  local h=readPtr('pPlayerCurrentHero')
  if not h or h==0 then skillStatus.Caption='Select a hero first.'; return end
  if not skillReadValid or h~=skillHero then
    skillStatus.Caption='Read the currently selected hero before applying.'
    applyMasteryButton.Enabled=false
    return
  end
  local changes={}
  for i=1,#secondarySkills do
    local before=skillSnapshot[i]
    local after=skillEdits[i].ItemIndex
    if before==0 and after~=0 then
      skillStatus.Caption='Adding skills is disabled; only existing skill mastery can be changed.'
      return
    elseif before>0 and (after<1 or after>3) then
      skillStatus.Caption='Removing skills is disabled; keep each existing skill at Basic, Advanced, or Expert.'
      return
    elseif before>0 and after~=before then
      changes[#changes+1]={id=i-1,level=after}
    end
  end
  for _,change in ipairs(changes) do
    if not writeAt(h+0xC9+change.id,'byte',change.level) then
      skillStatus.Caption='A mastery write failed. Refresh the hero before continuing.'
      skillReadValid=false; applyMasteryButton.Enabled=false
      return
    end
  end
  readSkills()
  skillStatus.Caption=string.format('Updated mastery for %d existing skill(s).',#changes)
end)
applyMasteryButton.Enabled=false

-- HotA's original table marks the vanilla +E5 skill order as unused.
-- Direct level/count writes crashed the hero screen, so this tab is read-only
-- until HotA's runtime skill list behavior is mapped.
label(skillAdditionTab,'SKILL ADDITION (HOTa MAPPING IN PROGRESS)',20,16,500).Font.Style='[fsBold]'
label(skillAdditionTab,'The HotA table marks the vanilla +0xE5 skill-order bytes as unused. Direct level/count additions crashed the hero screen.',22,42,700)
label(skillAdditionTab,'Read current skill data here. Addition stays locked while we inspect HotA\'s runtime skill-order list.',22,68,700)
local addSkillCombo=createComboBox(skillAdditionTab)
addSkillCombo.Left,addSkillCombo.Top,addSkillCombo.Width=22,110,220
for _,name in ipairs(secondarySkills) do addSkillCombo.Items.add(name) end
addSkillCombo.ItemIndex=-1
local additionStatus=label(skillAdditionTab,'No hero read yet.',260,114,450)
local additionSnapshot,additionHero,additionCount={},nil,nil
local additionReadValid=false
local function readAdditionSkills()
  local h=readPtr('pPlayerCurrentHero')
  if not h or h==0 then additionStatus.Caption='Select a hero first.'; return false end
  local values,valid={},true
  for i=1,#secondarySkills do
    local value=readAt(h+0xC9+(i-1),'byte')
    if value==nil or value>3 then valid=false end
    values[i]=value
  end
  local count=readAt(h+0x101,'byte')
  local learned=0
  for id,value in ipairs(values) do
    if value and value>0 then learned=learned+1 end
  end
  if count==nil or count>28 or count~=learned then valid=false end
  additionSnapshot,additionHero,additionCount=values,h,count
  additionReadValid=valid
  additionStatus.Caption=valid and string.format('Hero 0x%X: %d learned skills; levels and count agree.',h,count) or
    'Skill levels/count did not validate; addition is unavailable.'
  return valid
end
button(skillAdditionTab,'Read selected hero',22,158,160,readAdditionSkills)
local addSkillButton=button(skillAdditionTab,'Add selected skill (paused)',195,158,190,function()
  additionStatus.Caption='No memory written. HotA runtime skill-order state is still being mapped.'
end)
addSkillButton.Enabled=false
label(skillAdditionTab,'The attached HotA table labels hero +0xE5 as “Skills Order (Useless in HOTA)”. It also has a separate HotA runtime skill-order probe; use that before any more addition writes.',22,220,690)

-- Hero spell-access array.
label(toolsTab,'HERO SPELL ACCESS',20,14,420).Font.Style='[fsBold]'
label(toolsTab,'140 flags at hero +0x3EA. Values must be 0 or 1.',22,38,420)
local spellMemo=createMemo(toolsTab)
spellMemo.Left,spellMemo.Top,spellMemo.Width,spellMemo.Height=22,62,420,78
spellMemo.ScrollBars=ssVertical
spellMemo.Lines.Text=''
local spellStatus=label(toolsTab,'No spell array loaded.',22,250,420)
local spellTargetHero=nil
local function getCurrentHero()
  local h=readPtr('pPlayerCurrentHero')
  if not h or h==0 then return nil end
  return h
end
local function readSpellArray()
  local h=getCurrentHero()
  if not h then spellStatus.Caption='Select a hero first.'; return nil end
  local values={}
  for i=0,139 do
    local value=readAt(h+0x3EA+i,'byte')
    if value==nil then spellStatus.Caption='Could not read the full spell array.'; return nil end
    values[#values+1]=value
  end
  spellMemo.Lines.Text=table.concat(values,' ')
  spellTargetHero=h
  spellStatus.Caption=string.format('Read 140 spell-access bytes from hero 0x%X.',h)
  return values,h
end
local function parseSpellArray(text)
  local values={}
  for token in text:gmatch('[^,%s;]+') do
    local value=tonumber(token)
    if not value or (value~=0 and value~=1) then return nil end
    values[#values+1]=value
  end
  if #values~=140 then return nil end
  return values
end
local function writeSpellArray(values, expectedHero)
  local h=getCurrentHero()
  if not h then spellStatus.Caption='Select a hero first.'; return false end
  if not expectedHero then spellStatus.Caption='Read a hero or load a preset before applying.'; return false end
  if h~=expectedHero then spellStatus.Caption='Selected hero changed. Read that hero again before applying.'; return false end
  local previous={}
  for i=0,139 do
    previous[i+1]=readAt(h+0x3EA+i,'byte')
    if previous[i+1]==nil then spellStatus.Caption='Could not validate the full spell array; nothing was written.'; return false end
  end
  for i=0,139 do
    if not writeAt(h+0x3EA+i,'byte',values[i+1]) then
      for rollback=0,i-1 do writeAt(h+0x3EA+rollback,'byte',previous[rollback+1]) end
      spellStatus.Caption='A write failed; previous spell bytes were restored where possible.'
      return false
    end
  end
  spellStatus.Caption=string.format('Wrote 140 spell-access bytes to hero 0x%X.',h)
  return true
end
button(toolsTab,'Read spell array',22,151,125,function() readSpellArray() end)
button(toolsTab,'Apply edited array',158,151,140,function()
  local values=parseSpellArray(spellMemo.Lines.Text)
  if not values then spellStatus.Caption='Enter exactly 140 values, each 0 or 1.'; return end
  writeSpellArray(values,spellTargetHero)
end)
local referenceSpellPreset={}
for token in string.gmatch('1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 1 1 1 1','%d+') do
  referenceSpellPreset[#referenceSpellPreset+1]=tonumber(token)
end
button(toolsTab,'Unlock reference set',22,207,155,function()
  if #referenceSpellPreset~=140 then spellStatus.Caption='Reference spell preset is malformed.'; return end
  spellTargetHero=getCurrentHero()
  if not spellTargetHero then spellStatus.Caption='Select a hero before loading a preset.'; return end
  spellMemo.Lines.Text=table.concat(referenceSpellPreset,' ')
  writeSpellArray(referenceSpellPreset,spellTargetHero)
end)
button(toolsTab,'Clear all flags',188,207,125,function()
  local values={}
  for i=1,140 do values[i]=0 end
  local h=getCurrentHero()
  if not h then spellStatus.Caption='Select a hero first.'; return end
  writeSpellArray(values,h)
end)

label(heroTab,'SPECIALTY EFFECTS',680,18,230).Font.Style='[fsBold]'
label(heroTab,'Edit effect bytes; hero text stays unchanged.',680,42,230)
local specialtyProbeRecord
local function specialtyRecord()
  local ok,record=pcall(function() return getAddressList().getMemoryRecordByID(9004) end)
  return ok and record or nil
end
specialtyProbeRecord=specialtyRecord()
local specialtyProbeToggle=createCheckBox(heroTab)
specialtyProbeToggle.Caption='Enable specialty table probe'
specialtyProbeToggle.Left,specialtyProbeToggle.Top,specialtyProbeToggle.Width=680,67,230
specialtyProbeToggle.Enabled=specialtyProbeRecord~=nil
specialtyProbeToggle.Checked=specialtyProbeRecord and specialtyProbeRecord.Active or false
local specialtyStatus=label(heroTab,'Read a hero before editing.',680,92,230)
local specialtyFields={
  {name='Kind',offset=0}, {name='Source',offset=4},
  {name='Attack bonus',offset=8}, {name='Defence bonus',offset=12},
  {name='Damage bonus',offset=16}, {name='2nd unit to convert',offset=20},
  {name='Target unit',offset=24}
}
local specialtyEdits={}
for i,field in ipairs(specialtyFields) do
  local x=680
  local y=120+(i-1)*27
  label(heroTab,field.name,x,y,135)
  specialtyEdits[i]=edit(heroTab,x+138,y-3,72)
end
local specialtySnapshot
specialtyProbeToggle.OnChange=function(sender)
  local record=specialtyRecord()
  if not record then sender.Checked=false; specialtyStatus.Caption='Specialty probe entry is missing.'; return end
  local ok=pcall(function() record.Active=sender.Checked end)
  if not ok or record.Active~=sender.Checked then
    sender.Checked=not sender.Checked
    specialtyStatus.Caption='Could not change the specialty probe. Check the CE error.'
  else
    specialtyStatus.Caption=sender.Checked and 'Probe on. Read a selected hero.' or 'Probe off.'
  end
end
local function readSpecialty()
  local h=getCurrentHero()
  local tableBase=readPtr('Specialties')
  if not h then specialtyStatus.Caption='Select a hero first.'; return false end
  if not specialtyProbeToggle.Checked or not tableBase or tableBase==0 then
    specialtyStatus.Caption='Enable the specialty probe, then read again.'
    return false
  end
  local index=readAt(h+0x1A,'byte')
  if index==nil or index>255 then specialtyStatus.Caption='Could not read the hero specialty index.'; return false end
  local address=tableBase+index*0x28
  local values={}
  for i,field in ipairs(specialtyFields) do
    values[i]=readAt(address+field.offset,'byte')
    if values[i]==nil then specialtyStatus.Caption='Could not read specialty effect bytes.'; return false end
    specialtyEdits[i].Text=tostring(values[i])
  end
  specialtySnapshot={hero=h,index=index,address=address,values=values}
  specialtyStatus.Caption=string.format('Read specialty %d at 0x%X.',index,address)
  return true
end
button(heroTab,'Read specialty',680,315,108,readSpecialty)
button(heroTab,'Apply effects',794,315,116,function()
  local snapshot=specialtySnapshot
  local h=getCurrentHero()
  local tableBase=readPtr('Specialties')
  local index=h and readAt(h+0x1A,'byte') or nil
  if not snapshot or h~=snapshot.hero or index~=snapshot.index or not tableBase or tableBase==0 or tableBase+index*0x28~=snapshot.address then
    specialtyStatus.Caption='Hero or specialty changed. Read again before applying.'
    return
  end
  local values={}
  for i=1,#specialtyFields do
    values[i]=num(specialtyEdits[i].Text)
    if not values[i] or values[i]<0 or values[i]>255 then specialtyStatus.Caption='Each specialty effect must be a byte from 0 to 255.'; return end
  end
  local changed={}
  for i,field in ipairs(specialtyFields) do
    if values[i]~=snapshot.values[i] then
      if not writeAt(snapshot.address+field.offset,'byte',values[i]) then
        for _,entry in ipairs(changed) do writeAt(snapshot.address+entry.offset,'byte',entry.value) end
        specialtyStatus.Caption='A write failed; previous values were restored where possible.'
        return
      end
      changed[#changed+1]={offset=field.offset,value=snapshot.values[i]}
    end
  end
  readSpecialty()
  specialtyStatus.Caption=string.format('Applied %d specialty effect change(s).',#changed)
end)

-- Neutral creature pointer capture and disposition editor.
label(neutralTab,'NEUTRAL CREATURE EDITOR',20,16,350).Font.Style='[fsBold]'
label(neutralTab,'Enable the probe, then right-click a wandering creature to capture its data.',22,42,690)
label(neutralTab,'Count range: 1–4095. Disposition: 0 always joins, 10 never joins.',22,66,690)
local neutralProbeRecord
local function neutralRecord()
  local ok,record=pcall(function() return getAddressList().getMemoryRecordByID(9003) end)
  return ok and record or nil
end
neutralProbeRecord=neutralRecord()
local neutralProbeToggle=createCheckBox(neutralTab)
neutralProbeToggle.Caption='Enable right-click capture'
neutralProbeToggle.Left,neutralProbeToggle.Top,neutralProbeToggle.Width=22,100,260
neutralProbeToggle.Enabled=neutralProbeRecord~=nil
neutralProbeToggle.Checked=neutralProbeRecord and neutralProbeRecord.Active or false
local neutralStatus=label(neutralTab,'No creature captured.',300,101,580)
label(neutralTab,'Creature count',22,150,140)
local neutralCountEdit=edit(neutralTab,165,146,100)
label(neutralTab,'Disposition',22,190,140)
local neutralDispositionEdit=edit(neutralTab,165,186,100)
local neutralSnapshot
local function readNeutralCreature()
  local address=readPtr('neutralCreatureRecordAddr')
  local captures=readPtr('neutralCreatureCaptureCount')
  if not neutralProbeToggle.Checked then neutralStatus.Caption='Enable the capture probe first.'; return false end
  if not address or address==0 then neutralStatus.Caption='No capture yet. Right-click a wandering creature.'; return false end
  local count=readAt(address,'int')
  local disposition=readAt(address+8,'byte')
  if count==nil or disposition==nil then neutralStatus.Caption='Captured address could not be read.'; return false end
  neutralCountEdit.Text=tostring(count)
  neutralDispositionEdit.Text=tostring(disposition)
  neutralSnapshot={address=address,count=count,disposition=disposition}
  neutralStatus.Caption=string.format('Captured 0x%X (probe hits: %s).',address,tostring(captures or '?'))
  return true
end
neutralProbeToggle.OnChange=function(sender)
  local record=neutralRecord()
  if not record then sender.Checked=false; neutralStatus.Caption='Neutral capture entry is missing.'; return end
  local ok=pcall(function() record.Active=sender.Checked end)
  if not ok or record.Active~=sender.Checked then
    sender.Checked=not sender.Checked
    neutralStatus.Caption='Could not change the neutral creature probe. Check the CE error.'
  else
    neutralStatus.Caption=sender.Checked and 'Probe on. Right-click a wandering creature.' or 'Probe off.'
  end
end
button(neutralTab,'Read captured creature',22,236,170,readNeutralCreature)
button(neutralTab,'Apply count / disposition',205,236,190,function()
  local snapshot=neutralSnapshot
  local address=readPtr('neutralCreatureRecordAddr')
  local count=num(neutralCountEdit.Text)
  local disposition=num(neutralDispositionEdit.Text)
  if not snapshot or not address or address==0 or address~=snapshot.address then neutralStatus.Caption='Capture and read a creature again before applying.'; return end
  if not count or count<1 or count>4095 then neutralStatus.Caption='Creature count must be from 1 to 4095.'; return end
  if not disposition or disposition<0 or disposition>10 then neutralStatus.Caption='Disposition must be from 0 to 10.'; return end
  local okCount=writeAt(address,'int',count)
  local okDisposition=okCount and writeAt(address+8,'byte',disposition)
  local actualCount=readAt(address,'int')
  local actualDisposition=readAt(address+8,'byte')
  if actualCount==nil or actualDisposition==nil then
    neutralStatus.Caption='Write attempted, but the captured address could not be read back.'
    return
  end
  neutralCountEdit.Text=tostring(actualCount)
  neutralDispositionEdit.Text=tostring(actualDisposition)
  neutralSnapshot={address=address,count=actualCount,disposition=actualDisposition}
  if actualCount~=count or actualDisposition~=disposition then
    neutralStatus.Caption=string.format('Write mismatch at 0x%X: wanted %d / %d; read back %d / %d (CE writes %s / %s).',address,count,disposition,actualCount,actualDisposition,tostring(okCount),tostring(okDisposition))
    return
  end
  neutralStatus.Caption=string.format('Memory verified: count %d, disposition %d. Reopen the object to refresh its display.',actualCount,actualDisposition)
end)

-- Read-only hero dumps for comparing HotA memory before and after game actions.
label(dumpTab,'HERO MEMORY DUMP',20,16,400).Font.Style='[fsBold]'
label(dumpTab,'Read-only diagnostics. Enable the HotA order probe before reading its runtime list.',22,40,690)
local dumpMemo=createMemo(dumpTab)
dumpMemo.Left,dumpMemo.Top,dumpMemo.Width,dumpMemo.Height=22,62,680,260
dumpMemo.ReadOnly=true
dumpMemo.ScrollBars=ssVertical
dumpMemo.Lines.Text='No dump yet.'
local dumpStatus=label(dumpTab,'Read-only diagnostic.',400,365,300)
local function dumpHeroBytes(startOffset,endOffset)
  local h=readPtr('pPlayerCurrentHero')
  if not h or h==0 then
    dumpMemo.Lines.Text='No selected hero pointer.'
    dumpStatus.Caption='Select a hero in-game, then retry.'
    return false
  end
  local lines={string.format('Hero=0x%X; range=+0x%03X..+0x%03X',h,startOffset,endOffset)}
  for rowStart=startOffset,endOffset,16 do
    local parts={string.format('+%03X:',rowStart)}
    for offset=rowStart,math.min(rowStart+15,endOffset) do
      local value=readAt(h+offset,'byte')
      parts[#parts+1]=value and string.format('%02X',value) or '??'
    end
    lines[#lines+1]=table.concat(parts,' ')
  end
  dumpMemo.Lines.Text=table.concat(lines,'\r\n')
  dumpStatus.Caption=string.format('Read %d bytes from hero at 0x%X.',endOffset-startOffset+1,h)
  return true
end
button(dumpTab,'Dump skill area',22,330,150,function() dumpHeroBytes(0xB0,0x130) end)
button(dumpTab,'Dump full hero record',185,330,190,function() dumpHeroBytes(0x000,0x491) end)
button(dumpTab,'Dump HotA runtime order',390,330,190,function()
  local symbol=symbolAddress('skillOrderAddr')
  if not symbol then
    dumpMemo.Lines.Text='CE cannot resolve skillOrderAddr. Confirm the HotA skill-order probe is checked.'
    dumpStatus.Caption='Probe symbol is not registered.'
    return
  end
  local p=readPtr('skillOrderAddr')
  if not p or p==0 then
    local hook=symbolAddress('skillOrderHook')
    local module=symbolAddress('hota.dll')
    local hookLocation=(hook and module and hook>=module) and string.format('hota.dll+0x%X',hook-module) or 'unknown location'
    local function codeContext(name,address)
      if not address then return name..': unavailable' end
      local parts={}
      for offset=-16,15 do
        local value=readAt(address+offset,'byte')
        parts[#parts+1]=value and string.format('%02X',value) or '??'
      end
      return name..' ('..table.concat(parts,' ')..')'
    end
    local oldHook=symbolAddress('hota.dll+1232A4')
    dumpMemo.Lines.Text='Probe is enabled, but the hook has not captured a runtime call. Matched instruction: '..hookLocation..'. Expected original hook: hota.dll+0x1232A4.\r\n'..codeContext('Matched code, -16..+15',hook)..'\r\n'..codeContext('Old address, -16..+15',oldHook)
    dumpStatus.Caption='Probe symbol exists; captured pointer is zero.'
    return
  end
  local lines={string.format('HotA skillOrderAddr=0x%X; runtime order bytes (28 skills)',p)}
  for rowStart=0,27,16 do
    local parts={string.format('+%02X:',rowStart)}
    for offset=rowStart,math.min(rowStart+15,27) do
      local value=readAt(p+offset,'byte')
      parts[#parts+1]=value and string.format('%02X',value) or '??'
    end
    lines[#lines+1]=table.concat(parts,' ')
  end
  dumpMemo.Lines.Text=table.concat(lines,'\r\n')
  dumpStatus.Caption=string.format('Read HotA runtime skill-order array at 0x%X.',p)
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
  refreshBattleSpellToggle()
  if h and h~=0 then
    heroName.Caption=string.format('Current hero address: 0x%X',h)
    for i,d in ipairs(heroFields) do local v=readAt(h+d[2],d[3]); heroEdits[i].Text=(v~=nil) and tostring(v) or '' end
  end
  if (not p or p==0) and (not h or h==0) then status.Caption='Symbols found, but no active player/hero yet. Open a map and select a hero.'
  else status.Caption='Connected to table symbols. Refresh after changing the selected hero.' end
end

button(overview,'Refresh all',350,295,130,refreshAll)

form.OnClose=function()
  infiniteSpellTimer.Enabled=false
  local record=battleSpellRecord()
  if record then pcall(function() record.Active=false end) end
  HotASpellResetTimer=nil
  HotATrainerForm=nil
  return caFree
end
refreshAll()
form.show()
