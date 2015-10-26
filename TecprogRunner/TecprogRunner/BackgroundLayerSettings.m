//
//  BackgroundLayerSettings.m
//  TecprogRunner
//
//  Background for Settings
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "BackgroundLayerSettings.h"

@implementation BackgroundLayerSettings

-(instancetype) initWithSize:(CGSize)size{
    
    if(self = [super init]){
        [self addBackgroundSprite];
    }
    return self;
}


-(void) addBackgroundSprite{
    
    self.background = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImageNamed:@"backgroundSettings"]];
    self.background.position =CGPointZero;
    self.background.anchorPoint = CGPointZero;
    [self.background setScale:0.5];
    
    self.background.zPosition = -1;
    
    [self addChild:self.background];
    
}

@end
