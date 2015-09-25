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
    SKSpriteNode* _firstGround;
    SKSpriteNode* _secondGround;
    SKSpriteNode* _backgroundClouds;
}

-(instancetype) initWithSize:(CGSize)size{
    self = [super init];
    if(self != NULL){
        
        _size = size;
        
        UIColor *magenta = [UIColor magentaColor];
        UIColor *green = [UIColor greenColor];
        CGSize backgroundSize = CGSizeMake(size.width, size.height/2);
        
        // Setting grounds
        _firstGround = [[SKSpriteNode alloc] initWithColor:magenta size:backgroundSize];
        _firstGround.anchorPoint = CGPointZero;
        
        _secondGround = [[SKSpriteNode alloc] initWithColor:green size:backgroundSize];
        _secondGround.anchorPoint = CGPointZero;
        
        // Setting background sprite initial point
        _initialPoint = CGPointMake(_size.width, -_firstGround.size.height*0.8);
        _firstGround.position = _initialPoint;
        
        _secondGround.position = _initialPoint;
        
        //Instantiating background clouds
        _backgroundClouds = [[SKSpriteNode alloc] initWithImageNamed:@"background_Clouds"];
        _backgroundClouds.size = CGSizeMake(2160, _size.height);
        _backgroundClouds.position = CGPointZero;
        _backgroundClouds.anchorPoint = CGPointZero;
        _backgroundClouds.zPosition = -1;
        
        
        //Moviment placeholder until tile creation of tile pool do not Delete
        //Setting Background Moviments
        [self setBackgroundMoviment:_firstGround
                        withMoveByX:-_size.width*2
                   withInitialPoint:_initialPoint andTime:12];
        
        [self runAction:[SKAction waitForDuration:5.98] completion:^{
            [self setBackgroundMoviment:_secondGround
                            withMoveByX:-_size.width*2
                       withInitialPoint:_initialPoint andTime:12];
        }];
        
        [self setBackgroundMoviment:_backgroundClouds
                        withMoveByX:-_backgroundClouds.size.width
                   withInitialPoint:_initialPoint andTime:240];
        
        // Adding clouds to view
        [self addChild:_backgroundClouds];
        
        // Adding background to view
        [self addChild:_firstGround];
        [self addChild:_secondGround];
        
    }else{
        // Throw exception
    }
    
    return self;
}

-(void) setBackgroundMoviment:(SKSpriteNode*)background
                  withMoveByX:(CGFloat)x
             withInitialPoint:(CGPoint)initialPoint
                      andTime:(NSTimeInterval) timeToReload{
    
    // Setting backgroundMoviment
    SKAction* backgroundMoviment = [SKAction moveByX:x y:0 duration:timeToReload];
    SKAction* setBackgroundPosition = [SKAction moveTo:initialPoint duration:0.0];
    
    // Creating a sequence with the actions
    SKAction* backgroundMovimentSequence = [SKAction sequence:@[backgroundMoviment, setBackgroundPosition]];
    
    // Creating Action to repeat the sequence forever
    SKAction* repeatMovimentForever = [SKAction repeatActionForever:backgroundMovimentSequence];
    
    // Running background moviment sequence
    [background runAction:repeatMovimentForever];
}

@end
