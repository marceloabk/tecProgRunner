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
 Update background using a time
*/
-(void) updateWithDeltaTime:(CFTimeInterval)deltaTime;

/**
 Init background with a size
 and a Body Adder
*/
-(instancetype) initWithSize:(CGSize)size andBodyAdder:(id<physicsControllerAddBody>)physicsBodyAdder;

@end
