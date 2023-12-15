package kr.co.sist.user.controller.sales;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.sist.user.service.sales.SalesService;

@Controller
public class SalesController {

	@Autowired
	private SalesService sService;
}
