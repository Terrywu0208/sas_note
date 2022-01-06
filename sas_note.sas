/*描述統計*/
proc univariate data=work.Ds0201;
var m; /*選用欄位*/
run;


/*直方圖    次數分配*/
proc univariate data = work.Ds0201;
histogram m;
run;


/*盒須圖*/
proc sgplot data = work.Ds0229;
hbox Generic;
run;


/*莖葉圖*/
proc univariate data=work.Ds0229 normal plot;
var Generic;
run;


/*圓餅圖*/
proc gchart data = work.A;
pie Category / sumvar= Frequency;
run;
quit;


/*長條圖*/
proc gchart data = work.A;
vbar Category / sumvar= Frequency;
run;
quit;


/*折線圖*/
ods graphics / imagefmt=png width=1100px height=600px;
proc sgplot data=work.New0105;
series y=Data  x=Year / legendlabel = "person rank" markers  markerattrs=(symbol=circlefilled color=red  size=6)   lineattrs = (pattern=1 color=red   thickness = 2)  ;
run;


/*帕雷托圖*/
proc pareto data=work.DS0111;
vbar religion / freq=Members__millions_;
run;
quit;


/*資料太多時要呈現柱狀圖可用*/
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







