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

typedef enum : NSUInteger {
    WEAK_ENEMY = 1,
    STRONG_ENEMY,
    WAIT,
} Probability;

@implementation EnemyGenerator{
    CGSize _size;
}

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

-(void) newEnemyWithScore:(unsigned int)score{
    
    // Define the new enemy position
    CGPoint enemyPosition = CGPointMake(_size.width - MARGIN, FLOOR_HEIGHT + MARGIN);
    
    const unsigned int probability = [self probabilityToCreateAnEnemy:score];
    
    // Case 1 creates an weak enemy
    // Case 2 creates a strong enemy
    // Case 3 waits 3 second to recall this method
    switch (probability) {
        case WEAK_ENEMY:
            [self createWeakEnemyWithPosition:enemyPosition];
            break;
        case STRONG_ENEMY:
            [self createStrongEnemyWithPosition:enemyPosition];
            break;
        case WAIT:
            [self recallMethodWithScore:score];
            break;
        default:
            break;
    }
    
}

/**
 Generate a probability to create an enemy 
 based on the score
 @param score unsigned int Score obtained in game
 @return unsigned int The probability to WAIT, create a STRONG_ENEMY or create a WEAK_ENEMY
*/
-(unsigned int) probabilityToCreateAnEnemy:(unsigned int)score{
    
    DebugLog("Probability to create an enemy with score = %i", score);
    
    const unsigned int createEnemy = 0;
    
    unsigned int probabilityValue = 0;
    // If score is less then 4 we create a weak enemy
    // Else if the score is less then 40 we have 45% of chance to create an strong enemy...
    // ...and 55% of chance to create an weak enemy
    // Else we create an strong enemy
    
    
    // We have 33% of chance to wait and 66% to create an enemy
    unsigned const int chanceToCreateEnemyOrWait = [self randomizeNumberBetween:0 and:2];
    
    if(chanceToCreateEnemyOrWait == createEnemy){
        probabilityValue = WAIT;
    }else if(score < SHORT_PROBABILITY_VALUE){
        probabilityValue = WEAK_ENEMY;
    }else if(score > SHORT_PROBABILITY_VALUE && score < MEDIUM_PROBABILITY_VALUE){
        
        unsigned int random = [self randomizeNumberBetween:0 and:100];
        
        if(random < 45){
            probabilityValue = STRONG_ENEMY;
        }else{
            probabilityValue = WEAK_ENEMY;
        }
        
    }else{
        probabilityValue = STRONG_ENEMY;
    }

    return probabilityValue;
}

/**
 Randomize a number between two limits
 @param firstNumber int The smallest limit
 @param secondNumber int The greatest limit
 @return unsigned int Randomized number between the passed numbers
*/
-(unsigned int) randomizeNumberBetween:(unsigned int)firstNumber and:(unsigned int)secondNumber{
    // Example:
    // if I want a number between 2 and 4
    // realSecondNumber = 4 - 2 + 1 = 3
    // randomizedNumber = 2 + (0 or 1 or 2)
    
    if(firstNumber < secondNumber){
        // Continue
    }else{
        DebugLog(@"Passed a first number greater than a second number. Swap numbers.");
        
        [self swap:&firstNumber andSecondNumber:&secondNumber];
        
    }
    
    unsigned int realSecondNumber = secondNumber - firstNumber + 1;
    unsigned int randomizedNumber = firstNumber + (arc4random() % realSecondNumber);
    DebugLog("First = %i Second = %i. Random = %i", firstNumber, secondNumber, randomizedNumber);
    return randomizedNumber;
}

/**
 Swap two numbers
 @param firstNumber unsigned int
 @param secondNumber unsigned int
*/
-(void) swap:(unsigned int*)firstNumber andSecondNumber:(unsigned int*)secondNumber{
    
    // Storage the first number value
    unsigned int aux = *firstNumber;
    
    // Swap the two values
    *firstNumber = *secondNumber;
    *secondNumber = aux;
}

/**
 Create an weak enemy with the given position
 @param position CGPoint Position that the Weak Enemy will be created
*/
-(void) createWeakEnemyWithPosition:(CGPoint)position{
    
    @try {
        WeakEnemy *weakEnemy = [[WeakEnemy alloc]initWithPosition:position];
        weakEnemy.velocity = CGVectorMake(BACKGROUND_VELOCITY_X, 0.0);
        weakEnemy.name = @"enemy";
        
        [self.physicsBodyAdder addBody:weakEnemy];
        [self.parent addChild:weakEnemy];
        DebugLog(@"Weak enemy created");
    }@catch (NSException *exception) {
        DebugLog(@"Exception catched: Can't create Weak Enemy");
    }
}

/**
 Create a strong enemy with the given position
 @param position CGPoint Position that the Strong Enemy will be created
*/
-(void) createStrongEnemyWithPosition:(CGPoint)position{
    @try {
        StrongEnemy *strongEnemy = [[StrongEnemy alloc]initWithPosition:position];
        strongEnemy.velocity = CGVectorMake(BACKGROUND_VELOCITY_X, 0.0);
        strongEnemy.name = @"enemy";
        
        [self.physicsBodyAdder addBody:strongEnemy];
        [self.parent addChild:strongEnemy];
        DebugLog(@"Strong enemy created");
    }@catch (NSException *exception) {
        DebugLog(@"Exception catched: Can't create Strong Enemy");
    }
}

/**
 Recall newEnemyWithScore after 3 seconds
 @param score unsigned int The actual game score
*/
-(void) recallMethodWithScore:(unsigned int)score{
    // Here we convert an int to NSNumber because performSelector needs an object
    NSNumber *scoreNumber = [NSNumber numberWithInt:score];
    
    [self performSelector:@selector(newEnemyWithScore:) withObject:scoreNumber afterDelay:3];
    DebugLog(@"Wait to create an enemy");
}

@end
