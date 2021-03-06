//
//  SpriteNode.h
//  TecprogRunner
//
//  Created by Julio Xavier on 31/10/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GlobalHeaders.h"

@interface SpriteNode : SKSpriteNode

/**
 Create Sprite Node using parameters
*/
+(SpriteNode*) spriteNodeWithImageNamed:(NSString*)imageName
                            andPosition:(CGPoint)position anchorPoint:(CGPoint)anchorPoint
                               andScale:(CGFloat)scale andZPosition:(CGFloat) zPosition;
@end
