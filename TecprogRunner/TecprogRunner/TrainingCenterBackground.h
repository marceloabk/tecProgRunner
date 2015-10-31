//
//  TrainingCenterBackground.h
//  TecprogRunner
//
//  Contain a background for Training Center
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import <SpriteKit/SpriteKit.h>
#import "TrainingCenterBackground.h"
#import "SpriteNode.h"

@interface TrainingCenterBackground : SKNode

/**
 Initialize Training Center Background
 with a size
*/
-(instancetype) initWithSize:(CGSize)size;

/**
 Sprite that represent
 Training Center background on screen
*/
@property (nonatomic) SpriteNode* background;

@end
