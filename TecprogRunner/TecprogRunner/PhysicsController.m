//
//  PhysicsController.m
//  TecprogRunner
//
//  Control physics inside the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "PhysicsController.h"

@implementation PhysicsController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.bodies = [[NSMutableArray <GameObject*> alloc] init];
    }
    return self;
}

-(void) update:(CFTimeInterval)currentTime{
    
}

@end
