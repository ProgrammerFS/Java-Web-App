package ucl.ac.uk.main;

import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

//A singleton that stores the lists of all items.
//It also performs operations like add, delete and edit.
public class Model implements ModelInterface {
    private ArrayList<ItemList> itemLists;
    private JsonFileManager fileManager;

    public void readFile() {
        this.fileManager = new JsonFileManager();
        this.itemLists = fileManager.read();
    }

    public ArrayList<ItemList> getItems() {
        return itemLists;
    }

    public ItemList getItem(String id) {
        for (ItemList itemList : itemLists) {
            if (itemList.getId().equals(id)) {
                return itemList;
            }
        }

        return null;
    }

    public void addItem(String text, String name, String url, Part filePart, String linkList) throws IOException {
        ItemList itemList = new ItemList();
        itemList.setText(text);
        itemList.setUrl(url);
        itemList.setName(name);
        itemList.setId();
        itemList.setImage(filePart);
        itemList.setLinkedlist(linkList);
        itemLists.add(itemList);
        fileManager.write(itemLists);
    }

    public void rename(String id, String name) {
        ItemList itemList = getItem(id);
        itemList.setName(name);
        fileManager.write(this.itemLists);
    }

    public void deleteItem(String id) {
        ArrayList<ItemList> arr = getItems();
        ItemList to_delete = getItem(id);
        String filepath = getItem(id).getImage();
        String dirPath = "./src/main/webapp/";
        File file = new File(dirPath + filepath);
        if (!to_delete.getImage().equals(dirPath + "images/default-image.png")) {
            file.delete();
        }
        if (!arr.isEmpty()) {
            for (ItemList itemList : arr) {
                if (itemList.getLinkedlist() != null) {
                    if (itemList.getLinkedlist().equals(id)) {
                        itemList.setLinkedlist(null);
                    }
                }

            }
        }
        arr.remove(to_delete);
        this.itemLists = arr;

        fileManager.write(arr);
    }

    public void editItem(String id, String text, String url, Part filePart, String linkList) throws IOException {
        ItemList itemList = getItem(id);
        String filepath = itemList.getImage();
        String dirPath = "./src/main/webapp/";
        File file = new File(dirPath + filepath);
        if (!getItem(id).getImage().equals(dirPath + "images/default-image.png")) {
            file.delete();
        }
        itemList.setText(text);
        itemList.setUrl(url);
        itemList.setImage(filePart);
        itemList.setLinkedlist(linkList);
        fileManager.write(this.itemLists);
        readFile();
    }
}
