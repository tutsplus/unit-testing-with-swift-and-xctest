//
//  helpers.h
//  SimpleTipCalculator
//
//  Created by Derek Jensen on 5/28/15.
//  Copyright (c) 2015 Derek Jensen. All rights reserved.
//

#ifndef SimpleTipCalculator_helpers_h
#define SimpleTipCalculator_helpers_h

#import <Foundation/Foundation.h>

typedef void (^VoidBlock)(void);

@interface Helpers : NSObject

BOOL throws(VoidBlock block);

@end


#endif
