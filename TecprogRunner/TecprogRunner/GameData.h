//
//  GameData.h
//  TecprogRunner
//
//  Singleton that will save user data, and control layers inside the OverallScene
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GlobalHeaders.h"

@interface GameData : NSObject <NSCoding>

/**
 Identify which layer is activated at time
 @return GameDataLayerType
*/
@property (nonatomic) GameDataLayerType layerActivated;

/**
 Store game score.
*/
@property (nonatomic) unsigned int score;

/**
 Store the player jump level.
*/
@property (nonatomic) unsigned int levelJump;

/**
 Store the player luck level.
*/
@property (nonatomic) unsigned int levelLuck;

/**
 Store the player power level.
*/
@property (nonatomic) unsigned int levelPower;

/**
 Store the player shooting level.
*/
@property (nonatomic) unsigned int levelShooting;

/**
 Store the player speed level.
*/
@property (nonatomic) unsigned int levelSpeed;

/**
 Store the amount of coins.
*/
@property (nonatomic) unsigned int coins;

/**
 Store the amount of gems.
*/
@property (nonatomic) unsigned int gems;

/**
 Music.
*/
@property (nonatomic) BOOL musicAvailibility;


/**
 Sound effects.
*/
@property (nonatomic) BOOL soundEffectsAvailibility;

/**
 Dispatch method that creates the singleton.
 @return The actual instance of Game Data if succeeds.
*/
+(instancetype) sharedGameData;

/**
 Start the GameData.
 with pre-defined configuration
*/
-(void) start;

/**
 Write GameData to a local file.
 @return YES if the operation succeed, NO otherwise.
*/
-(BOOL) save;



@end
