package com.leebokeum.controller;

import com.leebokeum.common.Board;
import com.leebokeum.common.FileUtil;
import com.leebokeum.common.HitIncement;
import com.leebokeum.common.PageBlock;
import com.leebokeum.dao.BlogCategoryDao;
import com.leebokeum.dao.ContentDao;
import com.leebokeum.dao.MenuDao;
import com.leebokeum.dao.ReplyDao;
import com.leebokeum.dao.vo.BlogCategory;
import com.leebokeum.dao.vo.Content;
import com.leebokeum.dao.vo.Menu;
import com.leebokeum.dao.vo.Reply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by 이복음 on 2017-06-06.
 */
@Controller
public class BlogController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    ContentDao contentDao;
    @Autowired
    MenuDao menuDao;
    @Autowired
    ReplyDao replyDao;
    @Autowired
    BlogCategoryDao blogCategoryDao;

    //일반 글쓰기 저장
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    String save(Content contents, @RequestParam("repImage") MultipartFile repImage) throws Exception {
        FileUtil fileUtils = new FileUtil();
        contentDao.save(contents);

        if (!repImage.isEmpty()) {
            fileUtils.parseInsertFileHeader(contents, repImage);
        }
        contentDao.save(contents.saveDefualt(contents));
        return "redirect:/home";
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    String modify(Model model, @RequestParam("id") int id) {
        Content content = contentDao.findOne(id);
        model.addAttribute("content", content);
        return "write";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    String update(Content content, @RequestParam("repImage") MultipartFile repImage) throws Exception {
        Content originContent = contentDao.getOne(content.getId());
        Date date = new java.util.Date();
        SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        originContent.setLastUpdateDate(simpleDateFormat.format(date));
        originContent.setTitle(content.getTitle());
        originContent.setSubTitle(content.getSubTitle());
        originContent.setContents(content.getContents());
        originContent.setNoticeFlag(content.getNoticeFlag());
        originContent.setSecretFlag(content.getSecretFlag());
        originContent.setTag(content.getTag());
        originContent.setCreaterName(content.getCreaterName());
        FileUtil fileUtils = new FileUtil();
        if (!repImage.isEmpty()) {
            fileUtils.parseInsertFileHeader(originContent, repImage);
        }
        contentDao.save(originContent);
        return "redirect:/content/" + originContent.getId();
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    String delete(@RequestParam("id") int id) {
        Content content = contentDao.findOne(id);
        content.setDeleteFlag("Y");
        contentDao.save(content);
        return "redirect:/blog";
    }

    //댓글 쓰기
    @RequestMapping(value = "/replySave", method = RequestMethod.POST)
    @ResponseBody
    Reply replySave(Reply reply) {
        reply = replyDao.save(reply.saveDefualt(reply));
        return reply;
    }

    @RequestMapping(value = "/blog")
    String blogListAll(Model model,
                       @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC, size = 5) Pageable pageableDesc) {
        Page<Content> contentList = contentDao.findByDeleteFlag("N", pageableDesc);
        List<Content> noticeList = contentDao.findByDeleteFlagAndNoticeFlagOrderByIdDesc("N", "Y");
        List<BlogCategory> categoryList = blogCategoryDao.findAll();
        PageBlock pageBlock = new PageBlock(contentList);
        model.addAttribute("contentList", contentList);
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("pageBlock", pageBlock);
        return "blog";
    }


    @RequestMapping(value = "/blog/{categoryId}")
    String blogListByCategory(Model model,
                              @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC, size = 5) Pageable pageableDesc,
                              @PathVariable int categoryId) {
        Page<Content> contentList = contentDao.findByDeleteFlagAndCategoryId("N", categoryId, pageableDesc);
        List<Content> noticeList = contentDao.findByDeleteFlagAndNoticeFlagOrderByIdDesc("N", "Y");
        List<BlogCategory> categoryList = blogCategoryDao.findAll();
        PageBlock pageBlock = new PageBlock(contentList);
        model.addAttribute("contentList", contentList);
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("pageBlock", pageBlock);
        model.addAttribute("categoryId", categoryId);
        return "blog";
    }

    @RequestMapping("content/{id}")
    public String content(Model model, @PathVariable int id, HttpServletResponse response, HttpServletRequest request) {
        HitIncement hitIncrement = new HitIncement();
        Board content = hitIncrement.addHit(contentDao, id, response, request, "leebokeum"); //조회수 늘리기
        List<Content> noticeList = contentDao.findByDeleteFlagAndNoticeFlagOrderByIdDesc("N", "Y");
        List<BlogCategory> categoryList = blogCategoryDao.findAll();
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("content", content);
        return "post";
    }

    @RequestMapping(value = "/category", method = RequestMethod.POST)
    @ResponseBody
    List<BlogCategory> categoryList() {
        return blogCategoryDao.findAll();
    }

    @RequestMapping(value = "/addCategory", method = RequestMethod.POST)
    @ResponseBody
    BlogCategory addMenu(BlogCategory blogCategory) {
        blogCategory.setCategoryDesktopYn("Y");
        blogCategory.setCategoryLevel(1);
        blogCategory.setCategoryMobileYn("Y");
        blogCategory.setCategoryOrder(blogCategoryDao.findMaxOrder() + 1);
        blogCategory.setCategoryParent(0);
        blogCategory.setDeleteFlag("N");
        return blogCategoryDao.save(blogCategory);
    }
}
