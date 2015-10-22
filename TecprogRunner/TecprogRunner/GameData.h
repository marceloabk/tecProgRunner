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

@property (nonatomic) GameDataLayerType layerActivated;

/**
 Used to store game high score
 Should restart at every game start
*/
@property (nonatomic) unsigned int highScore;

// characters atributes
@property (nonatomic) unsigned int levelJump;
@property (nonatomic) unsigned int levelLuck;
@property (nonatomic) unsigned int levelPower;
@property (nonatomic) unsigned int levelShooting;
@property (nonatomic) unsigned int levelSpeed;

//Dispatch method that creates the singleton
+(instancetype) sharedGameData;

// Start with menu as activated layer.
-(void) start;

//Writing game data to local file.
-(void) save;



@end
