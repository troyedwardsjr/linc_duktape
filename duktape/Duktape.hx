package duktape;

@:keep
@:include('linc_duktape.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('duktape'))
#end
extern class Duktape {

    @:native('duk_create_heap_default')
	static function newContext() : DukContext;

	@:native('duk_eval_string')
	static function evalString(ctx:DukContext, src:String) : Void;

	@:native('duk_get_int')
	static function getInt(ctx:DukContext, idx:Int) : Int;

    //external native function definition
    //can be wrapped in linc::libname or call directly
    //and the header for the lib included in linc_duktape.h

    @:native('linc::duktape::example')
    static function example() : Int;

    //inline functions can be used as wrappers
    //and can be useful to juggle haxe typing to or from the c++ extern
    /*
    static inline function inline_example() : Int {
        return untyped __cpp__('linc::duktape::example()');
    }

    @:native('linc::duktape::example')
    private static function _internal_example() : Int;
    static inline function other_inline_example() : Int {
        return _internal_example();
    }
    */

} //Duktape