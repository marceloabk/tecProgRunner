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
 Layer that represent PauseLayer on screen
 */
@property SKNode *layer;

@property SpriteNode *background;

@property SpriteNode *continueButton;
@property SpriteNode *homeButton;
@property SpriteNode *restartButton;

@property (nonatomic) id pauseDelegate;

-(void) activatePauseLayer;


-(instancetype) initWithSize:(CGSize)size;

@end
