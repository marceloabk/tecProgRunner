//
//  TileGenerator.m
//  TecprogRunner
//
//  Created by Lucas Araujo on 11/6/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "TileGenerator.h"

@implementation TileGenerator{
    NSMutableArray<Tile*>* _recycleTiles;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _recycleTiles = [[NSMutableArray<Tile*> alloc] init];
    }
    return self;
}

-(Tile*) createTileGroundWithSize:(CGSize)size{
    
    Tile* tile;
    if(_recycleTiles.count <= 0){
        tile = [[Tile alloc] initWithColor:GREEN_COLOR size:size];
        tile.name = @"ground";
        tile.position = CGPointMake(0.0, 0.0);
    }else{
        tile = [_recycleTiles lastObject];
        [_recycleTiles removeLastObject];
        tile.size = size;
    }
    
    [tile generateTilePhysicsBodyWithSize:size];
    
    return tile;
}

-(void) recycleTile:(Tile *)tile{
    [_recycleTiles addObject:tile];
}

@end
