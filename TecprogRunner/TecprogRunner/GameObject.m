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

// init the GameObject with a position
-(instancetype) initWithPosition:(CGPoint)position{
    self = [super init];
    if(self != nil){
        
    }else{
        // There is no alternative path for this if
    }
    
    return self;
}

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
    
    return physicsBody;
}

-(SKPhysicsBody *) generatePhysicsBody{
    // Generate a physics body
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(100, 100)];
    
    return physicsBody;
}

    // Set attributes for the default "GameObject"
-(void) setBasicsAttributes{
    
}

#pragma mark Defining Contact methods

    // Handling for when the contact starts
-(void) beginContactWithNode:(SKNode *)node withBitmask:(uint32_t)bitmask andContact:(SKPhysicsContact *)contact{
    
    // Getting body names
    NSString *bodyA = contact.bodyA.node.name;
    NSString *bodyB = contact.bodyB.node.name;
    
    NSLog(@"Contact started between %@ and %@", bodyA, bodyB);
}
    // Handling for when the contact ends
-(void) endContactWithNode:(SKNode *)node withBitmask:(uint32_t)bitmask andContact:(SKPhysicsContact *)contact{
    NSString *bodyA = contact.bodyA.node.name;
    NSString *bodyB = contact.bodyB.node.name;
    
    NSLog(@"Contact ended between %@ and %@", bodyA, bodyB);
}

@end
