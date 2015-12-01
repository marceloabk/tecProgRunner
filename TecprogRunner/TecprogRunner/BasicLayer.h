//
//  BasicLayer.h
//  TecprogRunner
//
//  Protocol defining requirements to create a Layer
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#ifndef TecprogRunner_BasicLayer_h
#define TecprogRunner_BasicLayer_h

#import "GlobalHeaders.h"

@protocol LayerRequirements <NSObject>

@required

/**
 Initialize layer
 @param size The size of the screen
 @return A instance of a layer
*/
-(instancetype) initWithSize:(CGSize)size;

/**
 Add all children for the layer
*/
-(void) activateLayer;

@end

#endif
