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
    
    //Game layers
    BackgroundLayer* _background;
    HudLayer* _hud;
    GameLayer* _game;
    SKNode* _sceneLayer;
    
    //Time variables
    NSTimeInterval _deltaTime;
    NSTimeInterval _lastUpdateTime;
}

- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        
        //Instantiating layers
        _sceneLayer = [[SKNode alloc] init];
        _background = [[BackgroundLayer alloc] initWithSize:self.size];
        _hud = [[HudLayer alloc] initWithSize:self.size];
        _game = [[GameLayer alloc] initWithSize:self.size];

    }
    return self;
}

-(void) didMoveToView:(SKView *)view {
    
    //Adding layers to scene
    [self addChild:_sceneLayer];
    [_sceneLayer addChild:_background];
    [_sceneLayer addChild:_hud];
    [_sceneLayer addChild:_game];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
}

-(void) update:(CFTimeInterval)currentTime {
    
    //Updating frame time
    if(_lastUpdateTime) {
        _deltaTime = currentTime - _lastUpdateTime;
    } else {
        _deltaTime = 0;
    }
    _lastUpdateTime = currentTime;
    
}

-(void) moveSprite:(SKSpriteNode*) sprite withVelocity:(CGPoint) velocity {
    
    //Adapting velocity with frame time
    CGPoint amountToMove = CGPointMake(velocity.x * _deltaTime, velocity.y * _deltaTime);
    
    //Updating sprite position
    sprite.position = CGPointMake(sprite.position.x + amountToMove.x, sprite.position.y + amountToMove.y);
}

@end
