//
//  WeakEnemy.m
//  TecprogRunner
//
//  Created by Marcelo Cristiano Araujo Silva on 28/09/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "WeakEnemy.h"

@implementation WeakEnemy

// Initialize WeakEnemy with a position
-(instancetype) initWithPosition:(CGPoint)position{
    
    // Loading a texture for the weak enemy
    SKTexture *weakEnemyTexture = [super generateTextureWithImageNamed:INITIAL_WEAK_ENEMY_IMAGE];

    // Init the Sprite with the texture created
    self = [super initWithTexture:weakEnemyTexture];

    if(self != nil){
        
        DebugLog(@"Weak Enemy initialized with texture successfully");
        
        self.position = position;
        
        // Make Weak Enemy perform idle animation
        SKAction *idle = [self idleAnimation];
        [self runAction:idle];
        
        [self setBasicsAttributes];
        
    }else{
        
        DebugLog(@"Weak Enemy can't be initialized");
        
        // There is no alternative path for this if
    }
    
    return self;
}

// Set all the basics attributes that weak enemy will have
-(void) setBasicsAttributes{
    // Placeholder image is too big then we rescale it to fit our screen
    [self setScale:0.2];
    
    // Generate and set physics body
    self.physicsBody = [self generatePhysicsBody];

}

// Generate Weak Enemy physics body
-(SKPhysicsBody *) generatePhysicsBody{
    
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
    physicsBody.mass = 100;
    physicsBody.affectedByGravity = NO;
    physicsBody.allowsRotation = NO;
    
    // Defining types for Collision
    physicsBody.collisionBitMask = ColliderTypePlayer | ColliderTypeProjectile | ColliderTypeEnemy;
    physicsBody.categoryBitMask = ColliderTypeWeakEnemy;
    
    return physicsBody;
}

// Repeat idle animation forever
-(SKAction*) idleAnimation{
    
    // Load animation
    SKAction *idleAnimation = [self loadIdleAnimation];
    
    // Make animation repeat forever
    SKAction *repeatAnimation = [SKAction repeatActionForever:idleAnimation];
    
    return repeatAnimation;
}

// Load animations of weak enemy in idle state
-(SKAction*) loadIdleAnimation{
    
    DebugLog(@"Loading idle Animation");
    
    // Creating a Mutable Array filled with Idle Animations
    NSMutableArray *idleTextures = [super generateAnimationImages:@"weakEnemyIdle" andCount:2];
    
    // Using textures to make an action
    SKAction *idle = [SKAction animateWithTextures:idleTextures timePerFrame:0.3];
    
    return idle;
}

@end
