package service;

import java.util.List;

import dao.SumDao;
import entity.TbRoomWater;

public class SumService {
	private SumDao sumDao;
	public void setSumDao(SumDao sumDao) {
		this.sumDao = sumDao;
	}
	public List<TbRoomWater> getAll() {
		return sumDao.getAll();
	}
}
