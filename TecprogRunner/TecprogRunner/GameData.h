//
//  GameData.h
//  TecprogRunner
//
//  Created by Henrique Dutra on 15/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

// GameData singleton that will save user data, and control layers inside the OverallScene

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

// Store high score game
// Should restart at every game start
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
