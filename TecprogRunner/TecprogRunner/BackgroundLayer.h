//
//  BackgroundLayer.h
//  TecprogRunner
//
//  Define a background for the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "BasicLayer.h"

@class PhysicsController;

@interface BackgroundLayer : SKNode <LayerRequirements>

-(void) addBackgroundGameObjectsToPhysicsController:(PhysicsController*) physicsController;

-(void) updateWithDeltaTime:(CFTimeInterval)deltaTime;

@end
