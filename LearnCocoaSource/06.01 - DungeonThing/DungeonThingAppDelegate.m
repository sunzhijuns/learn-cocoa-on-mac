//
//  DungeonThingAppDelegate.m
//  DungeonThing
//
//  Created by JN on 7/1/09.
//  Copyright 2009 Rebisoft Inc. All rights reserved.
//

#import "DungeonThingAppDelegate.h"

#define kMonsterBootyFrequency @"monsterBootyFrequency"
#define kMonsterTypeAllowedOrc @"monsterTypeAllowedOrc"
#define kMonsterTypeAllowedGoblin @"monsterTypeAllowedGoblin"
#define kMonsterTypeAllowedOgre @"monsterTypeAllowedOgre"
#define kMonsterTypeAllowedSkeleton @"monsterTypeAllowedSkeleton"
#define kMonsterTypeAllowedTroll @"monsterTypeAllowedTroll"
#define kMonsterTypeAllowedVampire @"monsterTypeAllowedVampire"
#define kMonsterTypeAllowedSuccubus @"monsterTypeAllowedSuccubus"
#define kMonsterTypeAllowedShuggoth @"monsterTypeAllowedShuggoth"

#define kCharacterMaxNameLength @"characterMaxNameLength"
#define kCharacterStatsGenerationPolicy @"characterStatsGenerationPolicy"
#define kCharacterClassAllowedPaladin @"characterClassAllowedPaladin"
#define kCharacterClassAllowedBard @"characterClassAllowedBard"
#define kCharacterClassAllowedFighter @"characterClassAllowedFighter"
#define kCharacterClassAllowedCleric @"characterClassAllowedCleric"
#define kCharacterClassAllowedRogue @"characterClassAllowedRogue"
#define kCharacterClassAllowedMonk @"characterClassAllowedMonk"
#define kCharacterClassAllowedMagicUser @"characterClassAllowedMagicUser"
#define kCharacterClassAllowedThief @"characterClassAllowedThief"
#define kDungeonTunnelTwistiness @"dungeonTunnelTwistiness"
#define kDungeonMonsterFrequency @"dungeonMonsterFrequency"
#define kDungeonTreasureFrequency @"dungeonTreasureFrequency"

@implementation DungeonThingAppDelegate

@synthesize characters;
@synthesize monsters;
@synthesize dungeons;

+ (void)initialize
{
  [[NSUserDefaults standardUserDefaults] registerDefaults:
   [NSDictionary dictionaryWithObjectsAndKeys:
    [NSNumber numberWithInt:1], kMonsterBootyFrequency,
    [NSNumber numberWithBool:YES], kMonsterTypeAllowedOrc,
    [NSNumber numberWithBool:YES], kMonsterTypeAllowedGoblin,
    [NSNumber numberWithBool:YES], kMonsterTypeAllowedOgre,
    [NSNumber numberWithBool:YES], kMonsterTypeAllowedSkeleton,
    [NSNumber numberWithBool:YES], kMonsterTypeAllowedTroll,
    [NSNumber numberWithBool:YES], kMonsterTypeAllowedVampire,
    [NSNumber numberWithBool:YES], kMonsterTypeAllowedSuccubus,
    [NSNumber numberWithBool:YES], kMonsterTypeAllowedShuggoth,
    [NSNumber numberWithInt:7], kCharacterMaxNameLength,
    [NSNumber numberWithInt:1], kCharacterStatsGenerationPolicy,
    [NSNumber numberWithBool:YES], kCharacterClassAllowedPaladin,
    [NSNumber numberWithBool:YES], kCharacterClassAllowedBard,
    [NSNumber numberWithBool:YES], kCharacterClassAllowedFighter,
    [NSNumber numberWithBool:YES], kCharacterClassAllowedCleric,
    [NSNumber numberWithBool:YES], kCharacterClassAllowedRogue,
    [NSNumber numberWithBool:YES], kCharacterClassAllowedMonk,
    [NSNumber numberWithBool:YES], kCharacterClassAllowedMagicUser,
    [NSNumber numberWithBool:YES], kCharacterClassAllowedThief,
    [NSNumber numberWithInt:3], kDungeonTunnelTwistiness,
    [NSNumber numberWithInt:7], kDungeonMonsterFrequency,
    [NSNumber numberWithInt:1], kDungeonTreasureFrequency,
    nil]];
}

- init
{
  if ((self = [super init])) {
    characters = [NSMutableArray array];
    monsters = [NSMutableArray array];
    dungeons = [NSMutableArray array];
  }
  return self;
}

