//
//  Coin.m
//  TecprogRunner
//
//  Created by Julio Xavier on 24/09/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "Coin.h"

@implementation Coin

// Initialize Coin class with a position
-(instancetype)initWithPosition:(CGPoint)position{
    
    // Creating a texture for the Coin
    SKTexture *coinTexture = [super generateTextureWithImageNamed:INITIAL_COIN_IMAGE];
    
    // Init the Sprite with the texture created
    self = [super initWithTexture:coinTexture];
    
    if(self != nil){
        NSLog(@"Coin initialized with texture successfully");
        
        // Make coin spin
        SKAction *spinning = [self spinningAnimation];
        [self runAction: spinning];
        
        self.physicsBody = [self generatePhysicsBody];
        self.position = position;
        
        [self setBasicsAttributes];
    }else{
        
        NSLog(@"Player can't be initialized");
        
        // There is no alternative path for this if
    }
    
    return self;
}

// Generate projectile physics body
-(SKPhysicsBody *) generatePhysicsBody{
    
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.size.width/2];
    physicsBody.mass = 1;
    physicsBody.affectedByGravity = NO;
    physicsBody.allowsRotation = NO;
    
    return physicsBody;
}

// Load animations of coin spinning
-(SKAction*) loadSpinningAnimation{
    
    NSLog(@"Loading Run Animation");
    
    // Creating a Mutable Array filled with Run Animations
    NSMutableArray *runTextures = [super generateAnimationImages:@"Coin" andCount:6];
    
    // Using textures to make an action
    SKAction *run = [SKAction animateWithTextures:runTextures timePerFrame:0.1];
    
    return run;
}

// Make the spinning animation repeat forever
-(SKAction *) spinningAnimation{
    
    // Load animations
    SKAction *runAnimation = [self loadSpinningAnimation];
    
    // Make animations repeat forever
    SKAction *repeatAnimation = [SKAction repeatActionForever:runAnimation];
    
    return repeatAnimation;
    
}

@end
