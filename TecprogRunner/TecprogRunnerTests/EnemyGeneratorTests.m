//
//  EnemyGeneratorTests.m
//  TecprogRunner
//
//  Test enemy generator
//
//  Copyright © 2015 Bepid-UnB. All rights reserved.

#import <XCTest/XCTest.h>
#import "EnemyGenerator.h"
#import "GameLayer.h"

@interface EnemyGeneratorTests : XCTestCase

@property (nonatomic) EnemyGenerator *enemyGenerator;
@property (nonatomic) GameLayer *gameLayer;


@end

@implementation EnemyGeneratorTests

- (void)setUp{
    [super setUp];
    
    CGSize screenSize = CGSizeMake(DEFAULT_LAYER_WIDTH, DEFAULT_LAYER_HEIGHT);
    self.gameLayer = [[GameLayer alloc] initWithSize:screenSize];
    self.enemyGenerator = [[EnemyGenerator alloc]initWithSize:screenSize andBodyAdder:self.gameLayer];
}

- (void)tearDown{
    // Put teardown code here. This method is called after the invocation of each test method in the class
    [super tearDown];
}



- (void)testExample{
    // This is an example of a functional test case
    // Use XCTAssert and related functions to verify your tests produce the correct results
}

- (void)testPerformanceExample{
    // This is an example of a performance test case
    [self measureBlock:^{
        // Put the code you want to measure the time of here
    }];
}

@end
