//
//  StoreLayer.h
//  TecprogRunner
//
//  Player store
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GlobalHeaders.h"

@interface StoreLayer : SKNode

/**
 Initialize Store Layer
 with a size
 */
-(instancetype) initWithSize:(CGSize)size;

/**
 Layer that represent Store on screen
 */
@property (nonatomic) SKNode *layer;

/**
 Method used to activate Settings Layer
 */
-(void) activateLayer;

@end
