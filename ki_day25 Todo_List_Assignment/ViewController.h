//
//  ViewController.h
//  ki_day25 Todo_List_Assignment
//
//  Created by Student P_02 on 04/04/17.
//  Copyright © 2017 felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Databaselib.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITextField *TextNo;
@property (strong, nonatomic) IBOutlet UITextField *TextName;

- (IBAction)Add:(id)sender;
- (IBAction)Update:(id)sender;
- (IBAction)Delete:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property NSArray *myArray;
@property NSArray *myRollArray;

@end

