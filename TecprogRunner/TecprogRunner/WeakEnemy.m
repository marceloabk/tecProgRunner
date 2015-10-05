//
//  WeakEnemy.m
//  TecprogRunner
//
//  Created by Marcelo Cristiano Araujo Silva on 28/09/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "WeakEnemy.h"

@implementation WeakEnemy

-(instancetype)initWithPosition:(CGPoint)position{
    NSAssert(!CGPointEqualToPoint(position, CGPointZero) , @"Weak enemy initialized with a 0.0 point");
    
    SKTexture *weakEnemyTexture = [SKTexture textureWithImageNamed:@"weakEnemyTexture"];
    self = [super initWithTexture:weakEnemyTexture];
    
    if (self) {
        
    }else{
        // There is no alternative path for this if
    }
    
    return self;
}

@end
