//
//  Enemy.m
//  TecprogRunner
//
//  Distinguishes Enemy and his functions
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "Enemy.h"

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
    physicsBody.affectedByGravity = YES;
    physicsBody.allowsRotation = NO;
    
    // Defining types for Collision
    physicsBody.collisionBitMask = ColliderTypePlayer | ColliderTypeProjectile | ColliderTypeGround;
    physicsBody.contactTestBitMask = ColliderTypePlayer | ColliderTypeProjectile;
    physicsBody.categoryBitMask = ColliderTypeEnemy;
    
    return physicsBody;
}

@end
