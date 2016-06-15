package test;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.util.file.UtilFile;
import common.util.string.UtilString;

public class getClass {
	public static void main(String[] args) {

		String seaPath = "E:/360云盘/百度云/Projects/Repository/WebRoot/sea/";
		List<String[]> list = new ArrayList<String[]>();
//		list.add(new String[] { "Bread", "plugin/base/bread" });
		list.add(new String[] { "Grid", "plugin/base/grid" });
		list.add(new String[] { "Menu", "plugin/base/menu" });
//		list.add(new String[] { "Node", "plugin/base/node" });
		list.add(new String[] { "Pager", "plugin/base/pager" });
		list.add(new String[] { "Tip", "plugin/base/tip" });
		list.add(new String[] { "Tool", "plugin/base/toolbar" });
		list.add(new String[] { "Tree", "plugin/base/tree" });
		list.add(new String[] { "Window", "plugin/base/window" });
		list.add(new String[] { "Bar", "plugin/base/chart/bar" });
		list.add(new String[] { "Chord", "plugin/base/chart/chord" });
		list.add(new String[] { "Eventriver", "plugin/base/chart/eventriver" });
		list.add(new String[] { "Force", "plugin/base/chart/force" });
		list.add(new String[] { "Funnel", "plugin/base/chart/funnel" });
		list.add(new String[] { "Gauge", "plugin/base/chart/gauge" });
		list.add(new String[] { "Kline", "plugin/base/chart/kline" });
		list.add(new String[] { "Line", "plugin/base/chart/line" });
		list.add(new String[] { "Map", "plugin/base/chart/map" });
		list.add(new String[] { "Pie", "plugin/base/chart/pie" });
		list.add(new String[] { "Radar", "plugin/base/chart/radar" });
		list.add(new String[] { "Scatter", "plugin/base/chart/scatter" });
		list.add(new String[] { "Autoselect", "plugin/base/form/autoselect" });
		list.add(new String[] { "Button", "plugin/base/form/button" });
		list.add(new String[] { "ButtonGroup","plugin/base/form/buttongroup" });
		list.add(new String[] { "Check", "plugin/base/form/check" });
		list.add(new String[] { "CheckGroup", "plugin/base/form/checkgroup" });
		list.add(new String[] { "Color", "plugin/base/form/color" });
		list.add(new String[] { "DateTime", "plugin/base/form/datetime" });
		list.add(new String[] { "Fieldset", "plugin/base/form/fieldset" });
		list.add(new String[] { "Hidden", "plugin/base/form/hidden" });
//		list.add(new String[] { "Label", "plugin/base/form/label" });
		list.add(new String[] { "Radio", "plugin/base/form/radio" });
		list.add(new String[] { "RadioGroup", "plugin/base/form/radiogroup" });
		list.add(new String[] { "Select", "plugin/base/form/select" });
		list.add(new String[] { "Textarea", "plugin/base/form/textarea" });
//		list.add(new String[] { "Textfield", "plugin/base/form/textfield" });
//		list
//				.add(new String[] { "BorderLaout",
//						"plugin/base/layout/borderlaout" });
//		list
//				.add(new String[] { "FormLayout",
//						"plugin/base/layout/formlayout" });
		list.add(new String[] { "TabLayout", "plugin/base/layout/tablayout" });
		list
				.add(new String[] { "TableLayout",
						"plugin/base/layout/tablelayout" });
		createTemplate(list, seaPath);
	}

	public static void createTemplate(List<String[]> list,
			String seaPath) {
		String templateJs = UtilFile.readFile(seaPath
				+ "plugin/template/Template.js");
		String templateCss = UtilFile.readFile(seaPath
				+ "plugin/template/css/template.css");
		String templateLang = UtilFile.readFile(seaPath
				+ "plugin/template/Template.lang.js");
		List<String> listCls = new ArrayList<String>();
		List<String> listAlias = new ArrayList<String>();
		for (String[] pluginArr : list) {
			String pluginName = pluginArr[0];
			String pluginPath = seaPath + pluginArr[1] + "/" + pluginName;
			File filePlugin = new File(pluginPath + ".js");
			if (!filePlugin.exists()) {
				UtilFile.writeFile(pluginPath + ".js", templateJs.replace(
						"Template =", pluginName + " =").replace("Template.",
						pluginName + ".").replace("template.css.",
						UtilString.lowerCaseFirst(pluginName) + ".css")
						.replace("Template(", pluginName + "("));

				UtilFile.writeFile(pluginPath + ".lang.js", templateLang);
				UtilFile.writeFile(seaPath + pluginArr[1] + "/css/"
						+ pluginName.toLowerCase() + ".css", templateCss);

			}
			listCls.add(UtilString.lowerCaseFirst(pluginName) + ": \"sea_"
					+ UtilString.lowerCaseFirst(pluginName) + "\",");// borderLayout
																		// :"sea_borderLayout",
			listAlias.add(pluginName + ":"
					+pluginArr[1]+ "/" + pluginName + "\",");
																	
		}
		for (String cls : listCls) {
			System.out.println(cls);
		}
		System.out.println("/*************************/");
		for (String alias : listAlias) {
			System.out.println(alias);
		}
	}
}
