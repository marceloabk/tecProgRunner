//
//  OverallScene.h
//  TecprogRunner
//
//  Created by Henrique Dutra on 15/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "OverallControlLayer.h"

@interface OverallScene : SKScene

/**
 Overall Control Layer controls changing layer
*/
@property (nonatomic) OverallControlLayer *overallControlLayer;

@end
