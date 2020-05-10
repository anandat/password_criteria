#import "PasswordCriteriaPlugin.h"
#if __has_include(<password_criteria/password_criteria-Swift.h>)
#import <password_criteria/password_criteria-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "password_criteria-Swift.h"
#endif

@implementation PasswordCriteriaPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPasswordCriteriaPlugin registerWithRegistrar:registrar];
}
@end
