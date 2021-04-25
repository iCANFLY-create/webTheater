package com.example.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.movie.service.MovieService;
import com.example.movie.vo.Movie;
import com.example.movie.vo.Movietime;
import com.example.movie.vo.Reserve;
import com.example.movie.vo.ReserveTime;
import com.example.movie.vo.Time;

@Controller
@RequestMapping("/movie")
public class MovieController {
	@Autowired
	private MovieService movieService;
	
	@RequestMapping("/showMovieForm.do")
	public String showMovieForm(Model model) {
		
		List<Movie> movieList = movieService.showMovieForm();
		List<Time> timeList = movieService.timeList();
		List<Movietime> movietimeList = movieService.movietimeList();

		model.addAttribute("movieList", movieList);
		model.addAttribute("timeList", timeList);
		model.addAttribute("movietimeList", movietimeList);
		
		return "movie/movie";
	}
	
	
	@RequestMapping("/seatForm.do")
	public String seatForm(@RequestParam("timeId") String timeId ,Model model) {
		Time timeList = movieService.rowSeat(timeId);
		List<Reserve> reservedList = movieService.reservedSeat(timeId);
	
		model.addAttribute("row", timeList.getRowSeat());
		model.addAttribute("column", timeList.getColumnSeat());
		model.addAttribute("price", timeList.getPrice());
		model.addAttribute("timeId", timeId);
		model.addAttribute("seat", timeList.getSeatList());
		
		return "seat/seat";
	}

}
