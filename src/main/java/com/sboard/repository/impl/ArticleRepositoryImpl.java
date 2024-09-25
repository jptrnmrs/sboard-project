package com.sboard.repository.impl;

import com.querydsl.core.Tuple;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.sboard.dto.ArticleDTO;
import com.sboard.dto.PageRequestDTO;
import com.sboard.entity.Article;
import com.sboard.entity.QArticle;
import com.sboard.entity.QUser;
import com.sboard.repository.custom.ArticleRepositoryCustom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.util.List;

@Repository
@RequiredArgsConstructor
@Log4j2
public class ArticleRepositoryImpl implements ArticleRepositoryCustom {

    private final JPAQueryFactory queryFactory;

    private QArticle qArticle = QArticle.article;
    private QUser qUser = QUser.user;

    @Override
    public Page<Tuple> selectArticleAllForList(PageRequestDTO pageRequestDTO, Pageable pageable) {
        List<Tuple> contents = queryFactory
                .select(qArticle,qUser.nick)
                .from(qArticle)
                .join(qUser)
                .on(qArticle.writer.eq(qUser.uid))
                .offset(pageable.getOffset())
                .limit(pageable.getPageSize())
                .orderBy(qArticle.no.desc())
                .fetch();

        long total = queryFactory
                .select(qArticle.count())
                .from(qArticle)
                .fetchOne();
        return new PageImpl<>(contents, pageable, total);
    }

    @Override
    public Page<Tuple> selectArticleForSearch(PageRequestDTO pageRequestDTO, Pageable pageable) {

        String type = pageRequestDTO.getType();
        String keyword = pageRequestDTO.getKeyword();

        BooleanExpression expression = null;

        if(type.equals("title")){
            expression = qArticle.title.contains(keyword);
        }else if(type.equals("content")){
            expression = qArticle.content.contains(keyword);
        }else if(type.equals("title_content")){
            BooleanExpression tExpression = qArticle.content.contains(keyword);
            BooleanExpression cExpression = qArticle.title.contains(keyword);

            expression = tExpression.or(cExpression);
        }else if(type.equals("writer")){
            expression = qUser.nick.contains(keyword);
        }
        List<Tuple> contents = queryFactory
                .select(qArticle,qUser.nick)
                .from(qArticle)
                .join(qUser)
                .on(qArticle.writer.eq(qUser.uid))
                .where(expression)
                .offset(pageable.getOffset())
                .limit(pageable.getPageSize())
                .orderBy(qArticle.no.desc())
                .fetch();

        long total = queryFactory
                .select(qArticle.count())
                .from(qArticle)
                .where(expression)
                .join(qUser)
                .on(qArticle.writer.eq(qUser.uid))
                .fetchOne();

        return new PageImpl<>(contents, pageable, total);

    }

    @Override
    public Article selectArticleByNo(int no) {
        Tuple tuple = queryFactory.select(qArticle, qUser.nick)
                .from(qArticle)
                .join(qUser)
                .on(qArticle.writer.eq(qUser.uid))
                .where(qArticle.no.eq(no))
                .fetchOne();

        Article article = tuple.get(0, Article.class);
        article.setNick(tuple.get(1, String.class));
        return article;
    }
}
