package uhx.n;
import sys.io.Process;
import thx.csv.Csv;

import neko.Lib;

using StringTools;

/**
 * ...
 * @author Skial Bainn
 */
class Twxh {
	
	public static function main() {
		var stdout = Sys.stdout();
		var process:Process = null;
		var json: { width:Int, height:Int } = null;
		var title = ('twxh ' + (Date.now().getTime() * Math.random()) ).replace('.', '_');
		Sys.command('title $title');
		
		switch (Sys.systemName()) {
			case 'Windows':
				Sys.command( 'twxh.exe', [] );
				
			case _:
				
		}
	}

	public function new() {
		
	}
	
}