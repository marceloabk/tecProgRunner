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
    }else{
        // There is no alternative path for this if
    }
    
    return self;
}

-(void) setBasicsAttributes{
    self.texture.filteringMode = SKTextureFilteringNearest;
}

@end
