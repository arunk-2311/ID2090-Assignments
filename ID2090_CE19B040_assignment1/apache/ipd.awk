BEGIN{
	i=0;
}
{
	arr[$1,i++]=$2;
	D[$1];
	I[i];
}
END{
	for(d in D){
		count=0;
		for(i in I){
			if(length(arr[d,i])!=0){
				#print count+1,d,arr[d,i];
				count++;
			}
		}
		print "|__",d,"__|__",count,"__|";
	}
}
