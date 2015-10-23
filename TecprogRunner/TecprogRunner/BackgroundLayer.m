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
    
    
    NSMutableArray<GameObject*>* _tiles;
    
    SKSpriteNode* _firstClouds;
    SKSpriteNode* _secondClouds;
}

-(instancetype) initWithSize:(CGSize)size{
    self = [super init];
    
    if(self != NULL){
        
        _tiles = [[NSMutableArray<GameObject*> alloc] init];
        _size = size;
        
        CGSize backgroundSize = CGSizeMake(_size.width,_size.height*0.1);
    
        [self setClouds];
        
        // Initializating initial tiles
        GameObject *firstGround = [self createTileGroundWithSize:backgroundSize];
        firstGround.position = CGPointMake(0.0, 0.0);
        
        GameObject *secondGround = [self createTileGroundWithSize:backgroundSize];
        secondGround.position = CGPointMake(backgroundSize.width, 0.0);
        
        GameObject* airGround = [self createTileGroundWithSize:backgroundSize];
        airGround.position = CGPointMake(backgroundSize.width + 100, size.height/4);
        
        GameObject* secondAirGround = [self createTileGroundWithSize:backgroundSize];
        secondAirGround.position = CGPointMake(backgroundSize.width+ 250, size.height/1.5);
        
        // Adding clouds to view
        [self addChild:_firstClouds];
        [self addChild:_secondClouds];
        
        // Adding background to view
        [self addChild:firstGround];
        [self addChild:secondGround];
        [self addChild:airGround];
        [self addChild:secondAirGround];
        
        // adding tile to array
        [_tiles addObject:firstGround];
        [_tiles addObject:secondGround];
        [_tiles addObject:airGround];
        [_tiles addObject:secondAirGround];
        
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
    tile.physicsBody.affectedByGravity = false;
    tile.physicsBody.dynamic = false;
    tile.physicsBody.allowsRotation = false;
    tile.physicsBody.contactTestBitMask = ColliderTypePlayer | ColliderTypeEnemy | ColliderTypeObstacle;
    tile.velocity = CGVectorMake(-TILE_VELOCITY_X, 0.0);
    
    return tile;
}

-(void) update:(CFTimeInterval)currentTime{
    
    for (GameObject* tile in _tiles) {
        if(tile.position.x + tile.size.width/2 <= 0.0){
            tile.position = CGPointMake(_size.width + tile.size.width/2, tile.position.y);
        }
    }
    
}
@end
