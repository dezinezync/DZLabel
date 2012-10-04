/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2012 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "ComDzlabelView.h"

@implementation ComDzlabelView

-(void)dealloc
{
    RELEASE_TO_NIL(label);
    [super dealloc];
}

//Should this be RTLabel or UIView ?
-(RTLabel *)label
{
    if (label==nil)
    {
        label = [[RTLabel alloc] initWithFrame: [self frame]];
        [self addSubview:label];
    }
    return label;
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    if (label!=nil)
    {
        [TiUtils setView:label positionRect:bounds];
    }
}

-(void)setText_:(id)text {
    ENSURE_STRING_OR_NIL(text)
    NSLog(text);
    NSString *st = text;
    [label setText:text];
}

@end
