//
//  ViewController.m
//  2w4d4_receiptsPlusPlus
//
//  Created by Seantastic31 on 20/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Receipt+CoreDataClass.h"
#import "NewReceiptViewController.h"

@interface ViewController ()<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray<Receipt*>*receiptsArray;

@end

@implementation ViewController

#pragma mark - AppDelegate (Context)

- (AppDelegate*)appDelegate
{
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}

- (NSPersistentContainer*)getContainer
{
    return [self appDelegate].persistentContainer;
}

- (NSManagedObjectContext*)getContext
{
    return [self getContainer].viewContext;
}

#pragma mark - ViewDidLoad

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.receiptsArray = @[];
    self.tableView.dataSource = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self fetchReceipt];
    [self.tableView reloadData];
}


#pragma mark - Fetch (Populate TableView)

- (void)fetchReceipt
{
    NSFetchRequest *request = [Receipt fetchRequest];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"timeStamp" ascending:YES];
    [request setSortDescriptors:@[sortDescriptor]];
    
    NSManagedObjectContext *context = [self getContext];
    NSError *error;
    NSArray *result = [context executeFetchRequest:request error:&error];
    
    if (error != nil)
    {
        NSLog(@"@%@", error.localizedDescription);
    }
    else
    {
        self.receiptsArray = result;
        [self.tableView reloadData];
    }
}

#pragma mark - TableView (Datasource & Display Data)


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.receiptsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Receipt *receipt = self.receiptsArray[indexPath.row];
    cell.textLabel.text = receipt.note;
    return cell;
}

@end
