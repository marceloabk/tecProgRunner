//
//  GameLayer.m
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "GameLayer.h"
#import "Player.h"

@interface GameLayer()

@property (nonatomic) Player *player;

@end

@implementation GameLayer{
    CGSize _size;
}

-(instancetype) initWithSize:(CGSize)size{
    self = [super init];
    if(self){
        _size = size;
        
        self.player = [[Player alloc]init];
        
        [self addChild:self.player];
    }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    
    if((touchLocation.x < _size.width/2)){
        [self.player jump];
    }
}

@end
