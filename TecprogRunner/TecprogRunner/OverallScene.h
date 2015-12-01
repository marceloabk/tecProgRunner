//
//  OverallScene.h
//  TecprogRunner
//
//  Scene used to contain and show layers
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GlobalHeaders.h"
#import "OverallControlLayer.h"

@interface OverallScene : SKScene

/**
 Overall Control Layer controls changing layer
*/
@property (nonatomic) OverallControlLayer *overallControlLayer;

@end
