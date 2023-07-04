package com.leebokeum.controller;

import com.leebokeum.common.FileUtil;
import com.leebokeum.dao.BlogCategoryDao;
import com.leebokeum.dao.MenuDao;
import com.leebokeum.dao.ReplyDao;
import com.leebokeum.dao.vo.BlogCategory;
import com.leebokeum.dao.vo.Reply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;

@RestController
public class BlogRestController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    MenuDao menuDao;
    @Autowired
    ReplyDao replyDao;
    @Autowired
    BlogCategoryDao blogCategoryDao;

    //댓글 쓰기
    @RequestMapping(value = "/replySave", method = RequestMethod.POST)
    ResponseEntity<?> replySave(HttpSession session, Reply reply) {
        if (session.getAttribute("user") == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
        }

        reply = replyDao.save(reply.saveDefualt(reply));
        return ResponseEntity.ok(reply);
    }

    @RequestMapping(value = "/category", method = RequestMethod.POST)
    List<BlogCategory> categoryList() {
        return blogCategoryDao.findAll();
    }

    @RequestMapping(value = "/addCategory", method = RequestMethod.POST)
    ResponseEntity<?> addCategory(HttpSession session, BlogCategory blogCategory) {
        if (session.getAttribute("user") == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
        }

        blogCategory.setCategoryDesktopYn("Y");
        blogCategory.setCategoryLevel(1);
        blogCategory.setCategoryMobileYn("Y");
        blogCategory.setCategoryOrder(blogCategoryDao.findMaxOrder() + 1);
        blogCategory.setCategoryParent(0);
        blogCategory.setDeleteFlag("N");
        return ResponseEntity.ok(blogCategoryDao.save(blogCategory));
    }


    @RequestMapping(value = "/ImageUpload", method = RequestMethod.POST)
    ResponseEntity<?> imageUpload(HttpSession session, @RequestParam("upload") MultipartFile image) throws Exception {
        if (session.getAttribute("user") == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
        }

        FileUtil fileUtils = new FileUtil();
        String imageUrl = null;

        if (!image.isEmpty()) {
            imageUrl = fileUtils.insertImage(image);
        }

        HashMap<String,String> resultMap = new HashMap<String,String>();

        resultMap.put("fileName", "uploadedImage");
        resultMap.put("uploaded", "1");
        resultMap.put("url", "//leebokeum.com/images/" + imageUrl);

        return ResponseEntity.ok(resultMap);
    }

    @RequestMapping(value = "/FileUpload", method = RequestMethod.POST)
    ResponseEntity<?> fileUpload(HttpSession session, @RequestParam("upload") MultipartFile file) throws Exception {
        if (session.getAttribute("user") == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
        }

        FileUtil fileUtils = new FileUtil();
        String fileUrl = null;

        if (!file.isEmpty()) {
            fileUrl = fileUtils.insertFile(file);
        }

        HashMap<String,String> resultMap = new HashMap<String,String>();

        resultMap.put("fileName", "uploadedFile");
        resultMap.put("uploaded", "1");
        resultMap.put("url", "//leebokeum.com/file/" + fileUrl);

        return ResponseEntity.ok(resultMap);
    }
}
