//
//  BackgroundLayerMenu.m
//  TecprogRunner
//
//  Principal menu background
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "BackgroundLayerMenu.h"

@implementation BackgroundLayerMenu

-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];
    
    if(self != nil){
        
        [self addBackgroundSprite];
        
    }else{
        NSException *exception = [NSException exceptionWithName:@"Background layer menu" reason:@"Can't initialize Background Layer Menu" userInfo:nil];
        [exception raise];
    }
    
    return self;
}


-(void) addBackgroundSprite{
    
    SpriteNode *background = [SpriteNode spriteNodeWithImageNamed:@"menuBg" andPosition:CGPointZero
                                               anchorPoint:CGPointZero andScale:0.5 andZPosition:-1];
    
    [self addChild:background];

}

@end
