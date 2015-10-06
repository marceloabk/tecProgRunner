//
//  GameLayer.h
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

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
