
create table if not exists race (
  guiId        INTEGER,
  name         TEXT,
  strenght     INTEGER,
  dexterity    INTEGER,
  intelligence INTEGER,
  constitution INTEGER,
  wisdom       INTEGER,
  charisma     INTEGER,
  hit          INTEGER,
  shoot        INTEGER,
  throw        INTEGER,
  hitDie       INTEGER,
  XPmod        INTEGER,
  disarm       INTEGER,
  devices      INTEGER,
  save         INTEGER,
  stealth      INTEGER,
  infravision  INTEGER,
  diggig       INTEGER,
  search       TEXT,
  sustains     TEXT,
  resists      TEXT,
  extra        TEXT,
  primary key( guiId asc )
);

insert into race (
  guiId, name, strenght, dexterity, intelligence, constitution, wisdom, charisma, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, diggig, search
) values ( 1, 'Human', 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 100, 0, 0, 0, 0, 0, 0, '+0/10');
insert into race (
  guiId, name, strenght, dexterity, intelligence, constitution, wisdom, charisma, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, diggig, search, sustains )
values ( 2, 'Half-Elf', 0, 1, 1, -1, -1, 1, -1, 5, 5, 10, 110, 2, 3, 3, 1, 20, 0, '+6/11', 'dexterity' );
insert into race (
  guiId, name, strenght, dexterity, intelligence, constitution, wisdom, charisma, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, diggig, search, sustains, resists )
values ( 3, 'Elf', -1, 1, 2, -2, -1, 1, -5, 15, 15, 9, 120, 5, 6, 6, 3, 30, 0, '+8/12', 'dexterity', 'light damage' );
insert into race (
  guiId, name, strenght, dexterity, intelligence, constitution, wisdom, charisma, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, diggig, search, sustains, extra )
values ( 4, 'Hobbit', -2, 3, 2, +2, 1, 1, -10, 20, 20, 7, 110, 15, 18, 18, 4, 40, 0, '+12/15', 'experience', 'Identifies mushrooms' );
