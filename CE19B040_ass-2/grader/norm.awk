BEGIN{
        #print "FS set to ,";
        FS=",";
	grade="U";
}
{

        norm=($2+$3+$4)/(max*0.01);

	if(norm>90)
		grade="S";
	else if(norm>80)
		grade="A";
	else if(norm>70)
		grade="B";
	else if(norm>60)
		grade="C";
	else if(norm>50)
		grade="D";
	else if(norm>40)
		grade="E";


	if($1!="RollNO"){
		print $1,$2,$3,$4,norm,grade;
        }
        else{
               print $1,"Q1","Q2","FinalExam","NORM","GRADE";
        }
	
}
END{
}

