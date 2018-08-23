//
//  VCObjC.m
//  Tutti
//
//  Created by Pavle Mijatovic on 8/21/18.
//  Copyright © 2018 Pavle Mijatovic. All rights reserved.
//

#import "VCObjC.h"
#import "DrawingAPI.h"

@interface VCObjC ()

@end

@implementation VCObjC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testDraw];
}

- (void)testDraw {
    
    struct Msg **messages = malloc(sizeof(struct Msg*));
    
    for (int i = 0; i < 4; i++) {
        requestNextMove(messages + 1);
        struct Msg *message = messages[i];
        int value = message->msg;
        CGPoint point = message->point;
        NSLog(@"%@, %@", @(value), @(point));
    }
}

@end
