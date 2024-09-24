package com.sboard.controller;

import com.sboard.config.AppInfo;
import com.sboard.dto.ArticleDTO;
import com.sboard.dto.FileDTO;
import com.sboard.dto.PageRequestDTO;
import com.sboard.dto.PageResponseDTO;
import com.sboard.entity.User;
import com.sboard.security.MyUserDetails;
import com.sboard.service.ArticleService;
import com.sboard.service.FileService;
import com.sboard.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Log4j2
@RequiredArgsConstructor
@Controller
public class ArticleController {

    private final ArticleService articleService;
    private final FileService fileService;


    @GetMapping("/article/list")
    public String list(Model model, PageRequestDTO pageRequestDTO) {

        PageResponseDTO pageResponseDTO = articleService.selectArticles(pageRequestDTO);
        model.addAttribute("pageResponseDTO",pageResponseDTO);

        return "/article/list";
    }

    @GetMapping("/article/modify")
    public String modify(){
        return "/article/modify";
    }

    @GetMapping("/article/view")
    public String view(){
        return "/article/view";
    }

    @GetMapping("/article/write")
    public String write(){
        return "/article/write";
    }
    @PostMapping("/article/write")
    public String write(ArticleDTO articleDTO, HttpServletRequest req){
        String regip = req.getRemoteAddr();
        articleDTO.setRegip(regip);

        List<FileDTO> files = fileService.uploadFile(articleDTO);
        articleDTO.setFile(files.size());
        int ano = articleService.insertArticle(articleDTO);

        for (FileDTO file : files) {
            file.setAno(ano);
            fileService.insertFile(file);
        }

        return "redirect:/article/list";
    }

    @GetMapping("/article/delete")
    public String delete(){
        return "/article/delete";
    }

}
