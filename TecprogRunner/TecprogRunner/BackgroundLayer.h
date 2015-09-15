//
//  BackgroundLayer.h
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "BasicLayer.h"

@interface BackgroundLayer : SKNode <LayerRequirements>

@property (nonatomic) SKSpriteNode* background;

-(void)moveBackgroundWithDeltaTime:(NSTimeInterval)deltaTime;

@end
