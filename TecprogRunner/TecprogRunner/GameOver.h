//
//  GameOver.h
//  TecprogRunner
//
//  Created by Marcelo Cristiano Araujo Silva on 27/11/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SpriteNode.h"

#define GAME_OVER_Z_POSITION 10000000

// This protocol says when to remove the gameOver
@protocol gameOverDelegate <NSObject>
@required
-(void) removeGameOver;

@end

@interface GameOver : SKNode

-(instancetype) initWithSize:(CGSize)size andScore: (int) scorePassed;

@property (nonatomic) id<gameOverDelegate> gameOverDelegate;

@property SKNode *layer;


@end
