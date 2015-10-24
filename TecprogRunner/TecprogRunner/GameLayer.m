//
//  GameLayer.m
//  TecprogRunner
//
//  Contain the game play
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GameLayer.h"
#import "Player.h"
#import "HudLayer.h"
#import "BackgroundLayer.h"
#import "Coin.h"

@interface GameLayer()

@property (nonatomic) Player *player;

@end

@implementation GameLayer{
    
    CGSize _size;
    
    BackgroundLayer *_backgroundLayer;
    HudLayer* _hudLayer;
    SKNode* _sceneLayer;
    
    SKSpriteNode* _pauseButton;
    
}

-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];
    if(self){
        _physicsController = [[PhysicsController alloc] init];
        _physicsController.gameLayer = self;
        _size = size;
        self.name = @"layer";

    }
    return self;
}

-(void) loadPause{

    _pauseButton = [SKSpriteNode spriteNodeWithImageNamed:@"pauseButton"];
    [_pauseButton setScale:0.5];
    _pauseButton.anchorPoint = CGPointMake(0, 1);
    #warning CGPoint not catalogated, it is magic point
    _pauseButton.position = CGPointMake(15, 365);
    #warning posX and posY not catalogated, it is magic numbers
    _pauseButton.zPosition = 10000000;
    #warning zPosition not catalogated, it is magic number
    _pauseButton.name = @"pauseGame";
    
    [self addChild:_pauseButton];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    
    SKNode *node = [self nodeAtPoint:touchLocation];
    
    if([node.name isEqualToString:@"pauseGame"]){
       
        // Pause or unpause game;
        [self pausedClicked];
    }
    else if((touchLocation.x < _size.width/2) && self.player.playerOnGround == true){
        DebugLog(@"User clicked on left side of game layer and is on ground");
        [self.player jump];
    }else if(touchLocation.x > _size.width/2){
        DebugLog(@"User clicked on right side of game layer");
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
        // Do nothing
    }
}

-(void) update:(CFTimeInterval)currentTime{
    
    [_physicsController update:currentTime];
    [_backgroundLayer update:currentTime];
}

-(void) activateLayer{
    
    _sceneLayer = [[SKNode alloc] init];
    _backgroundLayer = [[BackgroundLayer alloc] initWithSize:_size];
    [_backgroundLayer addBackgroundGameObjectsToPhysicsController:self.physicsController];
    _hudLayer = [[HudLayer alloc] initWithSize:_size];
    self.layer = [SKNode node];
    
    // Adding layers to game layer
    [self addChild:self.layer];
    [self.layer addChild:_sceneLayer];
    [_sceneLayer addChild:_backgroundLayer];
    [_sceneLayer addChild:_hudLayer];
    
    // Put player on the layer
    [self initializePlayer];
    
    self.pointsScored = 0;
    [self initiateTimer];
    
    //Initiating loop of coin generation
    [self generateCoin];
    
    // Pause button
    [self loadPause];
}

-(void) initializePlayer{
    // Instantiating and adding to game layer
    CGPoint playerPosition = CGPointMake(50, 200);
    self.player = [[Player alloc]initWithPosition:playerPosition];
    
    // Add player to the layer
    [self.layer addChild:self.player];
    
    [_physicsController.bodies addObject:self.player];
}

-(void) deactivateTimer{

    [self.timer invalidate];
    self.timer = nil;
    
}

-(void) initiateTimer{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.52 target:self selector:@selector(onTick) userInfo:nil repeats:YES];
}

-(void) generateCoin{

    Coin *newCoin = [Coin generateCoinInParent:self.layer withPosition:CGPointMake(_size.width/2, _size.height*0.9)];
    
    if(newCoin != nil){
        
        // Adding coin to physics controller for updating moviment
        [self.physicsController.bodies addObject:newCoin];
        
    } else {
        // Nothing to do
    }
    
    // Setting timer to next coin generation
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(generateCoin) userInfo:nil repeats:NO];
}

-(void) onTick{
    
    self.pointsScored += 1;

    [_hudLayer putScoreLabel:self.pointsScored];
    
}

-(void) playerContactCoin:(Coin *)coin{
    
    [coin runScoredMoviment];
    [GameData sharedGameData].currentScore += coin.value;
    
}

@end
