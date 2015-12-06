//
//  GlobalHeaders.h
//  TecprogRunner
//
//  Definitions for the project
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#ifndef GlobalHeaders_h
#define GlobalHeaders_h

#import <SpriteKit/SpriteKit.h>
#import <Foundation/Foundation.h>

@class GameObject;
@class Enemy;


#ifdef DEBUG
#   define DebugLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#   define DebugLog(...)
#endif

#define DEFAULT_LAYER_WIDTH 667
#define DEFAULT_LAYER_HEIGHT 375

#define GREEN_COLOR [UIColor greenColor]
#define MAGENTA_COLOR [UIColor magentaColor]
#define BACKGROUND_VELOCITY_X (-100)

#define JUMP_IMPULSE 600

#pragma mark Defining z position objects

#define ZPOSITION_COIN 2

#define ZPOSITION_PLAYER 3
#define ZPOSITION_ENEMIES 3

#define ZPOSITION_BACKGROUND_PLATFORM 4

#define ZPOSITION_PROJECTILE 5

#define ZPOSITION_HUD 10

#define SKETCH_ANCHOR_POINT CGPointMake(0,1)

#define MINIMUN_HEIGHT (-300)

#define MINIMUN_WIDTH (0)

@protocol physicsControllerAddBody <NSObject>
@required
-(void) addBody:(GameObject*) body;

@end


typedef enum {
    menu,
    store,
    game,
    settings,
    trainingCenter,
} GameDataLayerType;

@protocol changeLayer <NSObject>
@required
-(void) changeToLayer:(GameDataLayerType) layerType;

@end

@protocol EnemyGeneratorDelegate <NSObject>

@required
-(Enemy*) generateNewEnemy;

@end

#endif /* GlobalHeaders_h */
