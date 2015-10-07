//
//  BackgroundLayerSettings.m
//  TecprogRunner
//
//  Created by Henrique Dutra on 24/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "BackgroundLayerSettings.h"

@implementation BackgroundLayerSettings

-(instancetype) initWithSize: (CGSize) size{
    
    if(self = [super init]){
        
        [self addBackgroundSprite];
    }
    return self;
}


-(void) addBackgroundSprite{
    
    self.background = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImageNamed:@"background"]];
    self.background.position =CGPointZero;
    self.background.anchorPoint = CGPointZero;
    [self.background setScale:0.5];
    
    self.background.zPosition = -1;
    
    [self addChild:self.background];
    
}

@end
