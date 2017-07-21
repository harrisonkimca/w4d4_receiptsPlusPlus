//
//  Receipt+CoreDataProperties.h
//  2w4d4_receiptsPlusPlus
//
//  Created by Seantastic31 on 20/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "Receipt+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Receipt (CoreDataProperties)

+ (NSFetchRequest<Receipt *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDecimalNumber *amount;
@property (nullable, nonatomic, copy) NSString *note;
@property (nullable, nonatomic, copy) NSDate *timeStamp;
@property (nullable, nonatomic, retain) NSSet<Tag *> *receipt;

@end

@interface Receipt (CoreDataGeneratedAccessors)

- (void)addReceiptObject:(Tag *)value;
- (void)removeReceiptObject:(Tag *)value;
- (void)addReceipt:(NSSet<Tag *> *)values;
- (void)removeReceipt:(NSSet<Tag *> *)values;

@end

NS_ASSUME_NONNULL_END
