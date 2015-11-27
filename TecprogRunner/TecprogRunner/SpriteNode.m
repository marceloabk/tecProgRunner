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
    
    if(texture == nil){
        DebugLog(@"texture is nil");
    }else{
        DebugLog(@"texture created");
    }
    
    SpriteNode *sprite = [SpriteNode spriteNodeWithTexture:texture];
    
    if(sprite != nil){
        sprite.position = position;
        sprite.anchorPoint = anchorPoint;
        sprite.zPosition = zPosition;
        sprite.name = imageName;
        [sprite setScale:scale];
    }else{
        NSException *exception =[NSException exceptionWithName:@"Sprite Node init" reason:@"Can't init Sprite Node" userInfo:nil];
        [exception raise];
    }
    
    return sprite;
}
@end
