//
//  Enemy.h
//  TecprogRunner
//
//  Distinguishes Enemy and his functions
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GameObject.h"

#define INITIAL_ENEMY_IMAGE @"enemyIdle1"
#define ENEMY_VELOCITY -100

@interface Enemy : GameObject

@property (nonatomic) int lives;

/**
 Throw projectile procedures
 */
-(void) throwProjectile;

/**
 Make the animation of weak enemy in idle state
 */
-(SKAction*) idleAnimation;

@end
