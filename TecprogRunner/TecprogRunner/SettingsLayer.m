//
//  SettingsLayer.m
//  TecprogRunner
//
//  Contain buttons to configurate the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "SettingsLayer.h"

@implementation SettingsLayer

-(instancetype)initWithSize:(CGSize)size{

    if(self = [super init]){
    
        self.layer = [SKNode node];
        [self addChild:self.layer];
        
        self.name = @"layer";
        
        [self loadBackground];
        [self loadButtons];
        
    
    }
    return self;
}


-(void) loadBackground{

    self.backgroundLayerSettings = [[BackgroundLayerSettings alloc] initWithSize:CGSizeMake(667, 375)];

}

-(void) loadButtons{
    
    [self loadBack];
}

-(void) loadBack{
    
    self.backButton = [SKSpriteNode spriteNodeWithImageNamed:@"backButton"];
    self.backButton.position = CGPointMake(30, 363);
    self.backButton.anchorPoint = CGPointMake(0, 1);
    self.backButton.name = @"backButtonSettings";
    self.backButton.zPosition = 2;
    [self.backButton setScale:0.5];
    
}

-(void)activateLayer{

    [self.layer addChild:self.backgroundLayerSettings];
    [self.layer addChild:self.backButton];

}


@end
