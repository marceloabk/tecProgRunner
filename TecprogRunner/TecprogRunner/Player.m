//
//  Player.m
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "Player.h"
#import "Projectile.h"

@interface Player()
@end

@implementation Player

// Initialize Player class with a position
-(instancetype)initWithPosition:(CGPoint)position{
    
    // Creating a texture for the  player
    SKTexture *playerTexture = [super generateTextureWithImageNamed:INITIAL_PLAYER_IMAGE];
    
    NSAssert((playerTexture != NULL), @"Texture generated for player is NULL");
    
    // Init the Sprite with the texture created
    self = [super initWithTexture:playerTexture];
    
    if(self != nil){
        NSLog(@"Player initialized with texture successfully");
        
        self.physicsBody = [self generatePhysicsBody];
        self.playerOnGround = true;
        self.position = position;
        
        [self setBasicsAttributes];
    }else{
        
        NSLog(@"Player can't be initialized");
        
        // There is no alternative path for this if
    }
    
    return self;
}

// Set all the basics attributes that player will have
-(void) setBasicsAttributes{
    // Placeholder image is too big then we rescale it to fit our screen
    [self setScale:0.1];
    
    self.texture.filteringMode = SKTextureFilteringNearest;
}

// Generate player physics body
-(SKPhysicsBody *) generatePhysicsBody{
    
    // Using a rectangle as PhysicsBody
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
    physicsBody.mass = 100;
    physicsBody.affectedByGravity = NO;
    physicsBody.allowsRotation = NO;

    return physicsBody;
}

// Load animations of player running
-(SKAction*) loadRunAnimation{
    
    NSLog(@"Loading Run Animation");
    
    // Creating a Mutable Array filled with Run Animations
    NSMutableArray *runTextures = [super generateAnimationImages:@"playerRunning" andCount:6];
    
    // Using textures to make an action
    SKAction *run = [SKAction animateWithTextures:runTextures timePerFrame:0.1];
    
    return run;
}

-(SKAction *) runAnimation{
    
    // Load animations
    SKAction *runAnimation = [self loadRunAnimation];
    
    // Make animations repeat forever
    SKAction *repeatAnimation = [SKAction repeatActionForever:runAnimation];
    
    return repeatAnimation;
    
}

// Make player perform a jump when called
-(void) jump{
    self.playerOnGround = false;
    
    NSMutableArray *actionsToPlayerFinishJump = [NSMutableArray array];
    
    float timeToGetHigherPosition = 0; // Time To perform a small part of jump

    for (int i = 0; i < 9; i++) {
        timeToGetHigherPosition += 0.006;
        // Here is used a vector with coordinates (0,16) because the wanted final vector is a (0,144) vector
        // When move by is used it doesn't make a sum or a scalar multiplication of vectors
        SKAction *jumpAction = [SKAction moveBy:CGVectorMake(0, 16) duration:timeToGetHigherPosition];
        [actionsToPlayerFinishJump addObject:jumpAction];
    }
    
    float timeToGetLowestrPosition = 0.054;
    for (int i = 0; i < 9; i++) {
        timeToGetLowestrPosition -= 0.006;
        SKAction *fallAction = [SKAction moveBy:CGVectorMake(0, -16) duration:timeToGetLowestrPosition];
        [actionsToPlayerFinishJump addObject:fallAction];
    }

    SKAction *playerBackToGround = [SKAction runBlock:^{
        self.playerOnGround = true;
    }];
    
    [actionsToPlayerFinishJump addObject:playerBackToGround];

    [self runAction:[SKAction sequence:actionsToPlayerFinishJump]];
}

// Make player throw a projectile when called
-(void) throwProjectile{
    // Initial projectile position is the current player position plus half player width
    // This way the projectile is created in player border and it doesn't collide with player
    CGPoint initialProjectilePosition = CGPointMake(self.position.x + self.size.width/2, self.position.y);
    
    NSString *className = [NSString stringWithFormat:@"%@", self.class];
    Projectile *projectile = [[Projectile alloc]initWithPosition:initialProjectilePosition andOwner:className];
    
    [self.parent addChild:projectile];
}

@end
