//
//  GameLayer.h
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "BasicLayer.h"

@interface GameLayer : SKNode <LayerRequirements>

-(void)update:(CFTimeInterval)currentTime;
-(void) activateLayer;

@property (nonatomic) SKNode *layer;

@end
