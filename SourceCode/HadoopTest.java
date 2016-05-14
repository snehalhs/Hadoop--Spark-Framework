	import java.io.IOException;
	import java.util.*;
 	import org.apache.hadoop.fs.Path;
	import org.apache.hadoop.conf.*;
 	import org.apache.hadoop.io.*;
 	import org.apache.hadoop.mapred.*;
	import org.apache.hadoop.util.*;
	
	public class HadoopTest {
 	
 	   public static class Map extends MapReduceBase implements Mapper<LongWritable, Text, Text, Text> {
	     //private final static IntWritable one = new IntWritable(1);
 		  
		 
	     public void map(LongWritable key, Text value, OutputCollector<Text, Text> output, Reporter reporter) throws IOException {
		String line = value.toString();
		String key1=line.substring(0, 10);
		String value1=line.substring(10);
		Text t1 = new Text(key1);
		Text t2 = new Text(value1);
 	        output.collect(t1, t2);
	       }
	     }
	   
	
 	   public static class Reduce extends MapReduceBase implements Reducer<Text, Text, Text, Text> {
 	     public void reduce(Text key, Iterator<Text> values, OutputCollector<Text, Text> output, Reporter reporter) throws IOException {
 	    	 while (values.hasNext()) {
 	       output.collect(key, values.next());  //try.get()
		}
 	     }
 	   }
 	
 	     public static void main(String[] args) throws Exception {
	     String in="/user/ubuntu/gutenberg";
	     String out="/user/ubuntu/gutenberg-output";
 	     JobConf conf = new JobConf(HadoopTest.class);
 	     conf.setJobName("Terasort");
 	
 	     conf.setOutputKeyClass(Text.class); //text value
 	     conf.setOutputValueClass(Text.class); // text value
 	     conf.setMapperClass((Class<? extends Mapper>) Map.class);
 	     conf.setCombinerClass(Reduce.class);
 	     conf.setReducerClass(Reduce.class);
 	
 	     conf.setInputFormat(TextInputFormat.class); 
 	     conf.setOutputFormat(TextOutputFormat.class);
 	
 	     FileInputFormat.setInputPaths(conf, new Path(in)); //file name
 	     FileOutputFormat.setOutputPath(conf, new Path(out)); // directory name
 	
 	     JobClient.runJob(conf);
 	   }


 	}
