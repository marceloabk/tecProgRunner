//
//  TrainingCenterLayer.h
//  TecprogRunner
//
//  Contain Training Center
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import <SpriteKit/SpriteKit.h>
#import "TrainingCenterBackground.h"

@interface TrainingCenterLayer : SKNode

-(instancetype) initWithSize: (CGSize) size;

@property (nonatomic) SKNode *layer;

@property (nonatomic)  TrainingCenterBackground*trainingCenterBackground;

@property (nonatomic) SKSpriteNode *backButton;
@property (nonatomic) SKSpriteNode *atributesTable;
-(void) activateLayer;

@end
