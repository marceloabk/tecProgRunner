//
//  Label.h
//  TecprogRunner
//
//  Created by Lucas Araujo on 10/24/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Label : SKLabelNode

/**
 Create a chalkduster white label with 38 font size
*/
+(Label*) label;

/**
 Create a pixelated label
 passing parameters
*/
+(Label*) labelWithText:(NSString*)text andPosition:(CGPoint)position andSize:(CGFloat)fontSize andZPosition:(int)zPosition;

@end
