//
//  StrongEnemy.m
//  TecprogRunner
//
//  Distinguishes Strong Enemy and his functions
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "StrongEnemy.h"

@implementation StrongEnemy

// Initialize StrongEnemy with a position
-(instancetype) initWithPosition:(CGPoint)position{
    
    // Loading a texture for the strong enemy
    SKTexture *strongEnemyTexture = [super generateTextureWithImageNamed:INITIAL_STRONG_ENEMY_IMAGE];
    
    self = [super initWithTexture:strongEnemyTexture];
    
    if(self != nil){
        
        DebugLog(@"Strong Enemy initialized with texture successfully");
        
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

// Set all the basics attributes that strong enemy will have
-(void) setBasicsAttributes{
    // Placeholder image is too big then we rescale it to fit our screen
    [self setScale:0.1];
    
    self.physicsBody = [self generatePhysicsBody];
    
    self.lives = 4;

}

// Generate Strong Enemy physics body
-(SKPhysicsBody *) generatePhysicsBody{
    
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
    physicsBody.mass = 100;
    physicsBody.affectedByGravity = YES;
    physicsBody.allowsRotation = NO;
    
    // Defining types for Collision
    physicsBody.collisionBitMask = ColliderTypePlayer | ColliderTypeProjectile | ColliderTypeGround;
    physicsBody.contactTestBitMask = ColliderTypeProjectile;
    physicsBody.categoryBitMask = ColliderTypeEnemy;
    
    return physicsBody;
}

// Load animations of Strong enemy in idle state
-(SKAction*) loadIdleAnimation{
    
    DebugLog(@"Loading idle Animation");
    
    NSMutableArray *idleTextures = [super generateAnimationImages:@"enemyIdle" andCount:2];
    SKAction *idle = [SKAction animateWithTextures:idleTextures timePerFrame:0.3];
    
    return idle;
}

// Repeat idle animation forever
-(SKAction*) idleAnimation{
    
    SKAction *idleAnimation = [self loadIdleAnimation];
    SKAction *repeatAnimation = [SKAction repeatActionForever:idleAnimation];
    
    return repeatAnimation;
}

@end