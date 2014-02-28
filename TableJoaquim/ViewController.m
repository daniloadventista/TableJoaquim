//
//  ViewController.m
//  TableJoaquim
//
//  Created by Danilo Lira de Lima on 18/02/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import "ViewController.h"
#import "Contato.h"
#import "VCContato.h"
#import "VCContatoEditttt.h"
#import "ContatoStore.h"
#import "VCContatoView.h"

#pragma mark

@interface ViewController ()

@end

@implementation ViewController
@synthesize novoContato,headerView,myRow,sections,dados, contatoStore,contatoView,contatoEditando ;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    contatoStore = ContatoStore.defaultStore;
    
    dados = contatoStore.allItems;
    
    [dados sortWithOptions:0 usingComparator:^(Contato* obj1, Contato* obj2) {
        NSString *nome1 = obj1.nome;
        NSString *nome2 = obj2.nome;
        return [nome1 compare:nome2];
    }];
    sections = [[NSMutableDictionary alloc]init];
    
     NSLog(@"Dados ordenados:");
    for (Contato *c in dados) {
        //contar contatos da secao
        NSMutableArray * sec = [sections objectForKey:[c primeiraLetraNome]];
        if (sec==nil) {
            NSMutableArray * arr = [[NSMutableArray alloc]initWithArray:[NSArray arrayWithObject:c]];
//            [sections setValue:arr forKey:[c primeiraLetraNome]];
            [sections setObject:arr forKey:[c primeiraLetraNome]];
             }else{
                [sec addObject:c];
             }
        NSLog(@"Nome: %@", [c nome]);
    }
    self.title = @"Contatos";
    
    novoContato = [[VCContato alloc ]initWithNibName:@"VCContato" bundle:nil];
    contatoView = [[VCContatoView alloc ]initWithNibName:@"VCContatoView" bundle:nil];
    contatoEditando = [[VCContatoEditttt alloc ]initWithNibName:@"VCContatoEditttt" bundle:nil];
    
    UIBarButtonItem *btnAdd = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addContato:)];
    self.navigationController.topViewController.navigationItem.rightBarButtonItem = btnAdd;
    btnAdd.enabled=TRUE;
//    btnReload.style=UIBarButtonSystemItemRefresh;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//metodos secoes
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return ([sections count]+1);
//    return [dados count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    //
    
    NSArray * arr = [sections allKeys];
    arr = [arr sortedArrayWithOptions:0 usingComparator:^(NSString* obj1, NSString* obj2) {
        return [obj1 compare:obj2];
    }];
    
    NSString * titleSec = @"" ;
    if (section!=0) {
        titleSec = [arr objectAtIndex:section-1];
    }
    
    return titleSec;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Number of rows is the number of time zones in the region for the specified section.
//    return [dados count];
    NSInteger cont = 0;
    
    NSArray * arr = [sections allKeys];
    arr = [arr sortedArrayWithOptions:0 usingComparator:^(NSString* obj1, NSString* obj2) {
        return [obj1 compare:obj2];
    }];
    
    NSString * titleSec = @"" ;
    if (section!=0) {
        titleSec = [arr objectAtIndex:section-1];
    }
    NSMutableArray * arrSec = [sections objectForKey:titleSec];
    cont = [arrSec count];
    
//    Region *region = [regions objectAtIndex:section];
    return cont;
}

//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]
        initWithStyle:UITableViewCellStyleSubtitle
        reuseIdentifier:@"idCelula"];
    //TODO fazer if da celula
    
    NSArray * arr = [sections allKeys];
    arr = [arr sortedArrayWithOptions:0 usingComparator:^(NSString* obj1, NSString* obj2) {
        return [obj1 compare:obj2];
    }];
    
    NSString * titleSec = @"" ;
    if (indexPath.section!=0) {
        titleSec = [arr objectAtIndex:indexPath.section-1];
    }
    NSMutableArray * arrSec = [sections objectForKey:titleSec];
    
    Contato *c ;
    
    NSLog(@"indexPath row: %d", [indexPath row]);
    NSLog(@"indexPath.section: %d", indexPath.section);
    
    c = [arrSec objectAtIndex:[indexPath row]];
    myRow++;

    NSString *label = [NSString stringWithFormat:@"%@ ,%@ ,%d ,%d ,%@ ", [c nome],[c sobreNome], [c telefone],[c celular],[c endereco]];
    [[cell textLabel] setFont:[UIFont systemFontOfSize:14.0]];
    [[cell textLabel] setText:[c nome]];
    [[cell detailTextLabel] setFont:[UIFont systemFontOfSize:10.0]];
    [[cell detailTextLabel] setText:label];
    
    NSLog(@"dados count: %d", [dados count]);
    return cell;
}
- (UIView *)headerView
{
    // Se ainda nao tiver carregado a view de cabecalho...
    if (!headerView) {
        // Carrega HeaderView.xib
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    return headerView;
}

- (UIView *)tableView:(UITableView *)tv viewForHeaderInSection:(NSInteger)sec
{
    if (sec == 0)
    return [self headerView];
    return nil;
    
}

- (CGFloat)tableView:(UITableView *)tv heightForHeaderInSection:(NSInteger)sec
{
    if (sec == 0)
    return [[self headerView] bounds].size.height;
    return 0;
}

- (IBAction) addContato:(id)sender {
//    UIButton *buttonClicked = (UIButton *)sender;
    NSLog(@"teste");
    self.novoContato.title = @"Novo Contato";
    [self.navigationController
     pushViewController:self.novoContato
     animated:YES];
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray * arr = [sections allKeys];
    arr = [arr sortedArrayWithOptions:0 usingComparator:^(NSString* obj1, NSString* obj2) {
        return [obj1 compare:obj2];
    }];
    
    NSString * titleSec = @"" ;
    if (indexPath.section!=0) {
        titleSec = [arr objectAtIndex:indexPath.section-1];
    }
    NSMutableArray * arrSec = [sections objectForKey:titleSec];
    Contato* c = [arrSec objectAtIndex:indexPath.row];
    
    self.contatoView.contatoEdit = c;
    self.contatoView.title = c.nome;
    
    [self.navigationController
     pushViewController:self.contatoView
     animated:YES];
}
//metodo para recarregar tabela
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self viewDidLoad];
    [[self tableView] reloadData];

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


@end