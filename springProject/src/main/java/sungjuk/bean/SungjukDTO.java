package sungjuk.bean;

import java.util.Date;

import board.bean.BoardDTO;
import lombok.Data;

@Data
public class SungjukDTO {
	private int no;
	private String name;
	private int kor, eng, math;
	private int tot, avg;
	
}
