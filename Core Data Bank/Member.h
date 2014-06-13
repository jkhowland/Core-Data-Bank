//
//  Member.h
//  Core Data Bank
//
//  Created by Tiafau Purcell on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Member;

@interface Member : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) Member *parent;
@property (nonatomic, retain) NSSet *children;
@end

@interface Member (CoreDataGeneratedAccessors)

- (void)addChildrenObject:(Member *)value;
- (void)removeChildrenObject:(Member *)value;
- (void)addChildren:(NSSet *)values;
- (void)removeChildren:(NSSet *)values;

@end
