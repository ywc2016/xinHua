package xinHua.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import po.XinhuaNews;
import xinHua.dao.XinhuaNewsDao;

@Service
public class XinhuaNewsService {
	@Autowired
	private XinhuaNewsDao xinhuaNewsDao;

	public HashMap<String, Object> findByParamsForPagination(XinhuaNews xinhuaNews,
			String page, String rows, String sort, String order) {
		List<XinhuaNews> pojos;
		pojos = xinhuaNewsDao.findByExampleForPagination(xinhuaNews, page,
				rows, sort, order);
		long count = xinhuaNewsDao.countByParams(xinhuaNews);
		List<HashMap> newsList = new ArrayList();
		if (pojos != null && pojos.size() != 0) {
			for (XinhuaNews news : pojos) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("id", news.getId());
				map.put("webName", news.getWebName());
				map.put("navigation", news.getNavigation());
				map.put("classify", news.getClassify());
				map.put("classifyDetail", news.getClassifyDetail());
				map.put("url", news.getUrl());
				map.put("webLevel", news.getWebLevel());
				map.put("ranking", news.getRanking());
				map.put("belonging", news.getBelonging());
				newsList.add(map);
			}
		}
		HashMap<String, Object> responseJson = new HashMap<String, Object>();
		responseJson.put("total", count);
		responseJson.put("rows", newsList);
		return responseJson;
	}

}
