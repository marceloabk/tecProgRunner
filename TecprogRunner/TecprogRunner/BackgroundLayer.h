//
//  BackgroundLayer.h
//  TecprogRunner
//
//  Define a background for the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "BasicLayer.h"
#import "TileGenerator.h"

@interface BackgroundLayer : SKNode <LayerRequirements>

/**
 Used to add physics bodies to Physics Controller
*/
@property (nonatomic) id<physicsControllerAddBody> physicsBodyAdder;

/**
 Update background
 @param deltaTime elapsed time
*/
-(void) updateWithDeltaTime:(CFTimeInterval)deltaTime;

/**
 Initialize background layer
 @param size Size of the screen
 @param physicsBodyAdder Controller used to add bodies
*/
-(instancetype) initWithSize:(CGSize)size andBodyAdder:(id<physicsControllerAddBody>)physicsBodyAdder;

@end
