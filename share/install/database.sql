PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS charProperties (
   name  TEXT,
   guiId INTEGER,
   type  TEXT,
   PRIMARY KEY( name ASC )
);

CREATE TABLE IF NOT EXISTS charFactors (
   property TEXT,
   factor   TEXT,
   value    TEXT,
   FOREIGN KEY( property ) REFERENCES charProperties( name )
);

INSERT INTO charProperties VALUES ( 'Human',      1, 'race' );
INSERT INTO charProperties VALUES ( 'Half-Elf',   2, 'race' );
INSERT INTO charProperties VALUES ( 'Elf',        3, 'race' );
INSERT INTO charProperties VALUES ( 'Hobbit',     4, 'race' );
INSERT INTO charProperties VALUES ( 'Gnome',      5, 'race' );
INSERT INTO charProperties VALUES ( 'Dwarf',      6, 'race' );
INSERT INTO charProperties VALUES ( 'Half-Orc',   7, 'race' );
INSERT INTO charProperties VALUES ( 'Half-Troll', 8, 'race' );
INSERT INTO charProperties VALUES ( 'Dunadan',    9, 'race' );
INSERT INTO charProperties VALUES ( 'High-Elf',  10, 'race' );
INSERT INTO charProperties VALUES ( 'Kobold',    11, 'race' );

INSERT INTO charProperties VALUES ( 'Warrior',    1, 'class' );
INSERT INTO charProperties VALUES ( 'Mage',       2, 'class' );
INSERT INTO charProperties VALUES ( 'Priest',     3, 'class' );
INSERT INTO charProperties VALUES ( 'Rogue',      4, 'class' );
INSERT INTO charProperties VALUES ( 'Ranger',     5, 'class' );
INSERT INTO charProperties VALUES ( 'Paladin',    6, 'class' );

INSERT INTO charFactors VALUES ( 'Human', 'Strength',      '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Dexterity',     '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Intelligence',  '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Constitution',  '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Wisdom',        '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Charisma',      '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Hit',           '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Shoot',         '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Throw',         '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'HitDie',        '10' );
INSERT INTO charFactors VALUES ( 'Human', 'XPmod',       '100%' );
INSERT INTO charFactors VALUES ( 'Human', 'Disarm',        '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Devices',       '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Save',          '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Stealth',       '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Infravision', '0 ft' );
INSERT INTO charFactors VALUES ( 'Human', 'Digging',       '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Search',     '+0/10' );

INSERT INTO charFactors VALUES ( 'Half-Elf', 'Strength',        '+0' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Dexterity',       '+1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Intelligence',    '+1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Constitution',    '-1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Wisdom',          '-1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Charisma',        '+1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Hit',             '-1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Shoot',           '+5' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Throw',           '+5' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'HitDie',          '10' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'XPmod',         '110%' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Disarm',          '+2' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Devices',         '+3' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Save',            '+3' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Stealth',         '+1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Infravision',  '20 ft' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Digging',         '+0' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Search',       '+6/11' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Sustains', 'dexterity' );

INSERT INTO charFactors VALUES ( 'Elf', 'Strength',          '-1' );
INSERT INTO charFactors VALUES ( 'Elf', 'Dexterity',         '+1' );
INSERT INTO charFactors VALUES ( 'Elf', 'Intelligence',      '+2' );
INSERT INTO charFactors VALUES ( 'Elf', 'Constitution',      '-2' );
INSERT INTO charFactors VALUES ( 'Elf', 'Wisdom',            '-1' );
INSERT INTO charFactors VALUES ( 'Elf', 'Charisma',          '+1' );
INSERT INTO charFactors VALUES ( 'Elf', 'Hit',               '-5' );
INSERT INTO charFactors VALUES ( 'Elf', 'Shoot',            '+15' );
INSERT INTO charFactors VALUES ( 'Elf', 'Throw',            '+15' );
INSERT INTO charFactors VALUES ( 'Elf', 'HitDie',             '9' );
INSERT INTO charFactors VALUES ( 'Elf', 'XPmod',           '120%' );
INSERT INTO charFactors VALUES ( 'Elf', 'Disarm',            '+5' );
INSERT INTO charFactors VALUES ( 'Elf', 'Devices',           '+6' );
INSERT INTO charFactors VALUES ( 'Elf', 'Save',              '+6' );
INSERT INTO charFactors VALUES ( 'Elf', 'Stealth',           '+3' );
INSERT INTO charFactors VALUES ( 'Elf', 'Infravision',    '30 ft' );
INSERT INTO charFactors VALUES ( 'Elf', 'Digging',           '+0' );
INSERT INTO charFactors VALUES ( 'Elf', 'Search',         '+8/12' );
INSERT INTO charFactors VALUES ( 'Elf', 'Sustains',   'dexterity' );
INSERT INTO charFactors VALUES ( 'Elf', 'Resists', 'light damage' );

-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search, sustains, extra )
-- values ( 4, 'Hobbit', -2, 3, 2, 2, 1, 1, -10, 20, 20, 7, 110, 15, 18, 18, 4, 40, 0, '+12/15', 'experience', 'Identifies mushrooms' );
-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search, resists, extra )
-- values ( 5, 'Gnome', -1, 2, 2, 1, 0, -2, -8, 12, 12, 8, 125, 10, 22, 12, 3, 40, 0, '+6/13', 'paralysis', 'Identifies magic devices' );
-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search, resists, extra )
-- values ( 6, 'Dwarf', 2, -2, -3, 2, 2, -3, 15, 0, 0, 11, 120, 2, 9, 9, -1, 50, 40, '+7/10', 'blindness', 'Senses ore/minerals' );
-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search, resists )
-- values ( 7, 'Half-Orc', 2, 0, -1, 1, 0, -4, 12, -5, -5, 10, 110, -3, -3, -3, -1, 30, 0, '+0/7', 'darkness damage' );
-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search, sustains, extra )
-- values ( 8, 'Half-Troll', 4, -4, -4, 3, -2, -6, 20, -10, -10, 12, 120, -5, -8, -8, -2, 30, 0, '-1/5', 'strength', 'Regenerates quickly' );
-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search, sustains )
-- values ( 9, 'Dunadan', 1, 2, 2, 3, 2, 2, 15, 10, 10, 10, 180, 4, 5, 5, 2, 0, 0, '+3/13', 'constitution' );
-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search, resists, extra )
-- values ( 10, 'High-Elf', 1, 3, 3, 1, -1, 5, 10, 25, 25, 10, 200, 4, 20, 20, 3, 40, 0, '+3/14', 'light damage', 'Sees invisible creatures' );
-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search, resists )
-- values ( 11, 'Kobold', -1, 2, -1, 2, 0, -2, -5, 10, 10, 8, 115, 10, 5, 0, 4, 50, 0, '+15/15', 'poison' );
