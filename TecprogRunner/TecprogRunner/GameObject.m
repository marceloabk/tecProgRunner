//
//  GameObject.m
//  TecprogRunner
//
//  General class to create a object in game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "GameObject.h"

@implementation GameObject

#pragma mark Generating and configuring GameObject

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
    imageTexture.filteringMode = SKTextureFilteringNearest;
    
    return imageTexture;
}

-(NSMutableArray*) generateAnimationImages:(NSString*)modelImageName andCount:(int)count{
    
    const unsigned int initialIndex = 1;
    
    // Array used to storage textures
    NSMutableArray *texturesArray = [NSMutableArray array];
    
    // Fill the array with player running textures
    for (int index = initialIndex; index <= count; index++) {
        
        // Selecting image
        NSString *imageName = [NSString stringWithFormat:@"%@%i", modelImageName, index];
        
        // Making texture with the image
        SKTexture *texture = [self generateTextureWithImageNamed:imageName];
        
        // Add the new texture to the Array
        [texturesArray addObject:texture];
        
    }
    
    return texturesArray;
}

-(SKPhysicsBody *) generatePhysicsBodyWithImageNamed:(NSString *)image{
    
    // Generate a physics body with the image
    SKTexture *imageTexture = [self generateTextureWithImageNamed:image];
    
    // Initializing and setting physicsBody
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithTexture:imageTexture size:self.size];
    physicsBody.allowsRotation = NO;
    
    return physicsBody;
}

-(void) invertSpriteX:(BOOL)option{
    
    if (option == YES) {
        // Invert the xScale using the absolut value
        self.xScale = -fabs(self.xScale);
    }else{
        self.xScale = fabs(self.xScale);
    }
    
}

-(SKPhysicsBody *) generatePhysicsBody{
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(100, 100)];
    
    return physicsBody;
}

-(void) setBasicsAttributes{
    
}

#pragma mark Defining Contact methods

-(void) beginContactWithNode:(SKNode *)node withBitmask:(uint32_t)bitmask andContact:(SKPhysicsContact *)contact{
    
    // Getting body names
    NSString *bodyA = contact.bodyA.node.name;
    NSString *bodyB = contact.bodyB.node.name;
    
    NSLog(@"Contact started between %@ and %@", bodyA, bodyB);
}

-(void) endContactWithNode:(SKNode *)node withBitmask:(uint32_t)bitmask andContact:(SKPhysicsContact *)contact{
    
    // Getting body names
    NSString *bodyA = contact.bodyA.node.name;
    NSString *bodyB = contact.bodyB.node.name;
    
    NSLog(@"Contact ended between %@ and %@", bodyA, bodyB);
}

-(void) updateWithDeltaTime:(CFTimeInterval)deltaTime{
    
    CGFloat newX = self.position.x + self.velocity.dx * deltaTime;
    CGFloat newY = self.position.y + self.velocity.dy * deltaTime;
    
    self.position = CGPointMake(newX, newY);
}
@end
