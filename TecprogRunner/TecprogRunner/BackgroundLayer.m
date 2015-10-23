//
//  BackgroundLayer.m
//  TecprogRunner
//
//  Define a background for the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "BackgroundLayer.h"
#import "GameObject.h"
#import "PhysicsCategories.h"
#import "PhysicsController.h"

@implementation BackgroundLayer{
    
    CGSize _size;
    CGPoint _initialPoint;
    float backgroundDefaultVelocity;
    GameObject* _firstGround;
    GameObject* _secondGround;
    
    SKSpriteNode* _firstClouds;
    SKSpriteNode* _secondClouds;
}

-(instancetype) initWithSize:(CGSize)size{
    self = [super init];
    
    if(self != NULL){
        
        _size = size;
        
        CGSize backgroundSize = CGSizeMake(_size.width,_size.height*0.1);
    
        [self setClouds];
        
        _firstGround = [self createTileGroundWithSize:backgroundSize];
        _firstGround.position = CGPointMake(0.0, 0.0);
        
        _secondGround = [self createTileGroundWithSize:backgroundSize];
        _secondGround.position = CGPointMake(backgroundSize.width, 0.0);
        
        GameObject* airGround = [self createTileGroundWithSize:backgroundSize];
        airGround.position = CGPointMake(backgroundSize.width, size.height/4);
        
        // Adding clouds to view
        [self addChild:_firstClouds];
        [self addChild:_secondClouds];
        
        // Adding background to view
        [self addChild:_firstGround];
        [self addChild:_secondGround];
        [self addChild:airGround];
        
    }else{
        // Throw exception
    }
    
    return self;
}

// Instantiating background Clouds
-(void) setClouds{
    
    _firstClouds = [[SKSpriteNode alloc] initWithImageNamed:@"background_Clouds"];
    _firstClouds.size = CGSizeMake(2160, _size.height);
    _firstClouds.position = CGPointZero;
    _firstClouds.anchorPoint = CGPointZero;
    _firstClouds.zPosition = -1;
    
    _secondClouds = [[SKSpriteNode alloc] initWithImageNamed:@"background_Clouds"];
    _secondClouds.size = CGSizeMake(2160, _size.height);
    _secondClouds.position = CGPointMake(0, -_size.height);
    _secondClouds.anchorPoint = CGPointZero;
    _secondClouds.zPosition = -1;
}

-(void) addBackgroundGameObjectsToPhysicsController:(PhysicsController*) physicsController{
    
    for (SKSpriteNode* node in self.children) {
        if([node isKindOfClass:[GameObject class]]){
            GameObject* obj = (GameObject*) node;
            [physicsController.bodies addObject: obj];
        }
    }
}

-(GameObject*) createTileGroundWithSize:(CGSize) size{
    
    GameObject* tile = [[GameObject alloc] initWithColor:GREEN_COLOR size:size];
    tile.name = @"ground";
    tile.position = CGPointMake(0.0, 0.0);
    tile.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:size];
    
    tile.physicsBody.categoryBitMask = ColliderTypeGround;
    tile.physicsBody.dynamic = false;
    tile.physicsBody.contactTestBitMask = ColliderTypePlayer | ColliderTypeEnemy | ColliderTypeObstacle;
    tile.velocity = CGVectorMake(-TILE_VELOCITY_X, 0.0);
    
    return tile;
}

-(void) update:(CFTimeInterval)currentTime{
    if(_firstGround.position.x + _firstGround.size.width/2 <= 0.0){
        _firstGround.position = CGPointMake(_size.width + _firstGround.size.width/2, 0.0);
    }
}
@end
