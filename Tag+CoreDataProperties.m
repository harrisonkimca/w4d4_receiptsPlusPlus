//
//  Tag+CoreDataProperties.m
//  2w4d4_receiptsPlusPlus
//
//  Created by Seantastic31 on 20/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "Tag+CoreDataProperties.h"

@implementation Tag (CoreDataProperties)

+ (NSFetchRequest<Tag *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Tag"];
}

@dynamic tagName;
@dynamic tag;

@end
