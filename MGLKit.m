#import <Foundation/Foundation.h>
#include <dlfcn.h>
#include <GLES2/gl2.h>

const NSString* kEAGLDrawablePropertyColorFormat = @"EAGLDrawablePropertyColorFormat";
const NSString* kEAGLDrawablePropertyRetainedBacking = @"EAGLDrawablePropertyRetainedBacking";
const NSString* kEAGLColorFormatRGB565 = @"EAGLColorFormatRGB565";
const NSString* kEAGLColorFormatRGBA8 = @"EAGLColorFormatRGBA8";
const NSString* kEAGLColorFormatSRGBA8 = @"EAGLColorFormatSRGBA8";

@interface MGLContext : NSObject
@end
@interface EAGLContext : MGLContext
@end
@implementation EAGLContext
@end

@interface MGLSharegroup : NSObject
@end
@interface EAGLSharegroup : MGLSharegroup
@end
@implementation EAGLSharegroup
@end

@interface MGLLayer : NSObject
@end
@interface CAEAGLLayer : MGLLayer
@end
/*
@implementation CAEAGLLayer
@end
*/

@interface MGLKView : NSObject
@end
@interface GLKView : MGLKView
@end
@implementation GLKView
@end

@interface MGLKViewController : NSObject
@end
@interface GLKViewController : MGLKViewController
@end
@implementation GLKViewController
@end

@implementation CAEAGLLayer(hook)
+ (Class)class {
    return MGLLayer.class;
}
@end

void (*orig_glGenFramebuffers)(GLsizei n, GLuint *framebuffers);
void (*orig_glGenRenderbuffers)(GLsizei n, GLuint *renderbuffers);

void glGenFramebuffers(GLsizei n, GLuint *framebuffers) {
    if (!orig_glGenFramebuffers) {
        // The very first call is used to init default buffer
        // ANGLE does this internally, so return 0 to use it instead
        orig_glGenFramebuffers = dlsym(RTLD_NEXT, "glGenFramebuffers");
        for (int i = 0; i < n; i++) {
            framebuffers[i] = 0;
        }
    } else {
        orig_glGenFramebuffers(n, framebuffers);
    }
}

void glGenRenderbuffers(GLsizei n, GLuint *renderbuffers) {
    if (!orig_glGenRenderbuffers) {
        // The very first call is used to init default buffer
        // ANGLE does this internally, so return 0 to use it instead
        orig_glGenRenderbuffers = dlsym(RTLD_NEXT, "glGenRenderbuffers");
        for (int i = 0; i < n; i++) {
            renderbuffers[i] = 0;
        }
    } else {
        orig_glGenRenderbuffers(n, renderbuffers);
    }
}
