//
//  GameEntity.m
//  TecprogRunner
//
//  Created by Lucas Araujo on 11/25/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "GameEntity.h"

@implementation GameEntity

-(void) die{
    [self.delegate entityDied:self];
    
    [self removeAllChildren];
    [self removeAllActions];
    [self removeFromParent];
}

-(void)setPosition:(CGPoint)position{
    
    [super setPosition:position];
    
    if(position.y < MINIMUN_HEIGHT){
        [self die];
    }else if(position.x < 0){
        [self die];
    }
}

@end
