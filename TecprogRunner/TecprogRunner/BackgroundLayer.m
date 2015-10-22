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
        
        UIColor *magenta = [UIColor magentaColor];
        UIColor *green = [UIColor greenColor];
        CGSize backgroundSize = CGSizeMake(size.width, size.height/2);
        
        // Setting grounds
        _firstGround = [[SKSpriteNode alloc] initWithColor:magenta size:backgroundSize];
        _firstGround.anchorPoint = CGPointZero;
        
        _secondGround = [[SKSpriteNode alloc] initWithColor:green size:backgroundSize];
        _secondGround.anchorPoint = CGPointZero;
        
        //Setting initials Points
        CGPoint cloudsInitialPoint = CGPointMake(_size.width, 0);
        _initialPoint = CGPointMake(_size.width, -_firstGround.size.height*0.8);
        
        // Setting background sprite initial point
        _firstGround.position = _initialPoint;
        _secondGround.position = _initialPoint;
        
        //Instantiating background clouds
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
        
        //Moviment placeholder until tile creation of tile pool do not Delete
        //Defing moviment time
        float groundMovimentTime = 8;
        float cloudMovimentTime = 240;
        float timeCorrection = 0.02;
        
        //Setting Background Moviments
        [self setBackgroundMoviment:_firstGround
                        withMoveByX:-_size.width*2
                   withInitialPoint:_initialPoint andTime:groundMovimentTime];
        
        [self setBackgroundMoviment:_firstClouds
                        withMoveByX:-(_firstClouds.size.width*2)
                   withInitialPoint:cloudsInitialPoint andTime:cloudMovimentTime];
        
        [self runAction:[SKAction waitForDuration:groundMovimentTime*0.5 - timeCorrection] completion:^{
            [self setBackgroundMoviment:_secondGround
                            withMoveByX:-_size.width*2
                       withInitialPoint:_initialPoint andTime:groundMovimentTime];
        }];
    
        [self runAction:[SKAction waitForDuration:cloudMovimentTime*0.5 - timeCorrection] completion:^{
            
            _secondClouds.position = cloudsInitialPoint;
            [self setBackgroundMoviment:_secondClouds
                            withMoveByX:-(_secondClouds.size.width*2)
                       withInitialPoint:cloudsInitialPoint andTime:cloudMovimentTime];
        }];
        
        SKSpriteNode* ground = [[SKSpriteNode alloc] initWithColor:green size:backgroundSize];
        ground.anchorPoint = CGPointZero;
        ground.position = CGPointMake(0, -ground.size.height*0.8);
        
        [ground runAction:[SKAction moveByX:-ground.size.width y:0 duration:groundMovimentTime]];

        
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

@end
