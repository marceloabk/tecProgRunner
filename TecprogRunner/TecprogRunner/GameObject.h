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
 Initialize Game object with right position
*/
-(instancetype) initWithPosition:(CGPoint)position;

/**
 Generate Texture with image named
*/
-(SKTexture *) generateTextureWithImageNamed:(NSString *)image;

/**
 Generate a Mutable Array with SKTexture
 Used for animations
 */
-(NSMutableArray*) generateAnimationImages:(NSString*)modelImageName andCount:(int)count;

/**
 Generate physics body with image named
*/
-(SKPhysicsBody *) generatePhysicsBodyWithImageNamed:(NSString *)image;


/**
 Invert Sprite horizontally
*/
-(void) invertSpriteX:(BOOL)option;


/**
 Generate physics body for the GameObject
*/
-(SKPhysicsBody *) generatePhysicsBody;

/**
 Set Basic game object attributes
*/
-(void) setBasicsAttributes;

#pragma mark Defining Contact methods

/**
 Handle when a Contact begin
*/
-(void) beginContactWithNode:(SKNode *)node withBitmask:(uint32_t)bitmask andContact:(SKPhysicsContact *)contact;

/**
 Handle when a Contact end
*/
-(void) endContactWithNode:(SKNode *)node withBitmask:(uint32_t)bitmask andContact:(SKPhysicsContact *)contact;

/**
 Update Object position in reference to his velocity
 @param DeltaTime is the variation time between frames
*/
-(void) updateWithDeltaTime:(CFTimeInterval) deltaTime;

@end
