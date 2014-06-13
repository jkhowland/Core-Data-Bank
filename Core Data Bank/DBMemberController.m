//
//  DBMemberController.m
//  Core Data Bank
//
//  Created by Tiafau Purcell on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DBMemberController.h"
#import "DBAppDelegate.h"
#import "DBStack.h"

@interface DBMemberController ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation DBMemberController

+ (DBMemberController *)sharedInstance {
    static DBMemberController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DBMemberController alloc] init];
        DBAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
        
        sharedInstance.managedObjectContext = appDelegate.stack.managedObjectContext;
    });
    return sharedInstance;
}

- (Member*)rootMember
{
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"Member"];
    request.predicate = [NSPredicate predicateWithFormat:@"parent = %@", nil];
    
    NSArray* objects = [self.managedObjectContext  executeFetchRequest:request error:NULL];
    
    Member* rootMember = [objects lastObject];
    
    if (rootMember == nil) {
        rootMember = [DBMemberController insertMemberWithTitle:nil parent:nil inManagedObjectContext:self.managedObjectContext];
    }
    return rootMember;
}

+ (Member *)insertMemberWithTitle:(NSString*)title
                           parent:(Member*)parent
           inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Member* member = [NSEntityDescription insertNewObjectForEntityForName:@"Member"
                                                   inManagedObjectContext:managedObjectContext];
    member.title = title;
    member.parent = parent;
    
    return member;
}

@end
