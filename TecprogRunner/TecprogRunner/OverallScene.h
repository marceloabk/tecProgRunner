//
//  OverallScene.h
//  TecprogRunner
//
//  Created by Henrique Dutra on 15/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameControlLayer.h"
#import "OverallControlLayer.h"

@interface OverallScene : SKScene

@property (nonatomic) GameControlLayer *gameControlLayer;
@property (nonatomic) OverallControlLayer *overallControlLayer;

@end
