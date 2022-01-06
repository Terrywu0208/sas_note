/*�y�z�έp*/
proc univariate data=work.Ds0201;
var m; /*������*/
run;


/*�����    ���Ƥ��t*/
proc univariate data = work.Ds0201;
histogram m;
run;


/*������*/
proc sgplot data = work.Ds0229;
hbox Generic;
run;


/*������*/
proc univariate data=work.Ds0229 normal plot;
var Generic;
run;


/*����*/
proc gchart data = work.A;
pie Category / sumvar= Frequency;
run;
quit;


/*������*/
proc gchart data = work.A;
vbar Category / sumvar= Frequency;
run;
quit;


/*��u��*/
ods graphics / imagefmt=png width=1100px height=600px;
proc sgplot data=work.New0105;
series y=Data  x=Year / legendlabel = "person rank" markers  markerattrs=(symbol=circlefilled color=red  size=6)   lineattrs = (pattern=1 color=red   thickness = 2)  ;
run;


/*���p����*/
proc pareto data=work.DS0111;
vbar religion / freq=Members__millions_;
run;
quit;


/*��ƤӦh�ɭn�e�{�W���ϥi��*/
proc template;
  define statgraph axislegend ;
    begingraph;
      entrytitle "Religions";

      layout overlay / xaxisopts=(name="xaxis" discreteopts=(tickvaluefitpolicy=extract)) ;
        barchart category= x  response= y  / stat=mean ;
        axislegend "xaxis";
     endlayout;
    endgraph;
  end;
run;
proc sgrender data=work.DS0111 template=axislegend;
run;







