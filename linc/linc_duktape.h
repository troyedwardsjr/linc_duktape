#pragma once

//hxcpp include should always be first    
#include <hxcpp.h>

extern "C" {
    #include <../lib/duktape/duktape.h>
}

namespace linc {

    namespace duktape {
        extern int example();
        /*
        extern duk_context *createHeapDefault(void);
        extern void evalString(duk_context *ctx, const char *src);
        */
    } //duktape

} //linc