//
//  EnemyGenerator.m
//  TecprogRunner
//
//  Created by Marcelo Cristiano Araujo Silva on 14/10/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "EnemyGenerator.h"
#import "StrongEnemy.h"
#import "WeakEnemy.h"

@implementation EnemyGenerator{
    CGSize _size;
}

// Initialize EnemyGenerator with a position
-(instancetype)initWithSize:(CGSize)size{
    
    self = [super init];
    if(self != nil){
        _size = size;
        DebugLog(@"Enemy generator initialized successfully");
        
    }else{
        DebugLog(@"Enemy generator can't be initialized");
    }
    
    return self;
}

-(void)newEnemyWithScore:(unsigned int)score{
    
    CGFloat margin = 80;
    CGFloat floorHeight = 50;
    CGPoint enemyPosition = CGPointMake(_size.width - margin, floorHeight);
    
    int probability = 1;
    switch (probability) {
        case 1:
        {
            WeakEnemy *weakEnemey = [[WeakEnemy alloc]initWithPosition:enemyPosition];
            [self.parent addChild:weakEnemey];
            DebugLog(@"Weak enemy created");
            break;
        }
        case 2:
        {
            StrongEnemy *strongEnemy = [[StrongEnemy alloc]initWithPosition:enemyPosition];
            [self.parent addChild:strongEnemy];
            DebugLog(@"Strong enemy created");
            break;
        }
        default:
            break;
    }
}


@end
