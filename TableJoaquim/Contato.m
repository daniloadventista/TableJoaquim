//
//  Contato.m
//  TableJoaquim
//
//  Created by Danilo Lira de Lima on 18/02/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import "Contato.h"

@implementation Contato

@synthesize nome, sobreNome, telefone,celular,endereco,telefones,img;
-(Contato*) initWithNome: (NSString *)n andSobreNome: (NSString *)sn andTelefone: (int) telefoneE andCelular: (int) celularE andEndereco: (NSString *)enderecoE
{
    //chamando nsobject
    self = [super init];
    
    if (self)
    {
        nome = n;
        sobreNome = sn;
        telefone = telefoneE;
        celular = celularE;
        endereco = enderecoE;
        img = nil;
        telefones = [[NSMutableArray alloc]init];
        
    }
    return self;
}

-(NSString*)primeiraLetraNome{
    return [[[self nome] substringToIndex:1] capitalizedString];
}
@end
