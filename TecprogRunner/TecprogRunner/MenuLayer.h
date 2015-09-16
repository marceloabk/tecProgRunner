//
//  MenuLayer.h
//  TecprogRunner
//
//  Created by Henrique Dutra on 15/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "BackgroundLayerMenu.h"

@interface MenuLayer : SKNode

-(instancetype) initWithSize: (CGSize) size;

@property (nonatomic) BackgroundLayerMenu *backgroundLayerMenu;

-(void) activateLayer;

@end
