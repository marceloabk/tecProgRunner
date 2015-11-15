//
//  Tile.h
//  TecprogRunner
//
//  Class for tile
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GameObject.h"

@interface Tile : GameObject

/**
 Generates a tile
 containing a physics body
*/
-(void) generateTilePhysicsBodyWithSize:(CGSize)size;

@end
