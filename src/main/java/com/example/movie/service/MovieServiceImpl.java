package com.example.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.movie.dao.MovieDAO;
import com.example.movie.vo.Movie;
import com.example.movie.vo.Movietime;
import com.example.movie.vo.Person;
import com.example.movie.vo.Reserve;
import com.example.movie.vo.ReserveTime;
import com.example.movie.vo.Time;

@Service
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	private MovieDAO movieDAO;

	@Override
	public List<Movie> showMovieForm() {
		return movieDAO.showMovieForm();
	}

	@Override
	public List<Time> timeList() {
		return movieDAO.timeList();
	}

	@Override
	public List<Movietime> movietimeList() {
		return movieDAO.movietimeList();
	}

	@Override
	public Time rowSeat(String timeId) {
		return movieDAO.rowSeat(timeId);
	}

	@Override
	public Movietime mtInfo(String timeId) {
		return movieDAO.mtInfo(timeId);
	}

	@Override
	public int reserve(Reserve reserve) {
		return movieDAO.reserve(reserve);
	}

	@Override
	public List<Reserve> reservedSeat(String timeId) {
		return movieDAO.reservedSeat(timeId);
	}

	@Override
	public Person selectPhone(String phone) {
		return movieDAO.selectPhone(phone);
	}

	
	@Override
	public Time reservedSeatList(int timeId) {
		return movieDAO.reservedSeatList(timeId);
	}

	@Override
	public int addReservedSeat(Time reservedSeatList) {
		return movieDAO.addReservedSeat(reservedSeatList);
	}

	@Override
	public int addPersonPhone(String phone) {
		System.out.println("service"+phone);
		return movieDAO.addPersonPhone(phone);
	}

	@Override
	public List<ReserveTime> reserveTimeList(String phone) {
		return movieDAO.reserveTimeList(phone);
	}
}
