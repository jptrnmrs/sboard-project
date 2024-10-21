package com.sboard.service;

import com.querydsl.core.Tuple;
import com.sboard.dto.CommentDTO;
import com.sboard.entity.Article;
import com.sboard.entity.Comment;
import com.sboard.entity.User;
import com.sboard.repository.ArticleRepository;
import com.sboard.repository.CommentRepository;
import com.sboard.repository.UserRepository;
import jakarta.transaction.Transactional;
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

    @Transactional
    public CommentDTO insertComment(CommentDTO commentDTO) {
        Comment com = modelMapper.map(commentDTO, Comment.class);

        Article article = articleRepository.selectArticleByAno(com.getParent());
        int count = article.getComment();
        article.setComment(++count);
        articleRepository.save(article);
        return modelMapper.map(commentRepository.save(com), CommentDTO.class);
    }

    @Transactional
    public Boolean deleteComment(CommentDTO commentDTO){
            int parent = commentDTO.getParent();
            int cno = commentDTO.getCno();
            log.info("commentDTO : " +commentDTO);

        try{
            Article article = articleRepository.selectArticleByAno(parent);

            // 댓글 수 감소
            int updatedCount = article.getComment() - 1;
            article.setComment(updatedCount);
            articleRepository.save(article);

            commentRepository.deleteById(cno);
            return true;
        }catch (Exception e){
            // 예외 로깅
            log.error(e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

}
