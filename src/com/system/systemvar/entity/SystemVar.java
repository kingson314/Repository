package com.system.systemvar.entity;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;

import common.util.json.UtilJackSon;

import framework.base.entity.BaseEntity;

/**
 * @Description:
 * @date 2015-5-26
 * @author:fgq
 */
public class SystemVar extends BaseEntity {
	private static final long serialVersionUID = 1L;
	private String module;
	private String function;
	private Object value;
	private int useTimes;//使用次数 
	private static ConcurrentMap<String, SystemVar> MapVar = new ConcurrentHashMap<String, SystemVar>();
	public static final String separate = "/";

	public static boolean isNull(String module,String function){
		if(MapVar.get(module + separate + function) == null)
			return true;
		return false;
	}
	public static String toJson(String module,String function) throws JsonGenerationException, JsonMappingException, IOException{
		Object obj=get(module, function);
		return UtilJackSon.toJson(obj);
	}
	private static Object get(String module, String function) {
		SystemVar entity=MapVar.get(module + separate + function);
		if(entity==null){
			return null;
		}
		entity.setUseTimes(entity.getUseTimes()+1);
		return entity.getValue();
	}

	public static void put(String module, String function, Object value) {
		SystemVar entity=new SystemVar(module,function,value);
		entity.setCreateDate(new Date());
		entity.setOrd(0);
		entity.setState(0);
		entity.setUseTimes(1);
		MapVar.put(module + separate + function, entity);
	}

	public static String listToJson() throws JsonGenerationException, JsonMappingException, IOException{
		List<SystemVar> list = new ArrayList<SystemVar>();
		for (Map.Entry<String, SystemVar> entry : SystemVar.MapVar.entrySet()) {
			list.add(entry.getValue());
		}
		return UtilJackSon.toJson(list);
	}

	public SystemVar(String module, String function, Object value) {
		this.module = module;
		this.function = function;
		this.value = value;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public String getFunction() {
		return function;
	}

	public void setFunction(String function) {
		this.function = function;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}
	public int getUseTimes() {
		return useTimes;
	}

	public void setUseTimes(int useTimes) {
		this.useTimes = useTimes;
	}
}
