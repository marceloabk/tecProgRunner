//
//  WeakEnemy.h
//  TecprogRunner
//
//  Created by Marcelo Cristiano Araujo Silva on 28/09/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "Enemy.h"

#define INITIAL_WEAK_ENEMY_IMAGE @"weakEnemyIdle1"

@interface WeakEnemy : Enemy

/**
 Make the animation of weak enemy in idle state
*/
-(SKAction*) idleAnimation;

@end
