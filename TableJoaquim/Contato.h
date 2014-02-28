//
//  Contato.h
//  TableJoaquim
//
//  Created by Danilo Lira de Lima on 18/02/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contato : NSObject

{
    NSString *nome;
    NSString *sobreNome;
    int telefone;
    int celular;
    NSString *endereco;
    UIImage *img;
    NSMutableArray *telefones;
}
@property NSString *nome;
@property NSString *sobreNome;
@property int telefone;
@property NSMutableArray *telefones;
@property int celular;
@property NSString *endereco;
@property UIImage *img;

-(Contato*) initWithNome: (NSString *)n andSobreNome: (NSString *)sn andTelefone: (int) telefoneE andCelular: (int) celularE andEndereco: (NSString *)enderecoE;
-(NSString*)primeiraLetraNome;
@end