- (IBAction)createCharacter:(id)sender {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  NSMutableString *result = [NSMutableString stringWithCapacity:1024];
  [result appendString:@"Generating a character within these parameters:\n-----------------\n"];
  [result appendFormat:
    @"Maximum name length: %d\n", 
    [ud integerForKey:kCharacterMaxNameLength]];
  [result appendFormat:
   @"Stats generation policy: %d\n", 
   [ud integerForKey:kCharacterStatsGenerationPolicy]];
  [result appendFormat:
   @"Allows Paladin: %@\n", 
   [ud boolForKey:kCharacterClassAllowedPaladin] ? @"YES" : @"NO"];
  [result appendFormat:
   @"Allows Bard: %@\n", 
   [ud boolForKey:kCharacterClassAllowedBard] ? @"YES" : @"NO"];
  [result appendFormat:
   @"Allows Fighter: %@\n", 
   [ud boolForKey:kCharacterClassAllowedFighter] ? @"YES" : @"NO"];
  [result appendFormat:
   @"Allows Cleric: %@\n", 
   [ud boolForKey:kCharacterClassAllowedCleric] ? @"YES" : @"NO"];
  [result appendFormat:
   @"Allows Rogue: %@\n", 
   [ud boolForKey:kCharacterClassAllowedRogue] ? @"YES" : @"NO"];
  [result appendFormat:
   @"Allows Monk: %@\n", 
   [ud boolForKey:kCharacterClassAllowedMonk] ? @"YES" : @"NO"];
  [result appendFormat:
   @"Allows Magic-User: %@\n", 
   [ud boolForKey:kCharacterClassAllowedMagicUser] ? @"YES" : @"NO"];
  [result appendFormat:
   @"Allows Thief: %@\n", 
   [ud boolForKey:kCharacterClassAllowedThief] ? @"YES" : @"NO"];
  [characterArrayController addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                              result, @"createdObject",
                              [NSDate date], @"timestamp",
                              nil]];
}
- (IBAction)createMonster:(id)sender {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  NSMutableString *result = [NSMutableString stringWithCapacity:1024];
  [result appendString:@"Generating a monster within these parameters:\n-----------------\n"];
  [result appendFormat:
   @"Booty frequency: %d\n", 
   [ud integerForKey:kMonsterBootyFrequency]];
  [result appendFormat:
   @"Allows Orc: %@\n", 
   [ud boolForKey:kMonsterTypeAllowedOrc] ? @"YES" : @"NO"];
  [result appendFormat:
   @"Allows Goblin: %@\n", 
   [ud boolForKey:kMonsterTypeAllowedGoblin] ? @"YES" : @"NO"];
  [result appendFormat:
   @"Allows Ogre: %@\n", 
   [ud boolForKey:kMonsterTypeAllowedOgre] ? @"YES" : @"NO"];
  [result appendFormat:
   @"Allows Skeleton: %@\n", 
   [ud boolForKey:kMonsterTypeAllowedSkeleton] ? @"YES" : @"NO"];
  [result appendFormat:
   @"Allows Troll: %@\n", 
   [ud boolForKey:kMonsterTypeAllowedTroll] ? @"YES" : @"NO"];
  [result appendFormat:
   @"Allows Vampire: %@\n", 
   [ud boolForKey:kMonsterTypeAllowedVampire] ? @"YES" : @"NO"];
  [result appendFormat:
   @"Allows Succubus: %@\n", 
   [ud boolForKey:kMonsterTypeAllowedSuccubus] ? @"YES" : @"NO"];
  [result appendFormat:
   @"Allows Shuggoth: %@\n", 
   [ud boolForKey:kMonsterTypeAllowedShuggoth] ? @"YES" : @"NO"];
  [monsterArrayController addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                       result, @"createdObject",
                                       [NSDate date], @"timestamp",
                                       nil]];
}
- (IBAction)createDungeon:(id)sender {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  NSMutableString *result = [NSMutableString stringWithCapacity:1024];
  [result appendString:@"Generating a dungeon within these parameters:\n-----------------\n"];
  [result appendFormat:
   @"Tunnel twistiness: %d\n", 
   [ud integerForKey:kDungeonTunnelTwistiness]];
  [result appendFormat:
   @"Monster frequency: %d\n", 
   [ud integerForKey:kDungeonMonsterFrequency]];
  [result appendFormat:
   @"Treasure frequency: %d\n", 
   [ud integerForKey:kDungeonTreasureFrequency]];
  [dungeonArrayController addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                     result, @"createdObject",
                                     [NSDate date], @"timestamp",
                                     nil]];
}

@end
