//
//  BackgroundLayerSettings.m
//  TecprogRunner
//
//  Background for Settings
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "BackgroundLayerSettings.h"
#import "SpriteNode.h"

@implementation BackgroundLayerSettings

-(instancetype) initWithSize:(CGSize)size{
    
    if(self = [super init]){
        [self addBackgroundSprite];
    }else{
        NSException *exception = [NSException exceptionWithName:@"Background layer settings" reason:@"Can't initialize Background Layer Settings" userInfo:nil];
        [exception raise];
    }
    
    return self;
}


-(void) addBackgroundSprite{
    
    // Setting background properties
    SpriteNode *background = [SpriteNode spriteNodeWithImageNamed:@"background" andPosition:CGPointZero
                                               anchorPoint:CGPointZero andScale:0.5 andZPosition:-1];
    
    [self addChild:background];
    
}

@end
