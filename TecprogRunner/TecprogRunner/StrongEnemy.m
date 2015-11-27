//
//  StrongEnemy.m
//  TecprogRunner
//
//  Distinguishes Strong Enemy and his functions
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "StrongEnemy.h"
#import "Projectile.h"

@implementation StrongEnemy

// Initialize StrongEnemy with a position
-(instancetype) initWithPosition:(CGPoint)position{
    
    @try {
        // Loading a texture for the strong enemy
        SKTexture *strongEnemyTexture = [super generateTextureWithImageNamed:INITIAL_STRONG_ENEMY_IMAGE];
        
        self = [super initWithTexture:strongEnemyTexture];
    }
    @catch (NSException *exception) {
        self = nil;
    }
    
    if(self != nil){
        
        DebugLog(@"Strong Enemy initialized with texture successfully");
        
        self.position = position;
        
        // Make Weak Enemy perform idle animation
        SKAction *idle = [self idleAnimation];
        [self runAction:idle];
        
        [self setBasicsAttributes];
        
    }else{
        NSException *exception = [NSException exceptionWithName:@"Init exception" reason:@"Strong Enemy can't be initialized" userInfo:nil];
        [exception raise];
    }
    
    return self;
}

// Set all the basics attributes that strong enemy will have
-(void) setBasicsAttributes{
    // Placeholder image is too big then we rescale it to fit our screen
    [self setScale:0.1];
    
    self.physicsBody = [super generatePhysicsBody];
    
    self.health = 4;

}


// Load animations of Strong enemy in idle state
-(SKAction*) loadIdleAnimation{
    
    DebugLog(@"Loading idle Animation");
    
    NSMutableArray *idleTextures = [super generateAnimationImages:@"enemyIdle" andCount:2];
    SKAction *idle = [SKAction animateWithTextures:idleTextures timePerFrame:0.3];
    
    return idle;
}

// Repeat idle animation forever
-(SKAction*) idleAnimation{
    
    SKAction *idleAnimation = [self loadIdleAnimation];
    SKAction *repeatAnimation = [SKAction repeatActionForever:idleAnimation];
    
    return repeatAnimation;
}

-(void) throwProjectile{
    // Initial projectile position is the current player position minus half player width
    // This way the projectile is created in player border and it doesn't collide with player
    CGPoint initialProjectilePosition = CGPointMake(self.position.x - self.size.width/2, self.position.y);
    NSString *className = [NSString stringWithFormat:@"%@", self.class];
    
    @try {
        Projectile *projectile = [[Projectile alloc]initWithPosition:initialProjectilePosition andOwner:className];
        
        [self.parent addChild:projectile];
    }
    @catch (NSException *exception) {
        DebugLog(@"CATCHED EXCEPTION WHILE THROWING PROJECTILE");
    }
    
    
}

-(void)updateWithDeltaTime:(CFTimeInterval)deltaTime{
    [super updateWithDeltaTime:deltaTime];
    
    int decision = arc4random() % 20 + 1;
    if(decision == 1){
        [self throwProjectile];
    }
}

@end