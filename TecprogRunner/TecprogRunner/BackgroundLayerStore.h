//
//  BackgroundLayerStore.h
//  TecprogRunner
//
//  Background for Player store
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GlobalHeaders.h"

@interface BackgroundLayerStore : SKNode

-(instancetype) initWithSize: (CGSize) size;

//background sprite
@property (nonatomic) SKSpriteNode* background;


@end
