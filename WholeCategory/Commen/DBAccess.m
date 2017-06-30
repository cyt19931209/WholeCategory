//
//  DBAccess.m
//  FMDBDemo2
//
//  Created by baj on 15/11/26.
//  Copyright © 2015年 wxhl. All rights reserved.
//

#import "DBAccess.h"
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"

@interface DBAccess()
@property (nonatomic,strong) FMDatabase *database;//线程不安全的
@property (nonatomic,strong) FMDatabaseQueue *queue;//线程安全的
@end

static DBAccess *instance  = nil;
@implementation DBAccess
+ (instancetype) shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DBAccess alloc] init];
        
        [instance step];
        
        [instance createUserTable];
    });
    return instance;
}
- (NSString *) databasePath {
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/user.sqlite"];
}
- (void) step {
    
    //如果这个路径下面没有这个数据库,则会创建数据
    self.database = [FMDatabase databaseWithPath:[self databasePath]];
    
}

- (void) createUserTable {
    //打开数据库
    if ([self.database open]) {
        
        NSString *sql = @"create table user (id integer primary key,name text,age integer)";
        if ([self.database executeUpdate:sql]) {
            NSLog(@"创建表成功");
        }else{
            NSLog(@"创建表失败");
        }
    }else{
        NSLog(@"打开数据库失败");
    }
}

- (BOOL) addUser :(User *)user {

    //打开数据库
    if ([self.database open]) {
        
        NSString *sql = @"insert into user (name,age) values (?,?)";
        
        if ([self.database executeUpdate:sql,user.name,@(user.age)]) {
            NSLog(@"插入成功");
            return YES;
        }else{
            NSLog(@"插入失败");
        }
    }
    [self.database close];
    return NO;
}
- (NSArray *) fetchUser  {
    if ([self.database open]) {
        
        NSString *sql = @"select * from user";
        
       FMResultSet *resultSet = [self.database executeQuery:sql];
        User *user = nil;
        NSMutableArray *users = [NSMutableArray array];
        while ([resultSet next]) {
            user = [[User alloc] init];
            user.name = [resultSet stringForColumn:@"name"];
            user.age = [resultSet intForColumn:@"age"];
            [users addObject:user];
        }
        
        return [users copy];
    }
    [self.database close];
    return nil;
}
- (void) sqliteAscyn {
    
    self.queue = [[FMDatabaseQueue alloc] initWithPath:[self databasePath]];
    
    //这个方法是异步的.
    [self.queue inDatabase:^(FMDatabase *db) {
//        NSString *sql = @"insert into user (name,age) values (?,?)";
//        [db executeUpdate:sql,@"sisi",@38];
        NSLog(@"保存成功");
    }];
    
    [self.queue inDatabase:^(FMDatabase *db) {
       NSString *sql = @"select * from user";
        
        FMResultSet *resultSet = [db executeQuery:sql];
        User *user = nil;
        NSMutableArray *users = [NSMutableArray array];
        while ([resultSet next]) {
            user = [[User alloc] init];
            user.name = [resultSet stringForColumn:@"name"];
            user.age = [resultSet intForColumn:@"age"];
//            [users addObject:user];
            NSLog(@"name is %@,current Thread is %@",user.name,[NSThread currentThread]);
        }
    }];
}

//数据库事物
- (void) insertUsers :(NSArray *)users {
    //事物就是把一次数据库操作认作为原子性操作.
    //开启事物
    [self.database beginTransaction];
    
    /**
        这里编写的代码就是原子性操作.如果发生错误,就要进行数据库回滚 rollback
     */
    BOOL isRollBack;
    @try {
        //如果@try{}发生异常,则代码就会跳转到@catch{}这个代码快当中,很容易发生内存泄露,不推荐使用.
        //不管是发生不发生异常,最终都会执行@finally这个代码块
        User *user = nil;
        for (int index = 0; index < users.count; index ++) {
            user = users[index];
            [self.database executeUpdateWithFormat:@"insert into user (name,age) values (%@,%d)",user.name,user.age];
        }
    }
    @catch (NSException *exception) {
        //数据库回滚,回滚到事物开启时的状态.
        isRollBack = YES;
        [self.database rollback];
    }
    @finally {
        if (!isRollBack) {
            //提交事物.
            [self.database commit];
        }
    }
}


@end
