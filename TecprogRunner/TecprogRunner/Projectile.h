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
#define ENEMY_NAME @"StrongEnemy"

@class GameEntity;

@interface Projectile : GameObject


@property (nonatomic) GameEntity *owner;

/**
 Initialize the projectile
 @param position CGPoint initial position of projectile
 @param ownerName NSString containing the name of the class of the owner
 @return instancetype The instance of a bullet moving
*/
-(instancetype) initWithPosition:(CGPoint)position andOwner:(GameEntity*)owner;

@end
