//
//  Projectile.m
//  TecprogRunner
//
//  Created by Marcelo Cristiano Araujo Silva on 17/09/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "Projectile.h"

@interface Projectile()
@property NSString* ownerName;
@end

@implementation Projectile

-(instancetype) initWithPosition:(CGPoint)position andOwner:(NSString*)ownerName{
    
    // Creating a texture for the projectile
    SKTexture *projectileTexture = [super generateTextureWithImageNamed:DEFAULT_PROJECTILE_IMAGE];
    
    NSAssert((projectileTexture != NULL), @"Texture generated for projectile is NULL");
    
    // Init the Sprite with the texture created
    self = [super initWithTexture:projectileTexture];
    
    if(self != nil){
        
        NSLog(@"Projectile initialized with texture sucessfully");
        
        self.ownerName = ownerName;
        [self setBasicsAttributes];
        
        self.physicsBody = [self generatePhysicsBody];
        self.position = position;
        
        [self moveProjectile];
    }else{
        
        NSLog(@"Projectile can't be initialized");
        
        // There is no alternative path for this if
    }
    
    return self;
}

// Set basics projectile attributes
-(void) setBasicsAttributes{

    // Verify if the Owner is a Enemy
    BOOL isEnemy = [self.ownerName isEqualToString:ENEMY_NAME];
    if(isEnemy == YES){
        [super invertSpriteX:YES];
    }else{
        // Do nothing
    }
}

// Generate projectile physics body
-(SKPhysicsBody *) generatePhysicsBody{
    
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.size.width/2];
    physicsBody.mass = 1;
    physicsBody.affectedByGravity = NO;
    physicsBody.allowsRotation = NO;
    
    // Defining types for Collision
    physicsBody.collisionBitMask = ColliderTypeEnemy | ColliderTypePlayer;
    physicsBody.categoryBitMask = ColliderTypeProjectile;
    
    return physicsBody;
}

// Simulates the trajectory of the launched projectile
-(void) moveProjectile{
    
    // Get the root of the projectile
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    CGPoint finalProjectilePosition = CGPointMake(self.position.x + screenWidth, self.position.y);
    
    // Invert the final position if the owner is a Enemy
    BOOL isEnemy = [self.ownerName isEqualToString:ENEMY_NAME];
    if (isEnemy) {
        finalProjectilePosition.x = -finalProjectilePosition.x;
    }else{
        // Do nothing
    }
    
    // Set the move action
    SKAction *moveProjectile = [SKAction moveTo:finalProjectilePosition duration:1.2];
    
    // Run the action and remove projectile
    [self runAction:moveProjectile completion:^{
        [self removeFromParent];
    }];
}


@end
