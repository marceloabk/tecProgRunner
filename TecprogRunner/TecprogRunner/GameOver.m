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
    CGSize restartButtonSize = CGSizeMake(50, 50);
    SKSpriteNode *restart = [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size:restartButtonSize];
    [self.gameOver addChild:restart];
}


@end
