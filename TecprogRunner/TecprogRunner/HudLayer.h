//
//  HudLayer.h
//  TecprogRunner
//
//  Contain aditional information, like score
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "BasicLayer.h"
#import "Label.h"

@interface HudLayer : SKNode <LayerRequirements>

/**
 Layer that represent HudLayer on screen
 */
@property SKNode *layer;

/**
 Represent score in screen visually
*/
@property Label *scoreLabel;

/**
 Represent time passed in screen visually
 */
@property Label *timeLabel;

/**
 Update score label in HudLayer
*/
-(void) updateScoreLabel:(int)points;

/**
 Update time label in HudLayer
 */
-(void) updateTimeLabel:(int)points;

@end
