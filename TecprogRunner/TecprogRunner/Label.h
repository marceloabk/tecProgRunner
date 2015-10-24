//
//  Label.h
//  TecprogRunner
//
//  Created by Lucas Araujo on 10/24/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Label : SKLabelNode

- (instancetype)initWithPosition:(CGPoint)position;

+ (Label*) label;

@end
