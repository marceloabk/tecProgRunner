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

/**
 Layer that represents Menu on screen
*/
@property (nonatomic) SKNode *layer;

/**
 Method used to activate Menu Layer
 */
-(void) activateLayer;

/**
 Represent background on Menu Layer
*/
@property (nonatomic) BackgroundLayerMenu *backgroundLayerMenu;

/**
 Button to play game
*/
@property (nonatomic) SpriteNode *tapToPlayButton;

/**
 Button to redirect to Store
*/
@property (nonatomic) SpriteNode *storeButton;

/**
 Button to redirect to Settings
*/
@property (nonatomic) SpriteNode *settingsButton;

/**
 Button to view Game Center
*/
@property (nonatomic) SpriteNode *gameCenterButton;

/**
 Button to redirect to Training Center
*/
@property (nonatomic) SpriteNode *trainingCenterButton;

@end
