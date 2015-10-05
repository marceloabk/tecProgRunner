//
//  GameObject.h
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameObject : SKSpriteNode

#pragma mark Generating and configuring GameObject

/**
 Init Game object with right position
*/
-(instancetype) initWithPosition:(CGPoint)position;

/**
 Generate Texture with image named
*/
-(SKTexture *) generateTextureWithImageNamed:(NSString *)image;

/**
 Generate physics body with image named
*/
-(SKPhysicsBody *) generatePhysicsBodyWithImageNamed:(NSString *)image;

/**
 Generate physics body
*/
-(SKPhysicsBody *) generatePhysicsBody;

/**
 Set Basic game object attributes
*/
-(void) setBasicsAttributes;

#pragma mark Defining Contact methods

-(void) beginContactWithNode:(SKNode *)node withBitmask:(uint32_t)bitmask andContact:(SKPhysicsContact *)contact;

-(void) endContactWithNode:(SKNode *)node withBitmask:(uint32_t)bitmask andContact:(SKPhysicsContact *)contact;

@end
