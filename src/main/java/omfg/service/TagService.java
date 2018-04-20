package omfg.service;

import omfg.model.Tag;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TagService {
    List<Tag> getAll();
    Tag getTagById(int id);
}
