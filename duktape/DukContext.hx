package duktape;

@:include('linc_duktape.h')
@:native("duk_context")
extern class Duk_Context {}
typedef DukContext = cpp.Pointer<Duk_Context>;