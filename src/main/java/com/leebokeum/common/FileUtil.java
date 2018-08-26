package com.leebokeum.common;

import java.io.File;
import java.util.ArrayList;
import java.util.Date; 
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.leebokeum.dao.vo.Content;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	private final String imgOriginalPath = "C:\\dev\\origin-file\\";
	private final String targetFilePath = "C:\\dev\\file\\";

	//private final String imgOriginalPath = "/home/ec2-user/origin-upload/";
	//private final String targetFilePath = "/home/ec2-user/upload/";

	
	public void parseInsertFileHeader(Board content, MultipartFile multipartFile) throws Exception{
		String originalFileName = null;
		String originalFileExtension = null; 
		String storedFileName = null; 

		File file = new File(imgOriginalPath);
		if(file.exists() == false){
			file.mkdirs();
		}

		originalFileName = multipartFile.getOriginalFilename();
		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		storedFileName = CommonUtil.getRandomString() + "." + originalFileExtension;
		file = new File(imgOriginalPath + storedFileName);
		multipartFile.transferTo(file);

		ImgResizeRatio imgResizeRatio = new ImgResizeRatio();
		imgResizeRatio.imgResize(imgOriginalPath + storedFileName, targetFilePath + storedFileName, originalFileExtension , 300, 300);

		content.setOriginImg1(originalFileName);
		content.setImg1(storedFileName);
		content.setFileSizeImg1(multipartFile.getSize());
	}
}
