<HTML>
<HEAD><TITLE><p style="font-family:georgia">Output Page</p></TITLE></HEAD><BODY>
<CENTER><H2>Fragment Ion Calculator Results</H2></CENTER>
<HR WIDTH = 900><CENTER> </hr>

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
            AssignMass.setAionfragment(AssignMass.getnTerm());
            AssignMass.setBionfragment(AssignMass.getnTerm() + amassPar.getH());
            AssignMass.setCionfragment(AssignMass.getnTerm());
            AssignMass.setYionfragment(AssignMass.getcTerm() + amassPar.getOh() + amassPar.getH() + amassPar.getH());
            AssignMass.setXionfragment(AssignMass.getcTerm() + 45.0f);
            AssignMass.setZionfragment(AssignMass.getcTerm() + 2.0f);
            AssignMass.setAaMasses(AssignMass.getAaMasses());


            FragIonGenerator fragIonGenerator = new FragIonGenerator();
            fragIonGenerator.getFragIons("PEPTIDE");


            //Double[] aaMassAvg = new Double[];


            List<Double> aFragList =  fragIonGenerator.getaFragList();
            List<Double> bFragList =  fragIonGenerator.getbFragList();
            List<Double> cFragList =  fragIonGenerator.getcFragList();
            List<Double> xFragList =  fragIonGenerator.getxFragList();
            List<Double> yFragList =  fragIonGenerator.getyFragList();
            List<Double> zFragList =  fragIonGenerator.getzFragList();
%>

             </B>, &nbsp;
pI: <B>3.91367</B><BR>

<% String massType = request.getParameter("massType");
   String charge = request.getParameter("charge");
   String aCB = request.getParameter("aCB");
   String bCB = request.getParameter("bCB");
   String cCB = request.getParameter("cCB");
   String xCB = request.getParameter("xCB");
   String yCB = request.getParameter("yCB");
   String zCB = request.getParameter("zCB");

                            %>

            <!––-------------------------------frag table––-------------------------------->

<B><TABLE BORDER CELLPADDING=5><TR BGCOLOR=#D1E5EC><TH><FONT size=2><PRE>    Seq      </PRE></FONT></th><th><FONT size=4><PRE>     #     </PRE></font></th>
<%if(aCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=3F9E53>     A     ");  %> </th></PRE></FONT> <%}%>
<%if(bCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=BLUE>     B     ");  %> </th></PRE></FONT> <%}%>
<%if(cCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=PURPLE>     C     ");  %> </th></PRE></FONT> <%}%>
<%if(xCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=BROWN>     X     ");  %> </th></PRE></FONT> <%}%>
<%if(yCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=RED>     Y     ");  %> </th></PRE></FONT> <%}%>
<%if(zCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR= ff8c00>     Z     ");  %> </th></PRE></FONT> <%}%>
<th><PRE><font size=2>   # (+1)   </B><BR></font></PRE></TH></TR>


 <%

   for(int i = 0; i < copyInput.length-1; i++){

      out.print("<td style=text-align:center>" + copyInput[i] + "</td><td style=text-align:center>" + (i+1) + "</td>");
      if(aCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=3F9E53>" + aFragList.get(i) + "</FONT></td>");}
      if(bCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=BLUE>" + bFragList.get(i) + "</FONT></td>");}
      if(cCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=PURPLE>" + cFragList.get(i) + "</FONT></td>");}
      if(xCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=BROWN>" + xFragList.get(i) + "</FONT></td>");}
      if(yCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=RED>" + yFragList.get(i) + "</FONT></td>");}
      if(zCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR= ff8c00 >" + zFragList.get(i) + "</FONT></td>");}
        out.print("<td style=text-align:center>" + (copyInput.length -i)  +"</td>");
        out.print("</tr>");
   }


    %>
    </td></tr></table><p>




                        <!––-------------------------------mass/charge table––-------------------------------->
<CENTER><H2>Mass/Charge Table</H2></CENTER>
<HR WIDTH = 900><CENTER>
<B><TABLE BORDER CELLPADDING=5><TR><TH><PRE>              </PRE></th><th  BGCOLOR=#D1E5EC colspan="2"><FONT size =4><PRE>        Mass      </PRE></FONT></th>
<tr><th></th><th BGCOLOR=#D1E5EC>       Mono     </th>
<th BGCOLOR=#D1E5EC>         Avg         </td></tr>
    <tr><td style=text-align:left>       (M)      </td> <td><%= "test" %> </td><td><%="test3" %></td></tr>
    <tr><td style=text-align:left>    (M+H)<sup>+</sup>    </td><td><%= "test" %> </td><td><%="test3" %></td></tr>
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
                            if(nT.equals("") || nT.equals("0.0")){
                                out.println("");
                            }else{
                                out.println("N-terminus modification: " + nT + "<br>");
                            }
String cT = request.getParameter("cterm");
                               if(cT.equals("") || cT.equals("0.0")){
                                   out.println("");
                               }else{
                                   out.println("C-terminus modification: " + cT + "<br>");
                                }%>