package kr.or.ddit.page.comm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/comm")
@Controller
public class ProfileController {
    @GetMapping("/profile")
    public String showProfile(Model model) {
        // 더미 데이터 추가
        List<Comment> commentList = new ArrayList<>();
        commentList.add(new Comment("첫 번째 댓글", "2024-12-31"));
        commentList.add(new Comment("두 번째 댓글", "2024-12-30"));

        model.addAttribute("commentList", commentList);
        return "comm/profile"; // profile.jsp를 호출
    }

    // 댓글 클래스 (더미용)
    public static class Comment {
        private String content;
        private String date;

        public Comment(String content, String date) {
            this.content = content;
            this.date = date;
        }

        public String getContent() {
            return content;
        }

        public String getDate() {
            return date;
        }
    }
}
