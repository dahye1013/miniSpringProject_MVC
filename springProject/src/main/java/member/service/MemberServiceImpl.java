package member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;
import member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberDTO loginMember(Map<String, String> map) {
		return memberDAO.loginMember(map);
	}

	@Override
	public String checkId(String id) {
		MemberDTO memberDTO = memberDAO.checkId(id);
		if(memberDTO == null) {
			return "non_exist"; //사용가능
		}
		return "exist";
	}

	@Override
	public List<ZipcodeDTO> zipcodeList(Map<String, String> map) {
		List<ZipcodeDTO> list = memberDAO.zipcodeList(map);
		return list;
	}

	@Override
	public void write(MemberDTO memberDTO) {
		memberDAO.write(memberDTO);
		
	}

	@Override
	public MemberDTO getMember(String id) {
		 MemberDTO memberDTO = memberDAO.checkId(id);
		return memberDTO;
	}

	@Override
	public void modify(MemberDTO memberDTO) {
		memberDAO.modify(memberDTO);
		
	}




}
