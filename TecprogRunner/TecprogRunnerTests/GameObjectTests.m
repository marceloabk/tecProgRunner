//
//  GameObjectTests.m
//  TecprogRunner
//
//  Test Game Object
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GameObject.h"

@interface GameObjectTests : XCTestCase

@property (nonatomic) GameObject *gameObject;

@end

@implementation GameObjectTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.gameObject = [[GameObject alloc] initWithImageNamed:@"gameCenterButton"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// Test Game Object initializer
-(void) testGameObjectInitWithPosition{
    CGPoint position = CGPointMake(arc4random() % 1000, arc4random() % 1000);
    
    GameObject *obj = [self.gameObject initWithPosition:position];
    
    // Test if obj is in the correct position
    XCTAssert(obj.position.x == position.x, @"X Position changed inside the method");
    XCTAssert(obj.position.y == position.y, @"Y Position change inside the method");

}

// Test Generate Texture With Image Name
-(void) testGenerateTextureWithImageName{
    NSString *imageNamed = @"gameCenterButton";
    SKTexture *texture = [self.gameObject generateTextureWithImageNamed:imageNamed];
    
    XCTAssert(texture != nil, @"Texture is nil");
}

// Test Generate Animation Images
-(void) testGenerateAnimationImages{
    const unsigned int numberOfImages = arc4random() % 100 + 1;
    NSMutableArray *animations = [self.gameObject generateAnimationImages:@"someImage" andCount:numberOfImages];
    
    XCTAssert(animations != nil, @"Animations array is nil");
}

// Test Physics Body generation using image
-(void) testGeneratePhysicsBodyWithImage{
    SKPhysicsBody *physicsBody = [self.gameObject generatePhysicsBodyWithImageNamed:@"someImage"];
    
    XCTAssert(physicsBody != nil, "Physics Body generated with image is nil");
}

// Test Invert Sprite X
-(void) testInvertSpriteX{
    CGFloat initialXScale = self.gameObject.xScale;
    
    [self.gameObject invertSpriteX:YES];
    
    CGFloat finalXScale = self.gameObject.xScale;
    
    XCTAssert(initialXScale = -finalXScale, @"XScale isn't inverted");
}

// Test updating
-(void) testUpdateWithDeltaTime{
    self.gameObject.velocity = CGVectorMake(arc4random() % 100, arc4random() % 100);
    
    CGPoint initialPosition = self.gameObject.position;

    [self.gameObject updateWithDeltaTime:10.0];
    
    CGPoint finalPosition = self.gameObject.position;
    
    // Verify if Game Object is changing his position with time
    XCTAssert(initialPosition.x != finalPosition.x, @"Position isn't being updated in x axis");
    XCTAssert(initialPosition.y != finalPosition.y, @"Position isn't being update in y axis");
}

@end
