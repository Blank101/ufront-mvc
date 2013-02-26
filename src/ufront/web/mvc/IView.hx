package ufront.web.mvc;

import haxe.ds.StringMap;

interface IView 
{
	// TODO outputData should be removed if not needed anymore after HtmlViewResult has been moved to filter
	public function render(viewContext : ViewContext, outputData : StringMap<Dynamic>) : String;
}