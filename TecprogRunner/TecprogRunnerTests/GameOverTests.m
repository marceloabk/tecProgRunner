//
//  GameOverTests.m
//  TecprogRunner
//
//  Test Game Over
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GameOver.h"

@interface GameOverTests : XCTestCase

@property (nonatomic) GameOver *gameOver;

@end

@implementation GameOverTests

-(void) setUp{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

-(void) tearDown{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testExample{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

-(void) testPerformanceExample{
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void) testAddRestartButton{
    self.gameOver = [[GameOver alloc]init];
    NSArray *gameOverChildren = [self.gameOver children];
    
    BOOL isThereRestartButton = false;
    NSString *restartButtonName = @"restartButton";
    
    for (SKNode *node in gameOverChildren) {
        if ([node.name isEqualToString: restartButtonName]) {
            isThereRestartButton = true;
        }
    }
    
    XCTAssert(isThereRestartButton == true, @"gameOver isn't creating the restart button");
}

@end
