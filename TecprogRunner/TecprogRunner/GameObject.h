//
//  GameObject.h
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameObject : SKSpriteNode

-(SKTexture *)generateTextureWithName:(NSString *)name;

-(SKPhysicsBody *)generatePhysicsBody;

-(void)setBasicsAttributes;

-(void)beginContactWithNode:(SKNode *)node withBitmask:(uint32_t)bitmask andContact:(SKPhysicsContact *)contact;

-(void)endContactWithNode:(SKNode *)node withBitmask:(uint32_t)bitmask andContact:(SKPhysicsContact *)contact;

@end
