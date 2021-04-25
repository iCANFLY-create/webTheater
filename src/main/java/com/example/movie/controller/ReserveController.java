package com.example.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.movie.service.MovieService;
import com.example.movie.vo.Movietime;
import com.example.movie.vo.Person;
import com.example.movie.vo.Reserve;
import com.example.movie.vo.ReserveTime;
import com.example.movie.vo.Time;

@Controller
@RequestMapping("/reserve")
public class ReserveController {
	
	@Autowired
	private MovieService movieService;
	
	@RequestMapping(value = "/chkReserveForm.do")
	public String chkReserveForm() {
		return "reserve/chkReserveForm";
	}
	
	@RequestMapping(value = "/chkReserve.do")
	public String chkReserve(@RequestParam String phone, Model model) {
		
		System.out.println("dddd");
		
		List<ReserveTime> reserveTimeList = movieService.reserveTimeList(phone);
		System.out.println(reserveTimeList);
		
		model.addAttribute("reserveTimeList", reserveTimeList);
		return "reserve/reservedList";
	}
	
	@RequestMapping(value = "/reserveInfo.do")
	public String reserveInfo(@RequestParam String seat,
							  @RequestParam int peopleNum,
							  @RequestParam int totalPrice,
							  @RequestParam String timeId,
							  Model model) {
	
		Movietime mtInfo = movieService.mtInfo(timeId);	
		
		model.addAttribute("seat", seat);
		model.addAttribute("peopleNum", peopleNum);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("timeId", timeId);
		model.addAttribute("mtInfo", mtInfo);
		
		return "reserve/reserveTel";
	}
	
	@RequestMapping(value="/reserve.do")
	public String reserve(Reserve reserve,
						  Model model,
						  RedirectAttributes redirectAttr) {
		
		String msg3 = "";
		String newReservedSeatList = "";
		
		System.out.println("Ssss");

		//person테이블에 데이터 추가하기
		Person person = movieService.selectPhone(reserve.getPhone());
		
		if(person == null) {
			// 신규 예매하는 번호면
			int result3 = movieService.addPersonPhone(reserve.getPhone());
			int result1 = movieService.reserve(reserve);
			msg3 = "번호 등록 성공";
		}else {
			int result1 = movieService.reserve(reserve);
			msg3 = "번호 등록 실패";
		}

		
		// 이미 예매했던 좌석들을 불러온다
		Time reservedSeatList = movieService.reservedSeatList(reserve.getTimeId());
		
		if(reservedSeatList.getSeatList().isEmpty()) {
			// 상영시간 첫 예매하는 거라면
			newReservedSeatList = reserve.getSeat();
		}else {
			// 이미 전에 예매한 사람이 있다면, 전 예매좌석에 추가
			newReservedSeatList = reservedSeatList.getSeatList() +","+ reserve.getSeat();						
		}

		// time테이블에 신규로 예매한 좌석을 포함한 데이터를  set한다 
		reservedSeatList.setSeatList(newReservedSeatList);
		reservedSeatList.setTimeId(reserve.getTimeId());
		reservedSeatList.setReservedSeat(reservedSeatList.getReservedSeat()+reserve.getPeopleNum());
		
		int result2 = movieService.addReservedSeat(reservedSeatList);
		
		String msg2 = result2 >0? "예매성공" : "예매실패";
		redirectAttr.addFlashAttribute("msg2", msg2);
		return "redirect:/";
	}

}
