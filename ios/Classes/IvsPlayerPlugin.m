#import "IvsPlayerPlugin.h"
#if __has_include(<ivs_player/ivs_player-Swift.h>)
#import <ivs_player/ivs_player-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ivs_player-Swift.h"
#endif

@implementation IvsPlayerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftIvsPlayerPlugin registerWithRegistrar:registrar];
}
@end
