package omfg.model;

import javax.persistence.*;
import java.util.Set;

/**
 * Base entity
 */

@Entity
@Table(name = "video")
public class Video {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String src;
    private String file;
    private String description;

    //@ManyToMany(mappedBy = "fvideos")
    //private Set<User> users;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "video_tag", joinColumns = @JoinColumn(name = "video_id"),
            inverseJoinColumns = @JoinColumn(name = "tag_id"))
    private Set<Tag> tags;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<Tag> getTags() {
        return tags;
    }

    public void setTags(Set<Tag> tags) {
        this.tags = tags;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Video video = (Video) o;

        return id == video.id;
    }

    @Override
    public int hashCode() {
        return id;
    }

    @Override
    public String toString() {
        return "Video{" +
                "id=" + id +
                ", src='" + src + '\'' +
                ", file='" + file + '\'' +
                ", description='" + description + '\'' +
                ", tags=" + tags +
                '}';
    }
}
