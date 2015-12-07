//
//  GameLayerTests.m
//  TecprogRunner
//
//  Test GameLayerClass
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GameLayer.h"

@interface GameLayerTests : XCTestCase

@property (nonatomic) GameLayer *gameLayer;

@end

@implementation GameLayerTests

-(void) setUp{
    [super setUp];
    
    // Just creating a size for tests
    CGSize randomSize = CGSizeMake(20, 20);
    self.gameLayer = [[GameLayer alloc]initWithSize:randomSize];
    [self.gameLayer activateLayer];
    
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

// Test if gameLayer is loading the pause button
-(void) testLoadPauseButton{
    // Preparing the test
    NSArray *gameLayerChildren = [self.gameLayer children];
    NSString *pauseButtonName = @"pauseButton";
    BOOL isTherePauseButton = false;
    
    for (SKNode *node in gameLayerChildren) {
        if ([node.name isEqualToString:pauseButtonName]) {
            NSLog(@"Found the pause button");
            isTherePauseButton = true;
        }
    }
    
    XCTAssert(isTherePauseButton == true, "GameLayer isn't loading the pause button");
}

// Test if gameLayer is initializing the PhysicsController
-(void) testInitializePhysicsController{
    XCTAssertNotNil(self.gameLayer.physicsController, "Game layer is not initializing the physicsController");
}

// testPausedClicked succeed, commenting because it use private methods and attributes

// Test when the player clicked in the pause button
//-(void) testPausedClicked{
//    // Preparing the test
//    NSArray *sceneLayerChildren = [self.gameLayer children];
//    NSString *pauseLayerName = @"pauseLayer";
//    BOOL isTherePauseLayer = false;
//    
//    for (SKNode *node in sceneLayerChildren) {
//        if ([node.name isEqualToString:pauseLayerName]) {
//            NSLog(@"Found the pause layer");
//            isTherePauseLayer = true;
//        }
//    }
//    
//    XCTAssert(isTherePauseLayer == true, "SceneLayer isn't loading the pause layer");
//}


@end
