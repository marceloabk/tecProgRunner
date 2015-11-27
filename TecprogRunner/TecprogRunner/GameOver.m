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

@property (nonatomic) CGSize size;
@property (nonatomic) SKSpriteNode *gameOver;

@end

@implementation GameOver

// Initialize GameOver class
-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];
    
    if(self != nil){
        self.size = size;
        self.zPosition = 100;
        
        // Creating gameOverSize according to the screen
        CGFloat gameOverWidth = size.width/1.5;
        CGFloat gameOverHeight = size.height/1.5;
        CGSize gameOverSize = CGSizeMake(gameOverWidth, gameOverHeight);
        
        self.gameOver = [[SKSpriteNode alloc]initWithColor:[UIColor brownColor] size:gameOverSize];
        self.gameOver.position = CGPointMake(size.width/2, size.height/2);
        
        [self addChild:self.gameOver];
        [self addRestartButton];
    }else{
        // Exception
    }
    
    return self;
}

// Add restart button to GameOver node
-(void) addRestartButton{
    // Create a 50x50 button just for tests
    CGSize restartButtonSize = CGSizeMake(50, 50);
    SKSpriteNode *restart = [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size:restartButtonSize];
    restart.name = @"restartButton";
    [self.gameOver addChild:restart];
}

// Called whenever the player touches the screen
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    
    // Adding all nodes at the clicked point in the array
    NSArray *nodes = [self nodesAtPoint:touchLocation];
    
    for (SKNode *node in nodes) {
        if ([node.name isEqualToString:@"restartButton"]) {
            NSLog(@"Touching restart button");
        } else {
            // Exception
        }
    }
}


@end
