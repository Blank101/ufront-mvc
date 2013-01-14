
package ufront.web.session;
import ufront.web.IHttpSessionState;

class FileSession
{

    public static function create(savePath : String, ?expire : Int = 0) : IHttpSessionState {

#if php
        return new php.ufront.web.FileSession(savePath, expire);
#elseif neko
        return new neko.ufront.web.FileSession(savePath, expire);
#elseif nodejs
		return new nodejs.ufront.web.FileSession(savePath, expire);
#else
    	NOT IMPLEMENTED PLATFORM;
#end
	}
}
