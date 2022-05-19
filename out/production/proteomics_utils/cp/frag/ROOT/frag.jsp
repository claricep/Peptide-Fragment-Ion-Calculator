<HTML>
<HEAD><TITLE>Output Page</TITLE></HEAD><BODY>
<CENTER><H2>Fragment Ion Calculator Results</H2></CENTER>
<HR WIDTH = 900><CENTER>

<%@ page import="cp.frag.*, java.util.*" %>


Sequence: <B>
<% String sequence = request.getParameter("sequence");
sequence = sequence.trim();
 out.println(sequence.trim());
 char[] copyInput = new char[sequence.length()];
 for(int i = 0; i < sequence.length(); i++){
            copyInput[i] += sequence.charAt(i);
 }
            AssignMass amassPar = new AssignMass(true);
           // AssignMass.setAionfragment(AssignMass.getnTerm() + amassPar.getH());
            AssignMass.setBionfragment(AssignMass.getnTerm() + amassPar.getH());
            AssignMass.setYionfragment(AssignMass.getcTerm() + amassPar.getOh() + amassPar.getH() + amassPar.getH());
           // AssignMass.setXionfragment(AssignMass.getcTerm() + 45.0f);
           // AssignMass.setZionfragment(AssignMass.getcTerm() + 3.0f);

            FragIonGenerator fragIonGenerator = new FragIonGenerator();
            fragIonGenerator.getFragIons("PEPTIDE");

          // List<Double> aFragList =  fragIonGenerator.getFragIons();
            List<Double> bFragList =  fragIonGenerator.getbFragList();
            //List<Double> cFragList =  fragIonGenerator.getcFragList();
          // List<Double> xFragList =  fragIonGenerator.getxFragList();
            List<Double> yFragList =  fragIonGenerator.getyFragList();
           // List<Double> zFragList =  fragIonGenerator.getzFragList();

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

            <!––-------------------------------frag table––-------------------------------->

