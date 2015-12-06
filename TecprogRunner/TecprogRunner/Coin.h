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

/**
 Coin value
*/
@property (nonatomic) unsigned int value;

/**
 Generate Coin in his parent
 @param parent SKNode* The parent which the coin will be added
 @param position CGPoint Position relative to parent
 @return (Coin*) Instance of a Coin
*/
+(Coin*) generateCoinInParent:(SKNode*)parent withPosition:(CGPoint)position;


/**
 Run the procedures when a Coin get picked
*/
-(void) runScoredMoviment;

@end
