//
//  MenuLayer.h
//  TecprogRunner
//
//  Principal menu
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GlobalHeaders.h"
#import "BasicLayer.h"

@interface MenuLayer : SKNode <LayerRequirements>

/**
 Layer that represents Menu on screen
*/
@property (nonatomic) SKNode *layer;

/**
 Method used to activate Menu Layer
 */
-(void) activateLayer;


@end
