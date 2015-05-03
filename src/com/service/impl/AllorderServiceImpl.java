package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.IAllorderDao;
import com.dao.IUsersDao;
import com.entity.TAllorder;
import com.service.IAllorderService;
import com.util.PageBean;

@Service("allorderService")
public class AllorderServiceImpl implements IAllorderService {
	
	private IAllorderDao allorderDao;
	
	private IUsersDao userdao;
	
	@Resource(name="allorderDao")
	public void setAllorderDao(IAllorderDao AllorderDao) {
		this.allorderDao = AllorderDao;
	}
	
	@Resource(name="usersDao")
	public void setUserdao(IUsersDao userdao) {
		this.userdao = userdao;
	}


	public boolean insAllorder(TAllorder hp) {
		if(allorderDao.insert(hp)){
			return true;}
		else{
			return false;}
	}

	public boolean delAllorder(TAllorder hp) {
		if(allorderDao.delete(hp)){
			return true;}
		else{
			return false;}
	}

	public boolean uptAllorder(TAllorder hp) {
		if(allorderDao.update(hp)){
			return true;}
		else{
			return false;}
	}	
	
	public TAllorder getAAllorder(TAllorder hp) {
		return  allorderDao.getAAllorder(hp);
	}
	
	
	
	/**查找列表
	 * */
	public List<TAllorder> getAllorder(){
		List<TAllorder> list = allorderDao.list();
		return list;
	}

	public PageBean queryForPage(int pageSize, int currentPage, TAllorder tp,String type) {
		String where=" ";
		if(type.equals("in"))
			where=where+" where ordertype < 3";
		else if(type.equals("out"))
			where=where+" where ordertype > 2";
		String hql="from TAllorder "+where;
		int allRow=allorderDao.getAllRowCount(hql);//总记录数
		int totalPage =PageBean.countTotalPage(pageSize, allRow);//总页数
		final int offset = PageBean.countOffset(pageSize, currentPage);//当前页开始记录
		final int length =pageSize;//每页记录数
		List<TAllorder> list=allorderDao.queryForPage(hql, offset, length); //"一页"的记录
			for(TAllorder ta:list){
				if(ta.getTUser().getId()!=null){
					ta.setTUser(userdao.getUser(ta.getTUser()));
				}
			}
	    //把分页信息保存到bean中
	    PageBean pageBean = new PageBean();
	    pageBean.setPageSize(pageSize);
	    pageBean.setCurrentPage(currentPage);
	    pageBean.setAllRow(allRow);
	    pageBean.setTotalPage(totalPage);
	    pageBean.setList(list);
	    //pageBean.init();
		return pageBean;
	}
	
}
