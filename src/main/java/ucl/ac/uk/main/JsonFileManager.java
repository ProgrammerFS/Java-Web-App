package ucl.ac.uk.main;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;

//Defined the JsonFileManager class to read and write the lists to the lists.json file using the gson libraray.
public class JsonFileManager implements JsonFileManagerInterface {
    private final String filename = "./lists.json";

    public ArrayList<ItemList> read() {
        Gson gson = new Gson();
        try {
            BufferedReader br = new BufferedReader(new FileReader(filename));
            Type type = new TypeToken<ArrayList<ItemList>>() {
            }.getType();
            // convert the json string back to object
            ArrayList<ItemList> itemLists = gson.fromJson(br, type);
            if (itemLists == null) {
                return new ArrayList<ItemList>();
            }
            return itemLists;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void write(ArrayList<ItemList> arr) {
        Gson gson = new Gson();
        String json = gson.toJson(arr);
        try {
            FileWriter writer = new FileWriter(filename);
            writer.write(json);
            writer.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
