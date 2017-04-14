//
//  Databaselib.m
//  ki_day25 Todo_List_Assignment
//
//  Created by Student P_02 on 04/04/17.
//  Copyright © 2017 felix. All rights reserved.
//

#import "Databaselib.h"
#import "ViewController.h"
@implementation Databaselib
+(instancetype)getSharedObject
{
    static Databaselib *sharedObject;
    if(sharedObject==nil)
    {
        sharedObject=[[Databaselib alloc]init];
        
    }
    return sharedObject;
}
-(NSString *)getdatabasePath
{
    NSArray *docDir=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath=[[docDir firstObject]stringByAppendingString:@"sqliteDatabase.db"];
    return dbpath;
    
}
-(int)executeQuery:(NSString *)query
{
    int success=0;
    const char *cQuery=[query UTF8String];
    const char *cDatabasePath=[[self getdatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_open(cDatabasePath, &taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase,cQuery,-1,&stmt,NULL)!=SQLITE_OK)
            
        {
            NSLog(@"Error:%s",sqlite3_errmsg(taskDatabase));
        }
        else
        {
            if(sqlite3_step(stmt)==SQLITE_DONE)
            {
                success=1;
            }
        }
        
    }
    sqlite3_close(taskDatabase);
    sqlite3_finalize(stmt);
    return success;
    
}
-(void)createDatabase
{
    NSString *query=@"create table if not exists StudentTable(studentId text,StudentName text)";
    int issuccess=[self executeQuery:query];
    if (issuccess)
    {
        NSLog(@"Database created successfully");
        
    }
    else
        NSLog(@"Database created failed");
    
    
}
-(NSArray *)getAllTasks:(NSString *)query
{
    self.RollArray=[[NSMutableArray alloc]init];
    NSMutableArray *taskArray=[[NSMutableArray alloc]init];
    const char *cQuery=[query UTF8String];
    const char *cDatabasePath=[[self getdatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_open(cDatabasePath, &taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase,cQuery,-1,&stmt,NULL)!=SQLITE_OK)
            
        {
            NSLog(@"Error:%s",sqlite3_errmsg(taskDatabase));
        }
        else
        {
            while(sqlite3_step(stmt)==SQLITE_ROW)
            {
                const char *name=(const char *)sqlite3_column_text(stmt, 1);
                const char *roll=(const char *)sqlite3_column_text(stmt, 0);

                NSString *myName=[NSString stringWithFormat:@"%s",name];
                NSString *myRoll=[NSString stringWithFormat:@"%s",roll];

                [taskArray addObject:myName];
                [ self.RollArray addObject:myRoll];

            }
            
        }
    }
    NSLog(@"%@",self.RollArray);
    return taskArray;
}

-(NSArray *)getAllRollNo
{
    return self.RollArray;
}


@end
