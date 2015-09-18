//
//  GameLayer.m
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "GameLayer.h"
#import "Player.h"
#import "HudLayer.h"
#import "BackgroundLayer.h"

@interface GameLayer()

@property (nonatomic) Player *player;

@end

@implementation GameLayer
{
    CGSize _size;
    
    BackgroundLayer *_backgroundLayer;
    HudLayer* _hudLayer;
    SKNode* _sceneLayer;
    
    // Time variables
    NSTimeInterval _deltaTime;
    NSTimeInterval _lastUpdateTime;
}

-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];
    if(self){
        _size = size;
        
        self.player = [[Player alloc]init];
        
        [self prepareGameLayer];
        
        [self addChild:self.player];
    }
    return self;
}

-(void) prepareGameLayer{
    
    _sceneLayer = [[SKNode alloc] init];
    _backgroundLayer = [[BackgroundLayer alloc] initWithSize:_size];
    _hudLayer = [[HudLayer alloc] initWithSize:_size];
    
    // Adding layers to scene
    [self addChild:_sceneLayer];
    [_sceneLayer addChild:_backgroundLayer];
    [_sceneLayer addChild:_hudLayer];

}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    
    if((touchLocation.x < _size.width/2) && self.player.playerOnGound == true){
        NSLog(@"User clicked on left side of game layer and is on ground");
        [self.player jump];
    }else if(touchLocation.x > _size.width/2){
        NSLog(@"User clicked on right side of game layer");
    }else{
        // Do nothing
    }
}

-(void) update:(CFTimeInterval)currentTime{
    
    // Updating frame time
    if(_lastUpdateTime){
        _deltaTime = currentTime - _lastUpdateTime;
    }else{
        _deltaTime = 0;
    }
    _lastUpdateTime = currentTime;
    
    NSLog(@"%f", _deltaTime);
}

@end
