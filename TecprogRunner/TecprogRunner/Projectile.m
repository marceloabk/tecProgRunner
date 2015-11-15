//
//  Projectile.m
//  TecprogRunner
//
//  Distinguishes Projectile and his functions
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "Projectile.h"

@interface Projectile()
@property NSString* ownerName;
@end

@implementation Projectile{
    BOOL _isEnemy;
    CGVector _movimentVector;
}

-(instancetype) initWithPosition:(CGPoint)position andOwner:(NSString*)ownerName{
    
    @try {
        // Creating a texture for the Projectile
        SKTexture *projectileTexture = [super generateTextureWithImageNamed:DEFAULT_PROJECTILE_IMAGE];
        
        
        // Init the Sprite with the texture created
        self = [super initWithTexture:projectileTexture];
    }
    @catch (NSException *exception) {
        DebugLog(@"Catched exception while initializing projectile");
        self = nil;
    }
    
    
    if(self != nil){
        
        DebugLog(@"Projectile initialized with texture sucessfully");
        
        self.position = position;
        
        self.ownerName = ownerName;
        
        [self setBasicsAttributes];
        [self moveProjectile];
        
    }else{
        // Throw exception
        NSException *exception = [NSException exceptionWithName:@"Init Exception" reason:@"Projectile can't be initialized" userInfo:nil];
        [exception raise];
    }
    
    return self;
}

// Set basics Projectile attributes
-(void) setBasicsAttributes{
    
    // Verify if the Owner is a Enemy
    _isEnemy = [self.ownerName isEqualToString:ENEMY_NAME];
    
    [self setRoot];
    
    // Generate a Physics Body for Projectile
    @try {
        self.physicsBody = [self generatePhysicsBody];
    }
    @catch (NSException *exception) {
        [self removeFromParent];
    }
    
}

// Set presentation and final position according to Owner
-(void) setRoot{
    
    // The value of the x in future will depend by character habilities
    CGFloat dx = 700;
    _movimentVector = CGVectorMake(dx, 0);
    
    if(_isEnemy == YES){
        // Invert Sprite Horizontally
        [super invertSpriteX:YES];
        
        // Invert the final X Position
        _movimentVector.dx = -1*_movimentVector.dx;
    }else{
        // Do nothing
    }
    
}

// Generate projectile physics body
-(SKPhysicsBody *) generatePhysicsBody{
    
    // The bullet physics body should be a circle
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.size.width/2];
    
    if(physicsBody == nil){
        NSException *exception = [NSException exceptionWithName:@"Physics body exception" reason:@"Can't create projectile physics body" userInfo:nil];
        [exception raise];
    }else{
        // Continue
    }
    
    // Defining physics body properties
    physicsBody.mass = 1;
    physicsBody.affectedByGravity = NO;
    
    // Defining types for Collision
    physicsBody.collisionBitMask = ColliderTypeEnemy | ColliderTypePlayer;
    physicsBody.contactTestBitMask = ColliderTypeEnemy;
    physicsBody.categoryBitMask = ColliderTypeProjectile;
    
    return physicsBody;
}

// Simulates the trajectory of the launched projectile
-(void) moveProjectile{
    
    // Set the move action
    SKAction *moveProjectile = [SKAction moveBy:_movimentVector duration:1.2];
    
    // Run the action and remove projectile
    [self runAction:moveProjectile completion:^{
        [self removeFromParent];
    }];
}



@end
