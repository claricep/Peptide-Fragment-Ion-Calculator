<HTML>
<TITLE><p style="font-family:Courier New">Output Page</p></TITLE>     </HEAD><BODY>
<CENTER><H1>Fragment Ion Calculator Results</H1></CENTER>
<HR WIDTH = 900><CENTER> </hr>
<BODY BGCOLOR="#F4F0EC">

<%@ page import="cp.frag.*, java.util.*" %>

Sequence: <B>
<% String input = request.getParameter("sequence");
input = input.replaceAll("\\s+","");
input = input.toUpperCase();

String sequence = "";
for (int i = 0; i < input.length(); i++) {
 if (!Character.isDigit(input.charAt(i))) {
                 sequence = sequence + input.charAt(i);
             }
}
 out.println(sequence);
 sequence = sequence + sequence.substring(sequence.length()-1);
 char[] copyInput = new char[sequence.length()+1];
 for(int i = 0; i < sequence.length()-1; i++){
            copyInput[i] += sequence.charAt(i);
}

            AssignMass amassPar = new AssignMass(true);
                        AssignMass.setAionfragment(AssignMass.getnTerm() + 27.99492f);
                        AssignMass.setBionfragment(AssignMass.getnTerm() + amassPar.getH());
                        AssignMass.setCionfragment(AssignMass.getnTerm() + 17.02654f);
                        AssignMass.setYionfragment(AssignMass.getcTerm() + amassPar.getOh() + amassPar.getH() + amassPar.getH());
                        AssignMass.setXionfragment(AssignMass.getcTerm() + 25.97926f);
                        AssignMass.setZionfragment(AssignMass.getcTerm() + 17.02545f);
                        AssignMass.setAaMasses(AssignMass.getAaMasses());


                        FragIonGenerator fragIonGenerator = new FragIonGenerator();
                        fragIonGenerator.getFragIons(sequence);

                        List<Double> aFragList =  fragIonGenerator.getaFragList();
                        List<Double> bFragList =  fragIonGenerator.getbFragList();
                        List<Double> cFragList =  fragIonGenerator.getcFragList();
                        List<Double> xFragList =  fragIonGenerator.getxFragList();
                        List<Double> yFragList =  fragIonGenerator.getyFragList();
                        List<Double> zFragList =  fragIonGenerator.getzFragList();

%></B>, &nbsp;

pI: <B>3.91367</B><BR>
<HR WIDTH = 300><CENTER> </hr>
<CENTER><H2>Fragment Ion Table, monoisotopic masses</H2></CENTER>

<% String massType = request.getParameter("massType");
   String charge = request.getParameter("charge");
   String aCB = request.getParameter("aCB");
   String bCB = request.getParameter("bCB");
   String cCB = request.getParameter("cCB");
   String xCB = request.getParameter("xCB");
   String yCB = request.getParameter("yCB");
   String zCB = request.getParameter("zCB");

                            %>

            <!––-------------------------------frag table one––-------------------------------->

            <td><H3 style="text-align:center"><u>Charge One</u></H3></td>

