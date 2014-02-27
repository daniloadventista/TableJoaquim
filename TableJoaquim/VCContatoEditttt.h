//
//  VCContatoEditttt.h
//  TableJoaquim
//
//  Created by Danilo Lira de Lima on 24/02/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
@class Contato;

@interface VCContatoEditttt : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate>{
    
}

@property (weak, nonatomic) IBOutlet UIButton *btnDeletar;
- (IBAction)btnDeletatContato:(id)sender;

- (IBAction)btmVoltar:(id)sender;
- (IBAction)alterarContato:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *pn;
@property (weak, nonatomic) IBOutlet UITextField *sn;
@property (weak, nonatomic) IBOutlet UITextField *eml;
@property (weak, nonatomic) IBOutlet UITextField *tlP;
@property (weak, nonatomic) IBOutlet UITextField *end;
@property (weak, nonatomic) Contato *contatoEdit;

//variaveis de controle de imagens
@property (weak, nonatomic) IBOutlet UIImageView *uiImageVsh;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *uiTapGRImage;
- (IBAction)UITapImage:(id)sender;
@property BOOL newMedia;
- (IBAction)useCamera:(id)sender;
- (IBAction)useCameraRoll:(id)sender;
@end