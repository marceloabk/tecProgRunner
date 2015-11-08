//
//  Label.h
//  TecprogRunner
//
//  Created by Lucas Araujo on 10/24/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Label : SKLabelNode

+(Label*) label;
+(Label*) labelWithText:(NSString*)text andPosition:(CGPoint)position andSize:(CGFloat)fontSize andZPosition:(int)zPosition;

@end
