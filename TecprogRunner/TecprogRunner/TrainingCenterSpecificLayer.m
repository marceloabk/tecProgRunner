//
//  TrainingCenterSpecificLayer.m
//  TecprogRunner
//
//  Created by Henrique Dutra on 07/12/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "TrainingCenterSpecificLayer.h"

@implementation TrainingCenterSpecificLayer

-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];
    
    if(self != nil){
        
        self.layer = [SKNode node];
        [self addChild:self.layer];
        
        
        
    }else{
        NSException *exception = [NSException exceptionWithName:@"TrainingCenterSpecificLayer" reason:@"Can't initialize Training Center Specific Layer" userInfo:nil];
        [exception raise];
    }
    return self;
}


-(void) activateLayer{

}

@end
