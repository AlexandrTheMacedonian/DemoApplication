package omfg.repository;

import omfg.model.Video;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Data accsess object.
 */

@Repository
public class VideoRepositoryImpl implements VideoRepository {

    private static final Logger logger = LoggerFactory.getLogger(VideoRepositoryImpl.class);

    private SessionFactory sessionFactory;

    @Override
    public void add(Video video) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(video);
        logger.info("Video successfully added.\nVideo info:\n"+video);
    }

    @Override
    public void update(Video video) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(video);
        logger.info("Video successfully updated.\nVideo info:\n"+video);
    }

    @Override
    public void delete(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Video video = (Video) session.load(Video.class, id);
        if (video!=null) session.delete(video);
        logger.info("Video successfully removed.\nVideo info:\n"+video);
    }

    @Override
    public Video getById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Video video = (Video) session.load(Video.class, id);
        logger.info("Successfully got video by id.\n Video: " + video);
        return video;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Video> getAll() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Video> products = session.createQuery("from Video").list();
        logger.info("Successfully got all video.");
        return products;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
