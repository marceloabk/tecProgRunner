//
//  PhysicsController.m
//  TecprogRunner
//
//  Control physics inside the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "PhysicsController.h"
#import "Player.h"
#import "Enemy.h"
#import "Projectile.h"

@implementation PhysicsController{
    NSMutableArray<GameObject*> *_bodies;
}

- (instancetype)init{
    
    self = [super init];
    
    if (self != NULL) {
        
        _bodies = [[NSMutableArray <GameObject*> alloc] init];
        
    }else{
        
        // There is no alternative path
    }
    return self;
}

-(void) updateWithDeltaTime:(CFTimeInterval)deltaTime{
    
    //Update every object position
    for(GameObject* obj in _bodies){
        
        [obj updateWithDeltaTime:deltaTime];
    }
}

-(void) didBeginContact:(SKPhysicsContact *)contact{
    
    
    SKNode* nodeA = contact.bodyA.node;
    SKNode* nodeB = contact.bodyB.node;
    
    BOOL bodyAisGround = [nodeA.name isEqualToString:@"ground"];
    BOOL bodyBisGround = [nodeB.name isEqualToString:@"ground"];
    
    BOOL bodyAisCoin = [nodeA isKindOfClass:[Coin class]];
    BOOL bodyBisCoin = [nodeB isKindOfClass:[Coin class]];
    
    BOOL bodyAisPlayer = [nodeA isKindOfClass:[Player class]];
    BOOL bodyBisPlayer = [nodeB isKindOfClass:[Player class]];
    
    BOOL bodyAisEnemy = [nodeA isKindOfClass:[Enemy class]];
    BOOL bodyBisEnemy = [nodeB isKindOfClass:[Enemy class]];
    
    BOOL bodyAisProjectile = [nodeA isKindOfClass:[Projectile class]];
    BOOL bodyBisProjectile = [nodeB isKindOfClass:[Projectile class]];

    //If a body touches the ground... he isOnGround
    if((bodyAisGround || bodyBisGround) && (bodyAisPlayer || bodyBisPlayer)){
        GameObject* gameObj = ((GameObject*)contact.bodyB.node);
        
        BOOL bodyAboveGround = contact.contactNormal.dy >= 1 && contact.contactNormal.dx <= 0;
        
        if(bodyAboveGround){
            gameObj.isOnGround = true;
            gameObj.velocity = CGVectorMake(gameObj.velocity.dx, 0.0);
        }
    }else if((bodyAisCoin || bodyBisCoin) && (bodyAisPlayer || bodyBisPlayer)){
        // ground contact ground and body contact body do not interfers in gravity mechanics
        
        if(bodyAisCoin && bodyBisPlayer){
            Coin* coin = (Coin*)nodeA;
            [self.gameLayer playerContactCoin:coin];
            
        }
        else if(bodyBisCoin && bodyAisPlayer){
            Coin* coin = (Coin*)nodeB;
            [self.gameLayer playerContactCoin:coin];
            
        }
    }else if((bodyAisEnemy || bodyBisEnemy) && (bodyAisProjectile || bodyBisProjectile)){
       
        Enemy* enemy;
        if(bodyAisEnemy){
            enemy = (Enemy*)contact.bodyA.node;
        }else if (bodyBisEnemy){
            enemy = (Enemy*)contact.bodyB.node;
        }
        
        enemy.lives--;
        if (enemy.lives == 0) {
            [enemy removeFromParent];
        }
    }
}

-(void) didEndContact:(SKPhysicsContact *)contact{
    
    BOOL bodyAisGround = [contact.bodyA.node.name isEqualToString:@"ground"];
    BOOL bodyBisGround = [contact.bodyB.node.name isEqualToString:@"ground"];
    
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

-(void) addBody:(GameObject *)body{
    
    if(body != nil){
        
        if(_bodies == nil){
            _bodies = [[NSMutableArray<GameObject*> alloc] init];
        }
        
        if([_bodies containsObject:body] == false){
            [_bodies addObject:body];
            DebugLog(@"adding body with name: %@", body.name);
        }
        else {
            DebugLog(@"Body is already in physiscs array bodies");
        }
    }
    else {
        DebugLog(@"Body is nil");
    }
}

@end
