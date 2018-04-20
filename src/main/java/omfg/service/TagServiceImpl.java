package omfg.service;

import omfg.repository.TagRepository;
import omfg.model.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TagServiceImpl implements TagService{

    private TagRepository tagRepository;

    @Override
    @Transactional
    public List<Tag> getAll() {
        return tagRepository.findAll();
    }

    @Override
    @Transactional
    public Tag getTagById(int id) {
        return tagRepository.getTagById(id);
    }

    public void setTagRepository(TagRepository tagRepository) {
        this.tagRepository = tagRepository;
    }
}
