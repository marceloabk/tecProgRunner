//
//  GameKitHelper.m
//  TecprogRunner
//
//  Created by Julio Xavier on 15/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "GameKitHelper.h"

@implementation GameKitHelper

#pragma mark Initialization and sharing

-(instancetype)init{
    
    // Inicializar a classe
    self = [super init];
    
    return self;
}

+(instancetype)sharedGameKitHelper{
    // Compartilhar métodos e atributos da classe estática
    
    return nil;
}

#pragma mark Authentication
-(void)authenticateLocalPlayer{
    // Autenticar jogador
}

-(void)setAuthenticationViewController:(UIViewController *)authenticationViewController{
    // Definir View Controller de autenticação
}

-(void)setLastError:(NSError *)error{
    // Apresentar erro de forma mais legível
}

#pragma mark Report conquests

-(void)reportScore:(int64_t)score forLeaderboardID:(NSString *)leaderboardID{
    // Enviar 'score' para determinada 'leaderboardID'
}

-(void)reportAchievements:(NSArray *)achievements{
    // Enviar 'achievements'
    // Definir necessidade entre o grupo
}

#pragma mark View Controller manipulation

-(void)presentLeaderboardsOnViewController:(UIViewController *)viewController{
    // Mostrar View Controller na tela
}

-(void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController{
    // Remover View Controller da tela
}



@end
