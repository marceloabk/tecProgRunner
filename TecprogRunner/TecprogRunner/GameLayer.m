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
#import "EnemyGenerator.h"
#import "SpriteNode.h"

@interface GameLayer()

@property (nonatomic) Player *player;
@property (nonatomic) EnemyGenerator *enemyGenerator;

@end

@implementation GameLayer{
    
    CGSize _size;
    
    BackgroundLayer *_backgroundLayer;
    HudLayer *_hudLayer;
    SKNode *_sceneLayer;
    
    SpriteNode *_pauseButton;
    
    CFTimeInterval _lastTime;
    CFTimeInterval _pausedTime;
    
}

-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];
    if(self){
        _size = size;
        self.name = @"layer";
        [self initializePhysicsController];
    }
    return self;
}

-(void) loadPause{
    
    // Creating points
    CGPoint position = CGPointMake(15, 365);
    CGPoint anchorPoint = CGPointMake(0, 1);
    
    // Instantiating _pauseButton
    _pauseButton = [SpriteNode spriteNodeWithImageNamed:@"pauseButton" andPosition:position
                                            anchorPoint:anchorPoint andScale:0.5 andZPosition:100];
    
    [self addChild:_pauseButton];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    
    SKNode *node = [self nodeAtPoint:touchLocation];
    
    if([node.name isEqualToString:@"pauseGame"]){
        
        // Pause or unpause game;
        [self pausedClicked];
        
        
    }else{
        if(self.paused == false){
            
            if((touchLocation.x < _size.width/2) && self.player.playerOnGround == true){
                DebugLog(@"User clicked on left side of game layer and is on ground");
                [self.player jump];
            }else if(touchLocation.x > _size.width/2){
                DebugLog(@"User clicked on right side of game layer");
                [self.player throwProjectile];
            }else{
                // Do nothing
            }
        }

    }
    
}

-(void) initializePhysicsController{
    
    _physicsController = [[PhysicsController alloc] init];
    _physicsController.gameLayer = self;
    
}

-(void) pausedClicked{
    
    if(self.paused == true){
        self.scene.view.paused = false;
        self.paused = false;
        
        DebugLog(@"%.3f e %.3f", _lastTime, _pausedTime);
        _pausedTime = CACurrentMediaTime();
        
        [self initiateTimer];
        
        [self.pauseLayer removeFromParent];
    }else{
        self.scene.view.paused = true;
        self.paused = true;

        [self deactivateTimer];
        
        [self putPauseLayer];
    }
}

-(void) update:(CFTimeInterval)currentTime{
    
    //Update delta
    if (_lastTime == 0) {
        _lastTime = currentTime;
    }
    
    CFTimeInterval delta;
    if(_pausedTime == 0){
        delta = currentTime - _lastTime;
    }else{
        delta = currentTime - _pausedTime;
        _pausedTime = 0;
    }
    
    _lastTime = currentTime;
    
    if(self.paused == false){
        [_physicsController updateWithDeltaTime:delta];
        [_backgroundLayer updateWithDeltaTime:delta];
    }
    
}

-(void) activateLayer{
    
    _sceneLayer = [[SKNode alloc] init];
    _backgroundLayer = [[BackgroundLayer alloc] initWithSize:_size andBodyAdder:self];
    
    _hudLayer = [[HudLayer alloc] initWithSize:_size];

    self.layer = [SKNode node];
    
    // Adding layers to game layer
    [self addChild:self.layer];
    [self.layer addChild:_sceneLayer];
    [_sceneLayer addChild:_backgroundLayer];
    [_sceneLayer addChild:_hudLayer];
    
//    self.pauseLayer = [[PauseLayer alloc] initWithSize:_size];
//    [_sceneLayer addChild:self.pauseLayer];
//    [self.pauseLayer activatePauseLayer];

    // Put player on the layer
    [self initializePlayer];
    
    [self initializeEnemyGenerator];
    
    self.pointsScored = 0;
    [self initiateTimer];
    
    //Initiating loop of coin generation
    [self generateCoin];
    
    // Pause button
    [self loadPause];
}


// Initliaze the enemyGenerator
-(void) initializeEnemyGenerator{
    self.enemyGenerator = [[EnemyGenerator alloc]initWithSize:_size andBodyAdder:self];
    [self addChild:self.enemyGenerator];
    [self.enemyGenerator newEnemyWithScore:self.pointsScored];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newEnemy) name:@"enemy die" object:nil];
}

-(void)newEnemy{
    [self.enemyGenerator newEnemyWithScore:self.pointsScored];
}

-(void) initializePlayer{
    // Instantiating and adding to game layer
    CGPoint playerPosition = CGPointMake(50, 200);
    self.player = [[Player alloc]initWithPosition:playerPosition];
    
    // Add player to the layer
    [self.layer addChild:self.player];
    
    [_physicsController addBody:self.player];
}

-(void) deactivateTimer{

    [self.timer invalidate];
    self.timer = nil;
    
}

-(void) initiateTimer{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.52 target:self selector:@selector(onTick) userInfo:nil repeats:YES];
}

-(void) generateCoin{

    Coin *newCoin = [Coin generateCoinInParent:self.layer withPosition:CGPointMake(_size.width, _size.height*0.45)];
    
    if(newCoin != nil){
        
        // Adding coin to physics controller for updating moviment
        [self.physicsController addBody:newCoin];
        
    }else{
        // Nothing to do
    }
    srand(CACurrentMediaTime());
    double timeBetweenCoins = 1 + rand() % 5;
    
    // Setting timer to next coin generation
    [NSTimer scheduledTimerWithTimeInterval:timeBetweenCoins target:self selector:@selector(generateCoin) userInfo:nil repeats:NO];
}

-(void) onTick{
    
    self.timePassed += 1;

    [_hudLayer updateTimeLabel:self.timePassed];
    
}

-(void) playerContactCoin:(Coin *)coin{
    
    [coin runScoredMoviment];
    self.pointsScored += coin.value;
    
    [_hudLayer updateScoreLabel:self.pointsScored];
    
}

-(void) addBody:(GameObject *)body{
    [self.physicsController addBody:body];
}


-(void) putPauseLayer{
    
    self.pauseLayer = [[PauseLayer alloc] initWithSize:_size];
    [_sceneLayer addChild:self.pauseLayer];
    [self.pauseLayer activatePauseLayer];

}

@end