<B><TABLE BORDER CELLPADDING=5><TR BGCOLOR=#D1E5EC><TH><FONT size=2><PRE>    Seq      </PRE></FONT></th><th><FONT size=4><PRE>     #     </PRE></font></th>
<%if(aCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=3F9E53>     A     ");  %> </th></PRE></FONT> <%}%>
<%if(bCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=BLUE>     B     ");  %> </th></PRE></FONT> <%}%>
<%if(cCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=PURPLE>     C     ");  %> </th></PRE></FONT> <%}%>
<%if(xCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=BROWN>     X     ");  %> </th></PRE></FONT> <%}%>
<%if(yCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=RED>     Y     ");  %> </th></PRE></FONT> <%}%>
<%if(zCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR= ff8c00>     Z     ");  %> </th></PRE></FONT> <%}%>
<th><PRE><font size=2>   # (+1)   </B><BR></font></PRE></TH></TR>


 <%
 double total = bFragList.get(copyInput.length-3);

   for(int i = 0; i < copyInput.length-2; i++){

      out.print("<td style=text-align:center>" + copyInput[i] + "</td><td style=text-align:center>" + (i+1) + "</td>");
      if(aCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=3F9E53>" + aFragList.get(i) + "</FONT></td>");}
      if(bCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=BLUE>" + bFragList.get(i) + "</FONT></td>");}
      if((cCB != null) && (i == copyInput.length-3) && (cCB.equals("1"))){
        out.println("<td style=text-align:center><FONT size=2, COLOR=PURPLE>" + "-------" + "</FONT></td>");
      }else if(cCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=PURPLE>" + cFragList.get(i) + "</FONT></td>");}
      if((xCB != null) && (i == 0) && (xCB.equals("1")))
      {out.print("<td style=text-align:center><FONT size=2, COLOR=BROWN>" + "-------" + "</FONT></td>");}
      else if(xCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=BROWN>" + xFragList.get(i) + "</FONT></td>");}
      if(yCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=RED>" + yFragList.get(i) + "</FONT></td>");}
      if(zCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR= ff8c00 >" + zFragList.get(i) + "</FONT></td>");}
        out.print("<td style=text-align:center>" + (copyInput.length -i-2)  +"</td>");
        out.print("</tr>");
   }


    %>
    </td></tr></table><p>

<!––-------------------------------frag table two––-------------------------------->

            <td><H3 style="text-align:center"><u>Charge Two</u></H3></td>

<B><TABLE BORDER CELLPADDING=5><TR BGCOLOR=#D1E5EC><TH><FONT size=2><PRE>    Seq      </PRE></FONT></th><th><FONT size=4><PRE>     #     </PRE></font></th>
<%if(aCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=3F9E53>     A     ");  %> </th></PRE></FONT> <%}%>
<%if(bCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=BLUE>     B     ");  %> </th></PRE></FONT> <%}%>
<%if(cCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=PURPLE>     C     ");  %> </th></PRE></FONT> <%}%>
<%if(xCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=BROWN>     X     ");  %> </th></PRE></FONT> <%}%>
<%if(yCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=RED>     Y     ");  %> </th></PRE></FONT> <%}%>
<%if(zCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR= ff8c00>     Z     ");  %> </th></PRE></FONT> <%}%>
<th><PRE><font size=2>   # (+1)   </B><BR></font></PRE></TH></TR>


 <%

   for(int i = 0; i < copyInput.length-2; i++){

      out.print("<td style=text-align:center>" + copyInput[i] + "</td><td style=text-align:center>" + (i+1) + "</td>");
      if(aCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=3F9E53>" + (aFragList.get(i)+1.00728)/2 + "</FONT></td>");}
      if(bCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=BLUE>" + (bFragList.get(i)+1.00728)/2 + "</FONT></td>");}
      if((cCB != null) && (i == copyInput.length-3) && (cCB.equals("1"))){
        out.println("<td style=text-align:center><FONT size=2, COLOR=PURPLE>" + "-------" + "</FONT></td>");
      }else if(cCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=PURPLE>" + (cFragList.get(i)+1.00728)/2 + "</FONT></td>");}
      if((xCB != null) && (i == 0) && (xCB.equals("1")))
      {out.print("<td style=text-align:center><FONT size=2, COLOR=BROWN>" + "-------" + "</FONT></td>");}
      else if(xCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=BROWN>" + (xFragList.get(i)+1.00728)/2 + "</FONT></td>");}
      if(yCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=RED>" + (yFragList.get(i)+1.00728)/2 + "</FONT></td>");}
      if(zCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR= ff8c00 >" + (zFragList.get(i)+1.00728)/2 + "</FONT></td>");}
        out.print("<td style=text-align:center>" + (copyInput.length -i-2)  +"</td>");
        out.print("</tr>");
   }


    %>
    </td></tr></table><p>

                         <!––-------------------------------frag table three––-------------------------------->

                <td><H3 style="text-align:center"><u>Charge Three</u></H3></td>

    <B><TABLE BORDER CELLPADDING=5><TR BGCOLOR=#D1E5EC><TH><FONT size=2><PRE>    Seq      </PRE></FONT></th><th><FONT size=4><PRE>     #     </PRE></font></th>
    <%if(aCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=3F9E53>     A     ");  %> </th></PRE></FONT> <%}%>
    <%if(bCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=BLUE>     B     ");  %> </th></PRE></FONT> <%}%>
    <%if(cCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=PURPLE>     C     ");  %> </th></PRE></FONT> <%}%>
    <%if(xCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=BROWN>     X     ");  %> </th></PRE></FONT> <%}%>
    <%if(yCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=RED>     Y     ");  %> </th></PRE></FONT> <%}%>
    <%if(zCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR= ff8c00>     Z     ");  %> </th></PRE></FONT> <%}%>
    <th><PRE><font size=2>   # (+1)   </B><BR></font></PRE></TH></TR>


     <%

       for(int i = 0; i < copyInput.length-2; i++){

          out.print("<td style=text-align:center>" + copyInput[i] + "</td><td style=text-align:center>" + (i+1) + "</td>");
          if(aCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=3F9E53>" + (aFragList.get(i)+ 2*1.00728)/3 + "</FONT></td>");}
          if(bCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=BLUE>" + (bFragList.get(i)+ 2*1.00728)/3 + "</FONT></td>");}
          if((cCB != null) && (i == copyInput.length-3) && (cCB.equals("1"))){
            out.println("<td style=text-align:center><FONT size=2, COLOR=PURPLE>" + "-------" + "</FONT></td>");
          }else if(cCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=PURPLE>" + (cFragList.get(i)+ 2*1.00728)/3 + "</FONT></td>");}
          if((xCB != null) && (i == 0) && (xCB.equals("1")))
          {out.print("<td style=text-align:center><FONT size=2, COLOR=BROWN>" + "-------" + "</FONT></td>");}
          else if(xCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=BROWN>" + (xFragList.get(i)+ 2*1.00728)/3 + "</FONT></td>");}
          if(yCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=RED>" + (yFragList.get(i)+ 2*1.00728)/3 + "</FONT></td>");}
          if(zCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR= ff8c00 >" + (zFragList.get(i)+ 2*1.00728)/3 + "</FONT></td>");}
            out.print("<td style=text-align:center>" + (copyInput.length -i-2)  +"</td>");
            out.print("</tr>");
       }


        %>
        </td></tr></table><p>




                        <!––-------------------------------mass/charge table––-------------------------------->
<br><HR WIDTH = 900><CENTER>
<CENTER><H2>Mass/Charge Table</H2></CENTER>
<B><TABLE BORDER CELLPADDING=5><TR><TH><PRE>              </PRE></th><th  BGCOLOR=#D1E5EC colspan="2"><FONT size =4><PRE>      Mono Mass      </PRE></FONT></th>
    <tr><td style=text-align:left>       (M)      </td> <td><%= total + 18.0101022656 - 1.00729 %> </td></tr>
    <tr><td style=text-align:left>    (M+H)<sup>+</sup>    </td><td><%= total + 18.0101022656 %> </td></tr>
    <tr><td style=text-align:left>   (M+2H)<sup>2+</sup>     </td><td><%= (total + 18.0101022656+1.00729)/2 %> </td></tr>
    <tr><td style=text-align:left>    (M+3H)<sup>3+</sup>     </td><td><%= (total + 18.0101022656+(2*1.00729))/3 %> </td></tr>
    <tr><td style=text-align:left>   (M+4H)<sup>4+</sup>     </B></td><td><%= (total + 18.0101022656+ (3*1.00729))/4 %> </td></tr>


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