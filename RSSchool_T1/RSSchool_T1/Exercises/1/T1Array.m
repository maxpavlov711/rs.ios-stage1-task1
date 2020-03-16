#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray*) convertToHappy: (NSArray*) sadArray {
    bool iValid = [self verifyArray: sadArray];

    if (iValid) {
        NSArray *happyArray = [self makeArrayHappy: sadArray];
        return happyArray;
    } else {
        return sadArray;
    }
}

- (bool) verifyArray:(NSArray *) sadArray {
    BOOL iValid = true;

    if (sadArray == nil || [sadArray count] == 0) {
        NSLog(@"Array empty!");
        iValid = false;
    } else if ([sadArray count]  == 1) {
        NSLog(@"Elements equals 1");
        iValid = false;
    }
    return iValid;
}

- (NSArray *) makeArrayHappy:(NSArray *) array {
    NSMutableArray *happyArray = [[NSMutableArray alloc] initWithArray: array];
    NSInteger index = 1;

    while (index < [happyArray count] - 1) {
        int currentElement = [[happyArray objectAtIndex: index] intValue];
        if (index != [happyArray count]) {
            int leftElement = [[happyArray objectAtIndex: index - 1] intValue];
            int rightElement = [[happyArray objectAtIndex: index + 1] intValue];
            int sumOfPreviousAndNextElement = rightElement + leftElement;
            if (sumOfPreviousAndNextElement < currentElement) {
                [happyArray removeObjectAtIndex: index];
                index = 1;
                continue;
            }
        }
        index += 1;
    }
    return happyArray;
}

@end
