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
    
    SKSpriteNode* _pauseButton;

    // Time variables
    NSTimeInterval _deltaTime;
    NSTimeInterval _lastUpdateTime;
    
    
}

-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];
    if(self){
        _size = size;
        self.name = @"layer";
        
    }
    return self;
}

-(void) prepareGameLayer{
    
    _sceneLayer = [[SKNode alloc] init];
    _backgroundLayer = [[BackgroundLayer alloc] initWithSize:_size];
    _hudLayer = [[HudLayer alloc] initWithSize:_size];
    self.layer = [SKNode node];
    
    // Adding layers to game layer
    [self addChild:self.layer];
    [self.layer addChild:_sceneLayer];
    [_sceneLayer addChild:_backgroundLayer];
    [_sceneLayer addChild:_hudLayer];
    
    // Pause button
    [self loadPause];

    //Instantiating and adding to game layer
    CGPoint playerPosition = CGPointMake(50, 50);
    self.player = [[Player alloc]initWithPosition:playerPosition];
    [self.layer addChild:self.player];
    
    self.pointsScored = 0;
    [self initiateTimer];
    
}

-(void) loadPause{

    _pauseButton = [SKSpriteNode spriteNodeWithImageNamed:@"pauseButton"];
    [_pauseButton setScale:0.5];
    _pauseButton.anchorPoint = CGPointMake(0, 1);
    _pauseButton.position = CGPointMake(15, 365);
    _pauseButton.zPosition = 10000000;
    _pauseButton.name = @"pauseGame";
    
    [self addChild:_pauseButton];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    
    SKNode *node = [self nodeAtPoint:touchLocation];
    
    if([node.name isEqualToString:@"pauseGame"]){
       
        //pause or unpause game;
        [self pausedClicked];
    }
    else if((touchLocation.x < _size.width/2) && self.player.playerOnGround == true){
        NSLog(@"User clicked on left side of game layer and is on ground");
        [self.player jump];
    }else if(touchLocation.x > _size.width/2){
        NSLog(@"User clicked on right side of game layer");
        [self.player throwProjectile];
    }else{
        // Do nothing
    }
}

-(void) pausedClicked{
    
    if(self.paused ==1){
        self.paused = false;
        [self initiateTimer];
    }
    else if(self.paused != 1){
        self.paused = true;
        [self deactivateTimer];
    }
    else{
        // do nothing
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
    
    //NSLog(@"%f", _deltaTime);

}

-(void) activateLayer{
    
    [self prepareGameLayer];
    
}

-(void) deactivateTimer{

    [self.timer invalidate];
    self.timer = nil;
    
    
}

-(void) initiateTimer{
    
      self.timer = [NSTimer scheduledTimerWithTimeInterval:0.52 target:self selector:@selector(onTick) userInfo:nil repeats:YES];
}


-(void) onTick{
    
    self.pointsScored +=1;
    [_hudLayer putScoreLabel:self.pointsScored];
    
}

@end
