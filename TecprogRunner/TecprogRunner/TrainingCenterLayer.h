//
//  TrainingCenterLayer.h
//  TecprogRunner
//
//  Contain Training Center
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import <SpriteKit/SpriteKit.h>
#import "TrainingCenterBackground.h"

#define DEFAULT_STARS_ANCHOR_POINT CGPointMake(0, 1)
#define DEFAULT_STARTS_Z_POSITION 100

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
 Represent speed level
 */
@property (nonatomic) SKSpriteNode *levelSpeedStars;

/**
 Represent jump level
 */
@property (nonatomic) SKSpriteNode *levelJumpStars;

/**
 Represent luck level
 */
@property (nonatomic) SKSpriteNode *levelLuckStars;

/**
 Represent shooting level
 */
@property (nonatomic) SKSpriteNode *levelShootingStars;

/**
 Represent power level
 */
@property (nonatomic) SKSpriteNode *levelPowerStars;


/**
 Label for coins
*/
@property (nonatomic) SKLabelNode *coinsLabel;

/**
 Label for Gems
*/
@property (nonatomic) SKLabelNode *gemsLabel;



@end
