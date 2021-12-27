package csh.trade.dto;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@ToString
public class BoardDTO {
	
	private int boardno;
	private String id;
	private String boardtitle;
	private String boardcontent;
	private String boarddate;
	private String boardtag;
	private String attachedfile;
	private MultipartFile filename;
	
}
