//
//  GameOver.m
//  TecprogRunner
//
//  Called when player dies and give him options of what to do:
//
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "GameOver.h"

@interface GameOver()

@property (nonatomic) SKLabelNode *score;
@property (nonatomic) SKLabelNode *highScore;

@property (nonatomic) SKSpriteNode *home;

@property (nonatomic) SKSpriteNode *gameCenter;

@property (nonatomic) SKSpriteNode *restartButton;

@property (nonatomic) SKSpriteNode *background;

@end

@implementation GameOver 


// Initialize GameOver class
-(instancetype) initWithSize:(CGSize)size andScore: (int) scorePassed{
    
    self = [super init];
    
    if(self != nil){
        
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

-(void) loadLabels{}

-(void) activateLayer{
    
    // Add all components in layer
    [self.layer addChild:_background];
    [self.layer addChild:_restartButton];
    [self.layer addChild:_home];
    [self.layer addChild:_gameCenter];
}

/**
 Load the background presented in pause
 */
-(void) loadBackground{
    
    // Initialize background sprite node
    _background = [SpriteNode spriteNodeWithImageNamed:@"gameOverBg" andPosition:CGPointZero
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
           
        }else {
            // Exception
        }
    }
}

@end
