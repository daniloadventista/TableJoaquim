//
//  VCContatoEditttt.m
//  TableJoaquim
//
//  Created by Danilo Lira de Lima on 24/02/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import "VCContatoView.h"
#import "VCContatoEditttt.h"
#import "Contato.h"

@interface VCContatoView ()

@end

@implementation VCContatoView
@synthesize pn,sn,eml,tlP,end,contatoEdit,contatoEditando;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    contatoEditando = [[VCContatoEditttt alloc ]initWithNibName:@"VCContatoEditttt" bundle:nil];
    
    self.pn.text = contatoEdit.nome;
    self.sn.text = contatoEdit.sobreNome;
    self.end.text = contatoEdit.endereco;
    self.tlP.text = [NSString stringWithFormat:@"%d",contatoEdit.telefone];
    self.eml.text = [NSString stringWithFormat:@"%d",contatoEdit.celular];
    self.uiImageVsh.image = contatoEdit.img;

    // Botao editar
    
    UIBarButtonItem *btnEDIT = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editContato:)];
    self.navigationController.topViewController.navigationItem.rightBarButtonItem = btnEDIT;
    btnEDIT.enabled=TRUE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btmVoltar:(id)sender {
    
    [[self navigationController] popToRootViewControllerAnimated:YES];
    
}
- (IBAction)editContato:(id)sender{
    //reutilizar codigo abaixo
    [self editarContato:sender];
}

- (IBAction)editarContato:(id)sender{
    
//    alterarContato passado para classe
    //fazendo scrolling
    self.contatoEditando.contatoEdit = self.contatoEdit;
    self.contatoEditando.title = [NSString stringWithFormat: @"Editar: %@" ,self.contatoEdit.nome];

    [self.navigationController
     pushViewController:self.contatoEditando
     animated:YES];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setTitle:contatoEdit.nome];
    [self viewDidLoad];
}


@end
