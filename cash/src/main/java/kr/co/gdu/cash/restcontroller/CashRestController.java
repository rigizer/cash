package kr.co.gdu.cash.restcontroller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.CashRestService;

@RestController
public class CashRestController {
   @Autowired CashRestService cashRestService;
   
   @GetMapping("/admin/totalOfMonthByYear")
   public Map<String, Object> totalOfMonthByYear() {
      System.out.println("/admin/totalOfMonthByYear 호출성공");
      Map<String, Object> map = cashRestService.getTotalOfMonthByYear();
      return map; // 반환 객체를 JSON 문자열로 변경
   }
   
   @GetMapping("/admin/totalOutAndInByYear/{year}")
   public Map<String, Object> totalOutAndInByYear(
         @PathVariable(name = "year") int year) {
      return cashRestService.getTotalOutAndInByYear(year);
   }
}