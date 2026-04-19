//
//  FakeDelegate.m
//  CameraTweak
//
//  Created by Batman on 19/4/26.
//

#import "FakeDelegate.h"
@import UIKit;
@import AVFoundation;

@implementation FakeVideoDelegate

- (instancetype)initWithRealDelegate:(id)realDelegate {
	self = [super init];
	if (self) {
		_realDelegate = realDelegate;
		NSBundle *bundle = [NSBundle bundleWithPath:@"/var/jb/Library/Application Support/CameraTweak/CameraTweakResources.bundle"];
		NSString *path = [bundle pathForResource:@"fake_photo" ofType:@"jpeg"];
		if (!path) path = [bundle pathForResource:@"fake_photo" ofType:@"jpeg"];
		
		_fakeImage = [UIImage imageWithContentsOfFile:path];
		
		NSLog(@"[CameraTweak] FakeVideoDelegate init | fakeImage: %@", _fakeImage ? @"LOADED" : @"NIL");
	}
	return self;
}

- (void)captureOutput:(AVCaptureOutput *)output
didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer
	   fromConnection:(AVCaptureConnection *)connection
{
	NSLog(@"[CameraTweak] didOutputSampleBuffer INTERCEPTED!");
	
	[_realDelegate captureOutput:output didOutputSampleBuffer:sampleBuffer fromConnection:connection];
}

@end


@implementation FakePhotoDelegate

- (instancetype)initWithRealDelegate:(id<AVCapturePhotoCaptureDelegate>)realDelegate {
	self = [super init];
	if (self) {
		_realDelegate = realDelegate;
		NSLog(@"[CameraTweak] FakePhotoDelegate init");
	}
	return self;
}
- (void)captureOutput:(AVCapturePhotoOutput *)output didCapturePhotoForResolvedSettings:(AVCaptureResolvedPhotoSettings *)resolvedSettings {
	NSLog(@"[CameraTweak] didCapturePhotoForResolvedSettings INTERCEPTED!");
}
@end
