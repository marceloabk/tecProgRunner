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
    
    // A generic Game Object will be generated as a red sprite
    UIColor *color = [UIColor redColor];
    self = [super initWithColor:color size:self.size];
    
    if(self != nil){
        
        self.position = position;
        
    }else{
        // Throw exception
        NSException *exception = [NSException exceptionWithName:@"Init Exception" reason:@"Game object couldn't be initialized" userInfo:nil];
        [exception raise];
    }
    
    return self;
}

-(SKTexture *) generateTextureWithImageNamed:(NSString *)image{
    
    SKTexture *imageTexture = nil;
    
    if(image != nil){
        // Generate a texture with the image
        imageTexture = [SKTexture textureWithImageNamed:image];
        
        // Setting properties for texture
        imageTexture.filteringMode = SKTextureFilteringNearest;
        
    }else{
        NSException *exception = [NSException exceptionWithName:@"nil texture" reason:@"Texture generated is nil" userInfo:nil];
        [exception raise];
    }
    
    return imageTexture;
}

-(NSMutableArray*) generateAnimationImages:(NSString*)modelImageName andCount:(int)count{
    
    NSAssert(modelImageName != nil, @"generateAnimationImages: NSString 'modelImageName' is nil");
    
    
    // Array used to storage textures
    NSMutableArray *texturesArray = [NSMutableArray array];
    
    if(count > 0){
        // The index will always initialize with 1
        const unsigned int initialIndex = 1;
        
        // Fill the array with player running textures
        for (int index = initialIndex; index <= count; index++) {
            
            // Selecting image
            NSString *imageName = [NSString stringWithFormat:@"%@%i", modelImageName, index];
            
            @try {
                
                // Making texture with the image
                SKTexture *texture = [self generateTextureWithImageNamed:imageName];
                
                // Add the new texture to the Array
                [texturesArray addObject:texture];
                
            }@catch (NSException *exception){
                DebugLog(@"Texture with image named %@ couldn't be generated", imageName);
            }
            
        }
    }else{
        // Throw exception
        NSException *exception = [NSException exceptionWithName:@"Count negative" reason:@"Can't generate animations for a negative count number of images" userInfo:nil];
        [exception raise];
    }
    
    
    return texturesArray;
}

-(SKPhysicsBody *) generatePhysicsBodyWithImageNamed:(NSString *)image{
    
    // Initialize physics body that will be used
    SKPhysicsBody *physicsBody = nil;
    
    if(image != nil){
        // Generate a physics body with the image
        SKTexture *imageTexture = [self generateTextureWithImageNamed:image];
        
        // Initializing and setting physicsBody
        physicsBody = [SKPhysicsBody bodyWithTexture:imageTexture size:self.size];
        physicsBody.allowsRotation = NO;
        physicsBody.restitution = 0;
        
    }else{
        NSException *exception = [NSException exceptionWithName:@"nil image" reason:@"Can't generate a physics body using a nil image" userInfo:nil];
        [exception raise];
    }
    
    return physicsBody;
}

-(void) invertSpriteX:(BOOL)option{
    
    if(option == YES){
        // Invert the xScale using the absolut value
        self.xScale = -fabs(self.xScale);
    }else{
        self.xScale = fabs(self.xScale);
    }
    
}

-(void)setBasicsAttributes{
    
    // Abstract method until now
    
}

-(SKPhysicsBody *) generatePhysicsBodyWithRectangleOfSize:(CGSize)size{
    
    // Initializing a physics body using a rectangle
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:size];
    
    // Setting common properties for objects
    physicsBody.restitution = 0.0;
    physicsBody.allowsRotation = NO;
    
    if(physicsBody != nil){
        // Continue
    }else{
        NSException *exception = [NSException exceptionWithName:@"Physics body exception" reason:@"Failed to generate physics body with rectangle" userInfo:nil];
        [exception raise];
    }
    
    return physicsBody;
}

#pragma mark Updating

-(void) updateWithDeltaTime:(CFTimeInterval)deltaTime{
    
    NSAssert(deltaTime >= 0, @"updateWithDeltaTime: deltaTime is negative");
    
    // Set new coordinates according to velocity and delta time
    CGFloat newX = self.position.x + self.velocity.dx * deltaTime;
    CGFloat newY = self.position.y + self.velocity.dy * deltaTime;
    
    CGPoint newPosition = CGPointMake(newX, newY);
    
    // Updating position
    self.position = newPosition;
}

@end
