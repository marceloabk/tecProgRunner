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

struct line{
    CGPoint point1;
    CGPoint point2;
};

@implementation BackgroundLayer{
    
    CGSize _size;
    CGPoint _initialPoint;
    float backgroundDefaultVelocity;

    NSMutableArray<GameObject*>* _tiles;
    NSMutableArray<GameObject*>* _removedTiles;
    
    SKSpriteNode* _firstClouds;
    SKSpriteNode* _secondClouds;
    
    GameObject* lastGameObject;
}

-(instancetype) initWithSize:(CGSize)size andPhysicsController:(PhysicsController*) physicsController{
    self = [super init];
    
    if(self != NULL){
        
        _tiles = [[NSMutableArray<GameObject*> alloc] init];
        _removedTiles = [[NSMutableArray<GameObject*> alloc] init];
        self.physicsController = physicsController;
        _size = size;
        
        CGSize firstGroundSize = CGSizeMake(_size.width*2,_size.height*0.1);
    
        [self setClouds];
        
        // Initializating initial tiles
        GameObject *firstGround = [self createTileGroundWithSize:firstGroundSize];
        firstGround.position = CGPointMake(0.0, 0.0);
        
        lastGameObject = firstGround;
        
        [self generateTiles];
        
        // Adding clouds to view
        [self addChild:_firstClouds];
        [self addChild:_secondClouds];
        
        // Adding background to view
        [self addChild:firstGround];
        
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

-(GameObject*) createTileGroundWithSize:(CGSize) size{
    
    GameObject* tile;
    if(_removedTiles.count <= 0 || true){
        tile = [[GameObject alloc] initWithColor:GREEN_COLOR size:size];
        tile.name = @"ground";
        tile.position = CGPointMake(0.0, 0.0);
        tile.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:size];
        
        tile.physicsBody.categoryBitMask = ColliderTypeGround;
        tile.physicsBody.affectedByGravity = false;
        tile.physicsBody.dynamic = false;
        tile.physicsBody.allowsRotation = false;
        tile.physicsBody.collisionBitMask = ColliderTypePlayer;
        tile.physicsBody.contactTestBitMask = ColliderTypePlayer | ColliderTypeEnemy | ColliderTypeObstacle;
        tile.velocity = CGVectorMake(BACKGROUND_VELOCITY_X, 0.0);
    }
    else{
        tile = [_removedTiles lastObject];
        [_removedTiles removeLastObject];
        tile.size = size;
        tile.velocity = CGVectorMake(BACKGROUND_VELOCITY_X, 0.0);
    }
    
    if(self.physicsController != nil){
        [self.physicsController addBody:tile];
    }
    else {
        DebugLog(@"Physics controller is nil");
    }
        
    // adding tile to array
    [_tiles addObject:tile];
    
    return tile;
}

-(void) updateWithDeltaTime:(CFTimeInterval)deltaTime{
    
    for (int i = 0; i < _tiles.count; i++) {
        
        GameObject* tile = (GameObject*) _tiles[i];
        
        if(tile.position.x + tile.size.width < 0.0){
            [_tiles removeObject:tile];
            [tile removeFromParent];
            [_removedTiles addObject:tile];

        }
    }
    
}

-(void) generateTiles{
    
    srand(CACurrentMediaTime());
    
    CGFloat tileWidth = 45 + rand()%250;
    
    GameObject* newTile = [self createTileGroundWithSize:CGSizeMake(tileWidth, 20)];
    double maxX = lastGameObject.position.x + lastGameObject.size.width/2;
    
    float initialX = maxX + 70 + rand()%70;
    
    newTile.position = CGPointMake(initialX + newTile.size.width/2, newTile.size.height/2);
    
    [self addChild:newTile];
    
    lastGameObject = newTile;
    
    newTile.velocity = CGVectorMake(BACKGROUND_VELOCITY_X, 0.0);
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(generateTiles) userInfo:nil repeats:NO];
}

-(CGPoint) calculateInitialPointByLine:(struct line) line andX:(double) x{

    double partX = (line.point1.y - line.point2.y);
    double partXY = line.point1.x*line.point2.y - line.point2.x*line.point1.y;
    double partY = (line.point1.x - line.point2.x);
    
    double y = ( x * partX +  partXY) / partY;
    
    return CGPointMake(x, y);
}


@end
