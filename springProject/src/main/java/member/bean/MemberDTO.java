package member.bean;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
	String name, id, pwd, gender, email1, email2;
	String tel1, tel2, tel3, zipcode, addr1, addr2;
	Date date;
	
	
}
