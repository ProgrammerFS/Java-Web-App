package ucl.ac.uk.main;

import javax.servlet.http.Part;
import java.io.IOException;

public interface ImageManagerInterface {

    String writeImage(Part filePart, String id) throws IOException;
}
