//
//  HudLayer.h
//  TecprogRunner
//
//  Contain aditional information, like score
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "BasicLayer.h"

@interface HudLayer : SKNode <LayerRequirements>

@property SKLabelNode *scoreLabel;
@property SKNode *layer;

/**
 Create and add score label to HudLayer
*/
-(void) putScoreLabel:(int) points;

@end
