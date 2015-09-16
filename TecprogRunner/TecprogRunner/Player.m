//
//  Player.m
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "Player.h"

@implementation Player

-(instancetype) init{
    self = [super initWithTexture:[SKTexture textureWithImageNamed:@"playerTexture"]];
    if(self != nil){
        [self generatePhysicsBody];
        [self setBasicsAttributes];
    }
    return self;
}

// Set all the basics attributes that player will have
-(void)setBasicsAttributes{
    // Placeholder image is too big then we rescale it to fit our screen
    [self setScale:0.1];
    self.texture.filteringMode = SKTextureFilteringNearest;
}

// Generate player physics body
-(SKPhysicsBody *)generatePhysicsBody{
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
    physicsBody.allowsRotation = NO;
    physicsBody.mass = 100;
    physicsBody.affectedByGravity = YES;

    return physicsBody;
}

@end
