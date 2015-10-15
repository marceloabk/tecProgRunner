//
//  StrongEnemy.m
//  TecprogRunner
//
//  Created by Marcelo Cristiano Araujo Silva on 14/10/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "StrongEnemy.h"

@implementation StrongEnemy

// Initialize StrongEnemy with a position
-(instancetype) initWithPosition:(CGPoint)position{
    
    // Loading a texture for the strong enemy
    SKTexture *strongEnemyTexture = [super generateTextureWithImageNamed:INITIAL_STRONG_ENEMY_IMAGE];
    
    self = [super initWithTexture:strongEnemyTexture];
    
    if(self != nil){
        
        DebugLog(@"Strong Enemy initialized with texture successfully");
        
        self.position = position;
        
        // Make Weak Enemy perform idle animation
        SKAction *idle = [self idleAnimation];
        [self runAction:idle];
        
    }else{
        
        DebugLog(@"Weak Enemy can't be initialized");
        
        // There is no alternative path for this if
    }
    
    return self;
}


@end