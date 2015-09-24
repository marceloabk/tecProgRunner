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

-(void) setBasicsAttributes{
    self.texture.filteringMode = SKTextureFilteringNearest;
}

-(SKPhysicsBody *) generatePhysicsBody{
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.size.width/2];
    physicsBody.allowsRotation = NO;
    physicsBody.affectedByGravity = NO;
    
    return physicsBody;
}


-(void) throwing{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGPoint finalProjectilePosition = CGPointMake(self.position.x + screenWidth, self.position.y);
    SKAction *moveProjectile = [SKAction moveTo:finalProjectilePosition duration:3];
    
    [self runAction:moveProjectile];
}


@end
