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

@interface GameLayer : SKNode <LayerRequirements, GameObjectsContact, physicsControllerAddBody>

@property (nonatomic) PhysicsController* physicsController;

/**
 Layer that represent GameLayer on screen
 */
@property (nonatomic) SKNode *layer;

/**
 Timer for points
*/
@property (nonatomic) NSTimer *timer;

@property (nonatomic) int pointsScored;
@property (nonatomic) int timePassed;

@property (nonatomic) PauseLayer *pauseLayer;

/**
 Update from GameLayer
 */
-(void) update:(CFTimeInterval)currentTime;

/**
 Add game layer childs
 */
-(void) activateLayer;

@end
