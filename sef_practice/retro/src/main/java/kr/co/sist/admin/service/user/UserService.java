package kr.co.sist.admin.service.user;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.admin.dao.user.UserDAO;
import kr.co.sist.admin.domain.user.UserDomain;
import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.common.pagination.Pagination;
import kr.co.sist.common.pagination.PaginationDomain;

@Service
public class UserService {

	@Autowired
	private UserDAO uDAO;
	
	public PaginationDomain totalRecode(String currentPage) {
		int page = 1;
		if(currentPage != null && !"".equals(currentPage)) {
			page = Integer.parseInt(currentPage);
		}
		
		int total = uDAO.selectCntRecode();
		PaginationDomain pd = new Pagination().setStartEndPageNum(total, page);
		
		return pd;
	}
	
	public List<UserDomain> seachUserList(BoardRangeVO brVO) {
		if("phone".equals(brVO.getField())) {
			brVO.setKeyword(brVO.getKeyword().replace("-", ""));
		}
		
		return uDAO.selectAllUser(brVO);
	}
	
	public UserDomain searchOneUser(String id) {
		return uDAO.selectOneUser(id);
	}
	
	public JSONObject UserStatusChange(String id) {
		JSONObject json = new JSONObject();
		json.put("flag", uDAO.updateUserStatus(id) == 1 ? true : false);
		
		return json;
	}
	
	public JSONObject UserWithdraw(String id) {
		JSONObject json = new JSONObject();
		json.put("flag", uDAO.updateUser(id) == 1 ? true : false);

		return json;
	}
}
