package zhumeng.zyhs.ssm.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import zhumeng.zyhs.ssm.pojo.CommonGoods;
import zhumeng.zyhs.ssm.pojo.SmallAppliances;
import zhumeng.zyhs.ssm.tools.HttpReturn;
import zhumeng.zyhs.web.service.SmallAppliancesService;


@Controller
@RequestMapping("/SmallAppliances")
public class SmallAppliancesController {
	
	@Autowired
	private SmallAppliancesService Service;
	
	@RequestMapping(value="/getAll",method=RequestMethod.POST)
	public void getAll(HttpServletResponse response) throws IOException{

		List<SmallAppliances> visions = Service.getALL();
		
		JSONArray jsonArray;
		jsonArray = JSONArray.fromObject(visions);

		HttpReturn.reponseBody(response, jsonArray);
	}
	
	@RequestMapping(value="getByLevel",method=RequestMethod.POST)
	public void getByLevel(HttpServletResponse response,@RequestBody SmallAppliances vo){
		List<SmallAppliances> smallAppliances = Service.getByLevel(vo.getGoodsLevelId());
		JSONArray jsonArray;
		jsonArray = JSONArray.fromObject(smallAppliances);
		HttpReturn.reponseBody(response, jsonArray);
	}
	
	@RequestMapping(value="/get",method=RequestMethod.POST)
	public void get(HttpServletResponse response, @RequestBody SmallAppliances vo) throws IOException{

		SmallAppliances pojo = null;
		System.out.println(vo.toString());
		pojo = Service.getInfo(vo);
		//System.out.println(userInfo);
		// ת��ΪJSONObject����
		JSONObject jsonObject = new JSONObject().fromObject(pojo);
         System.out.println(jsonObject);
		HttpReturn.reponseBody(response, jsonObject);
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public void add(HttpServletResponse response, @RequestBody SmallAppliances vo) throws IOException{

		int hint;
		System.out.println(vo);
		hint = Service.add(vo);

		HttpReturn.reponseBody(response, String.valueOf(hint));
	}
	
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public void update(HttpServletResponse response, @RequestBody SmallAppliances vo) throws IOException{

		int hint;
		System.out.println(vo.toString());
		hint = Service.update(vo);
		HttpReturn.reponseBody(response, String.valueOf(hint));
	}
	
}
