//
//  ViewController.m
//  ki_day25 Todo_List_Assignment
//
//  Created by Student P_02 on 04/04/17.
//  Copyright © 2017 felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myArray=[[NSArray alloc]init];
    NSString *query=@"select * from StudentTable";
    self.myArray=[[Databaselib getSharedObject]getAllTasks:query];
    [self.myTableView reloadData];
    self.myRollArray=[[Databaselib getSharedObject]getAllRollNo];
    NSLog(@"%@",self.myRollArray);
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myArray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text=[self.myArray objectAtIndex:indexPath.row];
   // cell.detailTextLabel.text[self.roll]
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    self.TextName.text=cell.textLabel.text;
    self. TextNo.text=[self.myRollArray objectAtIndex:indexPath.row];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Add:(id)sender {
    
    NSString *idText,*nameText;
    idText=self.TextNo.text;
    nameText=self.TextName.text;
    NSString *query=[NSString stringWithFormat:@"insert into StudentTable(studentId,StudentName)values(\"%@\",\"%@\")",idText,nameText];
    NSLog(@"%@",idText);
    
    int issuccess=[[Databaselib getSharedObject]executeQuery:query];
    if(issuccess)
    {
        NSLog(@"insearted:success");
        
       NSString *query=@"select * from StudentTable";
        self.myArray=[[Databaselib getSharedObject]getAllTasks:query];
        [self.myTableView reloadData];

           }
    else
        
    {
        NSLog(@"inserted:failed");
    }
    
    
    

}
- (IBAction)Update:(id)sender {
    NSString *idText,*nameText;
    idText=self.TextNo.text;
    nameText=self.TextName.text;
    
    NSString *query=[NSString stringWithFormat:@"UPDATE StudentTable SET StudentName=\"%@\" WHERE StudentId = \"%@\"",nameText,idText];
                                                



    
    
    NSLog(@"%@",idText);
    int issuccess=[[Databaselib getSharedObject]executeQuery:query];
    if(issuccess)

    {
        NSLog(@"Updated:success");
        
        NSString *query=@"select * from StudentTable";
        self.myArray=[[Databaselib getSharedObject]getAllTasks:query];
        [self.myTableView reloadData];
        
    }
    else
        
    {
        NSLog(@"Update:failed");
    }
  
    
    
    
    
}

- (IBAction)Delete:(id)sender {
    NSString *idText,*nameText;
    idText=self.TextNo.text;
    nameText=self.TextName.text;
    NSString *query=[NSString stringWithFormat:@"delete from StudentTable where StudentName=\"%@\"",nameText];

    NSLog(@"%@",idText);
    
    int issuccess=[[Databaselib getSharedObject]executeQuery:query];
    if(issuccess)
    {
        NSLog(@"Deleted:success");
        
        NSString *query=@"select * from StudentTable";
        self.myArray=[[Databaselib getSharedObject]getAllTasks:query];
        [self.myTableView reloadData];
        
    }
    else
        
    {
        NSLog(@"Delete:failed");
    }
    
  
}
@end
