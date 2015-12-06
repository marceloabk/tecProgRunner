//
//  PhysicsController.h
//  TecprogRunner
//
//  Control physics inside the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GlobalHeaders.h"
#import "GameObject.h"
#import "Coin.h"
#import "Enemy.h"
#import "Player.h"
#import "Projectile.h"

#define GRAVITY 25

@protocol GameObjectsContact <NSObject>

@required

/**
 Handle when player contact a Coin
*/
-(void) playerContactCoin:(Coin*) coin;

/**
 Handle when enemy contact a bullet
*/
-(void) Bullet:(Projectile*)bullet hittedEnemy:(Enemy*) enemy;


/**
 Handle when player contact a bullet
 */
-(void) Bullet:(Projectile*)bullet hittedPlayer:(Player*) player;

@end

@interface PhysicsController : NSObject <SKPhysicsContactDelegate>


/**
 Array of bodies inside physics world
*/
@property (nonatomic) id<GameObjectsContact> gameLayer;

/**
 Each frame physics controller updates physics world, applying bodies velocities.
*/
-(void) updateWithDeltaTime:(CFTimeInterval)deltaTime;


/**
 Add a body to Array of bodies inside physics world
 */
-(void) addBody:(GameObject*) body;

@end
