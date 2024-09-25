package com.sboard.service;

import com.sboard.dto.TermsDTO;
import com.sboard.dto.UserDTO;
import com.sboard.entity.Terms;
import com.sboard.entity.User;
import com.sboard.repository.TermsRepository;
import com.sboard.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

import java.util.Optional;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

@Log4j2
@RequiredArgsConstructor
@Service
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final TermsRepository termsRepository;
    private final ModelMapper modelMapper;

    public TermsDTO getTerms() {
        List<Terms> terms = termsRepository.findAll();
        return terms.get(0).toDTO();
    }

    public void insertUser(UserDTO user) {

        String encodedPassword = passwordEncoder.encode(user.getPass());
        user.setPass(encodedPassword);
        userRepository.save(modelMapper.map(user,User.class));
    }


    public UserDTO selectUser(String username) {
        Optional<User> opt = userRepository.findById(username);
        if(opt.isPresent()) {
            User user = opt.get();
            return modelMapper.map(user,UserDTO.class);
        }
        return null;
    }


    public int selectCountUser(String type, String value){

        int count = 0;

        if(type.equals("uid")){
            count = userRepository.countUserByUid(value);
        }else if(type.equals("nick")){
            count = userRepository.countUserByNick(value);
        }else if(type.equals("hp")){
            count = userRepository.countUserByHp(value);
        }else if(type.equals("email")){
            count = userRepository.countUserByEmail(value);
        }
        return count;
    }

    @Value("${spring.mail.username}")
    private String sender;

    @Value("${spring.mail.password}")
    private String appPass;

    public String sendEmailCode(HttpSession session, String email) {
        // 인증코드 생성
        int code = ThreadLocalRandom.current().nextInt(100000, 1000000);

        session.setAttribute("code", String.valueOf(code));

        String title = "SBoard 가입 인증 번호입니다.";
        String content = "<h4> 인증코드는 " + code + "입니다.<h4>";

        // SMTP 설정 (고정값)
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        // gmail session 생성
        Session gmailSession = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(sender, appPass);
            }
        });

        // 메일 발송
        Message message = new MimeMessage(gmailSession);
        try {
            // 송신자 설정
            message.setFrom(new InternetAddress(sender, "SBoard", "UTF-8"));
            // 수신자 설정
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject(title); // 제목 설정
            message.setContent(content, "text/html;charset=utf-8"); // 내용 설정
            Transport.send(message);
        } catch (Exception e) {
            log.error(e.getMessage());
            e.printStackTrace();
        }
        return "" + code;
    }
}
