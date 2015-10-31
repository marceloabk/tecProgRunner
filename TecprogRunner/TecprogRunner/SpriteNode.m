//
//  SpriteNode.m
//  TecprogRunner
//
//  Created by Julio Xavier on 31/10/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "SpriteNode.h"

@implementation SpriteNode

+(SpriteNode *) spriteNodeWithImageNamed:(NSString *)imageName andPosition:(CGPoint)position anchorPoint:(CGPoint)anchorPoint andScale:(CGFloat)scale andZPosition:(CGFloat)zPosition{
    
    SKTexture *texture = [SKTexture textureWithImageNamed:imageName];
    
    SpriteNode *object = [SpriteNode spriteNodeWithTexture:texture];
    
    if(object != nil){
        object.position = position;
        object.anchorPoint = anchorPoint;
        object.zPosition = zPosition;
        object.name = imageName;
        [object setScale:scale];
    }
    
    return object;
}
@end
