//
//  DBAccess.h
//  FMDBDemo2
//
//  Created by baj on 15/11/26.
//  Copyright © 2015年 wxhl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@interface DBAccess : NSObject

+ (instancetype) shareInstance;
- (BOOL) addUser :(User *)user;
- (NSArray *) fetchUser;
- (void) sqliteAscyn ;
- (void) insertUsers :(NSArray *)users;
@end
