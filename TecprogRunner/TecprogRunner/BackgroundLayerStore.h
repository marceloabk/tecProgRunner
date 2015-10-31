//
//  BackgroundLayerStore.h
//  TecprogRunner
//
//  Background for Player store
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GlobalHeaders.h"
#import "SpriteNode.h"

@interface BackgroundLayerStore : SKNode

/**
 Init Store Background Layer
 with a size
 */
-(instancetype) initWithSize:(CGSize)size;

/**
 Sprite that represent background
 visually
 */
@property (nonatomic) SpriteNode* background;


@end
