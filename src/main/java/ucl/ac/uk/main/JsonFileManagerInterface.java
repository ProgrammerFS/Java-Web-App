package ucl.ac.uk.main;

import java.util.ArrayList;

public interface JsonFileManagerInterface {
    ArrayList<ItemList> read();

    void write(ArrayList<ItemList> arr);

}
