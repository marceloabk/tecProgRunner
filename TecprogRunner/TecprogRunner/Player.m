//
//  Player.m
//  TecprogRunner
//
//  Distinguishes Player and his functions
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "Player.h"
#import "Projectile.h"

@interface Player()
@end

@implementation Player{
    int isOnGroundChecker;
    SKAction *_runningAnimation;
    SKAction *_jumpAnimation;
    SKAction *_fallAnimation;
}

// Initialize Player class with a position
-(instancetype)initWithPosition:(CGPoint)position{
    
    // Creating a texture for the  player
    SKTexture *playerTexture = [super generateTextureWithImageNamed:INITIAL_PLAYER_IMAGE];
    
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
        
        // Throw Exception
        NSException *exception = [NSException exceptionWithName:@"Init Exception" reason:@"Player can't be initialized" userInfo:nil];
        [exception raise];
        
    }
    
    return self;
}

// Set some basics attributes that player will have
-(void) setBasicsAttributes{
    
    // Placeholder image is too big then we rescale it to fit our screen
    [self setScale:0.1];
    
    // Generate a Physics Body for Player
    self.physicsBody = [self generatePhysicsBody];
    
    self.playerOnGround = true;
    self.isOnGround = false;
    
    [self defineAnimations];
}

// Generate player physics body
-(SKPhysicsBody *) generatePhysicsBody{
    
    // Using a rectangle as PhysicsBody
    SKPhysicsBody *physicsBody = [super generatePhysicsBodyWithRectangleOfSize:self.size];
    physicsBody.mass = 100;
    physicsBody.affectedByGravity = YES;
    
    // Defining types for Collision
    physicsBody.categoryBitMask = ColliderTypePlayer;
    physicsBody.collisionBitMask = ColliderTypeProjectile | ColliderTypeEnemy | ColliderTypeGround;
    physicsBody.contactTestBitMask = ColliderTypeCoin;
    
    return physicsBody;
}

-(void) defineAnimations{
    _runningAnimation = [self loadRunningAnimation];
    _jumpAnimation = [self loadJumpAnimation];
    _fallAnimation = [self loadFallAnimation];
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
    
    DebugLog(@"Loading Running Animation");
    
    // Creating a Mutable Array filled with Run Animations
    NSMutableArray *runTextures = [super generateAnimationImages:@"playerRunning" andCount:6];
    
    // Using textures to make an action
    SKAction *run = [SKAction animateWithTextures:runTextures timePerFrame:0.1];
    
    // Make the action repeat forever
    SKAction *runForever = [SKAction repeatActionForever:run];
    
    return runForever;
}

-(SKAction*) loadJumpAnimation{
    DebugLog(@"Loading Jump Animation");
    
    SKTexture *jumpTexture = [self generateTextureWithImageNamed:@"playerJumping1"];
    
    // Using textures to make an action with certain time
    SKAction *jump = [SKAction animateWithTextures:@[jumpTexture] timePerFrame:0.3];
    
    SKAction *repeatJumpForEver = [SKAction repeatActionForever:jump];
    
    return repeatJumpForEver;
}

-(SKAction*) loadFallAnimation{
    DebugLog(@"Loading Fall Animation");
    
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
        
    }else{
        // Player can't jump while is in the air, by now
    }
    
}

// Make player throw a projectile when called
-(void) throwProjectile{
    
    // Initial projectile position is the current player position plus half player width
    // This way the projectile is created in player border and it doesn't collide with player
    CGPoint initialProjectilePosition = CGPointMake(self.position.x + self.size.width/2, self.position.y);
    
    NSString *className = [NSString stringWithFormat:@"%@", self.class];
    
    @try {
        Projectile *projectile = [[Projectile alloc]initWithPosition:initialProjectilePosition andOwner:className];
        
        [self.physicsBodyAdder addBody:projectile];
        
        [self.parent addChild:projectile];
    }
    @catch (NSException *exception) {
        DebugLog(@"CATCHED EXCEPTION WHILE THROWING PROJECTILE");
    }
}

-(void) setIsOnGround:(BOOL)isOnGround{
    
    // Changing animation depending player status is on ground
    if(isOnGround == true){
        [self changeToAction:PlayerMovimentRun];
    }else{
        [self changeToAction:PlayerMovimentJump];
    }
    
    super.isOnGround = isOnGround;
}

-(void) updateWithDeltaTime:(CFTimeInterval)deltaTime{

    [super updateWithDeltaTime:deltaTime];
    
    if(self.physicsBody.velocity.dy <= 0 && !self.isOnGround){
        [self changeToAction:PlayerMovimentFall];
    }else if(self.physicsBody.velocity.dy > 0 && !self.isOnGround){
        [self changeToAction:PlayerMovimentJump];
    }else{
        // Nothing to do
    }
    
    // Ansure that player is on ground
    if(self.isOnGround == false && self.physicsBody.velocity.dy == 0){
        isOnGroundChecker++;
        
        if(isOnGroundChecker > 1){
            self.isOnGround = true;
        }else{
            // Nothing to do
        }
        
    }else{
        isOnGroundChecker = 0;
    }
}

-(void) changeToAction:(playerMoviments)moviment{
    
    if(self.moviment != moviment){
        
        self.moviment = moviment;
        
        [self removeAllActions];
        
        @try {
            switch (moviment) {
                case PlayerMovimentRun:
                    [self runAction:_runningAnimation];
                    break;
                case PlayerMovimentJump:
                    [self runAction:_jumpAnimation];
                    break;
                    
                case PlayerMovimentFall:
                    [self runAction:_fallAnimation];
                    break;
                    
                default:
                    break;
            }
        }
        @catch (NSException *exception) {
            DebugLog(@"Catched exception: player moviment couldn't be changed");
        }
        
    }else{
        // Keep the moviment
    }
    
}


@end
