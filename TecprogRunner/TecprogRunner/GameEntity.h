//
//  GameEntity.h
//  TecprogRunner
//
//  Created by Lucas Araujo on 11/25/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "GameObject.h"

@class GameEntity;

@protocol GameEntityDelegate <NSObject>

@required
-(void) entityDied:(GameEntity*)entity;

@end

/// GameEntity Class. All characters must inherit
@interface GameEntity : GameObject

@property (nonatomic) id<GameEntityDelegate> delegate;

-(void) die;

@end

