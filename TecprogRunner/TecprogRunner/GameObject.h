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

-(instancetype) initWithPosition:(CGPoint)position;

-(SKTexture *) generateTextureWithImageNamed:(NSString *)image;

-(SKPhysicsBody *) generatePhysicsBodyWithImageNamed:(NSString *)image;

-(SKPhysicsBody *) generatePhysicsBody;

-(void) setBasicsAttributes;

#pragma mark Defining Contact methods

-(void) beginContactWithNode:(SKNode *)node withBitmask:(uint32_t)bitmask andContact:(SKPhysicsContact *)contact;

-(void) endContactWithNode:(SKNode *)node withBitmask:(uint32_t)bitmask andContact:(SKPhysicsContact *)contact;

@end
