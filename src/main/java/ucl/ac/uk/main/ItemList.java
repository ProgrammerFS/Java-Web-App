package ucl.ac.uk.main;

import javax.servlet.http.Part;
import java.io.IOException;

public class ItemList implements ItemListInterface {
    private String id;
    private String name;
    private String text;
    private String url;
    private String image;
    private String linkedlist;

    @Override
    public String getName() {
        return name;
    }

    @Override
    public void setName(String name) {
        this.name = name;
    }

    @Override
    public void setId() throws IOException {
        KeyGenerator keyGen = new KeyGenerator();
        this.id = keyGen.generateKey();
    }

    @Override
    public String getText() {
        return text;
    }

    @Override
    public void setText(String text) {
        this.text = text;
    }

    @Override
    public String getUrl() {
        return url;
    }

    @Override
    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setLinkedlist(String linkid) {
        this.linkedlist = linkid;
    }

    @Override
    public String getLinkedlist() {
        return this.linkedlist;
    }

    @Override
    public void setImage(Part filePart) throws IOException {
        if (filePart != null) {
            ImageManager imgbigList = new ImageManager();
            this.image = imgbigList.writeImage(filePart, this.id);
        } else {
            this.image = "images/default-image.png";
        }
    }

    @Override
    public String getImage() {
        return this.image;
    }
}
