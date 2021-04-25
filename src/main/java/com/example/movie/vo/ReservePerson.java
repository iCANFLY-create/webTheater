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
public class ReservePerson {
	private int reserveId;
	private int timeId;
	private String seat;
	private int totalPrice;
	private String phone;
	private int peopleNum;
}
