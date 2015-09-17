//
//  Player.m
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "Player.h"

@interface Player()

@end

@implementation Player

-(instancetype) init{
    self = [super initWithTexture:[SKTexture textureWithImageNamed:@"playerTexture"]];
    
    if(self != nil){
        self.physicsBody = [self generatePhysicsBody];
        self.playerOnGound = true;
        
        [self setBasicsAttributes];
    }else{
        // There is no alternative path for this else
    }
    return self;
}

// Set all the basics attributes that player will have
-(void) setBasicsAttributes{
    // Placeholder image is too big then we rescale it to fit our screen
    [self setScale:0.1];
    self.texture.filteringMode = SKTextureFilteringNearest;
    self.position = CGPointMake(self.size.width,self.size.height);
}

// Generate player physics body
-(SKPhysicsBody *) generatePhysicsBody{
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
    physicsBody.allowsRotation = NO;
    physicsBody.mass = 100;
    physicsBody.affectedByGravity = NO;

    return physicsBody;
}

// Make player perform a jump when called
-(void) jump{
    // Need to be improved to make a more realistic jump
    self.playerOnGound = false;
    
    SKAction *jumpAction = [SKAction moveBy:CGVectorMake(0, 150) duration:0.2];
    SKAction *fallAction = [SKAction moveBy:CGVectorMake(0, -150) duration:0.3];
    SKAction *playerBackToGround = [SKAction runBlock:^{
        self.playerOnGound = true;
    }];
    SKAction *sequence = [SKAction sequence:@[jumpAction,fallAction,playerBackToGround]];
    
    [self runAction:sequence];
}

@end
