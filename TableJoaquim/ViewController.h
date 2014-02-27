//
//  ViewController.h
//  TableJoaquim
//
//  Created by Danilo Lira de Lima on 18/02/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VCContato;
@class ContatoStore;
@class VCContatoEditttt;
@class VCContatoView;

@interface ViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>{
    NSMutableArray *dados;
    NSMutableDictionary  *sections;
    int  myRow;
//    IBOutlet UILabel *lbStatus;
    IBOutlet UIView *headerView;
    VCContato* novoContato;
    ContatoStore * contatoStore;
    
}

@property NSMutableArray *dados;
@property NSMutableDictionary  *sections;
@property int  myRow;
@property (nonatomic, strong) IBOutlet UIView *headerView;
@property (nonatomic, strong) IBOutlet VCContato *novoContato;
@property (nonatomic, strong) IBOutlet VCContatoEditttt *contatoEditando;
@property (nonatomic, strong) IBOutlet VCContatoView *contatoView;
@property (nonatomic, strong) IBOutlet ContatoStore *contatoStore;

//- (void)removeErrados;
@end
