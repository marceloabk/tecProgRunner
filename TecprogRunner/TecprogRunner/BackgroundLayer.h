//
//  BackgroundLayer.h
//  TecprogRunner
//
//  Define a background for the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.


#define GREEN_COLOR [UIColor greenColor]
#define MAGENTA_COLOR [UIColor magentaColor]
#define TILE_VELOCITY_X 100

#import "BasicLayer.h"

@class PhysicsController;

@interface BackgroundLayer : SKNode <LayerRequirements>

-(void) addBackgroundGameObjectsToPhysicsController:(PhysicsController*) physicsController;

-(void) update:(CFTimeInterval)currentTime;

@end
