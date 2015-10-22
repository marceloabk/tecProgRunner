//
//  StoreLayer.h
//  TecprogRunner
//
//  Player store
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GlobalHeaders.h"
#import "BackgroundLayerStore.h"

@interface StoreLayer : SKNode

-(instancetype) initWithSize: (CGSize) size;

@property (nonatomic) SKNode *layer;

@property (nonatomic) BackgroundLayerStore *backgroundLayerStore;

@property (nonatomic) SKSpriteNode *backButton;

-(void) activateLayer;

@end
