//
//  HudLayer.h
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "BasicLayer.h"

@interface HudLayer : SKNode <LayerRequirements>

@property SKLabelNode *scoreLabel;
@property SKNode *layer;

-(void) putScoreLabel: (int) points;

@end
