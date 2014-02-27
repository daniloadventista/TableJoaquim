//
//  VCContato.h
//  TableJoaquim
//
//  Created by Danilo Lira de Lima on 20/02/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
@class ContatoStore;
@interface VCContato : UIViewController<UITextFieldDelegate>{
    
}
- (IBAction)btmVoltar:(id)sender;
- (IBAction)criarContato:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *pn;
@property (weak, nonatomic) IBOutlet UITextField *sn;
@property (weak, nonatomic) IBOutlet UITextField *eml;
@property (weak, nonatomic) IBOutlet UITextField *tlP;
@property (weak, nonatomic) IBOutlet UITextField *end;

//variaveis de controle de imagens
@property (weak, nonatomic) IBOutlet UIImageView *uiImageVsh;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *uiTapGRImage;
- (IBAction)UITapImage:(id)sender;
@property BOOL newMedia;
- (IBAction)useCamera:(id)sender;
- (IBAction)useCameraRoll:(id)sender;

@end
