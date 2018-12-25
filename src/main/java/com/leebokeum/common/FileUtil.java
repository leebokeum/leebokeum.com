package com.leebokeum.common;

import java.io.File;
import java.util.ArrayList;
import java.util.Date; 
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.leebokeum.dao.vo.Content;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
//	private final String imgOriginalPath = "C:\\dev\\origin-file\\";
//	private final String targetFilePath = "C:\\dev\\target-file\\";

	private final String imgOriginalPath = "/home/ec2-user/origin-upload/";
	private final String targetFilePath = "/home/ec2-user/upload/";

	
	public void parseInsertFileHeader(Board content, MultipartFile multipartFile) throws Exception{
		String originalFileName = null;
		String originalFileExtension = null; 
		String storedFileName = null; 

		//이미지를 저장할 경로가 없다면 생성한다.
		File originFile = new File(imgOriginalPath);
		if(originFile.exists() == false){
			originFile.mkdirs();
		}

		//이미지를 저장할 경로가 없다면 생성한다.
		File targetFile = new File(targetFilePath);
		if(targetFile.exists() == false){
			targetFile.mkdirs();
		}

		originalFileName = multipartFile.getOriginalFilename();
		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		storedFileName = CommonUtil.getRandomString() + "." + originalFileExtension;
		originFile = new File(imgOriginalPath + storedFileName);
		multipartFile.transferTo(originFile);

		ImgResizeRatio imgResizeRatio = new ImgResizeRatio();
		imgResizeRatio.imgResize(imgOriginalPath + storedFileName, targetFilePath + storedFileName, originalFileExtension , 800, 800);

		content.setOriginRepImg(originalFileName);
		content.setRepImg(storedFileName);
	}


	public String insertImage(MultipartFile multipartFile) throws Exception{

		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		//이미지를 저장할 경로가 없다면 생성한다.
		File originFile = new File(imgOriginalPath);
		if(originFile.exists() == false){
			originFile.mkdirs();
		}

		//이미지를 저장할 경로가 없다면 생성한다.
		File targetFile = new File(targetFilePath);
		if(targetFile.exists() == false){
			targetFile.mkdirs();
		}

		originalFileName = multipartFile.getOriginalFilename();
		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		storedFileName = CommonUtil.getRandomString() + "." + originalFileExtension;
		originFile = new File(imgOriginalPath + storedFileName);
		multipartFile.transferTo(originFile);

		ImgResizeRatio imgResizeRatio = new ImgResizeRatio();
		imgResizeRatio.imgResize(imgOriginalPath + storedFileName, targetFilePath + storedFileName, originalFileExtension , 800, 800);

		return storedFileName;
	}


	public String insertFile(MultipartFile multipartFile) throws Exception{

		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;


		//이미지를 저장할 경로가 없다면 생성한다.
		File targetFile = new File(targetFilePath);
		if(targetFile.exists() == false){
			targetFile.mkdirs();
		}

		originalFileName = multipartFile.getOriginalFilename();
		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		storedFileName = CommonUtil.getRandomString() + "." + originalFileExtension;
		targetFile = new File(targetFilePath + storedFileName);
		multipartFile.transferTo(targetFile);

		return storedFileName;
	}
}
