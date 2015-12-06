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

// Keys to save data
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

/**
 Load data inside the singleton
*/
+(instancetype) loadInstance{
    
    DebugLog(@"Loading Game Data Instance");
    
    // Initialize game data
    GameData* gameData = [[GameData alloc] init];
    
    // Catch game data file path
    NSString *filePath = [GameData filePath];
    
    // Decode data
    NSData* decodedData = [NSData dataWithContentsOfFile: filePath];
    
    if(decodedData != nil){
        
        DebugLog(@"Setting game data using decoded data");
        gameData = [NSKeyedUnarchiver unarchiveObjectWithData:decodedData];
        
    }else{
        // Create and throw a exception
        NSException *exception = [NSException exceptionWithName:@"Game Data init" reason:@"Can't initialize Game Data" userInfo:nil];
        [exception raise];
    }
    
    return gameData;
}


-(BOOL) save{
    
    BOOL success = NO;
    
    // Get archived data
    NSData* encodedData = [NSKeyedArchiver archivedDataWithRootObject: self];
    
    // Write data to encoded data
    NSString *filePath = [GameData filePath];
    success = [encodedData writeToFile:filePath atomically:YES];
    
    return success;
}

-(instancetype) initWithCoder:(NSCoder*)decoder{
    
    NSAssert(decoder != nil, @"There's no decoder on GameData");
    
    // Initializing using superclass
    self = [super init];
    
    if(self != nil){
     
        NSLog(@"Decoding data on Game Data");
        
        // Decode all informations
        _score = [decoder decodeIntForKey: SSGameDataKey1];
        _levelJump = [decoder decodeIntForKey: SSGameDataKey2];
        _levelLuck = [decoder decodeIntForKey: SSGameDataKey3];
        _levelPower = [decoder decodeIntForKey: SSGameDataKey4];
        _levelShooting = [decoder decodeIntForKey: SSGameDataKey5];
        _levelSpeed = [decoder decodeIntForKey: SSGameDataKey6];
        _coins = [decoder decodeIntForKey: SSGameDataKey7];
        _gems = [decoder decodeIntForKey: SSGameDataKey8];
        _musicAvailibility = [decoder decodeBoolForKey: SSGameDataKey9];
        _soundEffectsAvailibility = [decoder decodeIntForKey: SSGameDataKey10];

    }else{
        // Create and throw a exception
        NSException *exception = [NSException exceptionWithName:@"Game Data init with coder" reason:@"Can't initialize Game Data With Coder" userInfo:nil];
        [exception raise];
    }
    
    return self;
}

-(void) start{

    // Define menu as the first layer activated
    self.layerActivated = menu;
    
    // Initialize the level of attributes
    self.levelJump = STARTING_LEVEL;
    self.levelLuck = STARTING_LEVEL;
    self.levelShooting = STARTING_LEVEL;
    self.levelSpeed = STARTING_LEVEL;
    self.levelPower = STARTING_LEVEL;
    self.gems = STARTING_COINS_OR_GEMS_AMOUNT;
    self.coins = STARTING_COINS_OR_GEMS_AMOUNT;
    
    self.musicAvailibility = NO;
    self.soundEffectsAvailibility = NO;
}

-(void) encodeWithCoder:(NSCoder *)encoder{
    
    NSAssert(encoder != nil, @"There's no encoder on GameData");
    
    // Encode all data
    [encoder encodeInt:self.score forKey: SSGameDataKey1];
    [encoder encodeInt:self.levelJump forKey: SSGameDataKey2];
    [encoder encodeInt:self.levelLuck forKey: SSGameDataKey3];
    [encoder encodeInt:self.levelPower forKey: SSGameDataKey4];
    [encoder encodeInt:self.levelShooting forKey: SSGameDataKey5];
    [encoder encodeInt:self.levelSpeed forKey: SSGameDataKey6];
    [encoder encodeInt:self.coins forKey: SSGameDataKey7];
    [encoder encodeInt:self.gems forKey: SSGameDataKey8];
    
}

/**
 File path used to save data
 @brief If a file path already exists, it is returned.
 @return The file path.
*/
+(NSString*) filePath{
    
    static NSString* filePath = nil;
    
    // Find file path in directories
    filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"gamedata"];
    
    
    return filePath;
}



@end
