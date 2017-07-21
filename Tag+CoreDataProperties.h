//
//  Tag+CoreDataProperties.h
//  2w4d4_receiptsPlusPlus
//
//  Created by Seantastic31 on 20/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "Tag+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Tag (CoreDataProperties)

+ (NSFetchRequest<Tag *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *tagName;
@property (nullable, nonatomic, retain) Receipt *tag;

@end

NS_ASSUME_NONNULL_END
