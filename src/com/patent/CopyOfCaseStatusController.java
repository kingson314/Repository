//package com.patent;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import org.jsoup.Jsoup;
//import org.jsoup.nodes.Document;
//import org.jsoup.select.Elements;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import com.system.user.entity.User;
//import framework.base.controller.BaseContorller;
//import framework.base.support.Result;
//
///**
// * @Description:
// * @date 2015-07-07
// * @author:fgq
// */
//@Controller
//@RequestMapping("/casestatus/")
//public class CopyOfCaseStatusController extends BaseContorller<User> {
//
//	private static String url = "http://cpquery.sipo.gov.cn/txnQueryBibliographicData.do?select-key:shenqingh=";
//	private static String[] StatusList = new String[] { "等待申请费", "未缴申请费视撤,等恢复",
//			"未缴申请费视撤,等恢复补正", "准备进入外观分类", "准备进入发明初审", "准备进入新型初审", "等待案件分配",
//			"新案审查", "初审待答复", "回案审查", "驳回等复审请求", "逾期视撤,等恢复（发明初审）",
//			"逾期视撤,等恢复补正（发明初审）", "待分配", "新案审查", "中间文件审查", "驳回等复审请求", "逾期视撤,等恢复",
//			"逾期视撤,等恢复补正", "待退件(审查)", "退件(审查)", "期限费用审查", "等待提案", "新案审查",
//			"初审待答复", "回案审查", "驳回等复审请求", "逾期视撤,等恢复", "逾期视撤,等恢复补正", "审查待提取",
//			"新案审查", "初审待答复", "回案审查", "逾期视撤,等恢复", "逾期视撤,等恢复补正", "驳回等复审请求",
//			"准备等待公布", "等待提实审", "等待公布", "公布封卷", "准备进入实审阶段", "实审请求视撤,等恢复",
//			"实审请求视撤,等恢复补正", "公布完成", "准备公布", "等待实审提案", "进入实审", "等待裁决转案",
//			"待质检抽案", "实审检查", "一通出案待答复", "中通出案待答复", "其他通知书出案待答复", "一通回案实审",
//			"中通回案实审", "其他通知书回案实审", "逾期视撤,等恢复", "逾期视撤,等恢复补正", "驳回等复审请求",
//			"一通回案形审", "中通回案形审", "其他通知书回案形审", "形审补正待答复", "待发授权办登通知书", "等年登印费",
//			"视为放弃,等恢复", "视为放弃,等恢复补正", "等待颁证公告", "准备颁证公告", "公告封卷", "专利权维持",
//			"等年费滞纳金", "未缴年费专利权终止,等恢复", "未缴年费终止,等恢复补正", "届满终止,待失效", "视为放弃失效",
//			"逾期视撤失效", "无申请费视撤失效", "实审请求视撤失效", "放弃专利权（重复授权）", "放弃专利权（主动放弃）",
//			"放弃专利权（同样发明创造）", "届满终止失效", "驳回失效", "未缴年费终止失效", "无效宣告失效", "分案结案",
//			"国优视撤", "撤回专利申请" };
//	private static int tryTimes = 5;
//
//	@RequestMapping("get")
//	public void get() {
//		ArrayList<Map<String,String>> list = new ArrayList<Map<String,String>>();
//		String[] sqhArr = this.mapParams.get("sqh").toString().split(",");
//		for (String sqh : sqhArr) {
//			if(sqh.trim().length()>0){
//				Map<String,String>map=getPatentRusult(sqh);
//				map.put("sqh", sqh);
//				list.add(map);	
//			}
//		}
//		this.print(new Result(list));
//	}
//
//	private Map<String, String> getPatentRusult(String sqh) {
//		long now = System.currentTimeMillis();
//		Map<String, String> map = new HashMap<String, String>();
//		String status = "";
//		int curTime = 0;
//		try {
//			String surl = url + sqh;
//			System.out.print(surl);
//			Elements elements = null;
//			while (curTime < tryTimes) {
//				elements = getElements(surl);
//				if (elements.size() >= 3) {
//					break;
//				}
//				curTime++;
//			}
//			System.out.println("       "+curTime);
//			// n次之后还是没查出来
//			if (elements.size() < 3) {
//				status = "STATUS NOT FOUND";
//				map.put("success", "false");
//				map.put("status", status);
//				map.put("time", String
//						.valueOf((System.currentTimeMillis() - now)));
//				map.put("times", String.valueOf(curTime));
//				return map;
//			}else{
//				status = elements.get(2).text();
//				status = status.substring(6);
//				status = removerepeatedchar(status);
//				status = getStaus(status);
//
//				map.put("success", "true");
//				map.put("status", status);
//				map.put("time", String.valueOf((System.currentTimeMillis() - now)));
//				map.put("times", String.valueOf(curTime));
//				return map;
//			}
//		} catch (Exception e) {
//			status = "请输入正确的申请号";
//			map.put("success", "false");
//			map.put("status", status);
//			map.put("time", String.valueOf((System.currentTimeMillis() - now)));
//			map.put("times", String.valueOf(curTime));
//			return map;
//		}
//	}
//
//	private Elements getElements(String surl) throws Exception {
//		Document doc = Jsoup
//				.connect(surl)
//				.timeout(20000)
//				.userAgent(
//						"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36")
//				.ignoreContentType(true).get();
//		return doc.select(".imfor_table_grid tr");
//	}
//
//	public String removerepeatedchar(String str) {
//		if (str == null)
//			return str;
//		List<String> list = new ArrayList<String>();
//		for (int i = 0; i < str.length(); i++) {
//			String s = str.substring(i, i + 1);
//			if (!list.contains(s)) {
//				list.add(s);
//			}
//		}
//		String rs = "";
//		for (String item : list) {
//			rs += item;
//		}
//		return rs;
//	}
//
//	private String getStaus(String status) {
//		String rs = status;
//		for (String item : StatusList) {
//			boolean isTrue = true;
//			for (int i = 0; i < status.length(); i++) {
//				if (isTrue) {
//					char schar = status.charAt(i);
//					if (item.indexOf(schar) >= 0) {
//						isTrue = true;
//					} else {
//						isTrue = false;
//					}
//				} else {
//					break;
//				}
//			}
//			if (isTrue) {
//				return item;
//			}
//		}
//		return "<未识别状态>" + rs;
//	}
//}
