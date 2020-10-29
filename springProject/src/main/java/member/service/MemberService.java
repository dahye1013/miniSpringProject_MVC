package member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;
import member.dao.MemberDAO;

public interface MemberService {

	public MemberDTO loginMember(Map<String, String> map);

	public String checkId(String id);

	public List<ZipcodeDTO> zipcodeList(Map<String, String> map);

	public void write(MemberDTO memberDTO);

	public MemberDTO getMember(String id);

	public void modify(MemberDTO memberDTO);

}
