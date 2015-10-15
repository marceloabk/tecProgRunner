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

@implementation EnemyGenerator

// Initialize EnemyGenerator with a position
-(instancetype)init{
    
    self = [super init];
    if(self != nil){
        DebugLog(@"Enemy generator initialized with texture successfully");
        
    }else{
        DebugLog(@"Enemy generator can't be initialized");
    }
    
    return self;
}
@end
