package omfg.service;

import omfg.model.Tag;
import omfg.repository.TagRepository;
import omfg.repository.VideoRepository;
import omfg.model.Video;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class VideoServiceImpl implements VideoService{

    private static final Logger logger = LoggerFactory.getLogger(VideoServiceImpl.class);

    private VideoRepository videoRepository;

    @Override
    @Transactional
    public void add(Video video) {
        videoRepository.add(video);
    }

    @Override
    @Transactional
    public void update(Video video) {
        videoRepository.update(video);
    }

    @Override
    @Transactional
    public void delete(int id) {
        videoRepository.delete(id);
    }

    @Override
    @Transactional
    public Video getById(int id) {
        return videoRepository.getById(id);
    }

    @Override
    @Transactional
    public List<Video> getAll() {
        return videoRepository.getAll();
    }

    @Override
    @Transactional
    public Set<Video> getVideosWith(Map<String, String> tags) {
        Set<Video> result = new HashSet<>();
        List<Video> allVideo = videoRepository.getAll();
        for (Video video : allVideo) {
            int count = 0;
            for (Tag tagv : video.getTags()) {
                for (Map.Entry<String, String> entry : tags.entrySet()) {
                    int id=0;
                    try {
                        id = Integer.parseInt(entry.getKey());
                    } catch (Exception e) {
                        logger.info("Catched _csrf token in values Map.");
                    }
                    if (tagv.getId() == id) count++;
                    if (count == tags.size()-1) {
                        result.add(video);
                        break;
                    }
                }
            }
        }
        return result;
    }

    public void setVideoRepository(VideoRepository videoRepository) {
        this.videoRepository = videoRepository;
    }

}
