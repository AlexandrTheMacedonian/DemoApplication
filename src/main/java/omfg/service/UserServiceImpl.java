package omfg.service;

import omfg.repository.RoleRepository;
import omfg.repository.UserRepository;
import omfg.model.Role;
import omfg.model.User;
import omfg.model.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import java.util.HashSet;
import java.util.Set;

/**
 *
 */

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        Set<Role> roles = new HashSet<>();
        roles.add(roleRepository.getOne(1L));
        user.setRoles(roles);
        userRepository.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public boolean iflike(Long id, int videoId) {
        Set<Video> fvideos = userRepository.getOne(id).getFvideos();
        for (Video video : fvideos){
            if (videoId == video.getId()) return true;
        }
        return false;
    }

    @Override
    public void like(Long user_id, Video video) {
        User user = userRepository.getOne(user_id);
        Set<Video> fvideos = user.getFvideos();
        fvideos.add(video);
        user.setFvideos(fvideos);
        userRepository.save(user);
    }

    @Override
    public void dislike(Long user_id, Video video) {
        User user = userRepository.getOne(user_id);
        Set<Video> fvideos = user.getFvideos();
        fvideos.remove(video);
        user.setFvideos(fvideos);
        userRepository.save(user);
    }
}
