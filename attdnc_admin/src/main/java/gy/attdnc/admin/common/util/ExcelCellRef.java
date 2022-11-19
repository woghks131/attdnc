package gy.attdnc.admin.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.util.CellReference;

public class ExcelCellRef {
	/**
     * Cell에 해당하는 Column Name을 가젼온다(A,B,C..)
     * 만약 Cell이 Null이라면 int cellIndex의 값으로
     * Column Name을 가져온다.
     * @param cell
     * @param cellIndex
     * @return
     */
    public static String getName(Cell cell, int cellIndex) {
        int cellNum = 0;
        if(cell != null) {
            cellNum = cell.getColumnIndex();
        }
        else {
            cellNum = cellIndex;
        }
        
        return CellReference.convertNumToColString(cellNum);
    }
    
    public static String getValue(Cell cell) {
        String value = "";
        
        if(cell == null) {
            value = "";
        }
        switch(cell.getCellType()) {
            case Cell.CELL_TYPE_FORMULA :
                value = cell.getCellFormula();
                break;
            
            case Cell.CELL_TYPE_NUMERIC :
            	if( DateUtil.isCellDateFormatted(cell)) {
    				Date date = cell.getDateCellValue();
    				value = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss").format(date);
    			}
    			else
    				value = cell.getNumericCellValue() + "";
                break;
                
            case Cell.CELL_TYPE_STRING :
                value = cell.getStringCellValue();
                break;
            
            case Cell.CELL_TYPE_BOOLEAN :
                value = cell.getBooleanCellValue() + "";
                break;
           
            case Cell.CELL_TYPE_BLANK :
                value = "";
                break;
            
            case Cell.CELL_TYPE_ERROR :
                value = cell.getErrorCellValue() + "";
                break;
            default:
                value = cell.getStringCellValue();
        }
 
        return value;
    }
}
