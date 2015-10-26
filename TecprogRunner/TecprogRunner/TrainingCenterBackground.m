//
//  TrainingCenterBackground.m
//  TecprogRunner
//
//  Contain a background for Training Center
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "TrainingCenterBackground.h"

@implementation TrainingCenterBackground

-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];
    
    if(self != NULL){
        [self addBackgroundSprite];
    }else{
        // Exception
    }
    return self;
}


-(void) addBackgroundSprite{
    
    // Loading a texture for background
    SKTexture* backgroundTexture = [SKTexture textureWithImageNamed:@"background"];
    
    // Setting background properties
    self.background = [SKSpriteNode spriteNodeWithTexture:backgroundTexture];
    self.background.position = CGPointZero;
    self.background.anchorPoint = CGPointZero;
    self.background.zPosition = -1;
    [self.background setScale:0.5];
    
    [self addChild:self.background];
    
}



@end
