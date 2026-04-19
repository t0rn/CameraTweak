#import <AVFoundation/AVFoundation.h>
#import "FakeDelegate.h"

%hook AVCaptureVideoDataOutput

- (void)setSampleBufferDelegate:(id<AVCaptureVideoDataOutputSampleBufferDelegate>)delegate
						  queue:(dispatch_queue_t)queue
{
	NSLog(@"[CameraTweak] setSampleBufferDelegate intercepted");
	
	FakeVideoDelegate *proxy = [[FakeVideoDelegate alloc] initWithRealDelegate:delegate];
	%orig(proxy, queue);
}

%end

%hook AVCapturePhotoOutput

- (void)capturePhotoWithSettings:(AVCapturePhotoSettings *)settings
						delegate:(id<AVCapturePhotoCaptureDelegate>)delegate
{
	NSLog(@"[CameraTweak] capturePhotoWithSettings intercepted");
	
	FakePhotoDelegate *proxy = [[FakePhotoDelegate alloc] initWithRealDelegate:delegate];
	%orig(settings, proxy);
}

%end

%ctor {
	NSLog(@"[CameraTweak] Tweak is loaded on process: %@", [[NSBundle mainBundle] bundleIdentifier]);
}
