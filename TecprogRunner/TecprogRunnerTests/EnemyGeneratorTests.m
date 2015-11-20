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

-(void) setUp{
    [super setUp];
    
    self.screenSize = CGSizeMake(DEFAULT_LAYER_WIDTH, DEFAULT_LAYER_HEIGHT);
    self.gameLayer = [[GameLayer alloc] initWithSize:self.screenSize];
    self.enemyGenerator = [[EnemyGenerator alloc]initWithSize:self.screenSize andBodyAdder:self.gameLayer];
}

-(void) tearDown{
    // Put teardown code here. This method is called after the invocation of each test method in the class
    [super tearDown];
}

// Test if enemy was initialized successfully
-(void) testInitialization{
    XCTAssertNotNil(self.enemyGenerator, @"Enemy generator is nil");
}

// Test if size parameter is not zero
-(void) testSizeParameter{
    BOOL isSizeZero = CGSizeEqualToSize(CGSizeZero, self.screenSize);
    
    XCTAssertFalse(isSizeZero,"Enemy generator size parameter can't be zero");
}

// Test if BodyAdder is not nil
-(void) testBodyAdderParameter{
    XCTAssertNotNil(self.gameLayer, @"Enemy generator BodyAdder parameter can't be nil");
}



// Test probability to return an enemy
//-(void) testProbabilityToCreateAnEnemy{
//    int shortValue = SHORT_PROBABILITY_VALUE - 1;
//    int mediumValue = MEDIUM_PROBABILITY_VALUE - 10;
//    int bigValue = SHORT_PROBABILITY_VALUE + MEDIUM_PROBABILITY_VALUE;
//    
//    int probability1 = [self.enemyGenerator probabilityToCreateAnEnemy:shortValue];
//    int probability2 = [self.enemyGenerator probabilityToCreateAnEnemy:mediumValue];
//    int probability3 = [self.enemyGenerator probabilityToCreateAnEnemy:bigValue];
//    
//    XCTAssert(probability1 == 1 || probability1 == 3, @"Probability1 is out of range");
//    XCTAssert(probability2 >= 1 && probability2 <= 3, @"Probability2 is out of range");
//    XCTAssert(probability3 == 2 || probability3 == 3, @"Probability3 is out of range");
//}

// Test if numbers are randomizing correctly
//-(void) testRandomizeNumber{
//    // Create random numbers
//    unsigned int firstNumber = arc4random()%1000;
//    // Guarantee that second number is greater than first number
//    unsigned int secondNumber = arc4random()%1000 + firstNumber;
//    
//    unsigned int randomizedNumber = [self.enemyGenerator randomizeNumberBetween:firstNumber and:secondNumber];
//    
//    XCTAssert(randomizedNumber >= firstNumber && randomizedNumber <= secondNumber, @"The randomized number isn't between the two passed values");
//}


@end
