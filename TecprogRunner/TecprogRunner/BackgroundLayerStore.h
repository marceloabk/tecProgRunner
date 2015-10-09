//
//  BackgroundLayerStore.h
//  TecprogRunner
//
//  Created by Henrique Dutra on 16/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "GlobalHeaders.h"

@interface BackgroundLayerStore : SKNode

-(instancetype) initWithSize: (CGSize) size;

//background sprite
@property (nonatomic) SKSpriteNode* background;


@end
