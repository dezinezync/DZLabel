/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2012 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "ComDzlabelView.h"
#import "TiUtils.h"

@implementation ComDzlabelView

-(void)dealloc
{
    RELEASE_TO_NIL(label);
    [super dealloc];
}

-(RTLabel *)label
{
    if (label == nil)
    {
        label = [[RTLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        
        [label setFont:[UIFont fontWithName:@"Helvetica" size:12]];
        [label setTextColor:[UIColor blackColor]];
        [self addSubview:label];
        label.delegate = self;
    }
    return label;
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    if (self.label != nil)
    {
        [TiUtils setView:label positionRect:bounds];
    }
}

//Code from RTLabel Example
- (void)layoutSubviews
{
	[super layoutSubviews];
    
	CGSize optimumSize = [self.label optimumSize];
	CGRect frame = [self.label frame];
	frame.size.height = (int)optimumSize.height+5; // +5 to fix height issue, this should be automatically fixed in iOS5
	[self.label setFrame:frame];
}

-(void)setText_:(id)text {
    ENSURE_STRING_OR_NIL(text)
    NSLog(text);

    [self.label setText:text];
}

/* TO DO */
// Implement methods to set Font Name, Font Size and Text Color

//Send click event data when a URL is clicked
// Needs proper implementation
- (void)label:(id)label didSelectLinkWithURL:(NSURL *)url {
    if ([self.proxy _hasListeners:@"urlClicked"]) {
        NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:
                               url, @"url",
                               nil];
        [self.proxy fireEvent:@"urlClicked" withObject:dict];
    }
}


@end
