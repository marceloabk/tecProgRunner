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

@implementation Projectile{
    CGPoint _finalProjectilePosition;
    BOOL _isEnemy;
}

-(instancetype) initWithPosition:(CGPoint)position andOwner:(NSString*)ownerName{
    
    // Creating a texture for the Projectile
    SKTexture *projectileTexture = [super generateTextureWithImageNamed:DEFAULT_PROJECTILE_IMAGE];
    
    NSAssert((projectileTexture != NULL), @"Texture generated for projectile is NULL");
    
    // Init the Sprite with the texture created
    self = [super initWithTexture:projectileTexture];
    
    if(self != nil){
        
        DebugLog(@"Projectile initialized with texture sucessfully");
        
        self.position = position;
        
        self.ownerName = ownerName;
        [self setBasicsAttributes];
        
        
        [self moveProjectile];
    }else{
        
        DebugLog(@"Projectile can't be initialized");
        
        // There is no alternative path for this if
    }
    
    return self;
}

// Set basics Projectile attributes
-(void) setBasicsAttributes{
    
    // Set the root of the projectile
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    _finalProjectilePosition = CGPointMake(self.position.x + screenWidth, self.position.y);
    
    [self conformToOwner];
    
    // Generate a Physics Body for Proojectile
    self.physicsBody = [self generatePhysicsBody];
    
}

// Set presentation and final position according to Owner
-(void) conformToOwner{
    
    // Verify if the Owner is a Enemy
    _isEnemy = [self.ownerName isEqualToString:ENEMY_NAME];
    
    if(_isEnemy == YES){
        // Invert Sprite Horizontally
        [super invertSpriteX:YES];
        
        // Invert the final X Position
        _finalProjectilePosition.x = -_finalProjectilePosition.x;
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
    
    // Set the move action
    SKAction *moveProjectile = [SKAction moveTo:_finalProjectilePosition duration:1.2];
    
    // Run the action and remove projectile
    [self runAction:moveProjectile completion:^{
        [self removeFromParent];
    }];
}

-(void) invertFinalProjectileXPosition{
    if (_isEnemy == YES) {
        _finalProjectilePosition.x = -_finalProjectilePosition.x;
    }else{
        // Do nothing
    }
}


@end
