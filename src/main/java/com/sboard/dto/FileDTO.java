package com.sboard.dto;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FileDTO {
    private int fno;
    private int ano;
    private String oName;
    private String sName;
    private int download;
    private String rdate;
}
