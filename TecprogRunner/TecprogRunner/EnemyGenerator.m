//
//  EnemyGenerator.m
//  TecprogRunner
//
//  Generate Enemies in the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

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

// Create a new enemy based on the score
-(void)newEnemyWithScore:(unsigned int)score{
    
    CGFloat margin = 80; // Pixels
    CGFloat floorHeight = 50; // Pixels
    CGPoint enemyPosition = CGPointMake(_size.width - margin, floorHeight);
    
    int probability = [self probabilityToCreateAnEnemyBasedOnTheScore:score];
    
    // Case 1 creates an weak enemy
    // Case 2 creates a strong enemy
    // Case 3 waits 3 second to recall this method
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
        case 3:
        {
            // Here we convert an int to NSNumber because performSelector needs an object
            NSNumber *scoreObject = [NSNumber numberWithInt:score];
            [self performSelector:@selector(newEnemyWithScore:) withObject:scoreObject afterDelay:3];
            DebugLog(@"Wait to creat an enemy");
            break;
        }
        default:
            break;
    }
}

// Generate a probability to create an enemy based on the score
-(int)probabilityToCreateAnEnemyBasedOnTheScore:(unsigned int)score{
    
    unsigned int probabilityValue = 0;
    // If score is less then 40 we create a weak enemy
    // Else if the score is less then 400 we have 45% of chance to create an strong enemy...
    // ...and 55% of chance to create an weak enemy
    // Else we create an strong enemy

    if(score < 40){
        probabilityValue = 1;
    }else if(score < 400){
        const unsigned int randomizer = arc4random() % 100;
        if(randomizer < 45){
            probabilityValue = 2;
        }else{
            probabilityValue = 1;
        }
    }else{
        probabilityValue = 2;
    }

    return probabilityValue;
}


@end
