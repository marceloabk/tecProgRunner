//
//  Player.h
//  TecprogRunner
//
//  Distinguishes Player and his functions
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GameObject.h"
#import "GlobalHeaders.h"

#define INITIAL_PLAYER_IMAGE @"playerRunning1"

typedef enum playerMoviments{
    PlayerMovimentRun,
    PlayerMovimentJump,
    PlayerMovimentFall
}playerMoviments;

@interface Player : GameObject

@property (nonatomic) id <physicsControllerAddBody> physicsBodyAdder;

/**
 Boolean that indicates whether player is on the ground
*/
@property (nonatomic) BOOL playerOnGround;
@property (nonatomic) playerMoviments moviment;

/**
 run jump procedures
*/
-(void) jump;

/**
 Throw projectile procedures
*/
-(void) throwProjectile;

@end
