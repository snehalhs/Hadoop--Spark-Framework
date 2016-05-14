Steps to run the code 

1. Hadoop 
   	1.1 Single Node Setup  
		1.1.1 chmod u+x Run.sh
		1.1.2 ./Run --> This script will install java, ssh, adds the key and opens the bashrc and configuration files 
		1.1.3 ./RunLocal.sh --> Copy the pem file, gensort and valsort from local 
		1.1.4 Update the bashrc 
				export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
				export HADOOP_INSTALL=/home/ubuntu/hadoop-2.7.2
				export PATH=$PATH:$HADOOP_INSTALL/bin
				export PATH=$PATH:$HASOOP_INSTALL/sbin
				export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
				export HADOOP_COMMON_HOME=$HADOOP_INSTALL
				export HADOOP_HDFS_HOME=$HADOOP_INSTALL
				export YARN_HOME=$HADOOP_INSTALL
				export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_INSTALL/lib/native
				export HADOOP_OPTS='-Djava.library.path=$HADOOP_INSTALL/lib'
		1.1.5 Update the core-site.xml
				<property>
				<name>fs.default.name</name>
				<value>hdfs://ec2-52-90-68-182.compute-1.amazonaws.com:9000</value>
				</property>
				<property>
				<name>hadoop.tmp.dir</name>
				<value>/data</value>
				<description>base location for other hdfs directories.</description>
				</property>
		1.1.6 Update the hadoop-env.sh
				export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
		1.1.7 Update the hdfs-site.xml
				<property>
				<name>dfs.replication</name>
				<value>1</value>
				</property>
				<property>
				<name>dfs.permissions</name>
				<value>false</value>
				</property>
		1.1.8 Update the mapred-site.xml
				<configuration>
				<property>
				<name>mapreduce.job.tracker</name>
				<value>hdfs://ec2-52-90-68-182.compute-1.amazonaws.com:9001</value>
				</property>
				<property>
				<name>mapreduce.framework.name</name>
				<value>yarn</value></property>
				</configuration>
		1.1.9 Update the yarn-site.xml
				<property>
				<name>yarn.nodemanager.aux-services</name>
				<value>mapreduce_shuffle</value>
				</property>
				<property>
				<name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
				<value>org.apache.hadoop.mapred.ShuffleHandler</value></property>
				<property>
				<name>yarn.resourcemanager.resource-tracker.address</name>
				<value>ec2-52-90-68-182.compute-1.amazonaws.com:9025</value>
				</property>
				<property>
				<name>yarn.resourcemanager.scheduler.address</name>
				<value>ec2-52-90-68-182.compute-1.amazonaws.com:9030</value>
				</property>
				<property>
				<name>yarn.resourcemanager.address</name>
				<value>ec2-52-90-68-182.compute-1.amazonaws.com:9050</value>
				</property>
				<property>
				<name>yarn.resourcemanager.webapp.address</name>
				<value>ec2-52-90-68-182.compute-1.amazonaws.com:9006</value>
				</property>
				<property>
				<name>yarn.resourcemanager.admin.address</name>
				<value>ec2-52-90-68-182.compute-1.amazonaws.com:9008</value>
				</property>
				<property>
				<name>yarn.nodemanager.vmem-pmem-ratio</name>
				<value>2.1</value>
				</property> 
	1.2 Multi Node Setup 
		1.2.1 chmod u+x MultiRun.sh
		1.2.2 ./MultiRun.sh
		1.2.3 Update the bashrc 
				export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
				export HADOOP_INSTALL=/home/ubuntu/hadoop-2.7.2
				export PATH=$PATH:$HADOOP_INSTALL/bin
				export PATH=$PATH:$HASOOP_INSTALL/sbin
				export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
				export HADOOP_COMMON_HOME=$HADOOP_INSTALL
				export HADOOP_HDFS_HOME=$HADOOP_INSTALL
				export YARN_HOME=$HADOOP_INSTALL
				export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_INSTALL/lib/native
				export HADOOP_OPTS='-Djava.library.path=$HADOOP_INSTALL/lib'
		1.2.4 Update the core-site.xml
				<property>
				<name>fs.default.name</name>
				<value>hdfs://ec2-52-90-68-182.compute-1.amazonaws.com:9000</value>
				</property>
				<property>
				<name>hadoop.tmp.dir</name>
				<value>/data</value>
				<description>base location for other hdfs directories.</description>
				</property>
		1.2.5 Update the hadoop-env.sh
				export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
		1.2.6 Update the hdfs-site.xml
				<property>
				<name>dfs.replication</name>
				<value>1</value>
				</property>
				<property>
				<name>dfs.permissions</name>
				<value>false</value>
				</property>
		1.2.7 Update the mapred-site.xml
				<configuration>
				<property>
				<name>mapreduce.job.tracker</name>
				<value>hdfs://ec2-52-90-68-182.compute-1.amazonaws.com:9001</value>
				</property>
				<property>
				<name>mapreduce.framework.name</name>
				<value>yarn</value></property>
				</configuration>
		1.2.8 Update the yarn-site.xml
				<property>
				<name>yarn.nodemanager.aux-services</name>
				<value>mapreduce_shuffle</value>
				</property>
				<property>
				<name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
				<value>org.apache.hadoop.mapred.ShuffleHandler</value></property>
				<property>
				<name>yarn.resourcemanager.resource-tracker.address</name>
				<value>ec2-52-90-68-182.compute-1.amazonaws.com:9025</value>
				</property>
				<property>
				<name>yarn.resourcemanager.scheduler.address</name>
				<value>ec2-52-90-68-182.compute-1.amazonaws.com:9030</value>
				</property>
				<property>
				<name>yarn.resourcemanager.address</name>
				<value>ec2-52-90-68-182.compute-1.amazonaws.com:9050</value>
				</property>
				<property>
				<name>yarn.resourcemanager.webapp.address</name>
				<value>ec2-52-90-68-182.compute-1.amazonaws.com:9006</value>
				</property>
				<property>
				<name>yarn.resourcemanager.admin.address</name>
				<value>ec2-52-90-68-182.compute-1.amazonaws.com:9008</value>
				</property>
				<property>
				<name>yarn.nodemanager.vmem-pmem-ratio</name>
				<value>2.1</value>
				</property> 
		1.2.9 Create image of the Master Node
		1.2.10 Create 16 Slaves using the image
		1.2.11 Connect to each slave node using the ssh command bellow 
				ssh -i /home/snehal/pa2/hadoop.pem ubuntu@52.90.68.182
		1.2.12 chmod u+x Update.sh 
		1.2.13 ./Update --> This script will mount the EBS volume and open the hosts and slaves to update manually 
		1.2.14 Update each of the slaves with public DNS of Master and Slave of Slave Node 
				ec2-52-90-68-182.compute-1.amazonaws.com
				ec2-52-90-143-48.compute-1.amazonaws.com
		1.2.15 Update each of the host with private IP public DNS of Master and Slave of Slave Node
		       172.31.31.253 ec2-52-90-143-48.compute-1.amazonaws.com
			   172.31.31.1 ec2-52-90-68-182.compute-1.amazonaws.com
		1.2.16 chmod u+x Master.sh 
		1.2.17 ./Master.sh --> open the hosts and slaves to update manually and copy all the keys to slaves
		1.2.18	Update the slaves of public DNS of Master and Slave of Master Node 
				ec2-52-90-143-48.compute-1.amazonaws.com
				ec2-54-165-7-232.compute-1.amazonaws.com
				ec2-54-165-65-45.compute-1.amazonaws.com
				ec2-54-85-106-15.compute-1.amazonaws.com
				ec2-54-173-231-189.compute-1.amazonaws.com
				ec2-54-173-132-3.compute-1.amazonaws.com
				ec2-54-173-95-125.compute-1.amazonaws.com
				ec2-54-89-112-24.compute-1.amazonaws.com
				ec2-52-91-137-40.compute-1.amazonaws.com
				ec2-54-172-66-178.compute-1.amazonaws.com
				ec2-52-90-169-137.compute-1.amazonaws.com
				ec2-54-89-122-163.compute-1.amazonaws.com
				ec2-54-173-68-102.compute-1.amazonaws.com
				ec2-52-90-141-123.compute-1.amazonaws.com
				ec2-54-85-72-182.compute-1.amazonaws.com
				ec2-54-173-128-111.compute-1.amazonaws.com			
				ec2-52-90-68-182.compute-1.amazonaws.com
		1.2.17 Update each of the host with private IP public DNS of Master and Slave of Slave Node 
				172.31.31.253 ec2-52-90-143-48.compute-1.amazonaws.com
				172.31.31.254 ec2-54-165-7-232.compute-1.amazonaws.com
				172.31.31.249 ec2-54-165-65-45.compute-1.amazonaws.com 
				172.31.31.250 ec2-54-85-106-15.compute-1.amazonaws.com 
				172.31.31.251 ec2-54-173-231-189.compute-1.amazonaws.com
				172.31.31.252 ec2-54-173-132-3.compute-1.amazonaws.com 
				172.31.31.239 ec2-54-173-95-125.compute-1.amazonaws.com 
				172.31.31.245 ec2-52-91-137-40.compute-1.amazonaws.com 
				172.31.31.246 ec2-54-172-66-178.compute-1.amazonaws.com 
				172.31.31.247 ec2-52-90-169-137.compute-1.amazonaws.com
				172.31.31.248 ec2-54-89-122-163.compute-1.amazonaws.com 
				172.31.31.241 ec2-54-173-68-102.compute-1.amazonaws.com 
				172.31.31.242 ec2-52-90-141-123.compute-1.amazonaws.com 
				172.31.31.243 ec2-54-85-72-182.compute-1.amazonaws.com 
				172.31.31.244 ec2-54-173-128-111.compute-1.amazonaws.com 
				172.31.31.1 ec2-52-90-68-182.compute-1.amazonaws.com

