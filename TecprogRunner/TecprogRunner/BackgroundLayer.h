//
//  BackgroundLayer.h
//  TecprogRunner
//
//  Define a background for the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "BasicLayer.h"

@interface BackgroundLayer : SKNode <LayerRequirements>

@property (nonatomic) id<physicsControllerAddBody> physicsBodyAdder;

-(void) updateWithDeltaTime:(CFTimeInterval)deltaTime;

-(instancetype) initWithSize:(CGSize)size andBodyAdder:(id<physicsControllerAddBody>) physicsBodyAdder;

@end
