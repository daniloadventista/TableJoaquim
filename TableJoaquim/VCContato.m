//
//  VCContato.m
//  TableJoaquim
//
//  Created by Danilo Lira de Lima on 20/02/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import "VCContato.h"
#import "Contato.h"
#import "ViewController.h"
#import "ContatoStore.h"

@interface VCContato ()

@end

@implementation VCContato
@synthesize pn,sn,eml,tlP,end;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _uiImageVsh.userInteractionEnabled = true;
    UITapGestureRecognizer *oneTap =
    [[UITapGestureRecognizer alloc]
     initWithTarget:self
     action:@selector(oneTapDetected:)];
    oneTap.numberOfTapsRequired = 1;
    [_uiImageVsh addGestureRecognizer:oneTap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btmVoltar:(id)sender {
    
    [[self navigationController] popToRootViewControllerAnimated:YES];
    
}

- (IBAction)criarContato:(id)sender {
//    [self ];
    
    Contato *c = [[Contato alloc]initWithNome:pn.text andSobreNome:sn.text andTelefone:[tlP.text intValue]andCelular: [eml.text intValue] andEndereco:end.text];
    c.img = self.uiImageVsh.image;
    [[ContatoStore defaultStore] addItem:c];
    
    [[self navigationController] popToViewController:[[[self navigationController] viewControllers] objectAtIndex:0] animated:YES];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)oneTapDetected:(UIGestureRecognizer *)sender {
    NSLog(@"Double Tap On Image");
    [self useCameraRoll:_uiImageVsh];
    
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
