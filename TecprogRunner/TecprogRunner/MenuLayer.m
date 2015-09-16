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
        
        self.backgroundLayerMenu = [[BackgroundLayerMenu alloc] initWithSize:size];
        [self loadButtons];
        
    }
    return self;
}

// method called when entering layer
-(void) activateLayer{
    
    [self.layer addChild:self.backgroundLayerMenu];
    [self.layer addChild:self.tapToPlayButton];
}

// load all buttons in the menu
-(void) loadButtons{

    [self loadTapToPlay];
}


-(void) changeLayer{
    
    [self.layer removeFromParent];
    self.layer = [SKNode node];
    [self addChild:self.layer];
    
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

@end