2. Shared Memory Sort 
	2.1 Connect to the instance using the ssh command 
				ssh -i /home/snehal/pa2/hadoop.pem ubuntu@52.90.163.45
	2.2 Copy files from local to instance 
			scp -i hadoop.pem /home/snehal/pa2/SharedMemorySort.java ubuntu@52.90.163.45:/home/ubuntu
			scp -i hadoop.pem /home/snehal/pa2/SplitThread.java ubuntu@52.90.163.45:/home/ubuntu
			scp -i hadoop.pem /home/snehal/pa2/gensort-linux-1.5/64/gensort ubuntu@52.90.163.45:/home/ubuntu
			scp -i hadoop.pem /home/snehal/pa2/gensort-linux-1.5/64/valsort ubuntu@52.90.163.45:/home/ubuntu
	2.3 chmod u+x SharedRun.sh
	2.4 ./SharedRun.sh --> This script will mount EBS volume compile the code and run for multiple threads( Provide as argument)
		
3. Spark 
	3.1 Single Node Setup 
		3.1.1 Connect to the instance using the ssh command 
				ssh -i /home/snehal/pa2/hadoop.pem ubuntu@54.183.68.117
		3.1.2 Copy pem file from local to instance 
				scp -i hadoop.pem /home/snehal/pa2/hadoop.pem ubuntu@54.183.68.117:/home/ubuntu
		3.1.3 chmod u+x SparkRun.sh 
		3.1.4 ./SparkRun.sh --> installs spark and fires the command to start 1 node 
		3.1.5 ./SparkSsh.sh --> Copy files to root 
		3.1.6 ./RootSpark.sh --> Generates data, executes the code, captures the first 10 lines and the last 10 lines
		
	3.2 Multi Node Setup 
		3.2.1 Connect to the instance using the ssh command 
				ssh -i /home/snehal/pa2/hadoop.pem ubuntu@54.183.68.117
		3.2.2 Copy pem file from local to instance 
				scp -i hadoop.pem /home/snehal/pa2/hadoop.pem ubuntu@54.183.68.117:/home/ubuntu
		3.2.3 chmod u+x SparkRun.sh 
		3.2.4 ./MultipleSparkRun.sh --> installs spark and fires the command to start 16 node 
		3.2.5 ./SparkSsh.sh --> Copy files to root 
		3.2.6 ./RootSpark.sh --> Generates data, executes the code, captures the first 10 lines and the last 10 lines