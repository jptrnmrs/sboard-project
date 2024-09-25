package com.sboard.controller;

import com.sboard.dto.CommentDTO;
import com.sboard.entity.Comment;
import com.sboard.service.CommentService;
import com.sboard.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

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

        return ResponseEntity
                .ok()
                .body(dto);
    }
    @DeleteMapping("/comment")
    public ResponseEntity write(@RequestBody CommentDTO commentDTO) {
        Boolean result = commentService.deleteComment(commentDTO);

        return ResponseEntity
                .ok()
                .body(result);
    }
}
