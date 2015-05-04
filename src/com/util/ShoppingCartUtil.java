package com.util;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.entity.TAllorderdetail;
import com.entity.TUser;

/**
 * 购物车工具类
 * 
 * @author ASUS
 * 
 */
public class ShoppingCartUtil {
	/**
	 * 获取当前用户的用户名字
	 * 
	 * @param session
	 * @return
	 */
	public static String getCurrentUserName(HttpSession session) {
		TUser user = (TUser) session.getAttribute("loginUser");
		if (user == null)
			return null;
		return user.getName();
	}

	/**
	 * 获取当前用户的用户
	 * 
	 * @param session
	 * @return
	 */
	public static TUser getCurrentUser(HttpSession session) {
		TUser user = (TUser) session.getAttribute("loginUser");
		if (user == null)
			return null;
		return user;
	}

	/**
	 * 得到购物车的信息
	 * 
	 * @param session
	 */
	public static List<TAllorderdetail> getCartInfo(HttpSession session) {
		List<TAllorderdetail> allorderdetails = new ArrayList<TAllorderdetail>();
		Enumeration<String> attributeNames = session.getAttributeNames();
		while (attributeNames.hasMoreElements()) {
			String nextElement = attributeNames.nextElement();
			// 判断是哪一个用户的购物车
			if (nextElement.startsWith(getCurrentUserName(session))) {
				// 保存信息
				TAllorderdetail allorderdetail = (TAllorderdetail) session.getAttribute(nextElement);
				if (allorderdetail != null) {
					allorderdetails.add(allorderdetail);
				}
			}
		}
		return allorderdetails;
	}
	
	/**
	 * 清空购物车
	 * @param session
	 */
	public static void removeCartInfo(HttpSession session){
		Enumeration<String> attributeNames = session.getAttributeNames();
		while (attributeNames.hasMoreElements()) {
			String nextElement = attributeNames.nextElement();
			// 判断是哪一个用户的购物车
			if (nextElement.startsWith(getCurrentUserName(session))) {
				// 删除信息
				session.removeAttribute(nextElement);
			}
		}
	}

	/**
	 * 获取总价
	 * 
	 * @param session
	 * @return
	 */
	public static int getCountCartInfo(HttpSession session) {
		Enumeration<String> attributeNames = session.getAttributeNames();
		int count = 0;// 总价
		while (attributeNames.hasMoreElements()) {
			String nextElement = attributeNames.nextElement();
			// 判断是哪一个用户的购物车
			if (nextElement.startsWith(getCurrentUserName(session))) {
				// 保存信息
				TAllorderdetail allorderdetail = (TAllorderdetail) session.getAttribute(nextElement);
				if(allorderdetail.getSum()!=null && allorderdetail.getSum().length()>0){					
					count += Integer.parseInt(allorderdetail.getSum());
				}
			}
		}
		return count;
	}
}
