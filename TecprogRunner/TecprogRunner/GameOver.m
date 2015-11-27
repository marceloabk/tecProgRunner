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

@end

@implementation GameOver

// Initialize GameOver class
-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];
    
    if(self != nil){
        self.size = size;
        
        // Creating gameOverSize according to the screen
        CGFloat gameOverWidth = size.width/1.5;
        CGFloat gameOverHeight = size.height/1.5;
        CGSize gameOverSize = CGSizeMake(gameOverWidth, gameOverHeight);
        
        SKSpriteNode *gameOver = [[SKSpriteNode alloc]initWithColor:[UIColor brownColor] size:gameOverSize];
        
        [self addChild:gameOver];
    }else{
        // Exception
    }
    
    return self;
}



@end
