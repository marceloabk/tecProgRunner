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

/**
 Initialize Training Center using a size
 */
-(instancetype) initWithSize:(CGSize)size;

/**
 Layer that represent Training Center on screen
 */
@property (nonatomic) SKNode *layer;

/**
 Represent background on Game Layer
*/
@property (nonatomic)  TrainingCenterBackground *trainingCenterBackground;

/**
 Button to return
*/
@property (nonatomic) SKSpriteNode *backButton;

/**
 Table with player attributes
*/
@property (nonatomic) SKSpriteNode *atributesTable;

/**
 Method used to activate Training Center layer
*/
-(void) activateLayer;

/**
Nodes with levels
 */
@property (nonatomic) SKSpriteNode *levelSpeedStars;
@property (nonatomic) SKSpriteNode *levelJumpStars;
@property (nonatomic) SKSpriteNode *levelLuckStars;
@property (nonatomic) SKSpriteNode *levelShootingStars;
@property (nonatomic) SKSpriteNode *levelPowerStars;

/**
Cons and gems labels
 */

@property (nonatomic) SKLabelNode *coinsLabel;
@property (nonatomic) SKLabelNode *gemsLabel;



@end
