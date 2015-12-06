//
//  TileGeneratorTests.m
//  TecprogRunner
//
//  Test Tile Generator
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

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
    
    newTile = [self.tileGenerator createTileGroundWithSize:tileSize];
    
    XCTAssert([self.tileGenerator countRecycledTiles] == 0);
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
        tile.hidden = false;
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

- (void)testRecyclingATileThatAlreadyIsRecycled {
    CGSize tileSize = CGSizeMake(100, 20);
    Tile* newTile = [self.tileGenerator createTileGroundWithSize:tileSize];
    
    BOOL tileRecycled = [self.tileGenerator recycleTile:newTile];
    XCTAssert([self.tileGenerator countRecycledTiles] == 1 && tileRecycled == YES);
    
    tileRecycled = [self.tileGenerator recycleTile:newTile];
    
    XCTAssert([self.tileGenerator countRecycledTiles] == 1 && tileRecycled == NO);
}

- (void)testRecyclingNilTile{
    
    BOOL tileRecycled = [self.tileGenerator recycleTile:nil];
    
    XCTAssert(tileRecycled == NO && self.tileGenerator.countRecycledTiles == 0);
}

@end
