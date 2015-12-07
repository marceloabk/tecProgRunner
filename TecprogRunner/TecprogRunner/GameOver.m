//
//  GameOver.m
//  TecprogRunner
//
//  Called when player dies and give him options of what to do:
//
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "GameOver.h"
#import "GameData.h"

@interface GameOver()

@property (nonatomic) SKLabelNode *score;
@property (nonatomic) SKLabelNode *highScore;

@property (nonatomic) SKSpriteNode *home;

@property (nonatomic) SKSpriteNode *gameCenter;

@property (nonatomic) SKSpriteNode *restartButton;

@property (nonatomic) SKSpriteNode *background;

@property (nonatomic) int lastScore;

@end

@implementation GameOver 


// Initialize GameOver class
-(instancetype) initWithSize:(CGSize)size andScore: (int) scorePassed{
    
    self = [super init];
    
    if(self != nil){
        
        [self checkHighScore:scorePassed];
        self.lastScore = scorePassed;
        
        self.layer = [SKNode node];
        [self addChild:self.layer];
        
        [self loadBackground];
        [self loadButtons];
        [self loadLabels];
        
        [self activateLayer];
        
    }else{
        // Exception
    }
    
    return self;
}

-(void) loadLabels{

    self.highScore = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
   self. highScore.text = [[NSString alloc] initWithFormat:@"%i", [GameData sharedGameData].highScore];
   self. highScore.fontColor = [UIColor whiteColor];
    self.highScore.fontSize = 30;
    self.highScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
    self.highScore.position = CGPointMake(545, 315);
    self.highScore.zPosition = GAME_OVER_Z_POSITION + 20;
    
    self.score = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
    self.score.text = [[NSString alloc] initWithFormat:@"%i", self.lastScore];
    self.score.fontColor = [UIColor whiteColor];
    self.score.fontSize = 30;
    self.score.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
    self.score.position = CGPointMake(116, 315);
    self.score.zPosition = GAME_OVER_Z_POSITION + 20;


}

-(void) activateLayer{
    
    // Add all components in layer
    [self.layer addChild:_background];
    [self.layer addChild:_restartButton];
    [self.layer addChild:_home];
    [self.layer addChild:_gameCenter];
    
    [self.layer addChild:self.highScore];
    [self.layer addChild:self.score];
}

/**
 Load the background presented in pause
 */
-(void) loadBackground{
    
    // Initialize background sprite node
    _background = [SpriteNode spriteNodeWithImageNamed:@"gameOverBg5" andPosition:CGPointZero
                                           anchorPoint:CGPointZero andScale:0.5 andZPosition:GAME_OVER_Z_POSITION];
}

/**
 Load the buttons presented in pause
 */
-(void) loadButtons{
    
    static const CGFloat buttonZPosition = GAME_OVER_Z_POSITION + 10;
    
    // Create restart button
    CGPoint restartButtonPosition = CGPointMake(279, DEFAULT_LAYER_HEIGHT - 125);
    _restartButton = [SpriteNode spriteNodeWithImageNamed:@"restartGameOver" andPosition:restartButtonPosition
                                              anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:buttonZPosition];
    _restartButton.name = @"restartButton";
    
    CGPoint homePosition = CGPointMake(40, DEFAULT_LAYER_HEIGHT - 251);
    _home = [SpriteNode spriteNodeWithImageNamed:@"homeGameOver" andPosition:homePosition
                                               anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:buttonZPosition];
    
    _home.name = @"home";
    
    CGPoint gameCenterPosition = CGPointMake(572, DEFAULT_LAYER_HEIGHT - 277);
    _gameCenter = [SpriteNode spriteNodeWithImageNamed:@"gameCenterGameOver" andPosition:gameCenterPosition
                                               anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:buttonZPosition];
    _gameCenter.name = @"gameCenter";

}


-(void) checkHighScore : (int) points{

    if([GameData sharedGameData].highScore < points){
        [GameData sharedGameData].highScore = points;
    }
    
    [[GameData sharedGameData] save];
}



// Called whenever the player touches the screen
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    
    // Adding all nodes at the clicked point in the array
    NSArray *nodes = [self nodesAtPoint:touchLocation];
    
    for (SKNode *node in nodes) {
        if ([node.name isEqualToString:@"restartButton"]) {
            [self.gameOverDelegate removeGameOver];
            NSLog(@"Touching restart button");
        }else if ([node.name isEqualToString:@"gameCenter"]) {
            // game center
        }
        else if ([node.name isEqualToString:@"home"]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"goHome" object:nil];
        }else {
            // Exception
        }
    }
}

@end
