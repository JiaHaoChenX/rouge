package com.chenjiahao.rouge.utils;


import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

public class ExcelUtil {

    private ExcelUtil() {

    }

    // 读取excel的结果集
    private static ArrayList<Map<String, String>> result = null;

    // 记录表格中空行的行数
    private static int num = 0;

    private static List<String> numList = new ArrayList<String>();

    /**
     * 获取需要传入数据库的数据
     */
    public static ArrayList<Map<String, String>> readExcelData(final String filePath) {
        try {
           return readExcelToObj(filePath);
        } catch (Exception e) {
            System.out.println("导入失败");
        }
        return null;
    }

    /**
     * 读取excel数据
     */
    private static ArrayList<Map<String, String>> readExcelToObj(final String path) throws Exception {
        Workbook wb = null;
        result = new ArrayList<Map<String, String>>();
        try {
            wb = WorkbookFactory.create(new File(path));
            Sheet sheet = wb.getSheetAt(0);
            result = readExcel(wb, sheet, 0, 0);
        } catch (InvalidFormatException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 读取excel文件
     * @param sheet sheet页下标：从0开始
     * @param startReadLine 开始读取的行:从0开始
     * @param tailLine 去除最后读取的行
     */
    private static ArrayList<Map<String, String>> readExcel(final Workbook wb, final Sheet sheet, final int startReadLine, final int tailLine) {
        Row row = null;
        for (int i = startReadLine; i < sheet.getLastRowNum() - tailLine + 1; i++) {
            row = sheet.getRow(i);
            Map<String, String> map = new HashMap<String, String>();
            for (Cell c : row) {
                String returnStr = "";
                boolean isMerge = isMergedRegion(sheet, i, c.getColumnIndex());
                //判断是否具有合并单元格
                if (isMerge) {
                    String rs = getMergedRegionValue(sheet, row.getRowNum(), c.getColumnIndex());
                    returnStr = rs;
                } else {
                    c.setCellType(Cell.CELL_TYPE_STRING);
                    returnStr = c.getRichStringCellValue().getString();
                }

                //设置名称
                if (c.getColumnIndex() == 0) {
                    map.put("id", returnStr);
                } else if (c.getColumnIndex() == 1) {
                    map.put("railwayTripsIn", returnStr);
                } else if (c.getColumnIndex() == 2) {
                    map.put("arriveTime", returnStr);
                } else if (c.getColumnIndex() == 3) {
                    map.put("railwayNum", returnStr);
                } else if (c.getColumnIndex() == 4) {
                    map.put("checkTrack", returnStr);
                } else if (c.getColumnIndex() == 5) {
                    map.put("maintenanceTask", returnStr);
                } else if (c.getColumnIndex() == 6) {
                    map.put("maintenanceUnitName", returnStr);
                } else if (c.getColumnIndex() == 7) {
                    map.put("project", returnStr);
                } else if (c.getColumnIndex() == 8) {
                    map.put("startTime", returnStr);
                } else if (c.getColumnIndex() == 9) {
                    map.put("finishTime", returnStr);
                } else if (c.getColumnIndex() == 10) {
                    map.put("linkTrack", returnStr);
                } else if (c.getColumnIndex() == 11) {
                    map.put("outboundTime", returnStr);
                } else if (c.getColumnIndex() == 12) {
                    map.put("railwayTripsOut", returnStr);
                }
            }
            result.add(map);
        }
        return result;
    }

  /*  public static List<TrackData> splitCenterData(ArrayList<Map<String,String>> result) throws Exception {
        trackListData = new ArrayList<TrackData>();
        Map<String,String> map = new HashMap<String,String>();
        Integer lineNumDataSize = result.size() - 5;
        for (int i = 0; i < lineNumDataSize; i++) {
            trackData = new TrackData();
            map = result.get(i);
            trackData.setId(map.get("id").trim());
            trackData.setInTimes(map.get("inTimes").trim());
            if(map.get("inTime").toString().trim().equals("\\")) {
                trackData.setInTime(null);
            } else {
                trackData.setInTime(map.get("inTime"));
            }
            trackData.setCarGroud(map.get("carGroud").trim());
            trackData.setCheckTrack(map.get("checkTrack").trim());
            trackData.setJob(map.get("job").trim());
            trackData.setNewsSource(map.get("newsSource").trim());
            trackData.setProject(map.get("project").trim());
            trackData.setStartTime(map.get("startTime").trim());
            trackData.setEndTime(map.get("endTime").trim());
            if(map.get("linkTrack").toString().trim().equals("\\")) {
                trackData.setLinkTrack(null);
            } else {
                trackData.setLinkTrack(map.get("linkTrack").trim());
            }
            if(map.get("outTime").toString().trim().equals("\\")) {
                trackData.setOutTime(null);
            } else {
                trackData.setOutTime(map.get("outTime").trim());
            }
            if(map.get("outTimes").toString().trim().equals("\\")) {
                trackData.setOutTimes(null);
            } else {
                trackData.setOutTimes(map.get("outTimes").trim());
            }
            trackListData.add(trackData);
        }
        return trackListData;
    }*/


    /**
     * 获取合并单元格的值
     * @param sheet
     * @param row
     * @param column
     */
    private static String getMergedRegionValue(final Sheet sheet, final int row, final int column) {
        int sheetMergeCount = sheet.getNumMergedRegions();

        for (int i = 0; i < sheetMergeCount; i++) {
            CellRangeAddress ca = sheet.getMergedRegion(i);
            int firstColumn = ca.getFirstColumn();
            int lastColumn = ca.getLastColumn();
            int firstRow = ca.getFirstRow();
            int lastRow = ca.getLastRow();

            if (row >= firstRow && row <= lastRow) {

                if (column >= firstColumn && column <= lastColumn) {
                    Row fRow = sheet.getRow(firstRow);
                    Cell fCell = fRow.getCell(firstColumn);
                    return getCellValue(fCell);
                }
            }
        }

        return null;
    }

    /**
     * 判断合并了行
     * @param sheet
     * @param row
     * @param column
     */
    private static boolean isMergedRow(final Sheet sheet, final int row, final int column) {
        int sheetMergeCount = sheet.getNumMergedRegions();
        for (int i = 0; i < sheetMergeCount; i++) {
            CellRangeAddress range = sheet.getMergedRegion(i);
            int firstColumn = range.getFirstColumn();
            int lastColumn = range.getLastColumn();
            int firstRow = range.getFirstRow();
            int lastRow = range.getLastRow();
            if (row == firstRow && row == lastRow) {
                if (column >= firstColumn && column <= lastColumn) {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * 判断指定的单元格是否是合并单元格
     * @param sheet
     * @param row 行下标
     * @param column 列下标
     */
    private static boolean isMergedRegion(final Sheet sheet, final int row, final int column) {
        int sheetMergeCount = sheet.getNumMergedRegions();
        for (int i = 0; i < sheetMergeCount; i++) {
            CellRangeAddress range = sheet.getMergedRegion(i);
            int firstColumn = range.getFirstColumn();
            int lastColumn = range.getLastColumn();
            int firstRow = range.getFirstRow();
            int lastRow = range.getLastRow();
            if (row >= firstRow && row <= lastRow) {
                if (column >= firstColumn && column <= lastColumn) {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * 判断sheet页中是否含有合并单元格
     * @param sheet
     */
    private static boolean hasMerged(final Sheet sheet) {
        return sheet.getNumMergedRegions() > 0 ? true : false;
    }

    /**
     * 合并单元格
     * @param sheet
     * @param firstRow 开始行
     * @param lastRow 结束行
     * @param firstCol 开始列
     * @param lastCol 结束列
     */
    private static void mergeRegion(final Sheet sheet, final int firstRow, final int lastRow, final int firstCol, final int lastCol) {
        sheet.addMergedRegion(new CellRangeAddress(firstRow, lastRow, firstCol, lastCol));
    }

    /**
     * 获取单元格的值
     * @param cell
     * @return
     */
    private static String getCellValue(final Cell cell) {

        if (cell == null) {
            return "";
        }

        if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
            return cell.getStringCellValue();
        } else if (cell.getCellType() == Cell.CELL_TYPE_BOOLEAN) {
            return String.valueOf(cell.getBooleanCellValue());
        } else if (cell.getCellType() == Cell.CELL_TYPE_FORMULA) {
            return cell.getCellFormula();
        } else if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
            return String.valueOf(cell.getNumericCellValue());
        }
        return "";
    }

    /**
     * 判断行为空 lineNum 为空行的开始位置
     */
    private static Integer checkRowNull(final Sheet sheet, final int rows) {
        Row row = null;
        for (int i = 0; i < rows; i++) {
            int cols = sheet.getRow(i).getPhysicalNumberOfCells();
            int col = 0;
            row = sheet.getRow(i);
            for (Cell c : row) {
                String returnStr = "";
                boolean isMerge = isMergedRegion(sheet, i, c.getColumnIndex());
                // 判断是否具有合并单元格
                if (isMerge) {
                    String rs = getMergedRegionValue(sheet, row.getRowNum(), c.getColumnIndex());
                    returnStr = rs;
                } else {
                    returnStr = c.getRichStringCellValue().getString();
                }
                if (returnStr.trim() == null || returnStr.trim() == "") {
                    col++;
                }
            }
            if (cols == col) {
                num++;
            }
        }
        return num;
    }

    /**
     * 从excel读取内容
     */
    private static void readContent(final String fileName) {
        boolean isE2007 = false;    //判断是否是excel2007格式
        if (fileName.endsWith("xlsx")) {
            isE2007 = true;
        }
        try {
            InputStream input = new FileInputStream(fileName);  //建立输入流
            Workbook wb  = null;
            //根据文件格式(2003或者2007)来初始化
            if (isE2007) {
                wb = new XSSFWorkbook(input);
            } else {
                wb = new HSSFWorkbook(input);
            }
            Sheet sheet = wb.getSheetAt(0);     //获得第一个表单
            Iterator<Row> rows = sheet.rowIterator(); //获得第一个表单的迭代器
            while (rows.hasNext()) {
                Row row = rows.next();  //获得行数据
                System.out.println("Row #" + row.getRowNum());  //获得行号从0开始
                Iterator<Cell> cells = row.cellIterator();    //获得第一行的迭代器
                while (cells.hasNext()) {
                    Cell cell = cells.next();
                    System.out.println("Cell #" + cell.getColumnIndex());
                    switch (cell.getCellType()) {   //根据cell中的类型来输出数据
                        case HSSFCell.CELL_TYPE_NUMERIC:
                            System.out.println(cell.getNumericCellValue());
                            break;
                        case HSSFCell.CELL_TYPE_STRING:
                            System.out.println(cell.getStringCellValue());
                            break;
                        case HSSFCell.CELL_TYPE_BOOLEAN:
                            System.out.println(cell.getBooleanCellValue());
                            break;
                        case HSSFCell.CELL_TYPE_FORMULA:
                            System.out.println(cell.getCellFormula());
                            break;
                        default:
                            System.out.println("unsuported sell type=======" + cell.getCellType());
                            break;
                    }
                }
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
