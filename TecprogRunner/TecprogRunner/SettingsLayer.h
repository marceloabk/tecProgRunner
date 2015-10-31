//
//  SettingsLayer.h
//  TecprogRunner
//
//  Contain buttons to configurate the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GlobalHeaders.h"
#import "BackgroundLayerSettings.h"
#import "SpriteNode.h"

@interface SettingsLayer : SKNode

/**
 Initialize Settings Layer
 with a size
*/
-(instancetype) initWithSize:(CGSize)size;

/**
 Layer that represent Settings on screen
*/
@property (nonatomic) SKNode *layer;

/**
 Represent background on Settings Layer
*/
@property (nonatomic) BackgroundLayerSettings *backgroundLayerSettings;

/**
 Button to return
*/
@property (nonatomic) SpriteNode *backButton;

/**
 Music and sound effects
 */
@property (nonatomic) SpriteNode *musicButton;
@property (nonatomic) SpriteNode *soundEffectsButton;

/**
 Method used to activate Settings Layer
*/
-(void) activateLayer;

@end
