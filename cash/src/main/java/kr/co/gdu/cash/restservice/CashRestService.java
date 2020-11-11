package kr.co.gdu.cash.restservice;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restmapper.CashRestMapper;

@Service
@Transactional
public class CashRestService {
   @Autowired CashRestMapper cashRestMapper;
   public Map<String, Object> getTotalOfMonthByYear () {
      return cashRestMapper.selectTotalOfMonthByYear();
   }
   
   public Map<String, Object> getTotalOutAndInByYear(int year) {
      return cashRestMapper.selectTotalOutAndInByYear(year);
   }
}