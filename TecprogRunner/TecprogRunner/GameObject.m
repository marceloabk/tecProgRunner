//
//  GameObject.m
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "GameObject.h"

@implementation GameObject

-(SKTexture *)generateTextureWithName:(NSString *)name{
    // Gerar texturas com o nome da imagem
    return [SKTexture textureWithImageNamed:name];
}

-(SKPhysicsBody *)generatePhysicsBodyWithTextureWithTextureNamed:(NSString *)image{
    // Gerar corpo físico usando a textura
    return [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(100, 100)];
}

-(void)setBasicsAttributes{
    // Atributos básicos do tipo GameObject
}

-(void)beginContactWithNode:(SKNode *)node withBitmask:(uint32_t)bitmask andContact:(SKPhysicsContact *)contact{
    // Tratamento para quando começa o contato
}

-(void)endContactWithNode:(SKNode *)node withBitmask:(uint32_t)bitmask andContact:(SKPhysicsContact *)contact{
    // Tratamento para quando termina o contato
}

@end
