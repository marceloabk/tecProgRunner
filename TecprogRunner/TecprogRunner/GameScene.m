//
//  GameScene.m
//  TecprogRunner
//
//  Created by Marcelo Cristiano Araujo Silva on 03/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene
{
    BackgroundLayer* _background;
    HudLayer* _hud;
    GameLayer* _game;
    SKNode* _sceneLayer;
}

- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        _sceneLayer = [[SKNode alloc] init];
        [self addChild:_sceneLayer];
        
        _background = [[BackgroundLayer alloc] initWithSize:self.size];
        [_sceneLayer addChild:_background];
        
        _hud = [[HudLayer alloc] initWithSize:self.size];
        [_sceneLayer addChild:_hud];
        
        _game = [[GameLayer alloc] initWithSize:self.size];
        [_sceneLayer addChild:_game];
    }
    return self;
}

-(void) didMoveToView:(SKView *)view {
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
}

-(void) update:(CFTimeInterval)currentTime {
}

@end
