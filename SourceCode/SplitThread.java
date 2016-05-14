import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.FileNotFoundException;
import java.util.concurrent.Executors;
import java.io.FileReader;
import java.util.Set;
import java.io.BufferedReader;
import java.util.TreeSet;
import java.util.concurrent.ExecutorService;

public class SplitThread implements Runnable{

	int fileno;
	
	String input="/user/ubuntu/gutenberg";	//input file path
	String outputFolder="/user/ubuntu/gutenberg-output/";	//output folder
	
	public SplitThread(int fileno) 
	{
		this.fileno = fileno;
	}
	
	@Override
	public void run() {
		Set<String> set = new TreeSet<String>();
		try 
		{
		FileReader in = new FileReader(input);
		BufferedReader br = new BufferedReader(in);
		    
	    br.skip(fileno * 10000000);
	    for (int i = 0; i < 100000; i++)
	    {
	    	set.add( br.readLine());
	    	}
		    	
		    FileWriter fw = new FileWriter(new File(outputFolder + "temp" + fileno +".txt"));
		    for (String lineStr : set){
		    	fw.write(lineStr);
		    	fw.write("\n");
	    }
	    fw.flush();
	    fw.close();
	    br.close();
		} catch (FileNotFoundException e) {
		e.printStackTrace();
		} catch (IOException e) {
		e.printStackTrace();
		}
	}
	
}
