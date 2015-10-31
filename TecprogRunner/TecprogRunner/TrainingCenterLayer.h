//
//  TrainingCenterLayer.h
//  TecprogRunner
//
//  Contain Training Center
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import <SpriteKit/SpriteKit.h>
#import "TrainingCenterBackground.h"
#import "Label.h"
#import "SpriteNode.h"

#define DEFAULT_STARS_X_POSITION 215
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
@property (nonatomic) SpriteNode *backButton;

/**
 Table with player attributes
*/
@property (nonatomic) SpriteNode *atributesTable;

/**
 Method used to activate Training Center layer
*/
-(void) activateLayer;

/**
 Represent speed level
 */
@property (nonatomic) SpriteNode *levelSpeedStars;

/**
 Represent jump level
 */
@property (nonatomic) SpriteNode *levelJumpStars;

/**
 Represent luck level
 */
@property (nonatomic) SpriteNode *levelLuckStars;

/**
 Represent shooting level
 */
@property (nonatomic) SpriteNode *levelShootingStars;

/**
 Represent power level
 */
@property (nonatomic) SpriteNode *levelPowerStars;


/**
 Label for coins
*/
@property (nonatomic) Label *coinsLabel;

/**
 Label for Gems
*/
@property (nonatomic) Label *gemsLabel;



@end
