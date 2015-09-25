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
    CGPoint _initialPoint;
    float backgroundDefaultVelocity;
}

-(instancetype) initWithSize:(CGSize)size{
    self = [super init];
    if(self != NULL){
        
        _size = size;
        
        UIColor *magenta = [UIColor magentaColor];
        CGSize backgroundSize = CGSizeMake(size.width, size.height/2);
        
        self.background = [[SKSpriteNode alloc] initWithColor:magenta size:backgroundSize];
        self.background.anchorPoint = CGPointZero;
        
        // Setting background sprite initial point
        _initialPoint = CGPointMake(_size.width, -self.background.size.height*0.8);
        self.background.position = _initialPoint;
        
        // Make the background move to a direction forever
        [self setBackgroundActions];
        
        // Adding background to view
        [self addChild:self.background];
    }else{
        // Throw exception
    }
    
    return self;
}

-(void) setBackgroundActions{
    // Setting backgroundMoviment
    SKAction* backgroundMoviment = [SKAction moveByX:-self.background.size.width*2 y:0 duration:6];
    SKAction* setBackgroundPosition = [SKAction moveTo:_initialPoint duration:0.0];
    
    // Creating a sequence with the actions
    SKAction* backgroundMovimentSequence = [SKAction sequence:@[backgroundMoviment, setBackgroundPosition]];
    
    // Creating Action to repeat the sequence forever
    SKAction* repeatMovimentForever = [SKAction repeatActionForever:backgroundMovimentSequence];
    
    // Running background moviment sequence
    [self.background runAction:repeatMovimentForever withKey:@"backgroundMoviment"];
}

@end
