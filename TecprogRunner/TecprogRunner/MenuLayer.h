//
//  MenuLayer.h
//  TecprogRunner
//
//  Principal menu
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GlobalHeaders.h"
#import "BackgroundLayerMenu.h"
#import "BasicLayer.h"

@interface MenuLayer : SKNode <LayerRequirements>

@property (nonatomic) SKNode *layer;

@property (nonatomic) BackgroundLayerMenu *backgroundLayerMenu;

@property (nonatomic) SKSpriteNode *tapToPlayButton;
@property (nonatomic) SKSpriteNode *storeButton;
@property (nonatomic) SKSpriteNode *settingsButton;
@property (nonatomic) SKSpriteNode *gameCenterButton;
@property (nonatomic) SKSpriteNode *trainingCenterButton;

@end
