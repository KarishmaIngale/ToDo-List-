//
//  Databaselib.h
//  ki_day25 Todo_List_Assignment
//
//  Created by Student P_02 on 04/04/17.
//  Copyright © 2017 felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
@interface Databaselib : NSObject
{
    sqlite3 *taskDatabase;
    
}
+(instancetype)getSharedObject;
-(void)createDatabase;
-(NSString *)getdatabasePath;
-(int)executeQuery:(NSString *)query;
-(NSArray *)getAllTasks:(NSString *)query;
-(NSArray *)getAllRollNo;

@property NSMutableArray *RollArray;
@end
