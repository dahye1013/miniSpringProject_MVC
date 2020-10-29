package member.dao;

import java.util.List;
import java.util.Map;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;


public interface MemberDAO {

	public MemberDTO loginMember(Map<String, String> map);

	public MemberDTO checkId(String id);

	public List<ZipcodeDTO> zipcodeList(Map<String, String> map);

	public void write(MemberDTO memberDTO);

	public void modify(MemberDTO memberDTO);
	
	
	
	
	
}
