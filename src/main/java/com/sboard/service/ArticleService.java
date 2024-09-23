package com.sboard.service;

import com.sboard.dto.ArticleDTO;
import com.sboard.entity.Article;
import com.sboard.repository.ArticleRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class ArticleService {

    private final ArticleRepository articleRepository;
    private final ModelMapper modelMapper;



    public int insertArticle(ArticleDTO articleDTO) {

        // ModelMapper를 이용해서 DTO를 Entity로 변환
        Article article = modelMapper.map(articleDTO, Article.class);
        log.info(article);

        // 저장
        Article savedArticle = articleRepository.save(article);

        return savedArticle.getNo();
    }


    public ArticleDTO selectArticle(int no) {
        return null;
    }
    public List<ArticleDTO> selectArticles() {
        articleRepository.findAll();
        return null;
    }
    public void deleteArticleById(int no) {
        articleRepository.deleteById(no);
    }
}
