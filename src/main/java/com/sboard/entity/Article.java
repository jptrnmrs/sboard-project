package com.sboard.entity;

import com.sboard.dto.ArticleDTO;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name="article")
public class Article {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private int no;

    private String cate;
    private String title;

    @Column(columnDefinition = "TEXT")
    private String content;
    private int hit;
    private int file;
    private int comment;
    private String writer;
    private String regip;

    @CreationTimestamp
    private LocalDateTime rdate;


}
