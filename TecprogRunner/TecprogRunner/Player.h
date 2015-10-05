//
//  Player.h
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "GameObject.h"

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
 run throw projectile procedures
*/
-(void) throwProjectile;

@end
