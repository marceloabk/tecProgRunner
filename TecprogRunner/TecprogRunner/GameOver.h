//
//  GameOver.h
//  TecprogRunner
//
//  Created by Marcelo Cristiano Araujo Silva on 27/11/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

// This protocol says when to remove the gameOver
@protocol gameOverDelegate <NSObject>
@required
-(void) removeGameOver;

@end

@interface GameOver : SKNode

-(instancetype) initWithSize:(CGSize)size;
@property (nonatomic) id<gameOverDelegate> gameOverDelegate;

@end
