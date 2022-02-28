<HTML>
<HEAD><TITLE>Output Page</TITLE></HEAD><BODY>
<CENTER><H2>Fragment Ion Calculator Results</H2></CENTER>
<HR WIDTH = 900><CENTER>
<%
boolean mono = true;
boolean average = false;
boolean charge1 = true;
boolean charge2 = false;
boolean charge3 = false;
boolean a = false;
boolean b = true;
boolean c = false;
boolean x = false;
boolean y = true;
boolean z = false;
%>
Sequence: <B><% String sequence = request.getParameter("sequence");
             out.println(sequence);
                char[] copyInput = new char[sequence.length()];
            for(int i = 0; i < sequence.length(); i++){
                        copyInput[i] += sequence.charAt(i);
                    }

             %></B>, &nbsp;
pI: <B>3.91367</B><BR>
<H3>Fragment Ion Table, 
monoisotopic masses
</H3>



<TABLE BORDER CELLPADDING=5>
<!DOCTYPE html>
<html>
<head>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding-top: 10px;
  padding-bottom: 20px;
  padding-left: 30px;
  padding-right: 40px;
}
</style>
</head>
<body>

<h2>Fragment Ion Table </h2>

<table style="width:100%">
  <tr>
      <th>Seq</th>
      <th>#</th>
      <th>      B      </th>
      <th>      Y      </th>
      <th>   # (+1) </th>
    </tr>
  <tr>
<%

  for(int i = 0; i < copyInput.length; i++){

     out.print("<td>" + copyInput[i] + "</td><td>" + (i+1) + "</td>");
      out.print("</tr>");

  }

  for(int i = copyInput.length; i > 0; i--){
        out.print("<td>" + (i+1) + "</td>");
        out.print("</tr>");
    }


 %>


</table>
</body>
</html>




* N-terminus modification: <% String nT = request.getParameter("nterm");
                            out.println(nT);%>
* C-terminus modification: <% String cT = request.getParameter("cterm");
                                out.println(cT);%>



<B><TABLE BORDER CELLPADDING=5><TR BGCOLOR=#FFFFCC><TD BGCOLOR=><PRE> Seq    # <FONT COLOR=BLUE>      B      </FONT><FONT COLOR=RED>      Y      </FONT>   # (+1) </B><BR></TD></TR><TR><TD><PRE>
  P     1 <FONT COLOR=BLUE>    98.06009 </FONT><FONT COLOR=RED>   800.36728 </FONT>   7
  E     2 <FONT COLOR=BLUE>   227.10268 </FONT><FONT COLOR=RED>   703.31452 </FONT>   6 
  P     3 <FONT COLOR=BLUE>   324.15544 </FONT><FONT COLOR=RED>   574.27193 </FONT>   5 
  T     4 <FONT COLOR=BLUE>   425.20312 </FONT><FONT COLOR=RED>   477.21916 </FONT>   4 
  I     5 <FONT COLOR=BLUE>   538.28718 </FONT><FONT COLOR=RED>   376.17149 </FONT>   3 
  D     6 <FONT COLOR=BLUE>   653.31413 </FONT><FONT COLOR=RED>   263.08742 </FONT>   2 
  E     7 <FONT COLOR=BLUE>   782.35672 </FONT><FONT COLOR=RED>   148.06048 </FONT>   1 
</TD></TR></TABLE><P>


<H3>Mass/Charge Table</H3>
<TABLE BORDER WIDTH = 25%><TR><TH></TH><TH COLSPAN=2 BGCOLOR=#FFFFCC>Mass</TH></TR><TR><TH></TH><TH BGCOLOR=#FFFFCC>Mono</TH><TH BGCOLOR=#FFFFCC>Avg</TH></TR><TR><TH ALIGN = LEFT><NOBR>(M)</TH></NOBR><TD ALIGN=RIGHT><TT>799.36001</TT></TD><TD ALIGN=RIGHT><TT>799.83277</TT></TD></TR>
<TR><TH ALIGN = LEFT><NOBR>(M+H)<SUP>+</SUP></NOBR></TH><TD ALIGN=RIGHT><TT>800.36728</TT></TD><TD ALIGN=RIGHT><TT>800.84004</TT></TD></TR>
<TR><TH ALIGN = LEFT><NOBR>(M+2H)<SUP>2+</SUP></NOBR></TH><TD ALIGN=RIGHT><TT>400.68730</TT></TD><TD ALIGN=RIGHT><TT>400.92368</TT></TD></TR>
<TR><TH ALIGN = LEFT><NOBR>(M+3H)<SUP>3+</SUP></NOBR></TH><TD ALIGN=RIGHT><TT>267.46064</TT></TD><TD ALIGN=RIGHT><TT>267.61823</TT></TD></TR>
<TR><TH ALIGN = LEFT><NOBR>(M+4H)<SUP>4+</SUP></NOBR></TH><TD ALIGN=RIGHT><TT>200.84731</TT></TD><TD ALIGN=RIGHT><TT>200.96550</TT></TD></TR>
</TABLE><P>

<TABLE><TR><TD></TD></TR></TABLE>
</CENTER>
</BODY></HTML>
