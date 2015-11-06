//
//  TileGeneratorTests.m
//  TecprogRunner
//
//  Created by Lucas Araujo on 11/6/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TileGenerator.h"

@interface TileGeneratorTests : XCTestCase
@property (nonatomic) TileGenerator* tileGenerator;
@end

@implementation TileGeneratorTests

- (void)setUp {
    [super setUp];
    self.tileGenerator = [[TileGenerator alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testTileSize {
    CGSize tileSize = CGSizeMake(100, 20);
    Tile* newTile = [self.tileGenerator createTileGroundWithSize:tileSize];

    XCTAssert(CGSizeEqualToSize(newTile.size, tileSize), "Tile size is correct");
}

- (void)testRecycleCount {
    CGSize tileSize = CGSizeMake(100, 20);
    Tile* newTile = [self.tileGenerator createTileGroundWithSize:tileSize];
    
    XCTAssert([self.tileGenerator countRecycledTiles] == 0);
    
    [self.tileGenerator recycleTile:newTile];
    
    XCTAssert([self.tileGenerator countRecycledTiles] == 1);
}

- (void)testMultiplesRecycle {
    CGSize tileSize = CGSizeMake(100, 20);
    NSMutableArray<Tile*> *arrayTiles = [NSMutableArray<Tile*> array];
    
    for (int i = 0; i < 10; i ++) {
        Tile* tile = [self.tileGenerator createTileGroundWithSize:tileSize];
        [self.tileGenerator recycleTile:tile];
    }
    
    XCTAssert([self.tileGenerator countRecycledTiles] == 1);
    
    for (int i = 0; i < 10; i ++) {
        Tile* tile = [self.tileGenerator createTileGroundWithSize:tileSize];
    }
    
    XCTAssert([self.tileGenerator countRecycledTiles] == 0);
    
    for (int i = 0; i < 10; i ++) {
        Tile* tile = [self.tileGenerator createTileGroundWithSize:tileSize];
        [arrayTiles addObject:tile];
    }
    
    for (Tile *tile in arrayTiles) {
        [self.tileGenerator recycleTile:tile];
    }
    
    XCTAssert([self.tileGenerator countRecycledTiles] == arrayTiles.count);
}

@end
