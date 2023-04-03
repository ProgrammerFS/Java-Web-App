package ucl.ac.uk.main;

import java.io.File;
import java.io.IOException;
import javax.servlet.http.Part;
import java.nio.file.Files;

// Define the ImageManager class that writes images to a file.
public class ImageManager implements ImageManagerInterface {

    @Override
    public String writeImage(Part filePart, String id) throws IOException {
        String filename = filePart.getSubmittedFileName();
        byte[] fileContent = filePart.getInputStream().readAllBytes();
        // checking if the image has been uploaded or not
        if (!filename.equals("")) {
            String filepath = id + filename.substring(filename.lastIndexOf("."));
            File file = new File("./src/main/webapp/images/" + filepath);
            Files.write(file.toPath(), fileContent);
            String htmlpath = "images/" + filepath;
            return htmlpath;
        } else {
            // if image doesn't exist return the default-image.jpeg to avoid errors in the
            // code.
            return "images/default-image.png";
        }
    }

}
