//
//  Player.m
//  TecprogRunner
//
//  Distinguishes Player and his functions
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "Player.h"
#import "Projectile.h"

#define JUMP_IMPULSE 500

typedef enum playerMoviments{
    PlayerMovimentRun,
    PlayerMovimentJump,
    PlayerMovimentFall
}playerMoviments;

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
        DebugLog(@"Player initialized with texture successfully");
        
        [self setBasicsAttributes];
        
        // Make player run
        SKAction *running = [self runningAnimation];
        [self runAction:running];
        
        self.position = position;
        
    }else{
        
        DebugLog(@"Player can't be initialized");
        
        // There is no alternative path for this if
    }
    
    return self;
}

// Set some basics attributes that player will have
-(void) setBasicsAttributes{
    // Placeholder image is too big then we rescale it to fit our screen
    [self setScale:0.1];
    
    // Generate a Physics Body for Player
    self.physicsBody = [self generatePhysicsBody];
    self.physicsBody.allowsRotation = false;
    self.physicsBody.affectedByGravity = true;
    
    self.playerOnGround = true;
    self.isOnGround = false;
}

// Generate player physics body
-(SKPhysicsBody *) generatePhysicsBody{
    
    // Using a rectangle as PhysicsBody
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
    physicsBody.mass = 100;
    physicsBody.affectedByGravity = NO;
    physicsBody.allowsRotation = YES;
    
    // Defining types for Collision
    physicsBody.categoryBitMask = ColliderTypePlayer;
    physicsBody.collisionBitMask = ColliderTypeProjectile | ColliderTypeEnemy | ColliderTypeGround;
    physicsBody.contactTestBitMask = ColliderTypeCoin;
    
    return physicsBody;
}

// Repeat running animation forever
-(SKAction *) runningAnimation{
    
    // Load animations
    SKAction *runAnimation = [self loadRunningAnimation];
    
    // Make animations repeat forever
    SKAction *repeatAnimation = [SKAction repeatActionForever:runAnimation];
    
    return repeatAnimation;
    
}

// Load animations of player running
-(SKAction*) loadRunningAnimation{
    
    DebugLog(@"Loading Run Animation");
    
    // Creating a Mutable Array filled with Run Animations
    NSMutableArray *runTextures = [super generateAnimationImages:@"playerRunning" andCount:6];
    
    // Using textures to make an action
    SKAction *run = [SKAction animateWithTextures:runTextures timePerFrame:0.1];
    
    SKAction *runForever = [SKAction repeatActionForever:run];
    
    return runForever;
}

-(SKAction*) loadJumpAnimation{
    DebugLog(@"Loading Jump Animation");
    
    // Creating a Mutable Array filled with Run Animations
//    NSMutableArray *jumpTextures = [super generateAnimationImages:@"playerJumping" andCount:2];
    
    SKTexture *jumpTexture = [self generateTextureWithImageNamed:@"playerJumping1"];
    
    // Using textures to make an action with certain time
    SKAction *jump = [SKAction animateWithTextures:@[jumpTexture] timePerFrame:0.3];
    
    SKAction *repeatJumpForEver = [SKAction repeatActionForever:jump];
    
    return repeatJumpForEver;
}

-(SKAction*) loadFallAnimation{
    DebugLog(@"Loading Fall Animation");
    
    // Creating a Mutable Array filled with Run Animations
    //    NSMutableArray *jumpTextures = [super generateAnimationImages:@"playerFalling" andCount:2];
    
    SKTexture *fallTexture = [self generateTextureWithImageNamed:@"playerFalling1"];
    
    // Using textures to make an action with certain time
    SKAction *fall = [SKAction animateWithTextures:@[fallTexture] timePerFrame:0.3];
    
    SKAction *repeatfallForEver = [SKAction repeatActionForever:fall];
    
    return repeatfallForEver;
}

// Make player perform a jump when called
-(void) jump{
    
    if(self.isOnGround){
        self.physicsBody.velocity = CGVectorMake(self.physicsBody.velocity.dx, self.physicsBody.velocity.dy + JUMP_IMPULSE);
        
        self.isOnGround = false;
    }
    else {
        // Player can't jump while is in the air, by now
    }

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

-(void) setIsOnGround:(BOOL)isOnGround{
    
    // Changing animation depending player status is on ground
    if(isOnGround == true){
        [self changeToAction:PlayerMovimentRun];
    }
    else {
        [self changeToAction:PlayerMovimentJump];
    }
    
    super.isOnGround = isOnGround;
}

-(void) updateWithDeltaTime:(CFTimeInterval)deltaTime{
    
    [super updateWithDeltaTime:deltaTime];
    
    if(self.physicsBody.velocity.dy <= 0 && !self.isOnGround){
        [self changeToAction:PlayerMovimentFall];
    } else if(self.physicsBody.velocity.dy > 0 && !self.isOnGround){
        [self changeToAction:PlayerMovimentJump];
    }
}

-(void) changeToAction:(playerMoviments) moviment{

    [self removeAllActions];
    
    switch (moviment) {
        case PlayerMovimentRun:
            [self runAction:[self loadRunningAnimation]];
            break;
        case PlayerMovimentJump:
            [self runAction:[self loadJumpAnimation]];
            break;
            
        case PlayerMovimentFall:
            [self runAction:[self loadFallAnimation]];
            break;
            
        default:
            break;
    }
}

@end
