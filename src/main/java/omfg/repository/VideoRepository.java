package omfg.repository;


import omfg.model.Video;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VideoRepository {
    void add(Video video);
    void update(Video video);
    void delete(int id);
    Video getById(int id);
    List<Video> getAll();
}
