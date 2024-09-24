package com.sboard.dto;

import java.util.List;

public class PageResponseDTO {
    private List<ArticleDTO> dtoList;
    private String cate;
    private int pg;
    private int size;
    private int startNo;
    private int start, end;
    private boolean prev,next;
}
