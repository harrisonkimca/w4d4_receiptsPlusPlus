//
//  NewReceiptViewController.m
//  2w4d4_receiptsPlusPlus
//
//  Created by Seantastic31 on 20/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "NewReceiptViewController.h"
#import "AppDelegate.h"
#import "Receipt+CoreDataClass.h"
#import "Tag+CoreDataClass.h"

@interface NewReceiptViewController ()<UITextFieldDelegate, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *receiptsArray;
@property (strong, nonatomic) NSArray *tagsArray;

@end

@implementation NewReceiptViewController

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
    self.tagsArray = @[];
    self.amountTextField.delegate = self;
    self.descriptionTextField.delegate = self;
}

#pragma mark - Add New Objects

- (IBAction)addButtonTapped:(UIButton *)sender
{
    [self saveReceipt];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveReceipt
{
    if (_amountTextField.text.length == 0 && _descriptionTextField.text.length == 0)
    {
        NSLog(@"Book name is empty");
        return;
    }
    NSManagedObjectContext *context = [self getContext];
    Receipt *receipt = [NSEntityDescription insertNewObjectForEntityForName:@"Receipt" inManagedObjectContext:context];
    receipt.amount = [NSDecimalNumber decimalNumberWithString:self.amountTextField.text];
    receipt.note = self.descriptionTextField.text;
    receipt.timeStamp = self.datePicker.date;
    
    [[self appDelegate] saveContext];
}


- (IBAction)cancelButtonTapped:(UIButton *)sender
{
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self cancelReceipt];
}

- (void)cancelReceipt
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - TableView



#pragma mark - Keyboard

// open keyboard & selector: to call keyboardWillShow method to move view up
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    // register notification (UIKeyboardWillShowNotification opens keyboard)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    return YES;
}

// also use delegate to close keyboard and save receipt when return button is hit in the keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    // endEditing closes keyboard when it resigns first responder
    [self.view endEditing:YES];
    // saveReceipt with return key
    [self saveReceipt];
    return YES;
}

// move view up to make room for keyboard (called by notification selector:)
- (void)keyboardWillShow:(NSNotificationCenter*)notification
{
    
}

// move view down when keyboard is hidden (called by notification selector:)
- (void)keyboardWillHide:(NSNotificationCenter*)notification
{
    [self cancelReceipt];
}

// CUSTOM TOUCH DETECTION to resign first responder
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.amountTextField resignFirstResponder];
    [self.descriptionTextField resignFirstResponder];
    [self.datePicker resignFirstResponder];
}

@end
