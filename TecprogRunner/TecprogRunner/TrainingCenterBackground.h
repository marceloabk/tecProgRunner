//
//  TrainingCenterBackground.h
//  TecprogRunner
//
//  Contain a background for Training Center
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import <SpriteKit/SpriteKit.h>
#import "TrainingCenterBackground.h"

@interface TrainingCenterBackground : SKNode

-(instancetype) initWithSize: (CGSize) size;

//background sprite
@property (nonatomic) SKSpriteNode* background;

@end
