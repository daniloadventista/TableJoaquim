//
//  ContatoStore.m
//  Homepwner
//
//  Created by joeconway on 8/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ContatoStore.h"
#import "Contato.h"


@implementation ContatoStore
//@synthesize indexPath;

+ (ContatoStore *)defaultStore
{
    static ContatoStore *defaultStore = nil;
    if(!defaultStore)
        defaultStore = [[super allocWithZone:nil] init];
        
    return defaultStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultStore];
}

- (id)init 
{
    self = [super init];
    if(self) {
//        allItems = [[NSMutableArray alloc] init];
        
        Contato * c1 = [[Contato alloc] initWithNome:@"Danilo" andSobreNome:@"Lira De Lima" andTelefone:87654321 andCelular:987654321 andEndereco:@"Rua Abc, 27"];
        Contato * c2 = [[Contato alloc] initWithNome:@"Idalia" andSobreNome:@"Lira De Lima" andTelefone:87654321 andCelular:987654321 andEndereco:@"Rua Abc, 27"];
        Contato * c3 = [[Contato alloc] initWithNome:@"Jaiane" andSobreNome:@"Lira De Lima" andTelefone:87654321 andCelular:987654321 andEndereco:@"Rua Abc, 27"];
        Contato * c4 = [[Contato alloc] initWithNome:@"Daniel" andSobreNome:@"Lira De Lima" andTelefone:87654321 andCelular:987654321 andEndereco:@"Rua Abc, 27"];
        Contato * c5 = [[Contato alloc] initWithNome:@"Idevaldo" andSobreNome:@"Lira De Lima" andTelefone:87654321 andCelular:987654321 andEndereco:@"Rua Abc, 27"];
        
        allItems = [[NSMutableArray alloc] initWithArray: [NSArray arrayWithObjects:c1, c2, c3,c4,c5, nil]];
        
    }
    return self;
}

- (void)removeItem:(Contato *)p
{
    [allItems removeObjectIdenticalTo:p];
}

- (NSMutableArray *)allItems
{
    return allItems;
}

- (void)moveItemAtIndex:(int)from
                toIndex:(int)to
{
    if (from == to) {
        return;
    }
    // Obtem o objeto na posicao de destino, para memorizar em 'p'
    Contato *p = [allItems objectAtIndex:from];

    // Remove o objeto da posicao destino
    [allItems removeObjectAtIndex:from];

    // Insere o objeto memorizado em 'p' na posicao destino
    [allItems insertObject:p atIndex:to];
}

- (void)addItem: (Contato *)c;
{
    [allItems insertObject:c atIndex:0];
   
}
@end
