//
//  EnemyGenerator.h
//  TecprogRunner
//
//  Generate Enemies in the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import <SpriteKit/SpriteKit.h>
#import "GlobalHeaders.h"


#define MARGIN 80.0
#define FLOOR_HEIGHT 50.0
#define SHORT_PROBABILITY_VALUE 40.0
#define MEDIUM_PROBABILITY_VALUE 400.0

@interface EnemyGenerator : SKNode

/**
 Used to add physics bodies into game
*/
@property (nonatomic) id <physicsControllerAddBody> physicsBodyAdder;

/**
 Initialize the Enemy Generator
 @param size CGSize
 @param physicsBodyAdder id<physicsControllerAddBody> Controller used to add bodies
*/
-(instancetype) initWithSize:(CGSize)size andBodyAdder:(id<physicsControllerAddBody>)physicsBodyAdder;

/**
 Create a new enemy according to score
 The dificulty is proporcional to score
 @param score unsigned int Actual score in game
*/
-(void)newEnemyWithScore:(unsigned int)score;

@end
