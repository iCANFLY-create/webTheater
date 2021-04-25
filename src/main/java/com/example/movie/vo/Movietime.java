package com.example.movie.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Movietime {
	
	private int movieId;
	private String space;
	private String title;
	private int timeId;
	private String startTime;
	private int totalSeat;
	private int reservedSeat;
	private int rowSeat;
	private int columnSeat;
	private int price;
	private String seatList;
}
