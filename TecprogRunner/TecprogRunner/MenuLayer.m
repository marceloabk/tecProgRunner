//
//  MenuLayer.m
//  TecprogRunner
//
//  Created by Henrique Dutra on 15/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "MenuLayer.h"

@implementation MenuLayer

-(instancetype) initWithSize: (CGSize) size{
    
    if(self = [super init]){
        
        self.layer = [SKNode node];
        [self addChild:self.layer];
        self.name = @"layer";
        
        self.backgroundLayerMenu = [[BackgroundLayerMenu alloc] initWithSize:size];
        [self loadButtons];
        
    }
    return self;
}

// method called when entering layer
-(void) activateLayer{
    
    [self.layer addChild:self.backgroundLayerMenu];
    [self.layer addChild:self.tapToPlayButton];
    [self.layer addChild:self.storeButton];
    [self.layer addChild:self.settingsButton];
    [self.layer addChild:self.trainingCenterButton];
    [self.layer addChild:self.gameCenterButton];
}

// load all buttons in the menu
-(void) loadButtons{

    [self loadTapToPlay];
    [self loadStoreButton];
    [self loadSettingsButton];
    [self loadGameCenterButton];
    [self loadTrainingCenterButton];
}


-(void) loadSettingsButton{
    
    self.settingsButton = [SKSpriteNode spriteNodeWithImageNamed:@"settingsButton"];
    self.settingsButton.position = CGPointMake(20, 360);
    self.settingsButton.anchorPoint = CGPointMake(0, 1);
    self.settingsButton.name = @"settingsButton";
    self.settingsButton.zPosition = 2;
    [self.settingsButton setScale:0.5];
}

-(void) loadGameCenterButton{
    
    self.gameCenterButton = [SKSpriteNode spriteNodeWithImageNamed:@"gameCenterButton"];
    self.gameCenterButton.position = CGPointMake(475, 375-316);
    self.gameCenterButton.anchorPoint = CGPointMake(0, 1);
    self.gameCenterButton.name = @"gameCenterButton";
    self.gameCenterButton.zPosition = 2;
    [self.gameCenterButton setScale:0.5];
}

-(void) loadStoreButton{

    self.storeButton = [SKSpriteNode spriteNodeWithImageNamed:@"storeButton"];
    self.storeButton.position = CGPointMake(575, 375-316);
    self.storeButton.anchorPoint = CGPointMake(0, 1);
    self.storeButton.name = @"storeButton";
    self.storeButton.zPosition = 2;
    [self.storeButton setScale:0.5];
    
}

-(void) loadTrainingCenterButton{
    
    self.trainingCenterButton = [SKSpriteNode spriteNodeWithImageNamed:@"trainingCenterButton"];
    self.trainingCenterButton.position = CGPointMake(45, 375-306);
    self.trainingCenterButton.anchorPoint = CGPointMake(0, 1);
    self.trainingCenterButton.name = @"trainingCenterButton";
    self.trainingCenterButton.zPosition = 2;
    [self.trainingCenterButton setScale:0.5];
    
}

-(void) loadTapToPlay{
    
    self.tapToPlayButton = [SKSpriteNode spriteNodeWithImageNamed:@"tapToPlay"];
    [self.tapToPlayButton setScale:0.5];
    self.tapToPlayButton.anchorPoint = CGPointMake(0, 1);
    self.tapToPlayButton.position = CGPointMake(251, 375-234);
    self.tapToPlayButton.zPosition = 2;
    self.tapToPlayButton.name = @"tapToPlay";
    
    // actions to fade in and out
    SKAction *action1 = [SKAction fadeAlphaTo:0.1 duration:1];
    SKAction *action3 = [SKAction fadeAlphaTo:1 duration:1];
    SKAction *action4 = [SKAction sequence:@[action1, action3]];
    
    [self.tapToPlayButton runAction: [SKAction repeatActionForever:action4]];
}

-(void) changeLayer{
    
    [self.layer removeFromParent];
    self.layer = [SKNode node];
    [self addChild:self.layer];
    
}


@end
