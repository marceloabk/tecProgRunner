//
//  TileGenerator.h
//  TecprogRunner
//
//  Created by Lucas Araujo on 11/6/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tile.h"

@interface TileGenerator : NSObject

-(Tile*) createTileGroundWithSize:(CGSize)size;

-(void) recycleTile:(Tile*) tile;

@end
