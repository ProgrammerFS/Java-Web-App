package ucl.ac.uk.main;

import java.io.IOException;
import java.util.List;

public interface KeyGeneratorInterface {
    public List<String> loadKeys() throws IOException;


    public String generateKey() throws IOException;
}
