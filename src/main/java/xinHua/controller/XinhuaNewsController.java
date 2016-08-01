package xinHua.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import po.XinhuaNews;
import xinHua.service.XinhuaNewsService;

@Controller
@RequestMapping("admin/news")
public class XinhuaNewsController {

	@Autowired
	private XinhuaNewsService xinhuaNewsService;

	@RequestMapping("/findByExampleForPagination")
	@ResponseBody
	public Map<String, Object> findByParamsForPagination(
			@Valid XinhuaNews xinhuaNews,
			@RequestParam(value = "rows", required = false, defaultValue = "20") String rows,
			@RequestParam(value = "page", required = false, defaultValue = "1") String page,
			@RequestParam(value = "order", required = false, defaultValue = "asc") String order,
			@RequestParam(value = "sort", required = false, defaultValue = "id") String sort,
			// @RequestParam(value = "leafId", required = false) String leafId,
			// @RequestParam(value = "parentId", required = false) String
			// parentId,
			Model model) {
		HashMap<String, Object> responseJson = xinhuaNewsService.findByParamsForPagination(xinhuaNews, page,
				rows, sort, order);
		System.out.println(responseJson);
		return responseJson;
	}
}
