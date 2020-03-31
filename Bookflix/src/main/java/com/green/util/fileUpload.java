package com.green.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class fileUpload {
  static final int THUMB_WIDTH = 300;
  static final int THUMB_HEIGHT = 300;
  //썸네일 파일의 가로세로 크기를 정한다

  //public static String fileUpload(String uploadPath, String fileName, byte[] fileData, String ymdPath)
  public static String fileupload(String uploadPath, String fileName, byte[] fileData)
      throws Exception {
    //업로드 패스는 root-context에 설정
    UUID uid = UUID.randomUUID();
    // 파일 이름 설정 = 랜덤값을 준다
    String newFileName = uid + "_" + fileName;
   // String imgPath = uploadPath + ymdPath;
    String imgPath = uploadPath;
    //파일 이름과 경로를 설정
    File target = new File(imgPath, newFileName);
    FileCopyUtils.copy(fileData, target);
    
    File image = new File(imgPath + File.separator + newFileName);
    
    
    return newFileName;
  }
  
  
  //여기서 부터는 폴더를 알아서만들고 그 경로를 구하는 코드
  //이번에는 쓰지않는다
/*
  public static String calcPath(String uploadPath) {
    Calendar cal = Calendar.getInstance();
    String yearPath = File.separator + cal.get(Calendar.YEAR);
    String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
    String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

    makeDir(uploadPath, yearPath, monthPath, datePath);
    makeDir(uploadPath, yearPath, monthPath, datePath + "\\s");

    return datePath;
  }

  private static void makeDir(String uploadPath, String... paths) {

    if (new File(paths[paths.length - 1]).exists()) {
      return;
    }

    for (String path : paths) {
      File dirPath = new File(uploadPath + path);

      if (!dirPath.exists()) {
        dirPath.mkdir();
      }
    }
  }
  */
}
