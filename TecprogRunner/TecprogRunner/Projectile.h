//
//  Projectile.h
//  TecprogRunner
//
//  Distinguishes Projectile and his functions
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GameObject.h"

#define DEFAULT_PROJECTILE_IMAGE @"projectile"
#define PLAYER_NAME @"Player"
#define ENEMY_NAME @"Enemy"

@interface Projectile : GameObject

/**
 Initialize the projectile with a position
 and a string representing the class of the owner
*/
-(instancetype) initWithPosition:(CGPoint)position andOwner:(NSString*)ownerName;

@end
