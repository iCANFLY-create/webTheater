package com.example.movie.vo;

import lombok.*;


@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Reserve {
	private int reserveId;
	private int timeId;
	private String seat;
	private int totalPrice;
	private String phone;
	private int peopleNum;
}
