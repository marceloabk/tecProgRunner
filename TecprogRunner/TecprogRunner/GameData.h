//
//  GameData.h
//  TecprogRunner
//
//  Singleton that will save user data, and control layers inside the OverallScene
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GlobalHeaders.h"

typedef enum {
    menu,
    store,
    game,
    settings,
    trainingCenter,
} GameDataLayerType;

@interface GameData : NSObject <NSCoding>

/**
 Identify which layer is activated at time
*/
@property (nonatomic) GameDataLayerType layerActivated;

/**
 Store game current score
 Should restart at every game start
 */
@property (nonatomic) unsigned int currentScore;

/**
 Store game high score
 Should not restart at every game start
*/
@property (nonatomic) unsigned int highScore;

/**
 Store the player jump level
*/
@property (nonatomic) unsigned int levelJump;

/**
 Store the player luck level
 */
@property (nonatomic) unsigned int levelLuck;

/**
 Store the player power level
 */
@property (nonatomic) unsigned int levelPower;

/**
 Store the player shooting level
 */
@property (nonatomic) unsigned int levelShooting;

/**
 Store the player speed level
 */
@property (nonatomic) unsigned int levelSpeed;

/**
 Dispatch method that creates the singleton
*/
+(instancetype) sharedGameData;

/**
 Start the GameData
 with pre-defined configuration
*/
-(void) start;

/**
 Write GameData to a local file
*/
-(void) save;



@end
