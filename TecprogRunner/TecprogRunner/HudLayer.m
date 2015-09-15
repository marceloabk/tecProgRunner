//
//  HudLayer.m
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "HudLayer.h"

@implementation HudLayer{
    CGSize _size;
}

-(instancetype)initWithSize:(CGSize)size{
    self = [super init];
    if(self){
        _size = size;
    }
    return self;
}

@end
