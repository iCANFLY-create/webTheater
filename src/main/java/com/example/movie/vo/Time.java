package com.example.movie.vo;

import java.io.Serializable;

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
public class Time implements Serializable{

	private int timeId;
	private int movieId;
	private String startTime;
	private int totalSeat;
	private int reservedSeat;
	private int rowSeat;
	private int columnSeat;
	private int price;
	private String seatList;
}
