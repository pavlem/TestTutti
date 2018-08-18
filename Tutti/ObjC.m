//
//  ObjC.m
//  Interbridge
//
//  Created by Pavle Mijatovic on 6/8/16.
//  Copyright © 2016 Pavle Mijatovic. All rights reserved.
//

#import "ObjC.h"

@implementation ObjC

- (NSString *)getFinalNameFrom:(NSString *)firstName andLastName:(NSString *)lastName {
  return [[firstName stringByAppendingString:@" "] stringByAppendingString:@"Peric"];
}

@end

