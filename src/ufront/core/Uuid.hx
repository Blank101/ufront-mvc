package ufront.core;

/**
Helper class to generate [UUID](http://en.wikipedia.org/wiki/Universally_unique_identifier) strings (version 4).

Original code from `thx.core` library, MIT licensed.
**/
class Uuid {
	static inline function random( outOf:Int )
		return Math.floor( Math.random()*outOf );

	static inline function srandom()
		return "0123456789ABCDEF".charAt( random(16) );

	/**
	`Uuid.create()` returns a UUID created using pseudo-random values.
	**/
	public static function create():String {
		var s = [];
		for(i in 0...8)
			s[i] = srandom();
		s[8]  = '-';
		for(i in 9...13)
			s[i] = srandom();
		s[13] = '-';
		s[14] = '4';
		for(i in 15...18)
			s[i] = srandom();
		s[18] = '-';
		s[19] = '' + "89AB".charAt( random(4) );
		for(i in 20...23)
			s[i] = srandom();
		s[23] = '-';
		for(i in 24...36)
			s[i] = srandom();
		return s.join('');
	}

	/**
	Check if a String is a valid UUID.
	Currently only checks for version 4 UUIDs, as generated by `Uuid.create()`.
	This expects any letters in the UUID to be uppercase.
	**/
	public static function isValid( s:String ):Bool {
		return ~/[0-9A-F]{8}-[0-9A-F]{4}-4[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}/.match( s );
	}
}
