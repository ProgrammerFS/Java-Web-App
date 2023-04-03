package ucl.ac.uk.main;

import javax.servlet.http.Part;
import java.io.IOException;

public interface ItemListInterface {

    String getName();

    void setName(String name);

    void setId() throws IOException;

    public String getText();
    public String getUrl();
    public void setText(String text);
    public void setUrl(String url);

    String getId();

    void setLinkedlist(String linkid);

    String getLinkedlist();

    void setImage(Part filePart) throws IOException;
    String getImage();

}