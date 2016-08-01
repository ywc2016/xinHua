package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import dao.XinhuaNewsDao;
import po.XinhuaNews;

public class XinhuaNewsService {
	
	@Autowired
	XinhuaNewsDao xinhuaNewsDao;
	
	public List<HashMap> findByParamsForPagination(XinhuaNews xinhuaNews
			,String page,String rows,String sort,String order){
		List<XinhuaNews> pojos;
		pojos = xinhuaNewsDao.findByExampleForPagination(xinhuaNews, page,				
				rows, sort, order);
		List<HashMap> userList = new ArrayList();
		if (pojos != null && pojos.size() != 0) {
			for (XinhuaNews news : pojos) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("id", news.getId());
				map.put("web_name", news.getWebName());
				map.put("navigation", news.getNavigation());
				map.put("classify", news.getClassify());
				map.put("classify_detail", news.getClassifyDetail());
				map.put("url", news.getUrl());
				map.put("web_level", news.getWebLevel());
				map.put("ranking", news.getRanking());
				map.put("belonging", news.getBelonging());	
				userList.add(map);
			}
		}
		return userList;
	}

}
