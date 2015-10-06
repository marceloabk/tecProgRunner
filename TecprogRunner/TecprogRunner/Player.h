//
//  Player.h
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

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
 run throw projectile procedures
*/
-(void) throwProjectile;

@end
