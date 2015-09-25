//
//  SettingsLayer.h
//  TecprogRunner
//
//  Created by Henrique Dutra on 24/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SettingsLayer : SKNode

-(instancetype) initWithSize: (CGSize) size;

@property (nonatomic) SKNode *layer;

//@property (nonatomic)  *backgroundLayerStore;

@property (nonatomic) SKSpriteNode *backButton;

-(void) activateLayer;

@end
