//
//  BasicLayer.h
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/11/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#ifndef TecprogRunner_BasicLayer_h
#define TecprogRunner_BasicLayer_h

#import <SpriteKit/SpriteKit.h>

@protocol LayerRequirements <NSObject>

@required
- (instancetype) initWithSize:(CGSize)size;

@end

#endif
