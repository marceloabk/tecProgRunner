//
//  BackgroundLayerStore.m
//  TecprogRunner
//
//  Background for Player store
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "BackgroundLayerStore.h"
#import "SpriteNode.h"

@implementation BackgroundLayerStore

-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];
    
    if(self != nil){
        
        [self addBackgroundSprite];
        
    }else{
        NSException *exception = [NSException exceptionWithName:@"Background Layer Store" reason:@"Can't initialize Background Layer Store" userInfo:nil];
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
