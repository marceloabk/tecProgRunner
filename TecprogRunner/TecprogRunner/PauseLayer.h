//
//  PauseLayer.h
//  TecprogRunner
//
//  Created by Henrique Dutra on 25/10/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "BasicLayer.h"
#import "SpriteNode.h"

#define PAUSE_LAYER_Z_POSITION 10000

@protocol pauseDelegate <NSObject>

@required
-(void) continueButtonPressed;
-(void) homeButtonPressed;
-(void) restartButtonPressed;

@end

@interface PauseLayer : SKNode

/**
 Node that represent PauseLayer on screen
 */
@property SKNode *layer;

/**
 Pause should have a delegate
*/
@property (nonatomic) id<pauseDelegate> pauseDelegate;

/**
 Show pause layer
*/
-(void) activatePauseLayer;

/**
 Initialize Pause Layer with a size
*/
-(instancetype) initWithSize:(CGSize)size;

@end
