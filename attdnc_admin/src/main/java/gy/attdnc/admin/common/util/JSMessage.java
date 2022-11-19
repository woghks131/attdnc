package gy.attdnc.admin.common.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class JSMessage {
	
	private static void jsExecute(String script,HttpServletResponse response) throws IOException
	{		
		response.setContentType("text/html;charset=utf-8");	
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();				
		out.println(" <script>");
		out.println(" <!-- ");		
		out.println(script);		  
		out.println(" //-->");
		out.println(" </script>");
	}
	
	private static void htmlExecute(String encoding,String html,HttpServletResponse response) throws IOException
	{
		response.setContentType("text/html;charset=" + encoding);	
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();				
		out.println(" <html><head></head><body>");				
		out.println(html);	
		out.println(" </body></html>");
	}
	
	public static void returnXML(String returnTags,HttpServletResponse response) throws Exception
	{
		StringBuffer result = new StringBuffer();
		result.append("<?xml version=\"1.0\" encoding=\"utf-8\" ?>"); 
		result.append("<ajax-response>");
		result.append("<response>");
		result.append(returnTags);
		result.append("</response>");
		result.append("</ajax-response>");
		response.setContentType("text/xml;charset=UTF-8");
		//response.setCharacterEncoding("utf-8");
		response.setHeader("Cache-Control", "no-cache");
		response.getWriter().write(result.toString());		
	}
	
	public static void showHtmlMessage(String encoding,String message,HttpServletResponse response) throws IOException
	{
		StringBuffer sbf = new StringBuffer();
		sbf.append("<style>");
		sbf.append("body {");
		sbf.append("font-family: verdana, gulim;" );
		sbf.append("font-size: 11px;");	
		sbf.append("color:#666666;");
		sbf.append("padding:0px 20px 20px 20px;");
		sbf.append("</style>");
		sbf.append(message);
		htmlExecute(encoding,sbf.toString(),response);	
	}
	
	public static void executeJS(String script, HttpServletResponse response) throws Exception
	{
		jsExecute(script,response);
	}
	public static void showMessage(String message,HttpServletResponse response) throws IOException
	{		
		String script = " alert(\"" + message + "\");";
		jsExecute(script,response);
		
	}
	
	public static void alertBack(String msg,HttpServletResponse response) throws Exception
	{		  
		  String script = "";
		  if(!msg.equals(""))
		  {
			  script +=" alert(\"" + msg + "\"); ";
		  }		  
		  script += " history.back(); ";
		  jsExecute(script,response);
	}

	public static void historyBack(HttpServletResponse response) throws Exception
	{		  
		  String script = "";
		  script += "history.back();";
		  jsExecute(script,response);
	}
	  
	public static void goAlertURL(String msg, String url,HttpServletResponse response) throws Exception
	{
		String script = "";
		if(!msg.equals(""))
		{
			script +=" alert(\"" + msg + "\"); ";
		}
		//script += " location.href = \"" + url + "\"; ";
		script += " location.replace(\"" + url + "\"); ";
		jsExecute(script,response);
	}
	 
	public static void goParentAlertURL(String msg, String url,HttpServletResponse response) throws Exception
	{
		String script = "";
		if(!msg.equals(""))
		{
			script +=" alert(\"" + msg + "\"); ";
		}
		script += " parent.location.href = \"" + url + "\"; ";
		jsExecute(script,response);
	}
	
	public static void goURL(String url,HttpServletResponse response) throws Exception
	{
		String script = "";
		script += " location.href = \"" + url + "\"; ";
		jsExecute(script,response);
	}
	
	public static void alert(String msg,HttpServletResponse response) throws Exception
	{
		String script = " alert(\"" + msg + "\"); ";
		jsExecute(script,response);
	}
	
	public static void alertClose(String msg,HttpServletResponse response) throws Exception
	{
		String script = "";
		if(!msg.equals(""))
		{
			script +=" alert(\"" + msg + "\"); ";
		}		
		script += " self.close();";
		jsExecute(script,response);
	}
	
	public static void alertOpenerReload(String msg,HttpServletResponse response) throws Exception
	{
		String script = "";
		if(!msg.equals(""))
		{
			script +=" alert(\"" + msg + "\"); ";
		}
		script += " opener.location.reload();";
		script += " self.close();";
		jsExecute(script,response);
	}
	  
	public static void alertOpenerUrl(String msg, String url,HttpServletResponse response) throws Exception
	{
		String script = "";
		if(!msg.equals(""))
		{
			script +=" alert(\"" + msg + "\"); ";
		}
		script += " opener.location.href = \"" + url + "\"; ";
		script += " self.close();";
		jsExecute(script,response);
	}
	  
	public static void goParentURL(String msg,String url,HttpServletResponse response) throws Exception
	{
		String script = "";
		if(!msg.equals(""))
		{
			script +=" alert(\"" + msg + "\"); ";
		}
		script += " parent.location.href = \"" + url + "\"; ";
		jsExecute(script,response);
		  
	}	  
	
	public static void goLoginURL(String msg,String url,HttpServletResponse response) throws Exception
	{
		StringBuffer sbf = new StringBuffer();
		sbf.append("var child = parent.document.getElementById('content');");
		sbf.append("if(child != null){alert('" + msg +"');	parent.location.href = '" + url + "';}");
		sbf.append("else{location.href='" + url + "';}");		
		jsExecute(sbf.toString(),response);      
		  
	}
}
