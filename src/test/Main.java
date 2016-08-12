package test;
import java.net.URL;
import com.gargoylesoftware.htmlunit.ScriptResult;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class Main {
	public static void main(String[] args) throws Exception {
		// testHtmlPage();
		exescript();
	}
	public static void testHtmlPage() throws Exception {
		// 新建webclient对象，相当于浏览器
		final WebClient WebClient = new WebClient();
		// 构造一个URL，为待访问的地址
		URL url = new URL("http://zhixing.court.gov.cn/search");
		HtmlPage page = (HtmlPage) WebClient.getPage(url);
		System.out.println(page.getTitleText());
	}

	public static void exescript() throws Exception {
		WebClient webClient = new WebClient();
		webClient.setJavaScriptEnabled(true); // 启用JS解析器
		webClient.setRedirectEnabled(true);
		// webClient.getOptions().setCssEnabled(false); //禁用css
		webClient.setTimeout(20000); // 1000ms timeout
		HtmlPage page = webClient.getPage("http://zhixing.court.gov.cn/search");
		System.out.println(page.asXml());
		System.out.println("---------------------------------");
		ScriptResult result = page.executeJavaScript("document.getElementById(\"pname\").value=\"陈旭光\";$('#searchForm').submit();");
		HtmlPage page2 = (HtmlPage) result.getNewPage();
		HtmlPage framepage = (HtmlPage) page2.getFrameByName("contentFrame").getEnclosedPage();
		System.out.println(framepage.asXml());
	}

}