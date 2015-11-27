//
//  SettingsLayer.m
//  TecprogRunner
//
//  Contain buttons to configurate the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "SettingsLayer.h"
#import "GameData.h"
#import "BackgroundLayerSettings.h"
#import "SpriteNode.h"

@implementation SettingsLayer{
    BackgroundLayerSettings *_backgroundLayerSettings;
    SpriteNode *_backButton;
    SpriteNode *_musicButton;
    SpriteNode *_soundEffectsButton;
}

-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];

    if(self != nil){
    
        self.layer = [SKNode node];
        [self addChild:self.layer];
        
        self.name = @"layer";
        
        [self loadBackground];
        [self loadButtons];
        
    
    }else{
        NSException *exception = [NSException exceptionWithName:@"Settings layer" reason:@"Can't initialize Settings Layer" userInfo:nil];
        [exception raise];
    }
    
    return self;
}


-(void) loadBackground{

    // Setting background size
    CGSize backgroundSize = CGSizeMake(DEFAULT_LAYER_WIDTH, DEFAULT_LAYER_HEIGHT);
    
    // Initializing background
    _backgroundLayerSettings = [[BackgroundLayerSettings alloc] initWithSize:backgroundSize];

}

-(void) loadButtons{
    
    [self loadBack];
    [self loadSoundEffects];
    [self loadMusic];
}

-(void) loadSoundEffects{

    NSString *soundEffects;
    
    if([GameData sharedGameData].soundEffectsAvailibility){
        soundEffects = @"volumeOn";
    }else{
        soundEffects = @"volumeOff";
    }

    CGPoint position = CGPointMake(142, DEFAULT_LAYER_HEIGHT - 150);
    _musicButton = [SpriteNode spriteNodeWithImageNamed:soundEffects andPosition:position
                                                anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];

}

-(void) loadMusic{

    NSString *music;

    if([GameData sharedGameData].musicAvailibility){
        music = @"volumeOn";
    }else{
        music = @"volumeOff";
    }
    
    CGPoint position = CGPointMake(432, DEFAULT_LAYER_HEIGHT - 150);
    _soundEffectsButton = [SpriteNode spriteNodeWithImageNamed:music andPosition:position
                                                       anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];

}

-(void) loadBack{
    
    CGPoint position = CGPointMake(30, 363);
    _backButton = [SpriteNode spriteNodeWithImageNamed:@"backButton" andPosition:position
                                               anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
}

-(void) activateLayer{

    [self.layer addChild:_backgroundLayerSettings];
    [self.layer addChild:_backButton];
    [self.layer addChild:_musicButton];
    [self.layer addChild:_soundEffectsButton];

}


@end
