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
    
//    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
//
//    });
    
    
    for (int i = 0; i < 6; i++) {
        NSLog(@"========");
        requestNextMove(messages + i);
        struct Msg *message = messages[i];
        int value = message->msg;
        CGPoint point = message->point;
        NSLog(@"value: %@, point: %@", @(value), @(point));
        NSLog(@"message address is: %p", message);
        NSLog(@"messages + i address is: %p", messages + i);
        NSLog(@"");
    }
    
    NSLog(@"=====FINISHED=====");
}

@end
