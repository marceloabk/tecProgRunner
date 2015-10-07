//
//  BackgroundLayerMenu.m
//  TecprogRunner
//
//  Created by Henrique Dutra on 15/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "BackgroundLayerMenu.h"

@implementation BackgroundLayerMenu

-(instancetype) initWithSize: (CGSize) size{
    
    if(self = [super init]){
        
        [self addBackgroundSprite];
        
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
