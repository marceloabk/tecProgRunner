//
//  PhysicsController.h
//  TecprogRunner
//
//  Control physics inside the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GlobalHeaders.h"
#import "GameObject.h"

#define GRAVITY 25

@interface PhysicsController : NSObject <SKPhysicsContactDelegate>

/**
 Array of bodies inside physics world
*/
@property (nonatomic) NSMutableArray<GameObject*> *bodies;

/**
 Each frame physics controller updates physics world, applying bodies velocities.
*/
-(void) update:(CFTimeInterval)currentTime;

@end
