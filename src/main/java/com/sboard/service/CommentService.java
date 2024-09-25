package com.sboard.service;

import com.querydsl.core.Tuple;
import com.sboard.dto.CommentDTO;
import com.sboard.entity.Article;
import com.sboard.entity.Comment;
import com.sboard.entity.User;
import com.sboard.repository.ArticleRepository;
import com.sboard.repository.CommentRepository;
import com.sboard.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@RequiredArgsConstructor
@Service
public class CommentService {
    private final CommentRepository commentRepository;
    private final ArticleRepository articleRepository;
    private final ModelMapper modelMapper;

    public CommentDTO insertComment(CommentDTO commentDTO) {
        Comment com = modelMapper.map(commentDTO, Comment.class);

        Article article = articleRepository.selectArticleByNo(com.getParent());
        int count = article.getComment();
        article.setComment(++count);
        articleRepository.save(article);
        return modelMapper.map(commentRepository.save(com), CommentDTO.class);
    }

    public Boolean deleteComment(CommentDTO comment) {
        Article article = articleRepository.selectArticleByNo(comment.getParent());

        int count = article.getComment();
        article.setComment(--count);
        articleRepository.save(article);
        try{
            commentRepository.deleteById(comment.getCno());
            return true;
        }catch (Exception e){
            return false;
        }
    }

}
