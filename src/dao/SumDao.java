package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import entity.TbRoomWater;
import entity.TbSt;

public class SumDao {
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}
	
	public List<TbRoomWater> getAll() {
		String sql="select water.date as date,sum(water.water) as watersum from TbRoomWater water group by water.date";
		Query query = getSession().createQuery(sql);
		List list = query.list();
		for (int i = 0; i < list.size(); i++) {
			Object[] objects=(Object[]) list.get(i);
			System.out.println(objects[0].toString());
			System.out.println(objects[1].toString());
			System.out.println("=================");
		}
		
		return list;
	
	}

}
