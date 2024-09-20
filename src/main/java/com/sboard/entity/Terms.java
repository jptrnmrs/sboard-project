package com.sboard.entity;

import com.sboard.dto.TermsDTO;
import jakarta.persistence.*;
import lombok.*;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@Entity
@Table(name = "terms")
public class Terms {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(columnDefinition = "TEXT", nullable = false)
    private String terms;

    @Column(columnDefinition = "TEXT", nullable = false)
    private String privacy;

    public TermsDTO toDTO(){
        return TermsDTO.builder()
                .terms(this.terms)
                .privacy(this.privacy)
                .build();
    }
}