<B><TABLE BORDER CELLPADDING=5><TR BGCOLOR=#D1E5EC><TH><FONT size=2><PRE>    Seq      </PRE></FONT></th><th><FONT size=4><PRE>     #     </PRE></font></th>
<%if(aCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=3F9E53>     A     ");  %> </th></PRE></FONT> <%}%>
<%if(bCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=BLUE>     B     ");  %> </th></PRE></FONT> <%}%>
<%if(cCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=PURPLE>     C     ");  %> </th></PRE></FONT> <%}%>
<%if(xCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=BROWN>     X     ");  %> </th></PRE></FONT> <%}%>
<%if(yCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=RED>     Y     ");  %> </th></PRE></FONT> <%}%>
<%if(zCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=1F563A>     Z     ");  %> </th></PRE></FONT> <%}%>
<th><PRE><font size=2>   # (+1)   </B><BR></font></PRE></TH></TR>


 <%

   for(int i = 0; i < copyInput.length; i++){

      out.print("<td style=text-align:center>" + copyInput[i] + "</td><td style=text-align:center>" + (i+1) + "</td>");
      if(aCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=3F9E53>" + bFragList.get(i) + "</FONT></td>");}
      if(bCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=BLUE>" + bFragList.get(i) + "</FONT></td>");}
      if(cCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=PURPLE>" + bFragList.get(i) + "</FONT></td>");}
      if(xCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=BROWN>" + yFragList.get(i) + "</FONT></td>");}
      if(yCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=RED>" + yFragList.get(i) + "</FONT></td>");}
      if(zCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR= 1F563A >" + yFragList.get(i) + "</FONT></td>");}
        out.print("<td style=text-align:center>" + (copyInput.length -i)  +"</td>");
        out.print("</tr>");
   }
    %>
    </td></tr></table><p>

<B><TABLE BORDER CELLPADDING=5><TR BGCOLOR=#FFFFCC><TD BGCOLOR=><PRE> Seq    # <FONT COLOR=BLUE>      B      </FONT><FONT COLOR=RED>      Y      </FONT>   # (+1) </B><BR></TD></TR><TR><TD><PRE>
  P     1 <FONT COLOR=BLUE>    98.06009 </FONT><FONT COLOR=RED>   800.36728 </FONT>   7
  E     2 <FONT COLOR=BLUE>   227.10268 </FONT><FONT COLOR=RED>   703.31452 </FONT>   6
  P     3 <FONT COLOR=BLUE>   324.15544 </FONT><FONT COLOR=RED>   574.27193 </FONT>   5
  T     4 <FONT COLOR=BLUE>   425.20312 </FONT><FONT COLOR=RED>   477.21916 </FONT>   4
  I     5 <FONT COLOR=BLUE>   538.28718 </FONT><FONT COLOR=RED>   376.17149 </FONT>   3
  D     6 <FONT COLOR=BLUE>   653.31413 </FONT><FONT COLOR=RED>   263.08742 </FONT>   2
  E     7 <FONT COLOR=BLUE>   782.35672 </FONT><FONT COLOR=RED>   148.06048 </FONT>   1
</TD></TR></TABLE><P>

</table>
</body>
</html>

                        <!––-------------------------------mass/charge table––-------------------------------->
<CENTER><H2>Mass/Charge Table</H2></CENTER>
<HR WIDTH = 900><CENTER>
<B><TABLE BORDER CELLPADDING=5><TR><TH><PRE>              </PRE></th><th  BGCOLOR=#D1E5EC colspan="2"><FONT size =4><PRE>        Mass      </PRE></FONT></th>
<tr><th></th><th BGCOLOR=#D1E5EC>       Mono     </th>
<th BGCOLOR=#D1E5EC>         Avg         </td></tr>
    <tr><td style=text-align:left>       (M)      </td> <td><%= "test" %> </td><td><%="test3" %></td></tr>
    <tr><td style=text-align:left>    (M+H)+     </td><td><%= "test" %> </td><td><%="test3" %></td></tr>
    <tr><td style=text-align:left>   (M+2H)<sup>2+</sup>     </td><td><%= "test" %> </td><td><%="test3" %></td></tr>
    <tr><td style=text-align:left>    (M+3H)<sup>3+</sup>     </td><td><%= "test" %> </td><td><%="test3" %></td></tr>
    <tr><td style=text-align:left>   (M+4H)<sup>4+</sup>     </B><BR></td><td><%= "test" %> </td><td><%="test3" %></td></tr>


</td></tr></table><p>

</table>
</body>
</html>



<TABLE BORDER WIDTH = 25%><TR><TH></TH><TH COLSPAN=2 BGCOLOR=#FFFFCC>Mass</TH></TR><TR><TH></TH><TH BGCOLOR=#FFFFCC>Mono</TH><TH BGCOLOR=#FFFFCC>Avg</TH></TR><TR><TH ALIGN = LEFT><NOBR>(M)</TH></NOBR><TD ALIGN=RIGHT><TT>799.36001</TT></TD><TD ALIGN=RIGHT><TT>799.83277</TT></TD></TR>
<TR><TH ALIGN = LEFT><NOBR>(M+H)<SUP>+</SUP></NOBR></TH><TD ALIGN=RIGHT><TT>800.36728</TT></TD><TD ALIGN=RIGHT><TT>800.84004</TT></TD></TR>
<TR><TH ALIGN = LEFT><NOBR>(M+2H)<SUP>2+</SUP></NOBR></TH><TD ALIGN=RIGHT><TT>400.68730</TT></TD><TD ALIGN=RIGHT><TT>400.92368</TT></TD></TR>
<TR><TH ALIGN = LEFT><NOBR>(M+3H)<SUP>3+</SUP></NOBR></TH><TD ALIGN=RIGHT><TT>267.46064</TT></TD><TD ALIGN=RIGHT><TT>267.61823</TT></TD></TR>
<TR><TH ALIGN = LEFT><NOBR>(M+4H)<SUP>4+</SUP></NOBR></TH><TD ALIGN=RIGHT><TT>200.84731</TT></TD><TD ALIGN=RIGHT><TT>200.96550</TT></TD></TR>
</TABLE><P>

<TABLE><TR><TD></TD></TR></TABLE>
</CENTER>
</BODY></HTML>

<% String nT = request.getParameter("nterm");
                            if(nT.equals("0.0") || nT.equals(null)){
                                out.println("");
                            }else{
                                out.println("N-terminus modification: " + nT + "<br>");
                            }
String cT = request.getParameter("cterm");
                               if(cT.equals("0.0") || cT.equals("")){
                                   out.println("");
                               }else{
                                   out.println("C-terminus modification: " + cT + "<br>");
                                }%>