package ucl.ac.uk.main;

import javax.servlet.http.Part;
import java.io.IOException;
import java.util.ArrayList;

public interface ModelInterface {

    ArrayList<ItemList> getItems();
    ItemList getItem(String id);
    void addItem(String text, String name, String url, Part filePart, String linkList) throws IOException;
    void deleteItem(String id);
    void editItem(String id, String text, String url, Part filePart, String linkList) throws IOException;
}
