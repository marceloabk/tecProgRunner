//
//  Player.h
//  TecprogRunner
//
//  Distinguishes Player and his functions
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GameObject.h"

#define INITIAL_PLAYER_IMAGE @"playerRunning1"

@interface Player : GameObject

/**
 Boolean that indicates whether player is on the ground
*/
@property (nonatomic) BOOL playerOnGround;

/**
 run jump procedures
*/
-(void) jump;

/**
 Make the animation of player running
*/
-(SKAction*) runningAnimation;

/**
 Make the animation of player Jumping
*/
-(SKAction*) loadJumpAnimation;

/**
 Make the animation of player Falling
*/
-(SKAction*) loadFallAnimation;

/**
 Throw projectile procedures
*/
-(void) throwProjectile;

@end
