//
//  DBMemberController.m
//  Core Data Bank
//
//  Created by Tiafau Purcell on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DBMemberController.h"
#import "DBAppDelegate.h"

@interface DBMemberController ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation DBMemberController

// smart return type for compiler i.e. makes sure that xcode knows what type it is
+ (DBMemberController *)sharedInstance {
    static DBMemberController *sharedInstance = nil;
    // this part will only run once for life of app
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [DBMemberController new];
        
        DBAppDelegate *appDelegate = (DBAppDelegate *)[UIApplication sharedApplication].delegate;
        
        sharedInstance.managedObjectContext = appDelegate.stack.managedObjectContext;
        
    });
    
    return sharedInstance;
}

@end
