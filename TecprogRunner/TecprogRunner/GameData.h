//
//  GameData.h
//  TecprogRunner
//
//  Created by Henrique Dutra on 15/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

// GameData singleton that will save user data, and control layers inside the OverallScene

#import <Foundation/Foundation.h>

typedef enum {
    menu,
    store,
    game,
    settings,
    paused
} GameDataLayerType;

@interface GameData : NSObject <NSCoding>

@property (nonatomic) GameDataLayerType layerActivated;

/**
 Store high score game
 Should restart at every game start
 */
@property (nonatomic) int highScore;

/**
 Dispatch method that creates the singleton
 */
+(instancetype) sharedGameData;

/**
 Start with menu as activated layer.
*/
-(void) start;

/**
 Writing game data to local file.
*/
-(void) save;

@end
