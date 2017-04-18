package org.agent.common;

import java.io.CharArrayWriter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;


public class ZipFilter implements Filter {
	private FilterConfig config;
	private String charSet;

	public ZipFilter() {
	}

	public String getCharSet() {
		return charSet;
	}

	public void setCharSet(String charSet) {
		this.charSet = charSet;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws ServletException, IOException {
		CharArrayWrapper responseWrapper = new CharArrayWrapper(
				(HttpServletResponse) response);
		chain.doFilter(request, responseWrapper);
		if (responseWrapper.toString().equals(""))
			return;
		String responseString = new String(responseWrapper.toString());
	
		responseString = responseString.replaceAll("\\s+", " ");
		updateHeaders(response, responseString, request);
		PrintWriter out = response.getWriter();
		out.write(responseString);
		out.close();
	}

	public void init(FilterConfig config) throws ServletException {
		charSet = config.getInitParameter("charSet");
		this.config = config;
	}

	protected FilterConfig getFilterConfig() {
		return config;
	}

	public void destroy() {
	}

	public void updateHeaders(ServletResponse response, String responseString,
			ServletRequest request) {
		try {
			response.setContentLength(responseString.getBytes(charSet).length);
		} catch (Exception e) {
			
		}
	}

}
class CharArrayWrapper extends HttpServletResponseWrapper
{

    public CharArrayWrapper(HttpServletResponse response)
    {
        super(response);
        charWriter = new CharArrayWriter();
    }

    public PrintWriter getWriter()
    {
        return new PrintWriter(charWriter);
    }

    public String toString()
    {
        return charWriter.toString();
    }

    public char[] toCharArray()
    {
        return charWriter.toCharArray();
    }

    private CharArrayWriter charWriter;
}

