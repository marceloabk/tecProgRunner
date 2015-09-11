//
//  BackgroundLayer.m
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "BackgroundLayer.h"

@implementation BackgroundLayer
{
    CGSize _size;
}

- (instancetype) initWithSize:(CGSize)size
{
    self = [super init];
    if(self){
        
        _size = size;
        self.background = [[SKSpriteNode alloc] initWithColor:[UIColor magentaColor] size:CGSizeMake(size.width/2, size.height/2)];
        self.background.anchorPoint = CGPointZero;
        
        [self addChild:self.background];
    }
    return self;
}

@end
