package dao;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import po.XinhuaNews;

public class XinhuaNewsDao {
	
	@Autowired
	public SessionFactory sessionFactory;
	
	protected final String DEFAULT_PAGE_ROWS = "20";// 默认分页时每页行数
	protected final String DEFAULT_PAGE_START = "1";// 默认分页时起始页数
	
	public List<XinhuaNews> findByExampleForPagination(XinhuaNews xinhuaNews,String page, String rows, String sort,
			String order){
		try {
			int intPage = Integer.parseInt((page == null || page.equals("0")) ? DEFAULT_PAGE_START: page);
			int intRows =Integer.parseInt((rows == null || rows.equals("0")) ? DEFAULT_PAGE_ROWS : rows);
		String queryString = "from xinhuaNews as a  where 1 = 1";
		Query query = contrustString(xinhuaNews , queryString , sort , order);
		query.setFirstResult((intPage - 1) * intRows);
		query.setMaxResults(intRows);
		List<XinhuaNews> pojos = query.list();
		//logger.debug("findByParamsForPagination successful");
		return pojos;
		}catch (RuntimeException re) {
			//logger.error("findByParamsForPagination failed", re);
			throw re;
		}
	}
	
	public Query contrustString(XinhuaNews xinhuaNews ,String queryString ,String sort ,String order){
		if(xinhuaNews.getId() != null){
			queryString += " and a.id =:id";
		}
		if(xinhuaNews.getWebName() != null && !xinhuaNews.getWebName().isEmpty()){
			queryString += " and a.webName like:webName";
		}
		if(xinhuaNews.getNavigation() != null && !xinhuaNews.getNavigation().isEmpty()){
			queryString += " and a.navigation =:navigation";
		}
		if(xinhuaNews.getClassify() != null && !xinhuaNews.getClassify().isEmpty()){
			queryString += " and a.classify =:classify";
		}
		if(xinhuaNews.getClassifyDetail() !=null && !xinhuaNews.getClassifyDetail().isEmpty()){
			queryString += " and a.classifyDetail =:classifyDetail ";
		}
		if(xinhuaNews.getUrl()!=null && !xinhuaNews.getUrl().isEmpty()){
			queryString += " and a.url like:url ";
		}
		if(xinhuaNews.getWebLevel() !=null && !xinhuaNews.getWebLevel().isEmpty()){
			queryString += " and a.webLevel =:webLevel ";
		}		
		if(xinhuaNews.getRanking() !=null && !xinhuaNews.getRanking().isEmpty()){
			queryString += " and a.ranking =:ranking ";
		}
		if(xinhuaNews.getBelonging() != null && xinhuaNews.getBelonging().isEmpty()){
			queryString += " and a.belonging =:belonging ";
		}		
		if(sort != null && !sort.isEmpty()){
			queryString += " order by a."+ sort + "  "+ order;
		}
		Query query = sessionFactory.getCurrentSession().createQuery(
				queryString);
		// ---------------------下面是赋值操作------------------------
		
		if(xinhuaNews.getId()){
			query.setLong("id", xinhuaNews.getId());
		}
		if(xinhuaNews.getWebName() != null && !xinhuaNews.getWebName().isEmpty()){{
			query.setString("webName", '%'+xinhuaNews.getWebName()+'%');
		}
		if(xinhuaNews.getNavigation() != null && !xinhuaNews.getNavigation().isEmpty()){
			query.setString("navigation",xinhuaNews.getNavigation());
		}
		if(xinhuaNews.getClassify() != null && !xinhuaNews.getClassify().isEmpty()){
			query.setString("classify", xinhuaNews.getClassify());
		}
		if(xinhuaNews.getClassifyDetail() !=null && !xinhuaNews.getClassifyDetail().isEmpty()){
			query.setString("classifyDetail", xinhuaNews.getClassifyDetail());
		}
		if(xinhuaNews.getUrl()!=null && !xinhuaNews.getUrl().isEmpty()){
			query.setString("url",'%'+  xinhuaNews.getUrl()+'%');
		}			
		if(xinhuaNews.getWebLevel() !=null && !xinhuaNews.getWebLevel().isEmpty()){
			query.setString("webLevel", xinhuaNews.getWebLevel());
		}
		if(xinhuaNews.getRanking() !=null && !xinhuaNews.getRanking().isEmpty()){
			query.setString("ranking",xinhuaNews.getRanking());
		}
		if(xinhuaNews.getBelonging() != null && xinhuaNews.getBelonging().isEmpty()){
			query.setString("belonging",xinhuaNews.getBelonging());
		}	
		return query;
	}
}
