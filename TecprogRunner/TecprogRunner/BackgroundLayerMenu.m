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
    
    if(self != NULL){
        
        [self addBackgroundSprite];
        
    }else{
        // Exception
    }
    return self;
}


-(void) addBackgroundSprite{

    self.background = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImageNamed:@"menuBg"]];
    self.background.position =CGPointZero;
    self.background.anchorPoint = CGPointZero;
    [self.background setScale:0.5];
    
    self.background.zPosition = -1;
    
    [self addChild:self.background];

}

@end
