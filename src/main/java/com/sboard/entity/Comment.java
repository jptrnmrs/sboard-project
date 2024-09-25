package com.sboard.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name="comment")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cno;

    private int parent;
    private String content;
    private String regip;

    @CreationTimestamp
    private LocalDateTime rdate;

    // 추가필드
    @ManyToOne
    @JoinColumn(name="writer")
    private User user;
}
