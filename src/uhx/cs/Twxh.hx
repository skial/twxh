package uhx.cs;

import cs.Out;
import cs.types.Int16;
import cs.system.IntPtr;
import cs.system.runtime.interopservices.DllImportAttribute;

/**
 * ...
 * @author Skial Bainn
 * @see http://www.pinvoke.net/default.aspx/kernel32.getconsolescreenbufferinfo
 * @see http://www.pinvoke.net/default.aspx/kernel32.getstdhandle
 */
@:classCode(
'[global::System.Runtime.InteropServices.DllImportAttribute("kernel32.dll")]
	static extern bool GetConsoleScreenBufferInfo(global::System.IntPtr hConsoleOutput,  out CONSOLE_SCREEN_BUFFER_INFO lpConsoleScreenBufferInfo);

	
	[global::System.Runtime.InteropServices.DllImportAttribute("kernel32.dll", SetLastError = true)]
	static extern global::System.IntPtr GetStdHandle(int nStdHandle);
	
	
'
)
@:nativeGen class Twxh {

	public static function main() {
		var cchWidth = 80;
		var cchHeight = 25;
		var stdOutputHandle = -11;
		var csbi:CONSOLE_SCREEN_BUFFER_INFO = null;
		
		if (Helper.GetConsoleScreenBufferInfo( Helper.GetStdHandle( stdOutputHandle ), csbi )) {
			cchWidth = csbi.dwSize.X;
			cchHeight = csbi.dwSize.Y;
			
		}
		
		Sys.println( haxe.Json.stringify( { width:cchWidth, height:cchHeight } ) );
	}
	
}

@:native('uhx.cs.Twxh')
extern class Helper {
	
	@:strict(DllImportAttribute("kernel32.dll"))
	public static function GetConsoleScreenBufferInfo(hConsoleOutput:IntPtr, lpConsoleScreenBufferInfo:Out<CONSOLE_SCREEN_BUFFER_INFO>):Bool;
	
	@:strict(DllImportAttribute("kernel32.dll", SetLastError = true))
	public static function GetStdHandle(nStdHandle:Int):IntPtr;
	
}

@:struct @:nativeGen class COORD {
	public var X:Int16;
	public var Y:Int16;
	
	public function new(x:Int16, y:Int16) {
		X = x;
		Y = y;
	}
}

@:extern @:struct @:nativeGen class SMALL_RECT {
	public var Left:Int16;
	public var Top:Int16;
	public var Right:Int16;
	public var Bottom:Int16;
	
	public function new(left:Int16, top:Int16, right:Int16, bottom:Int16) {
		Left = left;
		Top = top;
		Right = right;
		Bottom = bottom;
	}
}

@:struct @:nativeGen class CONSOLE_SCREEN_BUFFER_INFO {
	public var dwSize:COORD;
	public var dwCursorPosition:COORD;
	public var wAttributes:Int16;
	public var srWindow:SMALL_RECT;
	public var dwMaximumWindowSize:COORD;
	
	public function new(dwSize:COORD, dwCursorPosition:COORD, wAttributes:Int16, srWindow:SMALL_RECT, dwMaximumWindowSize:COORD) {
		this.dwSize = dwSize;
		this.dwCursorPosition = dwCursorPosition;
		this.wAttributes = wAttributes;
		this.srWindow = srWindow;
		this.dwMaximumWindowSize = dwMaximumWindowSize;
	}
}