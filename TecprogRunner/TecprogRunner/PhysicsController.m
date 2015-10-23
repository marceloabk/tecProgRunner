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
        
        [obj updateWithDeltaTime:delta];
    }
}

-(void) didBeginContact:(SKPhysicsContact *)contact{
    
    BOOL bodyAisGround = [contact.bodyA.node.name isEqualToString:@"ground"];
    BOOL bodyBisGround = [contact.bodyB.node.name isEqualToString:@"ground"];
    
    //If a body touches the ground... he isOnGround
    if(bodyAisGround && !bodyBisGround){
        GameObject* gameObj = ((GameObject*)contact.bodyB.node);
        
        BOOL bodyAboveGround = contact.contactNormal.dy >= 1 && contact.contactNormal.dx <= 0;
        
        if(bodyAboveGround){
            gameObj.isOnGround = true;
            gameObj.velocity = CGVectorMake(gameObj.velocity.dx, 0.0);
        }
        
        
    } else if(bodyBisGround && !bodyAisGround){
        GameObject* gameObj = ((GameObject*)contact.bodyA.node);
        
        BOOL bodyAboveGround = contact.contactNormal.dy >= 1 && contact.contactNormal.dx <= 0;
        
        if(bodyAboveGround){
            gameObj.isOnGround = true;
            gameObj.velocity = CGVectorMake(gameObj.velocity.dx, 0.0);
        }
    }
    else {
        // ground contact ground and body contact body do not interfers in gravity mechanics
    }
}

-(void) didEndContact:(SKPhysicsContact *)contact{
    
    BOOL bodyAisGround = [contact.bodyA.node.name isEqualToString:@"ground"];
    BOOL bodyBisGround = [contact.bodyB.node.name isEqualToString:@"ground"];
    
    if(contact.contactNormal.dy == 1){
        NSLog(@"normal equal 1");
    }
    
    //If a body dont touches the ground... he !isOnGround
    if(bodyAisGround && !bodyBisGround){
        
        GameObject* gameObj = ((GameObject*)contact.bodyA.node);
        gameObj.isOnGround = false;
        
        // Ensures that obj is above ground
        for (SKPhysicsBody* bodyContacted in gameObj.physicsBody.allContactedBodies) {
            if(bodyContacted != contact.bodyA && [bodyContacted.node.name isEqualToString:@"ground"]){
                
                if(contact.contactNormal.dy == 0){
                    gameObj.isOnGround = true;
                    break;
                }
                
            }
        }
        
    } else if(bodyBisGround && !bodyAisGround){
        
        GameObject* gameObj = ((GameObject*)contact.bodyB.node);
        gameObj.isOnGround = false;
        
        // Ensures that obj is above ground
        for (SKPhysicsBody* bodyContacted in gameObj.physicsBody.allContactedBodies) {
            if(bodyContacted != contact.bodyB && [bodyContacted.node.name isEqualToString:@"ground"]){
                
                if(contact.contactNormal.dy == 0){
                    gameObj.isOnGround = true;
                    break;
                }
                
            }
        }

    }
}

@end
