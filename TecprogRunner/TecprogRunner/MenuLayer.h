//
//  MenuLayer.h
//  TecprogRunner
//
//  Created by Henrique Dutra on 15/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "BackgroundLayerMenu.h"
#import "BasicLayer.h"

@interface MenuLayer : SKNode <LayerRequirements>

@property (nonatomic) SKNode *layer;

@property (nonatomic) BackgroundLayerMenu *backgroundLayerMenu;

@property (nonatomic) SKSpriteNode *tapToPlayButton;
@property (nonatomic) SKSpriteNode *storeButton;
@property (nonatomic) SKSpriteNode *settingsButton;
@property (nonatomic) SKSpriteNode *gameCenterButton;
@property (nonatomic) SKSpriteNode *trainingCenterButton;

@end
