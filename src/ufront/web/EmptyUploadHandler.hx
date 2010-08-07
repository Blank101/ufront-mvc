/**
 * ...
 * @author Franco Ponticelli
 */

package ufront.web;
import haxe.io.Bytes;

class EmptyUploadHandler implements IHttpUploadHandler
{
	public function new();
	public function uploadStart(name : String, filename : String) : Void;
	public function uploadProgress(name : String, bytes : Bytes, pos : Int, len : Int) : Void;
	public function uploadEnd(name : String) : Void;
}