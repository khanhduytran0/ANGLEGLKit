# ANGLEGLKit

Drop-in replacement for OpenGLES framework using [ANGLE](http://github.com/google/angle) and [MetalANGLE's MGLKit](https://github.com/kakashidinho/metalangle/tree/master/ios/xcode/MGLKit).

## Why?
- OpenGLES game is limited to 60fps regardless of refresh rate of your device.
- Metal Performance HUD is not available in system OpenGLES framework.

## Usage
No source code modification is required, thus you can use this for closed-source games.

- Build ANGLE from source to get `libEGL.framework` and `libGLESv2.framework`, or use precompiled frameworks in Releases.
- Place all frameworks into the app bundle's `Frameworks` folder.
- Run `install_name_tool -change /System/Library/Frameworks/OpenGLES.framework/OpenGLES @rpath/ANGLEGLKit.framework/ANGLEGLKit <Mach-O file>` for all files that link against OpenGLES framework.

## License
[BSD?](https://github.com/kakashidinho/metalangle/raw/master/LICENSE)