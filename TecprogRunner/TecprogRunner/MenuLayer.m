//
//  MenuLayer.m
//  TecprogRunner
//
//  Created by Henrique Dutra on 15/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "MenuLayer.h"

@implementation MenuLayer

-(instancetype) initWithSize: (CGSize) size{
    
    if(self = [super init]){
        
        self.backgroundLayerMenu = [[BackgroundLayerMenu alloc] initWithSize:size];
        
    }
    return self;
}

-(void) activateLayer{
    
    [self addChild:self.backgroundLayerMenu];
    
}

@end
