//
//  TrainingCenterSpecificLayer.h
//  TecprogRunner
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.//

#import <SpriteKit/SpriteKit.h>
#import "SpriteNode.h"
#import "GameData.h"

@interface TrainingCenterSpecificLayer : SKNode

/**
 Initialize Training Center using a size and attribute number and attribute name
 */
-(instancetype) initWithSize:(CGSize)size andAttribute : (NSString *) attribute andAttributeNumber : (int) num;

/**
 Layer that represent Training Center on screen
 */
@property (nonatomic) SKNode *layer;

/**
 Method used to activate Training Center layer
 */
-(void) activateLayer;

@property (nonatomic) int attributeNumber;
@property (nonatomic) NSString * attributeString;

@property (nonatomic) SKSpriteNode *background;

@property (nonatomic) SKSpriteNode *attributeName;

@property (nonatomic) SKSpriteNode *exitButton;
@property (nonatomic) SKSpriteNode *upgradeButton;

@property (nonatomic) SKSpriteNode *levelStars;

@property (nonatomic) SKLabelNode *cost;




@end
