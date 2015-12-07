//
//  TrainingCenterSpecificLayer.h
//  TecprogRunner
//
//  Created by Henrique Dutra on 07/12/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SpriteNode.h"
#import "GameData.h"

@interface TrainingCenterSpecificLayer : SKNode

/**
 Initialize Training Center using a size
 */
-(instancetype) initWithSize:(CGSize)size andAttribute : (NSString *) attribute;

/**
 Layer that represent Training Center on screen
 */
@property (nonatomic) SKNode *layer;

/**
 Method used to activate Training Center layer
 */
-(void) activateLayer;

@end
