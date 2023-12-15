package kr.co.sist.user.service.sales;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.user.dao.sales.SalesDAO;

@Service
public class SalesService {

	@Autowired
	private SalesDAO sDAO;
}
