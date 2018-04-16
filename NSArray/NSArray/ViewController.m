//
//  ViewController.m
//  NSArray
//
//  Created by paul on 4/14/18.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self doTask];
    
}

- (void) doTask{
    //    Please, find your tasks on NSArray and NSMutableArray bellow:
    //
    //    Create NSArray, containing several strings, using literal declaration.
        NSArray *usingStringLiterals = @[@"first", @"second", @"third", @"fourth"];
    
    
    //    Create mutable array from piviously created NSArray.
    NSMutableArray *mutableFromNSArray = [NSMutableArray arrayWithArray:usingStringLiterals];
    
    
    //    Create an empty array and obtain its first and last element in a safe way.
    NSArray *emptyArray = [NSArray array];
    [emptyArray firstObject];
    [emptyArray lastObject];
    
    
    //    Create NSArray, containing strings from 1 to 20:
    [mutableFromNSArray removeAllObjects];
    
    for (int i = 1; i <= 20; i++) {
        [mutableFromNSArray addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    NSArray *arrayOfStringsFromOneTillTwenty = [NSArray arrayWithArray:                                                                                                    mutableFromNSArray];
    
    
    //    Get its shallow copy and real deep copy.
    //shallow copy
    NSArray *shallowCopy = [NSArray arrayWithArray:arrayOfStringsFromOneTillTwenty];
    
    
    // real deep copy
    NSArray *deepCopy = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver                                                                         archivedDataWithRootObject:arrayOfStringsFromOneTillTwenty]];
    
    
    //    Iterate over array and obtain item at index 13. Print an item.
    for (int i = 0; i < deepCopy.count; i++) {
        if (i == 13) {
            NSLog(@"%@", deepCopy[i]);
            break;
        }
    }
    //    Make array mutable. Add two new entries to the end of the array, add an entry to the
    //beginning of the array.
    NSMutableArray *mutableArrayOfStringsFromOneTillTwenty = [arrayOfStringsFromOneTillTwenty mutableCopy];
    
    
    //Add two new entries to the end of the array
    [mutableArrayOfStringsFromOneTillTwenty addObject:@"21"];
    [mutableArrayOfStringsFromOneTillTwenty addObject:@"22"];
    [mutableArrayOfStringsFromOneTillTwenty insertObject:@"0" atIndex:0];
    
    
    // Iterate over an array and remove item at index 5.
    for (int i = 0; i < mutableArrayOfStringsFromOneTillTwenty.count; i++) {
        if(i == 5){
            [mutableArrayOfStringsFromOneTillTwenty  removeObjectAtIndex:i];
            break;
        }
    }
    
    
    //    Create new array of mixed numbers. Sort it in an ascending and descending order.
    //
    NSMutableArray *mixedNumbers = [NSMutableArray arrayWithCapacity:10];
    
    for (int i = 0; i < 10; i++ ) {
        mixedNumbers[i] = [NSNumber numberWithInteger:arc4random()%100];
    }
    
    //    Sort it in an ascending
    NSArray *sortedAcsending = [mixedNumbers sortedArrayUsingSelector:@selector(compare:)];
    
    //    Sort it in an descending
    NSArray *sortedDescending = [mixedNumbers sortedArrayUsingComparator:
                                 ^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                                return [obj2 compare:obj1];
                                }];
    [mutableArrayOfStringsFromOneTillTwenty release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
