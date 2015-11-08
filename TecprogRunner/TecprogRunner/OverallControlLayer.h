//
//  OverallControlLayer.h
//  TecprogRunner
//
//  Control the layers in the game and their disposition
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GlobalHeaders.h"
#import "MenuLayer.h"
#import "StoreLayer.h"
#import "GameLayer.h"
#import "SettingsLayer.h"
#import "TrainingCenterLayer.h"


@interface OverallControlLayer : SKNode <changeLayer, restartDelegate>

/**
 Initialize OverallControlLayer using a size
*/
-(instancetype)initWithSize:(CGSize)size;

/**
 Menu layer contains Buttons to setting, store, game center and Game
 */
@property (nonatomic) MenuLayer* menuLayer;

/**
 Store layer contains buttons to back to menu, list of itens that can be purchased
 */
@property (nonatomic) StoreLayer* storeLayer;

/**
 Game layer contains the game objects, background and hud
 */
@property (nonatomic) GameLayer* gameLayer;

/**
 Settings layer contains the game options
 */
@property (nonatomic) SettingsLayer* settingsLayer ;

/**
 Training center layer contains the characters training sessions
 */
@property (nonatomic) TrainingCenterLayer* trainingCenterLayer ;

/**
 Change layer according to activated layer in GameData singleton
*/
-(void) changeLayer;

/**
 Swipe right method
 */
-(void) swipeRight;

/**
 Swipe left method
*/
-(void) swipeLeft;

    
@end
