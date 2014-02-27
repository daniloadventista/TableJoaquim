//
//  ContatoStore.h
//  Homepwner
//
//  Created by joeconway on 8/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Contato;

@interface ContatoStore : NSObject
{
    NSMutableArray *allItems;
    NSIndexPath * indexPath;
}
//@property (nonatomic, strong) NSIndexPath * indexPath;

+ (ContatoStore *)defaultStore;

- (void)removeItem:(Contato *)c;

- (NSMutableArray *)allItems;

- (void)addItem: (Contato *)c;

- (void)moveItemAtIndex:(int)from
                toIndex:(int)to;

@end
