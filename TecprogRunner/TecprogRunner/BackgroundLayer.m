//
//  BackgroundLayer.m
//  TecprogRunner
//
//  Define a background for the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "BackgroundLayer.h"

@implementation BackgroundLayer{
    
    CGSize _size;
    CGPoint _initialPoint;
    float backgroundDefaultVelocity;
    SKSpriteNode* _firstGround;
    SKSpriteNode* _secondGround;
    
    SKSpriteNode* _firstClouds;
    SKSpriteNode* _secondClouds;
}

-(instancetype) initWithSize:(CGSize)size{
    self = [super init];
    
    if(self != NULL){
        
        _size = size;
        
        CGSize backgroundSize = CGSizeMake(_size.width,_size.height/2);
        
        [self setGroundsWithBackgroundSize:backgroundSize];
        [self setClouds];
        [self setAllBackgroundMoviment];
        
        SKSpriteNode* ground = [[SKSpriteNode alloc] initWithColor:GREEN_COLOR size:backgroundSize];
        ground.anchorPoint = CGPointZero;
        ground.position = CGPointMake(0, -ground.size.height*0.8);
        
        [ground runAction:[SKAction moveByX:-ground.size.width y:0 duration:GROUND_MOVIMENT_TIME]];

        
        // Adding clouds to view
        [self addChild:_firstClouds];
        [self addChild:_secondClouds];
        
        // Adding background to view
        [self addChild:ground];
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

-(void) setAllBackgroundMoviment{
    
    CGPoint cloudsInitialPoint = CGPointMake(_size.width, 0);
    
    [self setBackgroundMoviment:_firstGround
                    withMoveByX:-_size.width*2
               withInitialPoint:_initialPoint andTime:GROUND_MOVIMENT_TIME];
    
    [self setBackgroundMoviment:_firstClouds
                    withMoveByX:-(_firstClouds.size.width*2)
               withInitialPoint:cloudsInitialPoint andTime:CLOUD_MOVIMENT_TIME];
    
    [self runAction:[SKAction waitForDuration:GROUND_MOVIMENT_TIME*0.5 - TIME_CORRECTION] completion:^{
        [self setBackgroundMoviment:_secondGround
                        withMoveByX:-_size.width*2
                   withInitialPoint:_initialPoint andTime:GROUND_MOVIMENT_TIME];
    }];
    
    [self runAction:[SKAction waitForDuration:CLOUD_MOVIMENT_TIME*0.5 - TIME_CORRECTION] completion:^{
        
        _secondClouds.position = cloudsInitialPoint;
        [self setBackgroundMoviment:_secondClouds
                        withMoveByX:-(_secondClouds.size.width*2)
                   withInitialPoint:cloudsInitialPoint andTime:CLOUD_MOVIMENT_TIME];
    }];
}

// Instantiating background ground
-(void) setGroundsWithBackgroundSize:(CGSize)backgroundSize{
    
    _firstGround = [[SKSpriteNode alloc] initWithColor:MAGENTA_COLOR size:backgroundSize];
    _firstGround.anchorPoint = CGPointZero;
    
    _secondGround = [[SKSpriteNode alloc] initWithColor:GREEN_COLOR size:backgroundSize];
    _secondGround.anchorPoint = CGPointZero;
    
    _initialPoint = CGPointMake(_size.width, -_firstGround.size.height*0.8);
    
    // Setting background sprite initial point
    _firstGround.position = _initialPoint;
    _secondGround.position = _initialPoint;

}


// Instantiating background Clouds
-(void) setClouds{
    _firstClouds = [[SKSpriteNode alloc] initWithImageNamed:@"background_Clouds"];
    _firstClouds.size = CGSizeMake(2160, _size.height);
    _firstClouds.position = CGPointZero;
    _firstClouds.anchorPoint = CGPointZero;
    _firstClouds.zPosition = -1;
    
    _secondClouds = [[SKSpriteNode alloc] initWithImageNamed:@"background_Clouds"];
    _secondClouds.size = CGSizeMake(2160, _size.height);
    _secondClouds.position = CGPointMake(0, -_size.height);
    _secondClouds.anchorPoint = CGPointZero;
    _secondClouds.zPosition = -1;
}

@end
