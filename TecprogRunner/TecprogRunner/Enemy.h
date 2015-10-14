//
//  Enemy.h
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "GameObject.h"

#define INITIAL_ENEMY_IMAGE @"enemyIdle1"

@interface Enemy : GameObject

/**
 Throw projectile procedures
 */
-(void) throwProjectile;

/**
 Make the animation of weak enemy in idle state
 */
-(SKAction*) idleAnimation;

@end
