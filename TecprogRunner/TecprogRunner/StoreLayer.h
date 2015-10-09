//
//  StoreLayer.h
//  TecprogRunner
//
//  Created by Henrique Dutra on 16/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "GlobalHeaders.h"
#import "BackgroundLayerStore.h"

@interface StoreLayer : SKNode

-(instancetype) initWithSize: (CGSize) size;

@property (nonatomic) SKNode *layer;

@property (nonatomic) BackgroundLayerStore *backgroundLayerStore;

@property (nonatomic) SKSpriteNode *backButton;

-(void) activateLayer;

@end
