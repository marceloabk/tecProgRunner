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

    @try {
        // Loading a texture for the enemy
        SKTexture *enemyTexture = [super generateTextureWithImageNamed:INITIAL_ENEMY_IMAGE];
        
        // Init the Sprite with the texture created
        self = [super initWithTexture:enemyTexture];
        
    }
    @catch (NSException *exception) {
        self = nil;
    }
    
    if(self != nil){
        DebugLog(@"Enemy initialized with texture successfully");
        
        self.position = position;
        
        [self setBasicsAttributes];
        
    }else{
        // Throw exception
        NSException *exception = [NSException exceptionWithName:@"Init Exception" reason:@"Enemy can't be initialized" userInfo:nil];
        [exception raise];
    }
    
    return self;
}


-(void) setBasicsAttributes{
    // Placeholder image is too big then we rescale it to fit our screen
    [self setScale:0.1];
    
    // Set a physics body for Enemy
    @try {
        self.physicsBody = [self generatePhysicsBody];
    }
    @catch (NSException *exception) {
        [self removeFromParent];
    }

}

-(SKPhysicsBody *) generatePhysicsBody{
    
    // Initializing physics body according to superclass
    SKPhysicsBody *physicsBody = [super generatePhysicsBodyWithRectangleOfSize:self.size];
    
    if(physicsBody == nil){
        NSException *exception = [NSException exceptionWithName:@"Physics body" reason:@"Can't generate a physics body for enemy" userInfo:nil];
        [exception raise];
    }else{
        // Continue
    }
    
    // Setting physics body properties
    physicsBody.mass = 100;
    physicsBody.affectedByGravity = YES;
    
    // Defining types for Collision
    physicsBody.collisionBitMask = ColliderTypePlayer | ColliderTypeProjectile | ColliderTypeGround;
    physicsBody.contactTestBitMask = ColliderTypePlayer | ColliderTypeProjectile;
    physicsBody.categoryBitMask = ColliderTypeEnemy;
    
    return physicsBody;
}

@end
