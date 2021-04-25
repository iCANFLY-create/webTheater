package com.example.movie.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.movie.vo.Movie;
import com.example.movie.vo.Movietime;
import com.example.movie.vo.Person;
import com.example.movie.vo.Reserve;
import com.example.movie.vo.ReserveTime;
import com.example.movie.vo.Time;

@Repository
public class MovieDAOImpl implements MovieDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Movie> showMovieForm() {
		return session.selectList("movie.showMovieForm");
	}

	@Override
	public List<Time> timeList() {
		return session.selectList("movie.timeList");
	}

	@Override
	public List<Movietime> movietimeList() {
		return session.selectList("movie.movietimeList");
	}

	@Override
	public Time rowSeat(String timeId) {
		return session.selectOne("movie.rowSeat", timeId);
	}

	@Override
	public Movietime mtInfo(String timeId) {
		return session.selectOne("movie.mtInfo", timeId);
	}

	@Override
	public int reserve(Reserve reserve) {
		return session.insert("movie.reserve", reserve);
	}

	@Override
	public List<Reserve> reservedSeat(String timeId) {
		return session.selectList("movie.reservedSeat", timeId);
	}

	@Override
	public Person selectPhone(String phone) {
		return session.selectOne("movie.selectPhone",phone);
	}


	@Override
	public Time reservedSeatList(int timeId) {
		return session.selectOne("movie.reservedSeatList", timeId);
	}

	@Override
	public int addReservedSeat(Time reservedSeatList) {
		return session.update("movie.addReservedSeat", reservedSeatList);
	}

	@Override
	public int addPersonPhone(String phone) {
		return session.insert("movie.addPersonPhone", phone);
	}

	@Override
	public List<ReserveTime> reserveTimeList(String phone) {
		return session.selectList("movie.reserveTimeList", phone);
	}
	
}
