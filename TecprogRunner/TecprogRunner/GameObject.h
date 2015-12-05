//
//  GameObject.h
//  TecprogRunner
//
//  General class to create a object in game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GlobalHeaders.h"
#import "PhysicsCategories.h"

@interface GameObject : SKSpriteNode

@property (nonatomic) CGVector velocity;
@property (nonatomic) BOOL isOnGround;

#pragma mark Generating and configuring GameObject

/**
 Initialize Game Object
 @param position CGPoint The initial position
 @return (instancetype) The instance of the GameObject
*/
-(instancetype) initWithPosition:(CGPoint)position;

/**
 Generate Texture with image named
 @param image NSString with the name of a image contained in bundle
 @return (SKTexture*) The texture generated
*/
-(SKTexture*) generateTextureWithImageNamed:(NSString*)image;

/**
 Generate a Mutable Array to make animations
 @param modelImageName NSString The suffix contained in the sequence of images. For example: 'enemyIdle'.
 @param count int The count of the sequence of images.
 @return (NSMutableArray*) An array filled with SKTexture's
 */
-(NSMutableArray*) generateAnimationImages:(NSString*)modelImageName andCount:(int)count;

/**
 Generate physics body
 @param image NSString with the name of a image contained in bundle
 @return (SKPhysicsBody*) The physics body instance
*/
-(SKPhysicsBody*) generatePhysicsBodyWithImageNamed:(NSString *)image;


/**
 Invert Sprite horizontally
 @param option BOOL If is YES, invert the sprite horizontally, otherwise, don't invert.
*/
-(void) invertSpriteX:(BOOL)option;


/**
 Generate physics body using a rectangle
 @param size CGSize Contain the size of the rectangle that will be created
 @return (SKPhysicsBody*) The physics body instance
*/
-(SKPhysicsBody *) generatePhysicsBodyWithRectangleOfSize:(CGSize)size;

/**
 Set Basic Game Object attributes
*/
-(void) setBasicsAttributes;


/**
 Update Object position in reference to his velocity
 @param DeltaTime is the variation time between frames
*/
-(void) updateWithDeltaTime:(CFTimeInterval) deltaTime;

@end
