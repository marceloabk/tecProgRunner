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
@property (nonatomic) BOOL isPlayerDead;

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
    
    if(self != nil){
        _size = size;
        self.isPlayerDead = NO;
        self.name = @"layer";
        [self initializePhysicsController];
    }else{
        NSException *exception = [NSException exceptionWithName:@"Game layer init" reason:@"Can't init game layer" userInfo:nil];
        [exception raise];
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
    
    if(self.isPlayerDead == YES){
        [self.gameOver touchesBegan:touches withEvent:event];
    }else if ([node.name isEqualToString:@"pauseButton"] ){
        // Pause or unpause game;
        [self pausedClicked];
    }else{
        if(self.scene.view.paused == NO){
            
            if((touchLocation.x < _size.width/2) && self.player.playerOnGround == YES){
                DebugLog(@"User clicked on left side of game layer and is on ground");
                [self.player jump];
            }else if(touchLocation.x > _size.width/2){
                DebugLog(@"User clicked on right side of game layer");
                [self.player throwProjectile];
            }else{
                // Do nothing
            }
        }
        else {
            
            [self.pauseLayer touchesBegan:touches withEvent:event];
        }
    }
    
}

-(void) initializePhysicsController{
    
    _physicsController = [[PhysicsController alloc] init];
    _physicsController.gameLayer = self;
}

-(void) pausedClicked{
    
    if(self.scene.view.paused == NO){
    
        [_sceneLayer addChild:self.pauseLayer];
        
        //Applying delay to render paused layer on screen
        [self runAction:[SKAction waitForDuration:0.03] completion:^{
            self.scene.view.paused = YES;
            [self deactivateTimer];
        }];
    }
}

-(void) update:(CFTimeInterval)currentTime{
    
    // Update delta
    if (_lastTime == 0){
        _lastTime = currentTime;
    }else{
        // There's no alternative path
    }
    
    CFTimeInterval delta;
    if(_pausedTime == 0){
        delta = currentTime - _lastTime;
    }else{
        delta = currentTime - _pausedTime;
        _pausedTime = 0;
    }
    
    _lastTime = currentTime;
    
    if(self.scene.view.paused == NO){
        [_physicsController updateWithDeltaTime:delta];
        [_backgroundLayer updateWithDeltaTime:delta];
        
    }else{
        // Continue
    }
    
}

-(void) activateLayer{
    
    _sceneLayer = [[SKNode alloc] init];
    
    _backgroundLayer = [[BackgroundLayer alloc] initWithSize:_size andBodyAdder:self];
    [_backgroundLayer activateLayer];
    
    _hudLayer = [[HudLayer alloc] initWithSize:_size];

    self.layer = [SKNode node];
    
    // Adding layers to game layer
    [self addChild:self.layer];
    [self.layer addChild:_sceneLayer];
    [_sceneLayer addChild:_backgroundLayer];
    [_sceneLayer addChild:_hudLayer];
    
    self.pauseLayer = [[PauseLayer alloc] initWithSize:_size];
    self.pauseLayer.name = @"pauseLayer";
    self.pauseLayer.pauseDelegate = self;
    [self.pauseLayer activatePauseLayer];

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
    [self.enemyGenerator newEnemyWithScore:self.timePassed];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newEnemy) name:@"EnemyDied" object:nil];
}

// Create a new enemy based on the score
-(void) newEnemy{
    [self.enemyGenerator newEnemyWithScore:self.timePassed];
}

-(void) initializePlayer{
    // Instantiating and adding to game layer
    CGPoint playerPosition = CGPointMake(50, 200);
    self.player = [[Player alloc]initWithPosition:playerPosition];
    self.player.delegate = self;
    
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
    
    if(self.timePassed%5 == 0){
        [self newEnemy];
    }
    
    [_hudLayer updateTimeLabel:self.timePassed];
    
}

-(void) playerContactCoin:(Coin *)coin{
    
    [coin runScoredMoviment];
    self.pointsScored += coin.value;
    
    [_hudLayer updateScoreLabel:self.pointsScored];
    
    [GameData sharedGameData].score = self.pointsScored;
    
}

-(void) Bullet:(Projectile *)bullet hittedEnemy:(Enemy *)enemy{
    
    if([bullet.owner isKindOfClass:[Player class]]){
        enemy.health--;
        if (enemy.health == 0) {
            [enemy die];
        }else{
            // Nothing to do
        }
        
        [bullet removeFromParent];
    }
}

- (void)Bullet:(Projectile *)bullet hittedPlayer:(Player *)player{
    [player runAction:[SKAction moveBy:CGVectorMake(-10, 0) duration:0.2]];
}

-(void) addBody:(GameObject *)body{
    [self.physicsController addBody:body];
}

-(void) homeButtonPressed{
    
    if(self.scene.view.paused == YES){
        
        self.scene.view.paused = NO;
        [self.pauseLayer removeFromParent];
        [self.layerChangeDelegate changeToLayer:menu];
    }
}

-(void) restartButtonPressed{
    
    if(self.scene.view.paused == YES){
        
        self.scene.view.paused = NO;
        [self.pauseLayer removeFromParent];
        
        [self.gameRestartDelegate restartGame];
    }
}

-(void) continueButtonPressed{
    
    if(self.scene.view.paused == YES){
        self.scene.view.paused = NO;
        
        _pausedTime = CACurrentMediaTime();
        DebugLog(@"Pause time: %.2f",  _pausedTime - _lastTime);
        
        [self initiateTimer];
        
        [self.pauseLayer removeFromParent];
    }
}


// Remove gameOver from the game and restart the game
-(void) removeGameOver {
    self.scene.view.paused = NO;
    [self.gameOver removeFromParent];
    [self.gameRestartDelegate restartGame];
}


-(void) entityDied:(GameEntity *)entity{
    
    if([entity isKindOfClass:[Player class]]){
        // Initialize GameOver
        self.gameOver = [[GameOver alloc]initWithSize:_size];
        self.gameOver.gameOverDelegate = self;
        
        [_sceneLayer addChild: self.gameOver];
        
        self.isPlayerDead = true;
    }
}

@end
