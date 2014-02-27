//
//  VCContatoEditttt.h
//  TableJoaquim
//
//  Created by Danilo Lira de Lima on 24/02/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Contato;
@class VCContatoEditttt;

@interface VCContatoView : UIViewController<UITextFieldDelegate>{
    
}

@property (weak, nonatomic) IBOutlet UIButton *btnDeletar;

- (IBAction)btmVoltar:(id)sender;
- (IBAction)editarContato:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *pn;
@property (weak, nonatomic) IBOutlet UILabel *sn;
@property (weak, nonatomic) IBOutlet UILabel *eml;
@property (weak, nonatomic) IBOutlet UILabel *tlP;
@property (weak, nonatomic) IBOutlet UILabel *end;
@property (weak, nonatomic) Contato *contatoEdit;
@property (nonatomic, strong) IBOutlet VCContatoEditttt *contatoEditando;
@property (weak, nonatomic) IBOutlet UIImageView *uiImageVsh;


@end