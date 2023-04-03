package ucl.ac.uk.main;


import java.io.IOException;

// This class gives access to the model to any other class that needs it.
public class ModelFactory
{
    private static Model model;

    public static Model getModel() throws IOException
    {
        if (model == null)
        {
            model = new Model();
            model.readFile();
        }
        return model;
    }
}
