//
//  AutoTilerAppDelegate.h
//  AutoTiler
//
//  Created by Joshua Garnham on 16/03/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AutoTilerPreviewView.h"

@class AutoTilerPreviewView;

@interface AutoTilerAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	
	IBOutlet AutoTilerPreviewView *previewView;
	
	IBOutlet NSTextField *imageLocation;
	
	IBOutlet NSTextField *widthField;
	IBOutlet NSTextField *heightField;
	
	IBOutlet NSButton *saveImageButton;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction)previewImage:(id)sender;
- (IBAction)saveImage:(id)sender;

@end
