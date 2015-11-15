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
@property (nonatomic) CGSize screenSize;

@end

@implementation EnemyGeneratorTests

- (void)setUp{
    [super setUp];
    
    self.screenSize = CGSizeMake(DEFAULT_LAYER_WIDTH, DEFAULT_LAYER_HEIGHT);
    self.gameLayer = [[GameLayer alloc] initWithSize:self.screenSize];
    self.enemyGenerator = [[EnemyGenerator alloc]initWithSize:self.screenSize andBodyAdder:self.gameLayer];
}

- (void)tearDown{
    // Put teardown code here. This method is called after the invocation of each test method in the class
    [super tearDown];
}

// Test if enemy was initialized successfully
- (void)testInitialization{
    XCTAssertNotNil(self.enemyGenerator, @"Enemy generator is nil");
}

// Test if size parameter is not zero
- (void)testSizeParameter{
    BOOL isSizeZero = CGSizeEqualToSize(CGSizeZero, self.screenSize);
    
    XCTAssertFalse(isSizeZero,"Enemy generator size parameter can't be zero");
}

// Test if BodyAdder is not nil
- (void)testBodyAdderParameter{
    XCTAssertNotNil(self.gameLayer, @"Enemy generator BodyAdder parameter can't be nil");
}

@end
