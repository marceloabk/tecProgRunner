//
//  TrainingCenterSpecificLayer.m
//  TecprogRunner
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.//

#import "TrainingCenterSpecificLayer.h"

@implementation TrainingCenterSpecificLayer

-(instancetype) initWithSize:(CGSize)size andAttribute : (NSString *) attribute andAttributeNumber : (int) num{

    self = [super init];
    
    if(self != nil){
        
        self.layer = [SKNode node];
        [self addChild:self.layer];
        
        self.attributeString = attribute;
        self.attributeNumber = num;
        
        [self loadButtons];
        [self loadLabels];
        [self loadBackground];
        
        
    }else{
        NSException *exception = [NSException exceptionWithName:@"TrainingCenterSpecificLayer" reason:@"Can't initialize Training Center Specific Layer" userInfo:nil];
        [exception raise];
    }
    return self;
}


-(void) activateLayer{

    [self addChild: self.background];
    [self addChild: self.exitButton];
}

-(void) loadBackground{
    
}


-(void) loadButtons{
    
}


-(void) loadLabels{
    
}





@end
