//
//  MenuLayer.m
//  TecprogRunner
//
//  Principal menu
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "MenuLayer.h"
#import "BackgroundLayerMenu.h"

@implementation MenuLayer{
    BackgroundLayerMenu *_backgroundLayerMenu;
    SpriteNode *_tapToPlayButton;
    SpriteNode *_storeButton;
    SpriteNode *_settingsButton;
    SpriteNode *_gameCenterButton;
    SpriteNode *_trainingCenterButton;
    
}

-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];
    
    if(self != nil){
        
        self.layer = [SKNode node];
        [self addChild:self.layer];
        self.name = @"layer";
        
        _backgroundLayerMenu = [[BackgroundLayerMenu alloc] initWithSize:size];
        [self loadButtons];
        
    }else{
        NSException *exception = [NSException exceptionWithName:@"Menu layer" reason:@"Can't initialize Menu Layer" userInfo:nil];
        [exception raise];
    }
    
    return self;
}

-(void) activateLayer{
    
    [self.layer addChild:_backgroundLayerMenu];
    [self.layer addChild:_tapToPlayButton];
    [self.layer addChild:_storeButton];
    [self.layer addChild:_settingsButton];
    [self.layer addChild:_trainingCenterButton];
    [self.layer addChild:_gameCenterButton];
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
    
    _settingsButton = [SpriteNode spriteNodeWithImageNamed:@"settingsButton" andPosition:position
                                                   anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
}

-(void) loadGameCenterButton{
    CGPoint position = CGPointMake(475, DEFAULT_LAYER_HEIGHT-316);
    
    _gameCenterButton = [SpriteNode spriteNodeWithImageNamed:@"gameCenterButton" andPosition:position
                                                     anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
}

-(void) loadStoreButton{

    CGPoint position = CGPointMake(575, DEFAULT_LAYER_HEIGHT - 316);
    
    _storeButton = [SpriteNode spriteNodeWithImageNamed:@"storeButton" andPosition:position
                                                anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
}

-(void) loadTrainingCenterButton{
    
    
    CGPoint position = CGPointMake(45, DEFAULT_LAYER_HEIGHT - 322);
    
    _trainingCenterButton = [SpriteNode spriteNodeWithImageNamed:@"trainingCenterButton" andPosition:position
                                                         anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
}

-(void) loadTapToPlay{
    
    CGPoint position = CGPointMake(DEFAULT_LAYER_WIDTH/2, DEFAULT_LAYER_HEIGHT/2);
    CGPoint anchorPoint = CGPointMake(0.5, 0.5);
    
   _tapToPlayButton = [SpriteNode spriteNodeWithImageNamed:@"tapToPlay" andPosition:position
                                                    anchorPoint:anchorPoint andScale:1.0 andZPosition:2];
    
    // Actions to fade in and out
    SKAction *action1 = [SKAction fadeAlphaTo:0.1 duration:1];
    SKAction *action3 = [SKAction fadeAlphaTo:1 duration:1];
    SKAction *action4 = [SKAction sequence:@[action1, action3]];
    
    [_tapToPlayButton runAction: [SKAction repeatActionForever:action4]];
}

-(void) changeLayer{
    
    [self.layer removeFromParent];
    self.layer = [SKNode node];
    [self addChild:self.layer];
    
}

@end
