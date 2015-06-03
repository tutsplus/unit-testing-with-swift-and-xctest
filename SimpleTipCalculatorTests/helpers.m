//
//  helpers.m
//  SimpleTipCalculator
//
//  Created by Derek Jensen on 5/28/15.
//  Copyright (c) 2015 Derek Jensen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "helpers.h"

@implementation Helpers: NSObject

BOOL throws(VoidBlock block) {
    @try {
        block();
    }
    @catch (NSException *exception) {
        return YES;
    }
    return NO;
}

@end