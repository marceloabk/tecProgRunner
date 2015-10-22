//
//  HudLayer.h
//  TecprogRunner
//
//  Contain aditional information, like score
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "BasicLayer.h"

@interface HudLayer : SKNode <LayerRequirements>


/**
 Layer that represent HudLayer on screen
 */
@property SKNode *layer;

/**
 Represent score in screen visually
*/
@property SKLabelNode *scoreLabel;

/**
 Add score label in HudLayer
*/
-(void) putScoreLabel:(int)points;

@end
