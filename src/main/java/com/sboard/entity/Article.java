package com.sboard.entity;

import com.sboard.dto.ArticleDTO;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;
import java.util.List;

@Data
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

    // 추가필드
    @Transient  // 엔티티 속성에서 제외시키는 어노테이션
    private String nick;

    @OneToMany(mappedBy = "ano")
    private List<FileEntity> fileList;

    @OneToMany(mappedBy = "parent")
    private List<Comment> commentList;
}
