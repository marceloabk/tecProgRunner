//
//  GameLayer.h
//  TecprogRunner
//
//  Contain the game play
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "BasicLayer.h"

@interface GameLayer : SKNode <LayerRequirements>

/**
 Update from GameLayer
*/
-(void) update:(CFTimeInterval)currentTime;

/**
 Add game layer childs
*/
-(void) activateLayer;

@property (nonatomic) SKNode *layer;

/**
 Timer for points
*/
@property (nonatomic) NSTimer *timer;

/**
 Variable to storage points
*/
@property (nonatomic) int pointsScored;


@end
