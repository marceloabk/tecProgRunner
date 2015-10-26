//
//  PauseLayer.h
//  TecprogRunner
//
//  Created by Henrique Dutra on 25/10/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "BasicLayer.h"

@interface PauseLayer : SKNode

/**
 Layer that represent PauseLayer on screen
 */
@property SKNode *layer;

@property SKSpriteNode *background;

@property SKSpriteNode *continueButton;
@property SKSpriteNode *homeButton;
@property SKSpriteNode *restartButton;

-(void) activatePauseLayer;


-(instancetype) initWithSize:(CGSize)size;

@end
