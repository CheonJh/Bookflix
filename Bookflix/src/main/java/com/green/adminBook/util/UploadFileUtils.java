package com.green.adminBook.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;
import net.coobird.thumbnailator.Thumbnails;

public class UploadFileUtils {
  static final int THUMB_WIDTH = 300;
  static final int THUMB_HEIGHT = 300;
  //썸네일 파일의 가로세로 크기를 정한다

  //public static String fileUpload(String uploadPath, String fileName, byte[] fileData, String ymdPath)
  public static String fileUpload(String uploadPath, String fileName, byte[] fileData)
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
    //썸네일 만드는 과정
    String thumbFileName = "thumbnail_" + newFileName;
    File image = new File(imgPath + File.separator + newFileName);

    File thumbnail = new File(imgPath + File.separator + "thumbnail" + File.separator + thumbFileName);

    if (image.exists()) {
      thumbnail.getParentFile().mkdirs();
      Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
    }
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
