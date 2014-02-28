//
//  VCContatoEditttt.m
//  TableJoaquim
//
//  Created by Danilo Lira de Lima on 24/02/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import "VCContatoEditttt.h"
#import "Contato.h"
#import "ContatoStore.h"

@interface VCContatoEditttt ()

@end

@implementation VCContatoEditttt
@synthesize pn,sn,eml,tlP,end,contatoEdit;

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
    
    _uiImageVsh.userInteractionEnabled = true;
    UITapGestureRecognizer *oneTap =
    [[UITapGestureRecognizer alloc]
     initWithTarget:self
     action:@selector(oneTapDetected:)];
    oneTap.numberOfTapsRequired = 1;
    [_uiImageVsh addGestureRecognizer:oneTap];
    
    self.pn.text = contatoEdit.nome;
    self.sn.text = contatoEdit.sobreNome;
    self.end.text = contatoEdit.endereco;
    self.tlP.text = [NSString stringWithFormat:@"%d",contatoEdit.telefone];
    self.eml.text = [NSString stringWithFormat:@"%d",contatoEdit.celular];
    self.uiImageVsh.image = contatoEdit.img;
    
    for (NSString* s in contatoEdit.telefones) {
        //pega valor inteiro e insere como se fosse string
        _telefoneTemp = s.intValue;
        [self addTelefone:self];
    }
    _telefoneTemp = 0;
    
    [self.scrollPhones setScrollEnabled:YES];
    _incrementoBotao = 40;
    _numTelsSecundarios = 0;
    _telefones = [[NSMutableArray alloc]init];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnDeletatContato:(id)sender {

    [[ContatoStore defaultStore] removeItem:contatoEdit];
    
    [[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:0] animated:YES];
}

- (IBAction)btmVoltar:(id)sender {
    
    [[self navigationController] popToRootViewControllerAnimated:YES];
    
}

- (IBAction)oneTapDetected:(UIGestureRecognizer *)sender {
    NSLog(@"Double Tap On Image");
    [self useCameraRoll:_uiImageVsh];
    
}

- (IBAction)alterarContato:(id)sender {
//    alterarContato passado para classe

    contatoEdit.nome = self.pn.text;
    contatoEdit.sobreNome = self.sn.text;
    contatoEdit.endereco = self.end.text;
    contatoEdit.telefone = self.tlP.text.intValue;
    contatoEdit.celular = self.eml.text.intValue;
    contatoEdit.img = self.uiImageVsh.image;
    [[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:0] animated:YES];
    contatoEdit.telefones = [[NSMutableArray alloc]init];
    for (UITextField* t in _telefones) {
        //pega valor inteiro e insere como se fosse string
        [contatoEdit.telefones addObject:[NSString stringWithFormat:@"%d", [t.text intValue]]];
    }
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

//-(void)textFieldDidBeginEditing:(UITextField *)textField {
//    //Keyboard becomes visible
//        
//    self.view.frame = CGRectMake(self.view.frame.origin.x,
//                                  self.view.frame.origin.y,
//                                  self.view.frame.size.width,
//                                  self.view.frame.size.height - 215 + 50);   //resize
//
//    
//}
//
//-(void)textFieldDidEndEditing:(UITextField *)textField {
//
//        
//    self.view.frame = CGRectMake(self.view.frame.origin.x,
//                                 self.view.frame.origin.y,
//                                 self.view.frame.size.width,
//                                 self.view.frame.size.height + 215 + 50);   //resize
//    
//}

//metodo para adicao de telefones
- (IBAction)addTelefone:(id)sender {
    if (_numTelsSecundarios<5) {
        
        UITextField *newFone = [[UITextField alloc] initWithFrame:CGRectMake(_tlSecundario.frame.origin.x, (_tlSecundario.frame.origin.y + _incrementoBotao), _tlSecundario.frame.size.width, _tlSecundario.frame.size.height)];
        
        [newFone.layer setBorderColor:_tlSecundario.layer.borderColor];
        [newFone.layer setBorderWidth:_tlSecundario.layer.borderWidth];
        newFone.borderStyle = _tlSecundario.borderStyle;
        newFone.layer.cornerRadius = _tlSecundario.layer.cornerRadius;
        newFone.clipsToBounds = _tlSecundario.clipsToBounds;
        newFone.font = _tlSecundario.font;
        newFone.placeholder = _tlSecundario.placeholder;
        newFone.delegate = self;
        newFone.hidden = false;
        [self.view addSubview:newFone];
        if (_telefoneTemp!=0) {
            newFone.text = [NSString stringWithFormat:@"%d", _telefoneTemp];
        }
        [_telefones addObject:newFone];
        
        _incrementoBotao +=40;
        _numTelsSecundarios+=1;
    }
}

//metodos relacionados ao controle de imagens

- (void) useCamera:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker
                           animated:YES completion:nil];
        _newMedia = YES;
    }else{
        NSLog(@"Not Avaible");
    }
    
}

- (void) useCameraRoll:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker
                           animated:YES completion:nil];
        _newMedia = NO;
    }
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        
        _uiImageVsh.image = image;
        if (_newMedia)
            UIImageWriteToSavedPhotosAlbum(image,
                                           self,
                                           @selector(image:finishedSavingWithError:contextInfo:),
                                           nil);
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        // Code here to support video if enabled
    }
}

-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
