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

@interface PauseLayer : SKNode

/**
 Layer that represent PauseLayer on screen
 */
@property SKNode *layer;

@property SpriteNode *background;

@property SpriteNode *continueButton;
@property SpriteNode *homeButton;
@property SpriteNode *restartButton;

-(void) activatePauseLayer;


-(instancetype) initWithSize:(CGSize)size;

@end
