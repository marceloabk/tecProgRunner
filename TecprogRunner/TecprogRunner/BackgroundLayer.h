//
//  BackgroundLayer.h
//  TecprogRunner
//
//  Define a background for the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.


#define GREEN_COLOR [UIColor greenColor]
#define MAGENTA_COLOR [UIColor magentaColor]
#define GROUND_MOVIMENT_TIME 8
#define CLOUD_MOVIMENT_TIME 240
#define TIME_CORRECTION 0.02

#import "BasicLayer.h"

@interface BackgroundLayer : SKNode <LayerRequirements>

@end
