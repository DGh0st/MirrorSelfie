#import <AVFoundation/AVFoundation.h>

@interface AVCaptureConnection (MirrorSelfiePrivate)
-(AVCaptureDevice *)sourceDevice; // iOS 6 - 12
@end

%hook AVCaptureConnection
-(void)setVideoMirrored:(BOOL)arg1 {
	if ([self sourceDevice].position == AVCaptureDevicePositionFront)
		arg1 = self.supportsVideoMirroring;
	%orig(arg1);
}

-(void)_setVideoMirrored:(BOOL)arg1 {
	if ([self sourceDevice].position == AVCaptureDevicePositionFront)
		arg1 = self.supportsVideoMirroring;
	%orig(arg1);
}

-(BOOL)isVideoMirrored {
	if ([self sourceDevice].position == AVCaptureDevicePositionFront)
		return self.supportsVideoMirroring;
	return %orig();
}
%end
