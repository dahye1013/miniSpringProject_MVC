package imageboard.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ImageboardDTO {
	int  seq;
	String imageId;
	String imageName;
	int  imagePrice;
	int imageQty;
	String imageContent;
	String image1;
	String image2;
	Date logtime;
}
