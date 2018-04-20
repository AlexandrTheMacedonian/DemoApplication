package omfg.service;

import omfg.model.User;
import omfg.model.Video;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
    void save(User user);
    User findByUsername(String username);
    boolean iflike(Long id, int videoId);
    void like(Long user_id, Video video);
    void dislike(Long user_id, Video video);
}
