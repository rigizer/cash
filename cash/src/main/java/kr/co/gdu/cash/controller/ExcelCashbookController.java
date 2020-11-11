package kr.co.gdu.cash.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.vo.Cashbook;

@Controller
@Scope("singleton")
// 한 번만 객체를 만들어 반복하여 사용한다. (생략 가능, 기본값)
// 컴포넌트 타입의 Scope Default 값은 Singleton이다.
public class ExcelCashbookController {
   @GetMapping(path = "/admin/cashbookListExcel", produces = "application/vnd.ms-excel")
   public String cashbookListExcel() {
      return "cashbookListExcelView";
   }
}

// 두 번째 클래스는 public이 아닌 일반 class로 만든다.
@Component("cashbookListExcelView")
@Scope("prototype")	// 호출될 때 마다 객체를 생성한다.
class CashbookListExcelView extends AbstractXlsView {
	@Autowired CashbookService cashbookService;
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 파일 이름은 cashbook.xls, 엑셀 파일을 만들어준다.
		response.setHeader("Content-Disposition", "attachment;filename=\"cashbook.xls\"");
		List<Cashbook> cashbookList = cashbookService.getCashbookListAll();
		
		// 매개변수로 입력받은 Workbook(엑셀 파일 객체)에 첫 번째 시트를 접근
		Sheet sheet = workbook.createSheet("sheet");
		
		Row titleRow = sheet.createRow(0);
		titleRow.createCell(0).setCellValue("cashbook_id");
		titleRow.createCell(1).setCellValue("cashbook_kind");
		titleRow.createCell(2).setCellValue("category_name");
		titleRow.createCell(3).setCellValue("cashbook_price");
		titleRow.createCell(4).setCellValue("cashbook_content");
		titleRow.createCell(5).setCellValue("cashbook_date");
		titleRow.createCell(6).setCellValue("create_date");
		titleRow.createCell(7).setCellValue("update_date");
		
		int rowNum = 1;
		for (Cashbook c : cashbookList) {
			Row row = sheet.createRow(rowNum);
			row.createCell(0).setCellValue(c.getCashbookId());
			row.createCell(1).setCellValue(c.getCashbookKind());
			row.createCell(2).setCellValue(c.getCategoryName());
			row.createCell(3).setCellValue(c.getCashbookPrice());
			row.createCell(4).setCellValue(c.getCashbookContent());
			row.createCell(5).setCellValue(c.getCashbookDate());
			row.createCell(6).setCellValue(c.getCreateDate());
			row.createCell(7).setCellValue(c.getUpdateDate());
			
			rowNum++;
		}
	}
}