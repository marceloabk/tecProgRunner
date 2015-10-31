//
//  BackgroundLayerMenu.h
//  TecprogRunner
//
//  Principal menu background
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GlobalHeaders.h"
#import "SpriteNode.h"

@interface BackgroundLayerMenu : SKNode

/**
 Initialize Menu Backgroun Layer
 with a size
*/
-(instancetype) initWithSize:(CGSize)size;

/**
 Sprite used to represent
 background visually
*/
@property (nonatomic) SpriteNode* background;


@end
