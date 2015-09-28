//
//  GameObject.m
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "GameObject.h"

@implementation GameObject

#pragma mark Generating and configuring GameObject

-(SKTexture *) generateTextureWithImageNamed:(NSString *)image{
    // Generate a texture with the image
    SKTexture *imageTexture = [SKTexture textureWithImageNamed:image];
    
    return imageTexture;
}

-(SKPhysicsBody *) generatePhysicsBodyWithImageNamed:(NSString *)image{
    // Generate a physics body with the image
    SKTexture *imageTexture = [self generateTextureWithImageNamed:image];
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithTexture:imageTexture size:self.size];
    physicsBody.allowsRotation = NO;
    physicsBody.affectedByGravity = NO;
    
    return physicsBody;
}

-(SKPhysicsBody *) generatePhysicsBody{
    // Generate a physics body
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(100, 100)];
    
    return physicsBody;
}

-(void) setBasicsAttributes{
    // Set attributes for the default "GameObject"
}

#pragma mark Defining Contact methods

-(void) beginContactWithNode:(SKNode *)node withBitmask:(uint32_t)bitmask andContact:(SKPhysicsContact *)contact{
    // Handling for when the contact starts
}

-(void) endContactWithNode:(SKNode *)node withBitmask:(uint32_t)bitmask andContact:(SKPhysicsContact *)contact{
    // Handling for when the contact ends
}

@end
