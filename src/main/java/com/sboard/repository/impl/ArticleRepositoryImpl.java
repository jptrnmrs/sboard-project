package com.sboard.repository.impl;

import com.querydsl.core.QueryResults;
import com.querydsl.core.Tuple;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.sboard.dto.PageRequestDTO;
import com.sboard.entity.QArticle;
import com.sboard.entity.QUser;
import com.sboard.repository.custom.ArticleRepositoryCustom;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

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
        QueryResults<Tuple> results = queryFactory
                .select(qArticle,qUser.nick)
                .from(qArticle)
                .join(qUser)
                .on(qArticle.writer.eq(qUser.uid))
                .offset(pageRequestDTO.getPg())
                .limit(pageRequestDTO.getSize())
                .orderBy(qArticle.no.desc())
                .fetchResults();

        List<Tuple> contents = results.getResults();
        long total = results.getTotal();
        return new PageImpl<>(contents, pageable, total);
    }
}
