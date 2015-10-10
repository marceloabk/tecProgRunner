//
//  GlobalHeaders.h
//  TecprogRunner
//
//  Created by Lucas Araujo on 10/9/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

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

#endif /* GlobalHeaders_h */
