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
    
    // Setting background properties
    self.background = [SpriteNode spriteNodeWithImageNamed:@"background" andPosition:CGPointZero
                                               anchorPoint:CGPointZero andScale:0.5 andZPosition:-1];
    
    [self addChild:self.background];
    
}

@end
