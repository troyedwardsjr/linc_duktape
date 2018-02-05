//hxcpp include should be first
#include <hxcpp.h>
#include "./linc_duktape.h"

namespace linc {

    namespace duktape {

        int example() {
            return 55;
        }
        /*
        duk_context createHeapDefault(void) {
			duk_context *ctx = duk_create_heap_default();
            return ctx;
		}

       void evalString(duk_context *ctx, const char *src) {
			duk_eval_string(ctx, src);
		}
        */

    } //duktape namespace

} //linc