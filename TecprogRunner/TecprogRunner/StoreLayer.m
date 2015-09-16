//
//  StoreLayer.m
//  TecprogRunner
//
//  Created by Henrique Dutra on 16/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "StoreLayer.h"

@implementation StoreLayer

-(instancetype) initWithSize: (CGSize) size{
    
    if(self = [super init]){

        self.layer = [SKNode node];
        [self addChild:self.layer];
        
        self.backgroundLayerMenu = [[BackgroundLayerMenu alloc] initWithSize:size];
        
    }
    return self;
}


-(void) activateLayer{

    self.

}

@end
