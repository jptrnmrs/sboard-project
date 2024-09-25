package com.sboard.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ArticleDTO {

    private int no;

    @Builder.Default
    private String cate = "free";
    private String title;
    private String content;

    @Builder.Default
    private int comment=0;

    private List<MultipartFile> files;
    private int file;

    @Builder.Default
    private int hit=0;

    private String regip;
    private String rdate;

    private String writer;

    private String nick;

    private List<FileDTO> fileList;
    private List<CommentDTO> commentList;


}
