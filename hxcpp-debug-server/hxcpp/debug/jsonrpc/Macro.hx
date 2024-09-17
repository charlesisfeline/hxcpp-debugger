package hxcpp.debug.jsonrpc;

import haxe.macro.Context;
import haxe.macro.Compiler;

class Macro {
	macro public static function injectServer():Void {
		if (Context.defined("cpp") && Context.defined("debug")) {
			Context.onAfterInitMacros(onAfterInit);
			Compiler.define("HXCPP_DEBUGGER");
		}
	}

	static function onAfterInit():Void {
		Context.getType("hxcpp.debug.jsonrpc.Server");
	}

	macro public static function getDefinedValue(key:String, defaultV) {
		var val = Context.definedValue(key);
		return (val == null) ? macro ${defaultV} : macro $v{val};
	}
}
