//
//  WeakEnemy.h
//  TecprogRunner
//
//  Distinguishes Weak Enemy and his functions
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "Enemy.h"

#define INITIAL_WEAK_ENEMY_IMAGE @"weakEnemyIdle1"

@interface WeakEnemy : Enemy

/**
 Make the animation of weak enemy in idle state
*/
-(SKAction*) idleAnimation;

@end
