val start_time = System.currentTimeMillis()
val inputfile=sc.textFile("hdfs:////user/ubuntu/gutenberg")
val sort_file=inputfile.map(line => (line.take(10), line.drop(10)))
val sort = sort_file.sortByKey()
val lines=sort.map {case (key,value) => s"$key $value"}
lines.saveAsTextFile("/user/ubuntu/output")
val end_time = System.currentTimeMillis()
println ("Time taken to Sort :" + (end_time - start_time) + "ms")