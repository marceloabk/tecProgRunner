//
//  GameLayer.h
//  TecprogRunner
//
//  Contain the game play
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "BasicLayer.h"
#import "PhysicsController.h"
#import "GameData.h"
#import "PauseLayer.h"
#import "RestartGameProtocol.h"
#import "EnemyGenerator.h"

#warning Must add pause layer to hud layer

@interface GameLayer : SKNode <LayerRequirements, GameObjectsContact, physicsControllerAddBody, pauseDelegate, GameEntityDelegate>

/**
 Physics controller for Game actions
*/
@property (nonatomic) PhysicsController* physicsController;

/**
 Layer that represent GameLayer on screen
 */
@property (nonatomic) SKNode *layer;

/**
 Timer for points
*/
@property (nonatomic) NSTimer *timer;

/**
 Points scored on game
*/
@property (nonatomic) int pointsScored;

/**
 Time passed on game
*/
@property (nonatomic) int timePassed;

@property (nonatomic) PauseLayer *pauseLayer;

@property (nonatomic) id<changeLayer> layerChangeDelegate;

@property (nonatomic) id<restartDelegate> gameRestartDelegate;

@property (nonatomic) EnemyGenerator *enemyGenerator;

/**
 Update from GameLayer
 */
-(void) update:(CFTimeInterval)currentTime;

/**
 Add game layer childs
 */
-(void) activateLayer;

// Called when player die
-(void) playerDied;

@end
