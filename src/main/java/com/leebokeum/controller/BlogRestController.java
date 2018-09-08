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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;

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
    Reply replySave(Reply reply) {
        reply = replyDao.save(reply.saveDefualt(reply));
        return reply;
    }

    @RequestMapping(value = "/category", method = RequestMethod.POST)
    List<BlogCategory> categoryList() {
        return blogCategoryDao.findAll();
    }

    @RequestMapping(value = "/addCategory", method = RequestMethod.POST)
    BlogCategory addCategory(BlogCategory blogCategory) {
        blogCategory.setCategoryDesktopYn("Y");
        blogCategory.setCategoryLevel(1);
        blogCategory.setCategoryMobileYn("Y");
        blogCategory.setCategoryOrder(blogCategoryDao.findMaxOrder() + 1);
        blogCategory.setCategoryParent(0);
        blogCategory.setDeleteFlag("N");
        return blogCategoryDao.save(blogCategory);
    }


    @RequestMapping(value = "/ImageUpload", method = RequestMethod.POST)
    HashMap imageUpload(@RequestParam("upload") MultipartFile image) throws Exception {
        FileUtil fileUtils = new FileUtil();
        String imageUrl = null;

        if (!image.isEmpty()) {
            imageUrl = fileUtils.insertImage(image);
        }

        HashMap<String,String> resultMap = new HashMap<String,String>();

        resultMap.put("fileName", "uploadedImage");
        resultMap.put("uploaded", "1");
        resultMap.put("url", "//leebokeum.com/images/" + imageUrl);

        return resultMap;
    }

    @RequestMapping(value = "/FileUpload", method = RequestMethod.POST)
    HashMap fileUpload(@RequestParam("upload") MultipartFile file) throws Exception {
        FileUtil fileUtils = new FileUtil();
        String fileUrl = null;

        if (!file.isEmpty()) {
            fileUrl = fileUtils.insertFile(file);
        }

        HashMap<String,String> resultMap = new HashMap<String,String>();

        resultMap.put("fileName", "uploadedFile");
        resultMap.put("uploaded", "1");
        resultMap.put("url", "//leebokeum.com/file/" + fileUrl);

        return resultMap;
    }
}
