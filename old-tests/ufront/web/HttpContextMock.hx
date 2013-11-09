package ufront.web;
import ufront.web.UFHttpSessionState;
import ufront.web.HttpResponse;
import ufront.web.HttpRequest;
import ufront.web.HttpContextImpl;

class HttpContextMock extends HttpContextImpl
{
	public function new(?request : HttpRequest, ?response : HttpResponse, ?session : UFHttpSessionState)
	{
		super(
			null == request ? new HttpRequestMock() : request,
			null == response ? new HttpResponseMock() : response,
			null == session ? new HttpSessionStateMock() : session
		);
	}
}