//
//  SettingsLayer.h
//  TecprogRunner
//
//  Contain buttons to configurate the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GlobalHeaders.h"
#import "BackgroundLayerSettings.h"

@interface SettingsLayer : SKNode

-(instancetype) initWithSize: (CGSize) size;

@property (nonatomic) SKNode *layer;

@property (nonatomic)  BackgroundLayerSettings*backgroundLayerSettings;

@property (nonatomic) SKSpriteNode *backButton;

-(void) activateLayer;

@end
