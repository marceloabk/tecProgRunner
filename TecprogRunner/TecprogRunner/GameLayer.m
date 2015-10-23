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
        _size = size;
        self.name = @"layer";
        
        [self createGroundBody];

    }
    return self;
}

-(void) createGroundBody{
    
    CGFloat groundHeight = 50;
    CGFloat groundWidth = 500;
    
    CGPoint initialPoint = CGPointMake(0.0, groundHeight);
    CGPoint finalPoint = CGPointMake(groundWidth, groundHeight);
    
    GameObject *ground = [[GameObject alloc] initWithColor:[UIColor blackColor] size:CGSizeMake(400, 100)];
    ground.position = CGPointMake(0.0, 0.0);
    ground.name = @"ground";
    SKPhysicsBody* groundBody = [SKPhysicsBody bodyWithEdgeFromPoint:initialPoint toPoint:finalPoint];
    groundBody.categoryBitMask = ColliderTypeGround;
    groundBody.contactTestBitMask = ColliderTypePlayer | ColliderTypeEnemy | ColliderTypeObstacle;
    
    ground.physicsBody = groundBody;
    
    [self addChild:ground];
    
    [_physicsController.bodies addObject:ground];
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

}

-(void) activateLayer{
    
    _sceneLayer = [[SKNode alloc] init];
    _backgroundLayer = [[BackgroundLayer alloc] initWithSize:_size];
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


-(void) onTick{
    
    self.pointsScored += 1;
    
    [_hudLayer putScoreLabel:self.pointsScored];
    
}

@end
