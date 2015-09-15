//
//  BackgroundLayer.m
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "BackgroundLayer.h"

@implementation BackgroundLayer
{
    CGSize _size;
    float backgroundDefaultVelocity;
}

- (instancetype) initWithSize:(CGSize)size
{
    self = [super init];
    if(self){
        
        _size = size;
        self.background = [[SKSpriteNode alloc] initWithColor:[UIColor magentaColor] size:CGSizeMake(size.width/2, size.height/2)];
        
        self.background.anchorPoint = CGPointZero;
        
        backgroundDefaultVelocity = -50;
        
        [self addChild:self.background];
    }
    return self;
}

- (void) moveBackgroundWithDeltaTime:(NSTimeInterval) deltaTime {

    //Adapting velocity with frame time
    CGPoint amountToMove = CGPointMake(backgroundDefaultVelocity * deltaTime, 0);
    
    //Updating sprite position
    CGPoint bgPos = self.background.position;
    self.background.position = CGPointMake(bgPos.x + amountToMove.x, bgPos.y);

    //Resetting background position if it passes the left border
    if(self.background.position.x <= self.position.x - self.background.size.width) {
        self.background.position = CGPointMake(_size.width, 0);
    }
}

@end
