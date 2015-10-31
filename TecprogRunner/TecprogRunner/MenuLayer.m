//
//  MenuLayer.m
//  TecprogRunner
//
//  Principal menu
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "MenuLayer.h"

@implementation MenuLayer

-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];
    
    if(self != NULL){
        
        self.layer = [SKNode node];
        [self addChild:self.layer];
        self.name = @"layer";
        
        self.backgroundLayerMenu = [[BackgroundLayerMenu alloc] initWithSize:size];
        [self loadButtons];
        
    }else{
        // Exception
    }
    
    return self;
}

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
    CGPoint position = CGPointMake(20, 360);
    
    self.settingsButton = [SpriteNode spriteNodeWithImageNamed:@"settingsButton" andPosition:position
                                                   anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
}

-(void) loadGameCenterButton{
    CGPoint position = CGPointMake(475, DEFAULT_LAYER_HEIGHT-316);
    
    self.gameCenterButton = [SpriteNode spriteNodeWithImageNamed:@"gameCenterButton" andPosition:position
                                                     anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
}

-(void) loadStoreButton{

    CGPoint position = CGPointMake(575, DEFAULT_LAYER_HEIGHT - 316);
    
    self.storeButton = [SpriteNode spriteNodeWithImageNamed:@"storeButton" andPosition:position
                                                anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
}

-(void) loadTrainingCenterButton{
    
    
    CGPoint position = CGPointMake(45, DEFAULT_LAYER_HEIGHT - 322);
    
    self.trainingCenterButton = [SpriteNode spriteNodeWithImageNamed:@"trainingCenterButton" andPosition:position
                                                         anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
}

-(void) loadTapToPlay{
    
    CGPoint position = CGPointMake(DEFAULT_LAYER_WIDTH/2, DEFAULT_LAYER_HEIGHT/2);
    CGPoint anchorPoint = CGPointMake(0.5, 0.5);
    
    self.tapToPlayButton = [SpriteNode spriteNodeWithImageNamed:@"tapToPlay" andPosition:position
                                                    anchorPoint:anchorPoint andScale:1.0 andZPosition:2];
    
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
