
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

public class SharedMemory {

	long split_size = 10000000; // 10Mb
	String input=" /user/ubuntu/gutenberg";	//input file path
	String outputFolder="/user/ubuntu/gutenberg-output/";	//output folder
		
	static int no_threads;
	
	public static void main(String[] args) throws Exception 
	{
		no_threads = args[0];
		long startTime=System.currentTimeMillis();
		SharedMemory SharedMemory = new SharedMemory();
		SharedMemory.fileSplitSort();
		long finishTime = System.currentTimeMillis();
		long elapsedTime = (finishTime - startTime);
		
		System.out.println("Time taken to sort 10GB in:" + (elapsedTime - finishTime) + "ms");
	}
	
	public void fileSplitSort() throws IOException
	{
		File file = new File(input);
		long file_size = file.length();
		
		long threads_requiured = file_size / split_size;
	    ExecutorService es = Executors.newFixedThreadPool(no_threads);

	    for (int i = 0; i<threads_requiured; i++)
	    {
    	Runnable worker = new SplitThread(i);
    		es.execute(worker);
	    }
	    es.shutdown();
	    while (!es.isTerminated())
	    {
	    	
	    }
				
		mergeFiles();
		
		}
	
	
	public void mergeFiles(){
		File f = new File (outputFolder);
		String [] files = f.list();
		System.out.println("Number of files : " + files.length);
		for (int i=0; i<files.length; i++){
			for (int j = i+1 ; j<files.length; j++){
				System.out.println("File1 : " + files[i]);
				System.out.println("File2 : " + files[j]);
				System.out.println("=====================");
				sortTwoFiles(files[i], files[j]);
			}
		}
	}

	private void sortTwoFiles(String file1, String file2) {
		FileReader in1;
		FileReader in2;
		Set<String> set = new TreeSet<String>();
		try {
			in1 = new FileReader(outputFolder + file1);
			BufferedReader br1 = new BufferedReader(in1);
			in2 = new FileReader(outputFolder + file2);
			BufferedReader br2 = new BufferedReader(in2);
			String line = br1.readLine();
			while (null!= line)
			{
				set.add(line);
				line = br1.readLine();
			}
			 line = br2.readLine();
			 while (null!= line)
				{
					set.add(line);
					line = br2.readLine();
				}
			 br1.close();
			 br2.close();
			 in1.close();
			 in2.close();
			 
			FileWriter fw1 = new FileWriter(outputFolder + file1);
			FileWriter fw2 = new FileWriter(outputFolder + file2);
			
			int mid = set.size()/2;
			int k = 0;
			
			for (String strLine : set){
				if (k<mid){
					fw1.write(strLine);
					fw1.write("\n");
				}else{
					fw2.write(strLine);
					fw2.write("\n");
				}
				k++;
			}
			fw1.flush();
			fw2.flush();
			fw1.close();
			fw2.close();
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
