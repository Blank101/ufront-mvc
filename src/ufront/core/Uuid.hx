package ufront.core;

/**
Helper class to generate [UUID](http://en.wikipedia.org/wiki/Universally_unique_identifier) strings (version 4).

Original code from `thx.core` library, MIT licensed.
**/
class Uuid {
	static inline function random()
		return Math.floor(Math.random()*0x10);

	static inline function srandom()
		return '${random()}';

	/**
	`Uuid.create()` returns a string value representing a UUID value.
	**/
	public static function create() {
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
		s[19] = '' + ((random() & 0x3) | 0x8);
		for(i in 20...23)
			s[i] = srandom();
		s[23] = '-';
		for(i in 24...36)
			s[i] = srandom();
		return s.join('');
	}
}
