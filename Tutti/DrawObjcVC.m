//
//  DrawObjcVC.m
//  Tutti
//
//  Created by Pavle Mijatovic on 8/26/18.
//  Copyright © 2018 Pavle Mijatovic. All rights reserved.
//

#import "DrawObjcVC.h"
#import "DrawingAPI.h"
#import <malloc/malloc.h>
#import "Tutti-Swift.h"

@interface DrawObjcVC ()

@property (nonatomic, strong) DrawingEngine *drawingEngine;

@end

@implementation DrawObjcVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _drawingEngine = [[DrawingEngine alloc] init];
    
    [self testDraw];
}

- (void)testDraw {
    
    struct Msg **messages = malloc(sizeof(struct Msg*));
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        for (int i = 0; i < 6; i++) {
            NSLog(@"========");
            requestNextMove(messages + i);
            struct Msg *message = messages[i];
            int value = message->msg;
            CGPoint point = message->point;
            NSLog(@"value: %@, point: %@", @(value), @(point));
            NSLog(@"message address is: %p", message);
            NSLog(@"messages + i address is: %p", messages + i);
            NSLog(@"sizeof myObject: %ld", sizeof(*message));
            NSLog(@"");
            // TODO: - When memory excepton is fixed use this method
//            dispatch_async(dispatch_get_main_queue(), ^(void){
//                [self.drawingEngine drawOnView:self.view withMessage:*message];
//            });
        }
    });
}

@end
