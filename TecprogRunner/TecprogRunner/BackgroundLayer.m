//
//  BackgroundLayer.m
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "BackgroundLayer.h"

@implementation BackgroundLayer{
    CGSize _size;
    float backgroundDefaultVelocity;
}

-(instancetype) initWithSize:(CGSize)size{
    self = [super init];
    if(self != NULL){
        
        _size = size;
        self.background = [[SKSpriteNode alloc] initWithColor:[UIColor magentaColor] size:CGSizeMake(size.width, size.height/2)];
        
        self.background.anchorPoint = CGPointZero;
        
        // Setting background sprite initial point
        CGPoint initialPoint = CGPointMake(_size.width, 0);
        self.background.position = initialPoint;
        
        // Setting backgroundMoviment
        SKAction* backgroundMoviment = [SKAction moveByX:-self.background.size.width*2 y:0 duration:6];
        SKAction* setBackgroundPosition = [SKAction moveTo:initialPoint duration:0.0];
        SKAction* backgroundMovimentSequence = [SKAction sequence:@[backgroundMoviment, setBackgroundPosition]];
        
        // Running background moviment sequence
        [self.background runAction:[SKAction repeatActionForever:backgroundMovimentSequence] withKey:@"backgroundMoviment"];
        
        // Adding background to view
        [self addChild:self.background];
    }else{
        // Throw exception
    }
    
    return self;
}

@end
