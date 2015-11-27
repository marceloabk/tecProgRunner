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

@interface EnemyGenerator : SKNode <EnemyGeneratorDelegate>

/**
 Used to add physics bodies into game
*/
@property (nonatomic) id <physicsControllerAddBody> physicsBodyAdder;

/**
 Initialize the Enemy Generator with a Size and a Body Adder
*/
-(instancetype) initWithSize:(CGSize)size andBodyAdder:(id<physicsControllerAddBody>)physicsBodyAdder;

/**
 Create a new Enemy with a score
*/
-(void)newEnemyWithScore:(unsigned int)score;


@end
