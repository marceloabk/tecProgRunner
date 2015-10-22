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

/// Initialize with size
- (instancetype) initWithSize:(CGSize)size;

/// Add all chilldren from layer
-(void) activateLayer;

@end

#endif
