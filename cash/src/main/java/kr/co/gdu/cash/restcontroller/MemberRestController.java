package kr.co.gdu.cash.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.*;

@RestController
public class MemberRestController {
   @Autowired MemberRestService memberRestService;
   
   @PostMapping("/admin/idCheck")
   public String idCheck(@RequestParam(value = "id") String id) {
      String returnId = memberRestService.getMemberId(id);
      
      if (returnId == null) {
    	  return "YES";	// 중복되는 아이디가 없는 상태인 경우
      } else {
    	  return "NO";	// 중복되는 아이디가 있어 입력한 아이디를 사용할 수 없는 경우
      }
   }
}