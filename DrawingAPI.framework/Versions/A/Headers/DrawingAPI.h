//
//  DrawingAPI.h
//  DrawingApp
//
//  Created by mich2 on 20/05/14.
//  Copyright (c) 2014 tutti.ch. All rights reserved.
//

#ifndef DrawingApp_DrawingAPI_h
#define DrawingApp_DrawingAPI_h

#import <CoreGraphics/CoreGraphics.h>

/*
 Old C API.
 */

/*
 MsgsGoToPoint: start drawing at the point of the Msg.
 MsgsDrawLineToPoint: move the drawing position to the point.
 MsgsClearDrawing: clear the current drawing.
 MsgsDoNothing: msg indicating that the api has no more data at the moment.
 */
enum MsgAction {
    MsgsGoToPoint,
    MsgsDrawLineToPoint,
    MsgsClearDrawing,
    MsgsDoNothing
};

struct Msg
{
    enum MsgAction msg;
    CGPoint point;
};

/*
 Please note that this function can block the current thread for some time.
 It is also not thread save and should be properly garded.
 */
void requestNextMove(struct Msg **msg);

/* free a message */
void freeMsg(struct Msg *msg);

#endif
