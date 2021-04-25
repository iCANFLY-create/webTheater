package com.example.movie.dao;

import java.util.List;

import com.example.movie.vo.Movie;
import com.example.movie.vo.Movietime;
import com.example.movie.vo.Person;
import com.example.movie.vo.Reserve;
import com.example.movie.vo.ReserveTime;
import com.example.movie.vo.Time;

public interface MovieDAO {

	List<Movie> showMovieForm();

	List<Time> timeList();

	List<Movietime> movietimeList();

	Time rowSeat(String timeId);

	Movietime mtInfo(String timeId);

	int reserve(Reserve reserve);

	List<Reserve> reservedSeat(String timeId);

	Person selectPhone(String phone);

	Time reservedSeatList(int timeId);

	int addReservedSeat(Time reservedSeatList);

	int addPersonPhone(String phone);

	List<ReserveTime> reserveTimeList(String phone);

}
