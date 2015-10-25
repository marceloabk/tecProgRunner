//
//  EnemyGenerator.h
//  TecprogRunner
//
//  Generate Enemies in the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import <SpriteKit/SpriteKit.h>
#import "GlobalHeaders.h"

@interface EnemyGenerator : SKNode

@property (nonatomic) id <physicsControllerAddBody> physicsBodyAdder;

-(instancetype) initWithSize:(CGSize)size andBodyAdder:(id<physicsControllerAddBody>) physicsBodyAdder;
-(void)newEnemyWithScore:(unsigned int)score;

@end
