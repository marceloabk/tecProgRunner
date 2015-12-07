//
//  TrainingCenterLayer.h
//  TecprogRunner
//
//  Contain Training Center
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import <SpriteKit/SpriteKit.h>

#define DEFAULT_STARS_X_POSITION 235
#define DEFAULT_STARTS_Z_POSITION 120

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
 Method used to activate Training Center layer
*/
-(void) activateLayer;




@end
