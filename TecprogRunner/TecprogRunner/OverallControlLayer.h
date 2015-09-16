//
//  OverallControlLayer.h
//  TecprogRunner
//
//  Created by Henrique Dutra on 15/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "MenuLayer.h"
#import "StoreLayer.h"

@interface OverallControlLayer : SKNode

-(instancetype) initWithSize: (CGSize) size;

@property (nonatomic)  MenuLayer* menuLayer;
@property (nonatomic)  StoreLayer* storeLayer;

-(void) changeLayer;

@end
