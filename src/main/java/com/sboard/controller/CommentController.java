package com.sboard.controller;

import com.sboard.dto.CommentDTO;
import com.sboard.service.CommentService;
import com.sboard.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Log4j2
@RequiredArgsConstructor
@RestController
public class CommentController {

    private final CommentService commentService;
    private final UserService userService;

    @PostMapping("/comment")
    public ResponseEntity write(@RequestBody CommentDTO commentDTO, HttpServletRequest req) {
        String regip = req.getRemoteAddr();
        commentDTO.setRegip(regip);
        commentDTO.setUser(userService.selectUser(commentDTO.getWriter()));
        CommentDTO dto = commentService.insertComment(commentDTO);

        log.info(dto.toString());
        return ResponseEntity
                .ok()
                .body(dto);
    }
    @DeleteMapping("/comment")
    public ResponseEntity<Boolean> deleteComment(CommentDTO commentDTO) {

        Boolean result = commentService.deleteComment(commentDTO);
        log.info("result : " + result);

        if (result) {
            return ResponseEntity.ok(true); // 삭제 성공
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(false); // 댓글 없음 또는 삭제 실패
        }
    }

}
