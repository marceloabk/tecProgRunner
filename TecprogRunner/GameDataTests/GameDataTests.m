//
//  GameDataTests.m
//  GameDataTests
//
//  Created by Henrique Dutra on 07/12/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GameData.h"

@interface GameDataTests : XCTestCase

@end

@implementation GameDataTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCreation {

    XCTAssertNotNil([GameData sharedGameData]);
    
}

- (void)testInitialData {
    int initialCoins = [GameData sharedGameData].coins;
    int initialGems = [GameData sharedGameData].gems;
    
    
    XCTAssertEqual(initialCoins, 100);
    XCTAssertEqual(initialGems, 5);
}

- (void)testSavingRecord {
    
    int highScore = [GameData sharedGameData].highScore;
    XCTAssertEqual(highScore, 54);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
