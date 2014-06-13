//
//  DBStack.h
//  Core Data Bank
//
//  Created by Tiafau Purcell on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBStack : NSObject

// interact with Core Data
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end
