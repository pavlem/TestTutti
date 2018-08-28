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
@property (weak, nonatomic) IBOutlet UIView *drawingCanvas;
@property (nonatomic, assign) BOOL goToNextPoint;
@property (weak, nonatomic) IBOutlet UILabel *infoLbl;

@end

@implementation DrawObjcVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _drawingEngine = [[DrawingEngine alloc] init];
    
    [self drawPoints];
}

- (void)drawPoints {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        for (int i = 0; i < 48; i++) {
            
            self.goToNextPoint = NO;
            struct Msg *message;
            requestNextMove(&message);
            int value = message->msg;
            CGPoint point = message->point;
            NSLog(@"%@, %@", @(value), @(point));
            
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                self.infoLbl.text = [NSString stringWithFormat: @"%@", [self.drawingEngine getInfoTxtForMsgWithMsg: *message]];
                [self.drawingEngine drawOnView:self.drawingCanvas withMessage:*message completion:^(BOOL isAnimationFinished) {
                    freeMsg(message);
                    self.goToNextPoint = YES;
                    NSLog(@"sssss");
                }];
            });
            
            while (self.goToNextPoint == NO) {
            }
            
            NSLog(@"====================");
            NSLog(@"%d", i);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            self.infoLbl.text = [NSString stringWithFormat: @"Finished"];
        });
        
    });
}

@end
