//
//  BackgroundLayerSettings.h
//  TecprogRunner
//
//  Created by Henrique Dutra on 24/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BackgroundLayerSettings : SKNode

-(instancetype) initWithSize: (CGSize) size;

//background sprite
@property (nonatomic) SKSpriteNode* background;


@end
