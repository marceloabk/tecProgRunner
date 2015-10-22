//
//  Enemy.m
//  TecprogRunner
//
//  Distinguishes Enemy and his functions
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "Enemy.h"
#import "Projectile.h"

@implementation Enemy

-(instancetype)initWithPosition:(CGPoint)position{

    // Loading a texture for the enemy
    SKTexture *enemyTexture = [super generateTextureWithImageNamed:INITIAL_ENEMY_IMAGE];
    
    // Init the Sprite with the texture created
    self = [super initWithTexture:enemyTexture];
    
    if(self != nil){
        DebugLog(@"Enemy initialized with texture successfully");
        
        self.position = position;
        
        [self setBasicsAttributes];
        
        // Make Enemy perform idle animation
        SKAction *idle = [self idleAnimation];
        [self runAction:idle];
        
    }else{
        
        DebugLog(@"Enemy can't be initialized");
        
        // There is no alternative path for this if
    }
    
    return self;
}


-(void) setBasicsAttributes{
    // Placeholder image is too big then we rescale it to fit our screen
    [self setScale:0.1];
    
    self.physicsBody = [self generatePhysicsBody];
}


-(SKPhysicsBody *) generatePhysicsBody{
    
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
    physicsBody.mass = 100;
    physicsBody.affectedByGravity = NO;
    physicsBody.allowsRotation = NO;
    
    // Defining types for Collision
    physicsBody.collisionBitMask = ColliderTypePlayer | ColliderTypeProjectile | ColliderTypeWeakEnemy;
    physicsBody.categoryBitMask = ColliderTypeEnemy;
    
    return physicsBody;
}

-(void) throwProjectile{
    // Initial projectile position is the current player position plus half player width
    // This way the projectile is created in player border and it doesn't collide with player
    CGPoint initialProjectilePosition = CGPointMake(self.position.x + self.size.width/2, self.position.y);
    
    NSString *className = [NSString stringWithFormat:@"%@", self.class];
    Projectile *projectile = [[Projectile alloc]initWithPosition:initialProjectilePosition andOwner:className];
    
    [self.parent addChild:projectile];
}

-(SKAction*) idleAnimation{
    
    // Load animation
    SKAction *idleAnimation = [self loadIdleAnimation];
    
    // Make animation repeat forever
    SKAction *repeatAnimation = [SKAction repeatActionForever:idleAnimation];
    
    return repeatAnimation;
}

-(SKAction*) loadIdleAnimation{
    
    DebugLog(@"Loading idle Animation");
    
    // Creating a Mutable Array filled with Idle Animations
    NSMutableArray *idleTextures = [super generateAnimationImages:@"enemyIdle" andCount:2];
    
    // Using textures to make an action
    SKAction *idle = [SKAction animateWithTextures:idleTextures timePerFrame:0.2];
    
    return idle;
}

@end
