//
//  Coin.h
//  TecprogRunner
//
//  Object that represent Coins that can be picked inside the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GameObject.h"
#define INITIAL_COIN_IMAGE @"Coin1"

@interface Coin : GameObject

@property (nonatomic) unsigned int value;

+(Coin*) generateCoinInParent:(SKNode*) parent withPosition:(CGPoint) position;

- (void) runScoredMoviment;

@end
