//
//  Player.h
//  TecprogRunner
//
//  Distinguishes Player and his functions
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GameEntity.h"
#import "GlobalHeaders.h"

#define INITIAL_PLAYER_IMAGE @"playerRunning1"

/**
 Enumerate the player moviments
*/
typedef enum playerMoviments{
    PlayerMovimentRun,
    PlayerMovimentJump,
    PlayerMovimentFall
}playerMoviments;

@interface Player : GameEntity

/**
 Used to add physics bodies
*/
@property (nonatomic) id <physicsControllerAddBody> physicsBodyAdder;

/**
 Boolean that indicates whether player is on the ground
*/
@property (nonatomic) BOOL playerOnGround;

/**
 Player moviments
*/
@property (nonatomic) playerMoviments moviment;

/**
 Run jump procedures
 @return YES if the player jumped, otherwise, NO.
*/
-(BOOL) jump;

/**
 Throw projectile procedures
 @return YES if a projectile has throwed, otherwise, NO.
 */
-(BOOL) throwProjectile;

@end
