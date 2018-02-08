package duktape;

import cpp.Function;
import cpp.Pointer;
import haxe.Constraints;
import Type;

@:keep
@:include('linc_duktape.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('duktape'))
#end
extern class Duktape {
	// Duktape.
	
  @:native('duk_create_heap_default')
	static function newContext() : DukContext;

	@:native('duk_eval_string')
	static function evalString(ctx:DukContext, src:String) : Void;

	@:native('duk_peval_string')
	static function pevalString(ctx:DukContext, src:String) : Bool;

  @:native('duk_eval_string_noresult')
	static function evalStringNoResult(ctx:DukContext, src:String) : Void;

	@:native('duk_get_int')
	static function getInt(ctx:DukContext, idx:Int) : Int;

	@:native('duk_to_string')
	static function toString(ctx:DukContext, idx:Int) : Dynamic;
	
	@:native('duk_safe_to_string')
	static function safeToString(ctx:DukContext, idx:Int) : Dynamic;

	@:native('duk_get_string')
	static function getString(ctx:DukContext, idx:Int) : Dynamic;
	
	@:native('duk_get_prop_string')
	static function getPropString(ctx:DukContext, idx:Int, key:Dynamic) : Dynamic;

	@:native('duk_get_prop_string')
	static function getPropString(ctx:DukContext, idx:Int, key:Dynamic) : Dynamic;

	@:native('duk_push_c_function')
	static function pushCFunction(ctx:DukContext, func:cpp.Callable<DukContext -> Int>, idx:Int) : String;

	// Dukglue.

	@:native('dukglue_register_function')
	static function registerFunction(ctx:DukContext, func:Function, name:String) : Void;
	
	/*
	@:generic
	@:native('dukglue_register_constructor')
	static function registerConstructor<T:Dynamic>(t:T, ctx:DukContext, name:String) : Void;

	@:native('linc::duktape::registerConstructor')
	static function registerConstructor(cls:Dynamic, ctx:DukContext, name:String) : Void;
		*/
	
	static inline function registerConstructor(ctx:DukContext, name:String) : Void {
			untyped __cpp__('dukglue_register_constructor<::test::TestClass>(ctx, "TestClass")');
	}

	static inline function registerMethod(ctx:DukContext, name:String) : Void {
			untyped __cpp__('dukglue_register_method(ctx, &::test::TestClass_obj::printAdventure, "printAdventure")');
	}
	
	/*
	@:native('dukglue_register_method')
	static function registerMethod(ctx:DukContext, func:Function, name:String) : Void;
	*/
} // Duktape
