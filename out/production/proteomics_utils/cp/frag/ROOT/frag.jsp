<HTML>
<HEAD><TITLE>Output Page</TITLE></HEAD><BODY>
<CENTER><H2>Fragment Ion Calculator Results</H2></CENTER>
<HR WIDTH = 900><CENTER>

<%@ page import="cp.frag.AssignMass" %>


Sequence: <B>
<% String sequence = request.getParameter("sequence");
 out.println(sequence);
 char[] copyInput = new char[sequence.length()];
 for(int i = 0; i < sequence.length(); i++){
            copyInput[i] += sequence.charAt(i);
 }

            AssignMass amassPar = new AssignMass(true);
            AssignMass.setBionfragment(AssignMass.getnTerm() + amassPar.getH());
            AssignMass.setYionfragment(AssignMass.getcTerm() + amassPar.getOh() + amassPar.getH() + amassPar.getH());

            FragIonGenerator fragIonGenerator = new FragIonGenerator();
            fragIonGenerator.getFragIons("PEPTIDE");

            List<Double> bFragList =  fragIonGenerator.getbFragList();
                System.out.println(bFragList);
            List<Double> yFragList =  fragIonGenerator.getyFragList();
                System.out.println(yFragList);


%>

             </B>, &nbsp;
pI: <B>3.91367</B><BR>

<% String massType = request.getParameter("massType");
                            out.println("==mass type==>>" + massType);
   String charge = request.getParameter("charge");
                                out.println("==charge==>>" + charge);
   String aCB = request.getParameter("aCB");
                                   out.println("==A==>>" + aCB);
   String bCB = request.getParameter("bCB");
                                   out.println("==B==>>" + bCB);
   String cCB = request.getParameter("cCB");
                                   out.println("==C==>>" + cCB);
   String xCB = request.getParameter("xCB");
                                      out.println("==X==>>" + xCB);
   String yCB = request.getParameter("yCB");
                                      out.println("==Y==>>" + yCB);
   String zCB = request.getParameter("zCB");
                                      out.println("==Z==>>" + zCB);

                            %>

<B><TABLE BORDER CELLPADDING=5><TR BGCOLOR=#FFFFCC><TD BGCOLOR=><PRE>    Seq      </PRE></td><td><PRE>     #     </PRE></td><td><PRE><FONT COLOR=BLUE>     B     </PRE></td><td><PRE></FONT><FONT COLOR=RED>      Y      </PRE></td><td><PRE></FONT>   # (+1)   </B><BR></PRE></TD></TR><TR><PRE>

 <%
   for(int i = 0; i < copyInput.length; i++){
      out.print("<td style=text-align:center>" + copyInput[i] + "</td><td style=text-align:center>"
      + (i+1) + "</td><td style=text-align:center><FONT COLOR=BLUE>" + "b"
      + "</FONT></td><td style=text-align:center><FONT COLOR=RED>"
      + "y" + "</FONT></td>");

      out.print("<td>" + (copyInput.length -i)  +"</td>");
      out.print("</tr>");

   }
    %>






<B><TABLE BORDER CELLPADDING=5><TR BGCOLOR=#FFFFCC><TD BGCOLOR=><PRE> Seq    # <FONT COLOR=BLUE>      B      </FONT><FONT COLOR=RED>      Y      </FONT>   # (+1) </B><BR></TD></TR><TR><TD><PRE>
  P     1 <FONT COLOR=BLUE>    98.06009 </FONT><FONT COLOR=RED>   800.36728 </FONT>   7
  E     2 <FONT COLOR=BLUE>   227.10268 </FONT><FONT COLOR=RED>   703.31452 </FONT>   6
  P     3 <FONT COLOR=BLUE>   324.15544 </FONT><FONT COLOR=RED>   574.27193 </FONT>   5
  T     4 <FONT COLOR=BLUE>   425.20312 </FONT><FONT COLOR=RED>   477.21916 </FONT>   4
  I     5 <FONT COLOR=BLUE>   538.28718 </FONT><FONT COLOR=RED>   376.17149 </FONT>   3
  D     6 <FONT COLOR=BLUE>   653.31413 </FONT><FONT COLOR=RED>   263.08742 </FONT>   2
  E     7 <FONT COLOR=BLUE>   782.35672 </FONT><FONT COLOR=RED>   148.06048 </FONT>   1
</TD></TR></TABLE><P>

<%
  for(int i = 0; i < copyInput.length; i++){

     out.print("<td>" + copyInput[i] + "</td><td>" + (i+1) + "</td>");
      out.print("</tr>");
  }
 %>
 <tr>
 <%


  %>


</table>
</body>
</html>




* N-terminus modification: <% String nT = request.getParameter("nterm");
                            out.println(nT);%>
* C-terminus modification: <% String cT = request.getParameter("cterm");
                                out.println(cT);%>


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
