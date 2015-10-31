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
 Represent background on Store Layer
 */
@property (nonatomic) BackgroundLayerStore *backgroundLayerStore;

/**
 Button to return
 */
@property (nonatomic) SpriteNode *backButton;

/**
Store cards
 */
@property (nonatomic) SpriteNode *coinsCard;
@property (nonatomic) SpriteNode *gemsCard;
@property (nonatomic) SpriteNode *freeCoinsCard;

/**
 Method used to activate Settings Layer
 */
-(void) activateLayer;

@end
