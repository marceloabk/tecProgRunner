//
//  GameData.m
//  TecprogRunner
//
//  Singleton that will save user data, and control layers inside the OverallScene
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GameData.h"

#define STARTING_LEVEL 1
#define STARTING_COINS_OR_GEMS_AMOUNT 0

@implementation GameData

// Creating keys to save data
static NSString* const SSGameDataKey1 = @"highScore";
static NSString* const SSGameDataKey2 = @"levelJump";
static NSString* const SSGameDataKey3 = @"levelLuck";
static NSString* const SSGameDataKey4 = @"levelPower";
static NSString* const SSGameDataKey5 = @"levelShooting";
static NSString* const SSGameDataKey6 = @"levelSpeed";
static NSString* const SSGameDataKey7 = @"coins";
static NSString* const SSGameDataKey8 = @"gems";
static NSString* const SSGameDataKey9 = @"musicAvailibility";
static NSString* const SSGameDataKey10 = @"soundEffectsAvailibility";


+(instancetype) sharedGameData{
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self loadInstance];
    });
    
    return sharedInstance;
}

// Load data inside the singleton
+(instancetype) loadInstance{
    
    NSData* decodedData = [NSData dataWithContentsOfFile: [GameData filePath]];
    
    if (decodedData) {
        GameData* gameData = [NSKeyedUnarchiver unarchiveObjectWithData:decodedData];
        return gameData;
    }
    
    return [[GameData alloc] init];
}


-(void) save{
    
    NSData* encodedData = [NSKeyedArchiver archivedDataWithRootObject: self];
    [encodedData writeToFile:[GameData filePath] atomically:YES];
    
}

-(instancetype) initWithCoder:(NSCoder *)decoder{
    
    self = [self init];
    
    if (self){
     
        _highScore = [decoder decodeIntForKey: SSGameDataKey1];
        _levelJump = [decoder decodeIntForKey: SSGameDataKey2];
        _levelLuck = [decoder decodeIntForKey: SSGameDataKey3];
        _levelPower = [decoder decodeIntForKey: SSGameDataKey4];
        _levelShooting = [decoder decodeIntForKey: SSGameDataKey5];
        _levelSpeed = [decoder decodeIntForKey: SSGameDataKey6];
        _coins = [decoder decodeIntForKey: SSGameDataKey7];
        _gems = [decoder decodeIntForKey: SSGameDataKey8];
        _musicAvailibility = [decoder decodeBoolForKey: SSGameDataKey9];
        _soundEffectsAvailibility = [decoder decodeIntForKey: SSGameDataKey10];

    }
    
    return self;
}

// Will be called the first time the user enters the game
-(void) start{

    self.layerActivated = menu;
    
    self.levelJump = STARTING_LEVEL;
    self.levelLuck = STARTING_LEVEL;
    self.levelShooting = STARTING_LEVEL;
    self.levelSpeed = STARTING_LEVEL;
    self.levelPower = STARTING_LEVEL;
    self.gems = STARTING_COINS_OR_GEMS_AMOUNT;
    self.coins = STARTING_COINS_OR_GEMS_AMOUNT;
    
    self.musicAvailibility = true;
    self.soundEffectsAvailibility = true;
}

-(void) encodeWithCoder:(NSCoder *)encoder{
    
    [encoder encodeInt:self.highScore forKey: SSGameDataKey1];
    [encoder encodeInt:self.levelJump forKey: SSGameDataKey2];
    [encoder encodeInt:self.levelLuck forKey: SSGameDataKey3];
    [encoder encodeInt:self.levelPower forKey: SSGameDataKey4];
    [encoder encodeInt:self.levelShooting forKey: SSGameDataKey5];
    [encoder encodeInt:self.levelSpeed forKey: SSGameDataKey6];
    [encoder encodeInt:self.coins forKey: SSGameDataKey7];
    [encoder encodeInt:self.gems forKey: SSGameDataKey8];
    
}

// Create a file path to save data
+(NSString*) filePath{
    
    static NSString* filePath = nil;
    
    if (filePath == NULL){
        filePath =
        [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
         stringByAppendingPathComponent:@"gamedata"];
    }
    
    return filePath;
}



@end
