@interface SBBulletinObserverViewController : UIViewController
@end

@interface _UIContentUnavailableView : UIView
@property(copy) NSString *title;
@end

static BOOL enabled = YES;
static NSString *text = @"No Notifications";

%hook SBNotificationCenterViewController
-(void)hostWillPresent {

    SBBulletinObserverViewController *controller = MSHookIvar<SBBulletinObserverViewController *>(self, "_allModeViewController");
    
    _UIContentUnavailableView *view = MSHookIvar<_UIContentUnavailableView *>(controller, "_contentUnavailableView");
    
    view.title = text;

    %orig;
}
%end

static void loadPrefs()
{
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.tweaksbylogan.nonotificationstextprefs.plist"];

    if (prefs) {

        enabled = ([prefs objectForKey:@"enabled"] ? [[prefs objectForKey:@"enabled"] boolValue] : enabled );
        text = ([prefs objectForKey:@"text"] ? [prefs objectForKey:@"text"] : text );
		[text retain];
    }
    [prefs release];
}

%ctor 
{
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.tweaksbylogan.nonotificationstextprefs/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();
}