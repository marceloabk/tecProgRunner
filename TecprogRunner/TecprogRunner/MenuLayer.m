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
        
        self.backgroundLayerMenu = [[BackgroundLayerMenu alloc] initWithSize:size];
        [self loadButtons];
        
    }
    return self;
}

// method called when entering layer
-(void) activateLayer{
    
    [self addChild:self.backgroundLayerMenu];
    [self addChild:self.tapToPlayButton];
}

// load all buttons in the menu
-(void) loadButtons{

    [self loadTapToPlay];
}

-(void) loadTapToPlay{
    
    self.tapToPlayButton = [SKSpriteNode spriteNodeWithImageNamed:@"tapToPlay"];
    [self.tapToPlayButton setScale:0.5];
    self.tapToPlayButton.anchorPoint = CGPointMake(0, 1);
    self.tapToPlayButton.position = CGPointMake(211, 375-224);
    self.tapToPlayButton.zPosition = 2;
    self.tapToPlayButton.name = @"tapToPlay";
    
    
}

@end
