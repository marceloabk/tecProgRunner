//
//  GameOver.h
//  TecprogRunner
//
//  Created by Marcelo Cristiano Araujo Silva on 27/11/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "RestartGameProtocol.h"


@interface GameOver : SKNode <restartDelegate>

-(instancetype) initWithSize:(CGSize)size;
@property (nonatomic) id<restartDelegate> gameRestartDelegate;

@end
