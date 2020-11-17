package test;

import java.util.ArrayList;

public class TestDAO {
	
	public int userChk(String id, String pwd) {
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		return 0;
	}
	
	public TestDTO getUser(String id) {
		System.out.println("userID : " + id);
		TestDTO dto = new TestDTO();
		dto.setName("홍길동");
		dto.setAddr("산골");
		return dto;
	}
	public ArrayList<TestDTO> list(){
		ArrayList<TestDTO> li = new ArrayList<TestDTO>();
		for(int i = 0 ; i < 5; i++) {
			TestDTO dto = new TestDTO();
			dto.setName("홍길동" + i);
			dto.setAddr("산골" + i);
			li.add(dto);
		}
		return li;
	}
}
