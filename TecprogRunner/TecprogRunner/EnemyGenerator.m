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
-(instancetype) initWithSize:(CGSize)size andBodyAdder:(id<physicsControllerAddBody>)physicsBodyAdder{
    
    self = [super init];
    
    if(self != nil){
        self.physicsBodyAdder = physicsBodyAdder;
        _size = size;
        DebugLog(@"Enemy generator initialized successfully");
        
    }else{
        NSException *exception = [NSException exceptionWithName:@"Init Exception" reason:@"Enemy generator can't be initialized" userInfo:nil];
        [exception raise];
    }
    
    return self;
}

// Create a new enemy based on the score
-(void) newEnemyWithScore:(unsigned int)score{
    
    CGPoint enemyPosition = CGPointMake(_size.width - MARGIN, FLOOR_HEIGHT + MARGIN);
    
    int probability = [self probabilityToCreateAnEnemy:score];
    
    // Case 1 creates an weak enemy
    // Case 2 creates a strong enemy
    // Case 3 waits 3 second to recall this method
    switch (probability) {
        case 1:
            [self createWeakEnemyWithPosition:enemyPosition];
            break;
        case 2:
            [self createStrongEnemyWithPosition:enemyPosition];
            break;
        case 3:
            [self recallMethodWithScore:score];
            break;
        default:
            break;
    }
}

// Generate a probability to create an enemy based on the score
-(int) probabilityToCreateAnEnemy:(unsigned int)score{
    
    DebugLog("%i", score);
    
    const unsigned int createEnemy = 0;
    
    unsigned int probabilityValue = 0;
    // If score is less then 4 we create a weak enemy
    // Else if the score is less then 40 we have 45% of chance to create an strong enemy...
    // ...and 55% of chance to create an weak enemy
    // Else we create an strong enemy
    
    
    // We have 33% of chance to wait and 66% to create an enemy
    unsigned const int chanceToCreateEnemyOrWait = [self randomizeNumberBetween:0 and:2];
    
    if(chanceToCreateEnemyOrWait == createEnemy){
        probabilityValue = 3;
    }else if(score < 20){
        probabilityValue = 1;
    }else if(score > 20 && score < 200){
        
        unsigned int random = [self randomizeNumberBetween:0 and:100];
        
        if(random < 45){
            probabilityValue = 2;
        }else{
            probabilityValue = 1;
        }
        
    }else{
        probabilityValue = 2;
    }

    return probabilityValue;
}

// Randomize a number between the firstNumber and the secondNumber
-(unsigned int) randomizeNumberBetween:(unsigned int)firstNumber and:(unsigned int)secondNumber{
    // Example:
    // if I want a number between 2 and 4
    // realSecondNumber = 4 - 2 + 1 = 3
    // randomizedNumber = 2 + (0 or 1 or 2)
    unsigned int realSecondNumber = secondNumber - firstNumber + 1;
    unsigned int randomizedNumber = firstNumber + (arc4random() % realSecondNumber);
    return randomizedNumber;
}

-(void) createWeakEnemyWithPosition:(CGPoint)position{
    
    @try {
        WeakEnemy *weakEnemy = [[WeakEnemy alloc]initWithPosition:position];
        weakEnemy.velocity = CGVectorMake(BACKGROUND_VELOCITY_X, 0.0);
        weakEnemy.name = @"enemy";
        
        [self.physicsBodyAdder addBody:weakEnemy];
        [self.parent addChild:weakEnemy];
        DebugLog(@"Weak enemy created");
    }
    @catch (NSException *exception) {
        DebugLog(@"Exception catched: Can't create Weak Enemy");
    }
}

-(void) createStrongEnemyWithPosition:(CGPoint)position{
    @try {
        StrongEnemy *strongEnemy = [[StrongEnemy alloc]initWithPosition:position];
        strongEnemy.velocity = CGVectorMake(BACKGROUND_VELOCITY_X, 0.0);
        strongEnemy.name = @"enemy";
        
        [self.physicsBodyAdder addBody:strongEnemy];
        [self.parent addChild:strongEnemy];
        DebugLog(@"Strong enemy created");
    }
    @catch (NSException *exception) {
        DebugLog(@"Exception catched: Can't create Strong Enemy");
    }
}

-(void) recallMethodWithScore:(unsigned int)score{
    // Here we convert an int to NSNumber because performSelector needs an object
    NSNumber *scoreNumber = [NSNumber numberWithInt:score];
    
    [self performSelector:@selector(newEnemyWithScore:) withObject:scoreNumber afterDelay:3];
    DebugLog(@"Wait to create an enemy");
}

@end
