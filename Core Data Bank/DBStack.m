//
//  DBStack.m
//  Core Data Bank
//
//  Created by Tiafau Purcell on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DBStack.h"

@implementation DBStack

- (id)init {
    self = [super init];
    if (self) {
        [self setupManagedObjectContext];
    }
    return self;
}

- (void)setupManagedObjectContext
{
    self.managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    self.managedObjectContext.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    
    NSError* error;
    [self.managedObjectContext.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                                       configuration:nil
                                                                                 URL:self.storeURL
                                                                             options:nil
                                                                               error:&error];
    if (error) {
        NSLog(@"error: %@", error);
    }
    
    self.managedObjectContext.undoManager = [[NSUndoManager alloc] init];
}

- (NSURL*)storeURL
{
    NSURL* documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:NULL];
    return [documentsDirectory URLByAppendingPathComponent:@"db.sqlite"];
}

- (NSURL*)modelURL
{
    return [[NSBundle mainBundle] URLForResource:@"CoreDataBank" withExtension:@"momd"];
}

- (NSManagedObjectModel*)managedObjectModel
{
    return [[NSManagedObjectModel alloc] initWithContentsOfURL:self.modelURL];
}

@end
