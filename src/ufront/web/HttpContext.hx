/**
 * ...
 * @author Franco Ponticelli
 */

package ufront.web;
import ufront.web.UrlDirection;
import udo.error.NullArgument;
import ufront.web.IUrlFilter;
import udo.error.AbstractMethod;
import ufront.web.session.FileSession;

class HttpContext
{	
	var _urlFilters : Array<IUrlFilter>;
	public static function createWebContext(?sessionpath : String)
	{
		var request = HttpRequestImpl.instance;
		if (null == sessionpath)
		{
			sessionpath = request.scriptDirectory + "../_sessions";
		}
		return new HttpContextImpl(request, HttpResponseImpl.instance, new FileSession(sessionpath));
	}
	
	public var request(getRequest, null) : HttpRequest;
	public var response(getResponse, null) : HttpResponse;
	public var session(getSession, null) : IHttpSessionState;
	
	var _requestUri : String;
	public function getRequestUri() : String
	{      
		if(null == _requestUri)  
		{         
			var url = PartialUrl.parse(request.uri);
			for(filter in _urlFilters)
				filter.filterIn(url, request); 
			_requestUri = url.toString();       
		}
		return _requestUri;
	}
	
	public function generateUri(uri : String) : String
	{                            
		var uriOut = VirtualUrl.parse(uri);         
		var i = _urlFilters.length - 1;
		while(i >= 0)
			_urlFilters[i--].filterOut(uriOut, request);
		return uriOut.toString();
	}   
	
	public function addUrlFilter(filter : IUrlFilter)
	{                            
		NullArgument.throwIfNull(filter, "filter");
		_requestUri = null;
		_urlFilters.push(filter);  
		return this;
	}      
	
	public function clearUrlFilters()
	{           
		_requestUri = null;
		_urlFilters = [];
	}
	
	public function dispose() : Void;
	
	function getRequest() return throw new AbstractMethod()
	function getResponse() return throw new AbstractMethod()
	function getSession() return throw new AbstractMethod()

	function new()
	{
		_urlFilters = [];
	}
}