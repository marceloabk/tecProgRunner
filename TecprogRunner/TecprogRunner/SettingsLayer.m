//
//  SettingsLayer.m
//  TecprogRunner
//
//  Contain buttons to configurate the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "SettingsLayer.h"
#import "GameData.h"

@implementation SettingsLayer

-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];

    if(self != NULL){
    
        self.layer = [SKNode node];
        [self addChild:self.layer];
        
        self.name = @"layer";
        
        [self loadBackground];
        [self loadButtons];
        
    
    }else{
        // Exception
    }
    return self;
}


-(void) loadBackground{

    self.backgroundLayerSettings = [[BackgroundLayerSettings alloc] initWithSize:CGSizeMake(667, 375)];

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
    }
    else{
        soundEffects = @"volumeOff";
    }

    self.musicButton = [SKSpriteNode spriteNodeWithImageNamed:soundEffects];
    self.musicButton.position = CGPointMake(142, 375-150);
    self.musicButton.anchorPoint = CGPointMake(0, 1);
    self.musicButton.name = @"musicButton";
    self.musicButton.zPosition = 2;
    [self.musicButton setScale:0.5];
}

-(void) loadMusic{

    NSString *music;

    if([GameData sharedGameData].musicAvailibility){
        music = @"volumeOn";
    }
    else{
        music = @"volumeOff";
    }
    self.soundEffectsButton = [SKSpriteNode spriteNodeWithImageNamed:music];
    self.soundEffectsButton.position = CGPointMake(432, 375-150);
    self.soundEffectsButton.anchorPoint = CGPointMake(0, 1);
    self.soundEffectsButton.name = @"soundEffectsButton";
    self.soundEffectsButton.zPosition = 2;
    [self.soundEffectsButton setScale:0.5];

}

-(void) loadBack{
    
    self.backButton = [SKSpriteNode spriteNodeWithImageNamed:@"backButton"];
    self.backButton.position = CGPointMake(30, 363);
    self.backButton.anchorPoint = CGPointMake(0, 1);
    self.backButton.name = @"backButtonSettings";
    self.backButton.zPosition = 2;
    [self.backButton setScale:0.5];
    
}

-(void) activateLayer{

    [self.layer addChild:self.backgroundLayerSettings];
    [self.layer addChild:self.backButton];
    [self.layer addChild:self.musicButton];
    [self.layer addChild:self.soundEffectsButton];

}


@end
