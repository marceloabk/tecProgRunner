//
//  Enemy.h
//  TecprogRunner
//
//  Distinguishes Enemy and his functions
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GameEntity.h"

#define INITIAL_ENEMY_IMAGE @"enemyIdle1"
#define ENEMY_VELOCITY -100

@interface Enemy : GameEntity

/**
 Represent the health of the enemy
*/
@property (nonatomic) int health;


/**
 Generate a physics body to enemy
 @return (SKPhysicsBody*) The instance of the enemy physics body
*/
-(SKPhysicsBody *) generatePhysicsBody;

@end
