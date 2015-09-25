//
//  SettingsLayer.m
//  TecprogRunner
//
//  Created by Henrique Dutra on 24/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "SettingsLayer.h"

@implementation SettingsLayer

-(instancetype)initWithSize:(CGSize)size{

    if(self = [super init]){
    
        self.layer = [SKNode node];
        [self addChild:self.layer];
        
        [self loadBackground];
        [self loadButtons];
        
    
    }
    return self;
}


-(void) loadBackground{

}

-(void) loadButtons{

}

-(void)activateLayer{

}


@end
