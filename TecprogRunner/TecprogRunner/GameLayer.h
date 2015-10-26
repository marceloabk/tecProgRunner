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

@interface GameLayer : SKNode <LayerRequirements, GameObjectsContact, physicsControllerAddBody>

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

/**
 Update from GameLayer
 */
-(void) update:(CFTimeInterval)currentTime;

/**
 Add game layer childs
 */
-(void) activateLayer;

@end
