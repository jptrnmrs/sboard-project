package com.sboard.service;

import com.querydsl.core.Tuple;
import com.sboard.dto.ArticleDTO;
import com.sboard.dto.PageRequestDTO;
import com.sboard.dto.PageResponseDTO;
import com.sboard.entity.Article;
import com.sboard.repository.ArticleRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
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
        List<Article> articles = articleRepository.findAll();
        List<ArticleDTO> articleDTOs = articles.stream().map(entity ->{
            ArticleDTO dto = modelMapper.map(entity, ArticleDTO.class);
            return dto;
        }).toList();
        return articleDTOs;
    }


    public PageResponseDTO selectArticleAll(PageRequestDTO pageRequestDTO) {
        Pageable pageable = pageRequestDTO.getPageable("no");
        Page<Tuple> pageArticle = articleRepository.selectArticleAllForList(pageRequestDTO,pageable);

        List<ArticleDTO> articleDTOs = pageArticle.getContent().stream().map(tuple ->{
                Article article = tuple.get(0, Article.class);
                article.setNick(tuple.get(1, String.class));

                return modelMapper.map(article, ArticleDTO.class);
            }).toList();

        int total = (int) pageArticle.getTotalElements();

        return PageResponseDTO.builder()
                .pageRequestDTO(pageRequestDTO)
                .dtoList(articleDTOs)
                .total(total)
                .build();
    }


    public void deleteArticleById(int no) {
        articleRepository.deleteById(no);
    }
}
