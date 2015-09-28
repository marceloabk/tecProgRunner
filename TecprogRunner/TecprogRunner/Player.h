//
//  Player.h
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "GameObject.h"

@interface Player : GameObject

@property (nonatomic) BOOL playerOnGround;
-(void) jump;
-(void) throwProjectile;

@end
