package omfg.service;

import omfg.model.Video;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public interface VideoService {
    void add(Video video);
    void update(Video video);
    void delete(int id);
    Video getById(int id);
    List<Video> getAll();
    Set<Video> getVideosWith(Map<String, String> tags);
}
