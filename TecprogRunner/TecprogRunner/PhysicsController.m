//
//  PhysicsController.m
//  TecprogRunner
//
//  Created by Lucas Araujo on 10/9/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

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
