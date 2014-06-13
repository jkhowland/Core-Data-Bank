//
//  DBMemberController.h
//  Core Data Bank
//
//  Created by Tiafau Purcell on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Member.h"

@interface DBMemberController : NSObject

+ (DBMemberController *)sharedInstance;

- (Member *)rootMember;

+ (Member *)insertMemberWithTitle:(NSString*)title
                           parent:(Member*)parent
           inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end
