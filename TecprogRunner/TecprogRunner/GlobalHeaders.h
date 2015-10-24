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

#ifdef DEBUG
#   define DebugLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#   define DebugLog(...)
#endif

#define DEFAULT_LAYER_WIDTH 667
#define DEFAULT_LAYER_HEIGHT 375

#define GREEN_COLOR [UIColor greenColor]
#define MAGENTA_COLOR [UIColor magentaColor]
#define BACKGROUND_VELOCITY_X 100

#endif /* GlobalHeaders_h */
