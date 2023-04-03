package ucl.ac.uk.main;

import java.io.IOException;
import java.util.*;

//The KeyGenerator class uses the UUID library in Java to generate a unique random key for each itemList.

public class KeyGenerator implements KeyGeneratorInterface {


    @Override
    public ArrayList<String> loadKeys() throws IOException {
        Model model = ModelFactory.getModel();
        ArrayList<String> keys = new ArrayList<>();
        for (ItemList itemList : model.getItems()) {
            keys.add(itemList.getId());
        }
        return keys;
    }

    @Override
    public String generateKey() throws IOException {
        String uniquekey = "";
        ArrayList<String> existingKeys = loadKeys();
        do {
            uniquekey = UUID.randomUUID().toString();
        } while (existingKeys.contains(uniquekey));
        return uniquekey;
    }
}
