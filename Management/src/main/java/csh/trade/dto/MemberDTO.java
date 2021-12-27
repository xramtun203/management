package csh.trade.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Setter
@Getter
@ToString
public class MemberDTO {
	
	private String id;
	private String passwd;
	private String mobile;
	private String address;
	private String birthdate;
	private String name;
	
}
