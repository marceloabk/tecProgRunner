//
//  PhysicsController.m
//  TecprogRunner
//
//  Control physics inside the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "PhysicsController.h"

@implementation PhysicsController{
    CFTimeInterval _lastTime;
}

- (instancetype)init{
    
    self = [super init];
    
    if (self != NULL) {
        
        self.bodies = [[NSMutableArray <GameObject*> alloc] init];
        
    }else{
        
        // There is no alternative path
    }
    return self;
}

-(void) update:(CFTimeInterval)currentTime{

    //Update delta
    if (_lastTime == 0) {
        _lastTime = currentTime;
    }
    
    CFTimeInterval delta = currentTime - _lastTime;
    _lastTime = currentTime;
    
    //Update every object position
    for(GameObject* obj in self.bodies){
        
        if(obj.isOnGround == false && ![obj.name isEqualToString:@"ground"]){
            obj.velocity = CGVectorMake(obj.velocity.dx, obj.velocity.dy - GRAVITY);
        }
        else {
            //Do not apply gravity while object is on ground
        }
        [obj updateWithDeltaTime:delta];
    }
}

-(void) didBeginContact:(SKPhysicsContact *)contact{
    
    BOOL bodyAisGround = [contact.bodyA.node.name isEqualToString:@"ground"];
    BOOL bodyBisGround = [contact.bodyB.node.name isEqualToString:@"ground"];
    
    //If a body touches the ground... he isOnGround
    if(bodyAisGround && !bodyBisGround){
        GameObject* gameObj = ((GameObject*)contact.bodyB.node);
        
        gameObj.isOnGround = true;
        gameObj.velocity = CGVectorMake(gameObj.velocity.dx, 0.0);
        
    } else if(bodyBisGround && !bodyAisGround){
        GameObject* gameObj = ((GameObject*)contact.bodyA.node);
        
        gameObj.isOnGround = true;
        gameObj.velocity = CGVectorMake(gameObj.velocity.dx, 0.0);
    }
}

-(void) didEndContact:(SKPhysicsContact *)contact{
    
    BOOL bodyAisGround = [contact.bodyA.node.name isEqualToString:@"ground"];
    BOOL bodyBisGround = [contact.bodyB.node.name isEqualToString:@"ground"];
    
    //If a body dont touches the ground... he !isOnGround
    if(bodyAisGround && !bodyBisGround){
        ((GameObject*)contact.bodyB.node).isOnGround = false;
        
    } else if(bodyBisGround && !bodyAisGround){
        ((GameObject*)contact.bodyA.node).isOnGround = false;
    }
}

@end
