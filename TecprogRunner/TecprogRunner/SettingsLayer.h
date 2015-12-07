//
//  SettingsLayer.h
//  TecprogRunner
//
//  Contain buttons to configurate the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GlobalHeaders.h"

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
 Method used to activate Settings Layer
*/
-(void) activateLayer;

/**
 Method used to change interface after changed setting
 */
-(void) changedSetting;
@end
