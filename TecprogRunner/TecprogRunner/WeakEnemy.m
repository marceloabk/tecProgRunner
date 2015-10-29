//
//  WeakEnemy.m
//  TecprogRunner
//
//  Distinguishes Weak Enemy and his functions
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "WeakEnemy.h"

@implementation WeakEnemy{
    SKAction *_idle;
}


-(instancetype) initWithPosition:(CGPoint)position{
    
    // Loading a texture for the weak enemy
    SKTexture *weakEnemyTexture = [super generateTextureWithImageNamed:INITIAL_WEAK_ENEMY_IMAGE];

    // Init the Sprite with the texture created
    self = [super initWithTexture:weakEnemyTexture];

    if(self != nil){
        
        DebugLog(@"Weak Enemy initialized with texture successfully");
        
        self.position = position;
        
        [self setBasicsAttributes];
        
    }else{
        
        DebugLog(@"Weak Enemy can't be initialized");
        
        // There is no alternative path for this if
    }
    
    return self;
}


-(void) setBasicsAttributes{
    
    // Placeholder image is too big then we rescale it to fit our screen
    [self setScale:0.2];
    
    // Generate and set physics body
    self.physicsBody = [super generatePhysicsBody];
    
    // Make Weak Enemy perform idle animation
    _idle = [self idleAnimation];
    [self runAction:_idle];
    
    self.health = 2;
}


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
    NSMutableArray *idleTextures = [super generateAnimationImages:WEAK_ENEMY_IDLE andCount:2];
    
    // Using textures to make an action
    SKAction *idle = [SKAction animateWithTextures:idleTextures timePerFrame:0.3];
    
    return idle;
}

@end
