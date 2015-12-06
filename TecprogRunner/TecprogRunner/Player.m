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

-(void) setBasicsAttributes{
    
    // Placeholder image is too big then we rescale it to fit our screen
    [self setScale:0.1];
    
    // Generate a Physics Body for Player
    self.physicsBody = [self generatePhysicsBody];
    
    self.playerOnGround = YES;
    self.isOnGround = NO;
    
    [self defineAnimations];
}

/**
 Generate player physics body
*/
-(SKPhysicsBody *) generatePhysicsBody{
    
    SKPhysicsBody *physicsBody = nil;
    
    @try {
        // Using a rectangle as PhysicsBody
        physicsBody = [super generatePhysicsBodyWithRectangleOfSize:self.size];
        physicsBody.mass = 100;
        physicsBody.affectedByGravity = YES;
        
        // Defining types for Collision
        physicsBody.categoryBitMask = ColliderTypePlayer;
        physicsBody.collisionBitMask = ColliderTypeProjectile | ColliderTypeEnemy | ColliderTypeGround;
        physicsBody.contactTestBitMask = ColliderTypeCoin | ColliderTypeProjectile;
    }@catch (NSException *exception) {
        // Throw exception
        [exception raise];
    }
    
    return physicsBody;
}

/**
 Initialize all player animations
*/
-(void) defineAnimations{
    _runningAnimation = [self loadRunningAnimation];
    _jumpAnimation = [self loadJumpAnimation];
    _fallAnimation = [self loadFallAnimation];
}

/**
 Repeat running animation forever
*/
-(SKAction *) runningAnimation{
    
    // Initializing animation as nil
    SKAction *repeatAnimation = nil;
    
    // Load animations
    SKAction *runAnimation = [self loadRunningAnimation];
    
    // Make animations repeat forever
    repeatAnimation = [SKAction repeatActionForever:runAnimation];
    
    return repeatAnimation;
    
}

// Load animations of player running
-(SKAction*) loadRunningAnimation{
    
    DebugLog(@"Loading Running Animation");
    
    // Start the animation as nil
    SKAction *runForever = nil;
    
    @try {
        // Creating a Mutable Array filled with Run Animations
        NSMutableArray *runTextures = [super generateAnimationImages:@"playerRunning" andCount:6];
        
        // Using textures to make an action
        SKAction *run = [SKAction animateWithTextures:runTextures timePerFrame:0.1];
        
        // Make the action repeat forever
        runForever = [SKAction repeatActionForever:run];
    }@catch (NSException *exception) {
        // Continue
    }
    
    return runForever;
}

-(SKAction*) loadJumpAnimation{
    DebugLog(@"Loading Jump Animation");
    
    // Initializing the action as nil
    SKAction *repeatJumpForever = nil;
    
    @try {
        SKTexture *jumpTexture = [self generateTextureWithImageNamed:@"playerJumping1"];
        
        // Using textures to make an action with certain time
        SKAction *jump = [SKAction animateWithTextures:@[jumpTexture] timePerFrame:0.3];
        
        repeatJumpForever = [SKAction repeatActionForever:jump];
        
    }@catch (NSException *exception) {
        // Continue
    }
    
    
    return repeatJumpForever;
}

-(SKAction*) loadFallAnimation{
    DebugLog(@"Loading Fall Animation");
    
    // Initializing the action as nil
    SKAction* repeatFallForever = nil;
    
    @try {
        SKTexture *fallTexture = [self generateTextureWithImageNamed:@"playerFalling1"];
        
        // Using textures to make an action with certain time
        SKAction *fall = [SKAction animateWithTextures:@[fallTexture] timePerFrame:0.2];
        
        repeatFallForever = [SKAction repeatActionForever:fall];
        
    }@catch (NSException *exception) {
        
    }
    
    return repeatFallForever;
}

-(BOOL) jump{
    
    BOOL jumped = NO;
    
    if(self.isOnGround){
        self.physicsBody.velocity = CGVectorMake(self.physicsBody.velocity.dx, self.physicsBody.velocity.dy + JUMP_IMPULSE);
        self.isOnGround = NO;
        
        jumped = YES;
        
    }else{
        // Player can't jump while is in the air, by now
        // Variable jumped remain as NO
    }
    
    return jumped;
}

-(BOOL) throwProjectile{
    
    BOOL success = NO;
    
    // Initial projectile position is the current player position plus half player width
    // This way the projectile is created in player border and it doesn't collide with player
    CGPoint initialProjectilePosition = CGPointMake(self.position.x + self.size.width, self.position.y);
    
    NSString *className = [NSString stringWithFormat:@"%@", self.class];
    
    @try {
        Projectile *projectile = [[Projectile alloc]initWithPosition:initialProjectilePosition andOwner:className];
        
        [self.physicsBodyAdder addBody:projectile];
        
        [self.parent addChild:projectile];
        
        success = YES;
        
    }@catch (NSException *exception) {
        //Success remain as NO
        DebugLog(@"CATCHED EXCEPTION WHILE THROWING PROJECTILE");
    }
    
    return success;
}

-(void) setIsOnGround:(BOOL)isOnGround{
    
    // Changing animation depending player status is on ground
    if(isOnGround == YES){
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
    if(self.isOnGround == NO && self.physicsBody.velocity.dy == 0){
        isOnGroundChecker++;
        
        if(isOnGroundChecker > 1){
            self.isOnGround = YES;
        }else{
            // Nothing to do
        }
        
    }else{
        isOnGroundChecker = 0;
    }
    
    self.velocity = CGVectorMake(4, self.velocity.dy);
    
}

-(void) changeToAction:(playerMoviments)moviment{
    
    if(self.moviment != moviment){
        
        DebugLog(@"Changing player animation");
        
        self.moviment = moviment;
        
        [self removeAllActions];
        
        @try {
            
            // Change running animation depending of
            // the actual moviment of the player
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
            
        }@catch (NSException *exception) {
            DebugLog(@"Catched exception: player moviment couldn't be changed");
        }
        
    }else{
        // Keep the moviment
    }
    
}


@end
