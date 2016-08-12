package test;

import java.io.IOException;
import java.net.MalformedURLException;

import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlForm;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.gargoylesoftware.htmlunit.html.HtmlSubmitInput;
import com.gargoylesoftware.htmlunit.html.HtmlTextInput;

public class HtmlUnit {

	/**
	 * @param args
	 * @throws IOException 
	 * @throws MalformedURLException 
	 * @throws FailingHttpStatusCodeException 
	 */
	public static void main(String[] args) throws FailingHttpStatusCodeException, MalformedURLException, IOException {
		// 得到浏览器对象，直接New一个就能得到，现在就好比说你得到了一个浏览器了  
	    WebClient webclient = new WebClient();  
	  
	    // 这里是配置一下不加载css和javaScript,配置起来很简单，是不是  
	    webclient.setCssEnabled(false);
	    webclient.setJavaScriptEnabled(false);  
	    HtmlPage htmlpage=null;
	    String result="";
	  /*
	    // 做的第一件事，去拿到这个网页，只需要调用getPage这个方法即可  
	    htmlpage = webclient.getPage("http://news.baidu.com/advanced_news.html"); 
	    // 根据名字得到一个表单，查看上面这个网页的源代码可以发现表单的名字叫“f”  
	    final HtmlForm form = htmlpage.getFormByName("f");  
	    // 同样道理，获取”百度一下“这个按钮  
	    final HtmlSubmitInput button = form.getInputByValue("百度一下");  
	    // 得到搜索框  
	    final HtmlTextInput textField = form.getInputByName("q1");  
	    // 最近周星驰比较火呀，我这里设置一下在搜索框内填入”周星驰“  
	    textField.setValueAttribute("周星驰");  
	    // 输入好了，我们点一下这个按钮  
	    final HtmlPage nextPage = button.click();  
	    // 我把结果转成String  
	    result = nextPage.asXml();  
	     */
	    
	    htmlpage = webclient.getPage("http://cpquery.sipo.gov.cn/txnQueryBibliographicData.do?select-key:shenqingh=2014100028952");  
	    result = htmlpage.asXml();  
	    System.out.println(result);  

	}

}
