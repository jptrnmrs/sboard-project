package com.sboard.repository;

import com.sboard.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
    public int countUserByUid(String uid);
    public int countUserByNick(String nick);
    public int countUserByEmail(String email);
    public int countUserByHp(String hp);
    public User findByUidAndPass(String uid, String pass);
}
