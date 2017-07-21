//
//  Receipt+CoreDataProperties.m
//  2w4d4_receiptsPlusPlus
//
//  Created by Seantastic31 on 20/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "Receipt+CoreDataProperties.h"

@implementation Receipt (CoreDataProperties)

+ (NSFetchRequest<Receipt *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Receipt"];
}

@dynamic amount;
@dynamic note;
@dynamic timeStamp;
@dynamic receipt;

@end
