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

		//person???????????? ????????? ????????????
		Person person = movieService.selectPhone(reserve.getPhone());
		
		if(person == null) {
			// ?????? ???????????? ?????????
			int result3 = movieService.addPersonPhone(reserve.getPhone());
			int result1 = movieService.reserve(reserve);
			msg3 = "?????? ?????? ??????";
		}else {
			int result1 = movieService.reserve(reserve);
			msg3 = "?????? ?????? ??????";
		}

		
		// ?????? ???????????? ???????????? ????????????
		Time reservedSeatList = movieService.reservedSeatList(reserve.getTimeId());
		
		if(reservedSeatList.getSeatList().isEmpty()) {
			// ???????????? ??? ???????????? ?????????
			newReservedSeatList = reserve.getSeat();
		}else {
			// ?????? ?????? ????????? ????????? ?????????, ??? ??????????????? ??????
			newReservedSeatList = reservedSeatList.getSeatList() +","+ reserve.getSeat();						
		}

		// time???????????? ????????? ????????? ????????? ????????? ????????????  set?????? 
		reservedSeatList.setSeatList(newReservedSeatList);
		reservedSeatList.setTimeId(reserve.getTimeId());
		reservedSeatList.setReservedSeat(reservedSeatList.getReservedSeat()+reserve.getPeopleNum());
		
		int result2 = movieService.addReservedSeat(reservedSeatList);
		
		String msg2 = result2 >0? "????????????" : "????????????";
		redirectAttr.addFlashAttribute("msg2", msg2);
		return "redirect:/";
	}

}
