//
//  Projectile.m
//  TecprogRunner
//
//  Created by Marcelo Cristiano Araujo Silva on 17/09/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "Projectile.h"

@interface Projectile()

@end

@implementation Projectile

// Initialize the projectile with a position
-(instancetype) initWithPosition:(CGPoint)position{
    self = [super initWithTexture:[SKTexture textureWithImageNamed:@"projectileSprite"]];
    if(self != nil){
        [self setBasicsAttributes];
        
        self.physicsBody = [self generatePhysicsBody];
        self.position = position;
        
        [self throwing];
    }else{
        // There is no alternative path for this if
    }
    
    return self;
}

// Set basics projectile attributes
-(void) setBasicsAttributes{
    // Placeholder image is too big then we rescale it to fit our screen
    [self setScale:0.1];
    
    self.texture.filteringMode = SKTextureFilteringNearest;
}

// Generete projectile physics body
-(SKPhysicsBody *) generatePhysicsBody{
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.size.width/2];
    physicsBody.allowsRotation = NO;
    physicsBody.affectedByGravity = NO;
    
    return physicsBody;
}

// Simulates the trajectory of the launched projectile
-(void) throwing{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGPoint finalProjectilePosition = CGPointMake(self.position.x + screenWidth, self.position.y);
    SKAction *moveProjectile = [SKAction moveTo:finalProjectilePosition duration:2];
    
    [self runAction:moveProjectile];
}


@end
