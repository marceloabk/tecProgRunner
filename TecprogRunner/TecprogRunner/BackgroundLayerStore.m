//
//  BackgroundLayerStore.m
//  TecprogRunner
//
//  Background for Player store
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "BackgroundLayerStore.h"

@implementation BackgroundLayerStore

-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];
    
    if(self != nil){
        
        [self addBackgroundSprite];
        
    }else{
        // Exception
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
