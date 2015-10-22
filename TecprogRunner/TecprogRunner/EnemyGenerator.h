//
//  EnemyGenerator.h
//  TecprogRunner
//
//  Generate Enemies in the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import <SpriteKit/SpriteKit.h>

@interface EnemyGenerator : SKNode

-(instancetype)initWithSize:(CGSize)size;
-(void)newEnemyWithScore:(unsigned int)score;

@end
