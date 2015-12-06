//
//  Coin.m
//  TecprogRunner
//
//  Object that represent Coins that can be picked inside the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "Coin.h"

#define COIN_DEFAULT_VALUE 100

@implementation Coin

-(instancetype) init{
    
    @try {
        // Creating a texture for the Coin
        SKTexture *coinTexture = [super generateTextureWithImageNamed:INITIAL_COIN_IMAGE];
        
        // Init the Sprite with the texture created
        self = [super initWithTexture:coinTexture];
    }@catch (NSException *exception) {
        self = nil;
    }
    
    if(self != nil){
        
        [self setBasicsAttributes];
        
        DebugLog(@"Coin instantiated");
        
    }else{
        NSException *exception = [NSException exceptionWithName:@"Init exception" reason:@"Coin could not be initialized" userInfo:nil];
        [exception raise];
    }
    
    return self;
}

+(Coin*) generateCoinInParent:(SKNode*)parent withPosition:(CGPoint)position{
    Coin *newCoin;
    
    if(parent != nil){
        
        // Initialize and add Coin to parent
        newCoin = [[Coin alloc] initWithPosition:position];
        [parent addChild:newCoin];
        
        newCoin.velocity = CGVectorMake(BACKGROUND_VELOCITY_X, 0.0);
        
    }else{
        
        DebugLog(@"Not able to instantiate coin - parent is nil");
        
        newCoin = nil;
    }
    
    return newCoin;
}

-(instancetype) initWithPosition:(CGPoint)position{
    
    @try {
        self = [self init];
    }@catch (NSException *exception) {
        self = nil;
    }
    
    if(self != nil){
        // Setting position
        self.position = position;
    
    }else{
        NSException *exception = [NSException exceptionWithName:@"Init exception" reason:@"Coin could not be initialized" userInfo:nil];
        [exception raise];
    }
    
    return self;
}

-(void) setBasicsAttributes{
    
    [super setBasicsAttributes];
    
    // Make coin spin
    SKAction *spinning = [self spinningAnimation];
    [self runAction: spinning];
    
    // Generating physics Body
    @try {
        self.physicsBody = [self generatePhysicsBody];
    }@catch (NSException *exception) {
        [self removeFromParent];
    }
    
    // setting basic coin value
    self.value = COIN_DEFAULT_VALUE;
}

/**
 Generate Coin physics body
*/
-(SKPhysicsBody *) generatePhysicsBody{
    
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.size.width/2];
    
    if(physicsBody == nil){
        NSException *exception = [NSException exceptionWithName:@"Physics Body" reason:@"Couldn't generate physics body for Coin" userInfo:nil];
        [exception raise];
    }else{
        // Continue
    }
    
    physicsBody.mass = 1;
    physicsBody.affectedByGravity = NO;
    physicsBody.allowsRotation = NO;
    
    // Defining types for Collision
    physicsBody.contactTestBitMask = ColliderTypePlayer;
    physicsBody.categoryBitMask = ColliderTypeCoin;
    physicsBody.collisionBitMask = ColliderTypeNone;
    
    return physicsBody;
}

/**
 Load animations of coin spinning
 @return (SKAction*) The spinning animation action
*/
-(SKAction*) loadSpinningAnimation{
    
    // Spin animation starts with nil value
    SKAction *spin = nil;
    
    @try {
        // Creating a Mutable Array filled with Run Animations
        NSMutableArray *runTextures = [super generateAnimationImages:@"Coin" andCount:6];
        
        // Using textures to make an action
        spin = [SKAction animateWithTextures:runTextures timePerFrame:0.1];
        
    }@catch (NSException *exception) {
        // Continue
    }
    
    
    return spin;
}

/**
 The spinning animation repeating forever
 @return (SKAction*) The spinning animation repeating forever action
*/
-(SKAction *) spinningAnimation{
    
    // Load animations
    SKAction *runAnimation = [self loadSpinningAnimation];
    
    // Make animations repeat forever
    SKAction *repeatAnimation = [SKAction repeatActionForever:runAnimation];
    
    return repeatAnimation;
}


-(void) runScoredMoviment{

    SKAction *large = [SKAction scaleBy:1.5 duration:0.1];
    
    SKAction *dissapear = [SKAction scaleTo:0.0 duration:0.3];
    
    SKAction *sequenceMoviment = [SKAction sequence:@[large, dissapear]];
    
    [self runAction:sequenceMoviment completion:^{
        [self removeFromParent];
    }];
    
}

@end
