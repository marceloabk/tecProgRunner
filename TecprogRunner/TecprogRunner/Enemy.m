//
//  Enemy.m
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "Enemy.h"
#import "Projectile.h"

@implementation Enemy

// Initialize Enemy class with a position
-(instancetype)initWithPosition:(CGPoint)position{

    // Creating a texture for the enemy
    SKTexture *enemyTexture = [super generateTextureWithImageNamed:INITIAL_ENEMY_IMAGE];
    
    // Init the Sprite with the texture created
    self = [super initWithTexture:enemyTexture];
    
    if(self != nil){
        NSLog(@"Enemy initialized with texture successfully");
        
        self.physicsBody = [self generatePhysicsBody];
        self.position = position;
        
        [self setBasicsAttributes];
    }else{
        
        NSLog(@"Enemy can't be initialized");
        
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

// Set some basics attributes that enemy will have
-(void) setBasicsAttributes{
    // Placeholder image is too big then we rescale it to fit our screen
    [self setScale:0.1];
    
}

-(void) throwProjectile{
    // Initial projectile position is the current player position plus half player width
    // This way the projectile is created in player border and it doesn't collide with player
    CGPoint initialProjectilePosition = CGPointMake(self.position.x + self.size.width/2, self.position.y);
    
    NSString *className = [NSString stringWithFormat:@"%@", self.class];
    Projectile *projectile = [[Projectile alloc]initWithPosition:initialProjectilePosition andOwner:className];
    
    [self.parent addChild:projectile];
}

@end
