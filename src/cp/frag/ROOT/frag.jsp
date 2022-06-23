<HTML>
<head>
        <title>Fragment Ion Results</title>
    </head>
<TITLE><p style="font-family:Times New Roman">Output Page</p></TITLE>     </HEAD><BODY>
<CENTER><H1>Fragment Ion Calculator Results</H1></CENTER>
<HR WIDTH = 900><CENTER> </hr>
<BODY BGCOLOR="#FAF9F6">

<%@ page import="cp.frag.*, java.util.*" %>


        
        

Sequence: <B>
<% String input = request.getParameter("sequence");
input = input.replaceAll("\\s+","");
input = input.toUpperCase();

String sequence = "";
AssignMass.resetAA();
for (int i = 0; i < input.length(); i++) {
 if (!Character.isDigit(input.charAt(i))) {
                 sequence = sequence + input.charAt(i);
             }
}
 out.println(sequence);
 char[] copyInput = new char[sequence.length()];
 for(int i = 0; i < sequence.length(); i++){
            copyInput[i] += sequence.charAt(i);
}
            String nT = request.getParameter("nterm");
            float n = 0;
            if(nT.equals("") || nT.equals("0.0")){
                n =0;
            }else{
                n = Float.parseFloat(nT);
            }

            String cT = request.getParameter("cterm");
            float c = 0;
            if(cT.equals("") || cT.equals("0.0")){
                c =0;
            }else{
                 c = Float.parseFloat(cT);
                 }

        //aa + pos
        float addMass = 0;
        String type = " p e d";
        type=type.replaceAll("\\s+","");
        type = type.toUpperCase();
        type.trim();

        ArrayList<Character> ch = new ArrayList<Character>();
        String value = request.getParameter("addModifVal");
        ArrayList<Float> pos = new ArrayList<Float>();
        if(type.length() == 0 || value.length() == 0){
                    out.println("");
        }else{

            String array[]= value.split(" ");
            for (int i = 0; i < type.length(); i++) {
                ch.add(type.charAt(i));
             }

            String array1[]= value.split(" ");
            for (String temp: array1){
                float num = Float.parseFloat(temp);
                pos.add(num);
            }

            for(int i = 0; i < ch.size(); i ++){
                AssignMass.addAAValue(ch.get(i), pos.get(i));
            }


            for (int i = 0; i < sequence.length(); i++) {
                for (int j = 0; j < ch.size(); j++) {
                    if (sequence.charAt(i) == ch.get(j)) {
                        addMass += pos.get(j);
                    }
                }
            }out.println("==--> " + addMass);

        }

        AssignMass amassPar = new AssignMass(true);
        AssignMass.setAionfragment(AssignMass.getnTerm() + 27.99492f);
        AssignMass.setBionfragment(AssignMass.getnTerm() + amassPar.getH());
        AssignMass.setCionfragment(AssignMass.getnTerm() + 17.02654f);
        AssignMass.setXionfragment(AssignMass.getcTerm() + 51.95803814f);
        AssignMass.setYionfragment(AssignMass.getcTerm() + amassPar.getOh() + amassPar.getH() + amassPar.getH());
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

pI: <B>
<%
        double pi = org.biojava.nbio.aaproperties.PeptideProperties.getIsoelectricPoint(sequence);
        out.println((Math.round(pi*1000000.0)/1000000.0));
%>
</B><BR>

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
   String AA = request.getParameter("zCB");


                            %>

            <!––-------------------------------frag table one––-------------------------------->

            <td><H3 style="text-align:center; color:383838;"><u>Charge One</u></H3></td>

<B><TABLE BORDER CELLPADDING=4><TR BGCOLOR=#D1E5EC><TH><FONT size=2><PRE>    Seq      </PRE></FONT></th><th><FONT size=2><PRE>     #     </PRE></font></th>
<%if(aCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=3F9E53>     A     ");  %> </th></PRE></FONT> <%}%>
<%if(bCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=BLUE>     B     ");  %> </th></PRE></FONT> <%}%>
<%if(cCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=PURPLE>     C     ");  %> </th></PRE></FONT> <%}%>
<%if(xCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=BROWN>     X     ");  %> </th></PRE></FONT> <%}%>
<%if(yCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=RED>     Y     ");  %> </th></PRE></FONT> <%}%>
<%if(zCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR= ff8c00>     Z     ");  %> </th></PRE></FONT> <%}%>
<th><PRE><font size=2>   # (+1)   </B><BR></font></PRE></TH></TR>


 <%

   for(int i = 0; i < copyInput.length; i++){
      out.print("<td style=text-align:center>" + copyInput[i] + "</td><td style=text-align:center>" + (i+1) + "</td>");
      if(aCB != null && i == copyInput.length-1){out.print("<td style=text-align:left><FONT size=2, COLOR=3F9E53>&nbsp;&nbsp;&nbsp;" + (Math.round((aFragList.get(i)+n+c)*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      else if(aCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=3F9E53>&nbsp;&nbsp;&nbsp;" + ((Math.round((aFragList.get(i)+n)*1000000.0)/1000000.0)) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      if(bCB != null && i == copyInput.length-1){out.print("<td style=text-align:left><FONT size=2, COLOR=BLUE>&nbsp;&nbsp;&nbsp;" + (Math.round((bFragList.get(i)+n+c)*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      else if(bCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=BLUE>&nbsp;&nbsp;&nbsp;" + ((Math.round((bFragList.get(i)+n)*1000000.0)/1000000.0)) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      if((cCB != null) && (i == copyInput.length-1) && (cCB.equals("1"))){
        out.println("<td style=text-align:center><FONT size=2, COLOR=PURPLE>&nbsp;&nbsp;&nbsp;" + "-------" + "&nbsp;&nbsp;&nbsp;</FONT></td>");
      }else if(cCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=PURPLE>&nbsp;&nbsp;&nbsp;" + ((Math.round((cFragList.get(i)+n)*1000000.0)/1000000.0)) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      if((xCB != null) && (i == 0) && (xCB.equals("1")))
      {out.print("<td style=text-align:center><FONT size=2, COLOR=BROWN>&nbsp;&nbsp;&nbsp;" + "-------" + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      else if(xCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=BROWN>&nbsp;&nbsp;&nbsp;" + ((Math.round((xFragList.get(i)+c)*1000000.0)/1000000.0)) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      if(yCB != null && i == 0){out.print("<td style=text-align:left><FONT size=2, COLOR=RED>&nbsp;&nbsp;&nbsp;" + (Math.round((yFragList.get(i)+n+c)*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      else if(yCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=RED>&nbsp;&nbsp;&nbsp;" + ((Math.round((yFragList.get(i)+c)*1000000.0)/1000000.0)) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      if(zCB != null && i == 0){out.print("<td style=text-align:left><FONT size=2, COLOR=ff8c00>&nbsp;&nbsp;&nbsp;" + (Math.round((zFragList.get(i)+n+c)*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      else if(zCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=ff8c00>&nbsp;&nbsp;&nbsp;" + ((Math.round((zFragList.get(i)+c)*1000000.0)/1000000.0)) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
        out.print("<td style=text-align:center>&nbsp;&nbsp;&nbsp;" + (copyInput.length -i)  + "&nbsp;&nbsp;&nbsp;</td>");
        out.print("</tr>");
   }


    %>
    </td></tr></table><p>

<!––-------------------------------frag table two––-------------------------------->

            <td><H3 style="text-align:center; color:383838;"><u>Charge Two</u></H3></td>

<B><TABLE BORDER CELLPADDING=4><TR BGCOLOR=#D1E5EC><TH><FONT size=2><PRE>    Seq      </PRE></FONT></th><th><FONT size=2><PRE>     #     </PRE></font></th>
<%if(aCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=3F9E53>     A     ");  %> </th></PRE></FONT> <%}%>
<%if(bCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=BLUE>     B     ");  %> </th></PRE></FONT> <%}%>
<%if(cCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=PURPLE>     C     ");  %> </th></PRE></FONT> <%}%>
<%if(xCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=BROWN>     X     ");  %> </th></PRE></FONT> <%}%>
<%if(yCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=RED>     Y     ");  %> </th></PRE></FONT> <%}%>
<%if(zCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR= ff8c00>     Z     ");  %> </th></PRE></FONT> <%}%>
<th><PRE><font size=2>   # (+1)   </B><BR></font></PRE></TH></TR>


 <%

   for(int i = 0; i < copyInput.length; i++){

      out.print("<td style=text-align:center>" + copyInput[i] + "</td><td style=text-align:center>" + (i+1) + "</td>");
      if(aCB != null && i == copyInput.length-1){out.print("<td style=text-align:left><FONT size=2, COLOR=3F9E53>&nbsp;&nbsp;&nbsp;" + (Math.round((((aFragList.get(i)+1.00728)/2)+(n/2)+(c/2))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      else if(aCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=3F9E53>&nbsp;&nbsp;&nbsp;" + (Math.round((((aFragList.get(i)+1.00728)/2)+(n/2))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      if(bCB != null && i == copyInput.length-1){out.print("<td style=text-align:left><FONT size=2, COLOR=BLUE>&nbsp;&nbsp;&nbsp;" + (Math.round((((bFragList.get(i)+1.00728)/2)+(n/2)+(c/2))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      else if(bCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=BLUE>&nbsp;&nbsp;&nbsp;" + (Math.round((((bFragList.get(i)+1.00728)/2)+(n/2))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      if((cCB != null) && (i == copyInput.length-1) && (cCB.equals("1"))){
        out.println("<td style=text-align:center><FONT size=2, COLOR=PURPLE>&nbsp;&nbsp;&nbsp;" + "-------" + "&nbsp;&nbsp;&nbsp;</FONT></td>");
      }else if(cCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=PURPLE>&nbsp;&nbsp;&nbsp;" + (Math.round((((cFragList.get(i)+1.00728)/2)+(n/2))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      if((xCB != null) && (i == 0) && (xCB.equals("1")))
      {out.print("<td style=text-align:center><FONT size=2, COLOR=BROWN>&nbsp;&nbsp;&nbsp;" + "-------" + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      else if(xCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=BROWN>&nbsp;&nbsp;&nbsp;" + (Math.round((((xFragList.get(i)+1.00728)/2)+(c/2))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      if(yCB != null && i == 0){out.print("<td style=text-align:left><FONT size=2, COLOR=RED>&nbsp;&nbsp;&nbsp;" + (Math.round((((yFragList.get(i)+1.00728)/2)+(n/2)+(c/2))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      else if(yCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=RED>&nbsp;&nbsp;&nbsp;" + (Math.round((((yFragList.get(i)+1.00728)/2)+(c/2))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      if(zCB != null && i == 0){out.print("<td style=text-align:left><FONT size=2, COLOR=ff8c00>&nbsp;&nbsp;&nbsp;" + (Math.round((((zFragList.get(i)+1.00728)/2)+(n/2)+(c/2))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
      else if(zCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=ff8c00>&nbsp;&nbsp;&nbsp;" + (Math.round((((zFragList.get(i)+1.00728)/2)+(c/2))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
        out.print("<td style=text-align:center>" + (copyInput.length -i)  +"</td>");
        out.print("</tr>");
   }


    %>
    </td></tr></table><p>

                         <!––-------------------------------frag table three––-------------------------------->

                <td><H3 style="text-align:center; color:383838;"><u>Charge Three</u></H3></td>

    <B><TABLE BORDER CELLPADDING=4><TR BGCOLOR=#D1E5EC><TH><FONT size=2><PRE>    Seq      </PRE></FONT></th><th><FONT size=2><PRE>     #     </PRE></font></th>
    <%if(aCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=3F9E53>     A     ");  %> </th></PRE></FONT> <%}%>
    <%if(bCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=BLUE>     B     ");  %> </th></PRE></FONT> <%}%>
    <%if(cCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=PURPLE>     C     ");  %> </th></PRE></FONT> <%}%>
    <%if(xCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=BROWN>     X     ");  %> </th></PRE></FONT> <%}%>
    <%if(yCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR=RED>     Y     ");  %> </th></PRE></FONT> <%}%>
    <%if(zCB != null){out.println("<PRE><th style=text-align:center><FONT size = 2, COLOR= ff8c00>     Z     ");  %> </th></PRE></FONT> <%}%>
    <th><PRE><font size=2>   # (+1)   </B><BR></font></PRE></TH></TR>


     <%

       for(int i = 0; i < copyInput.length; i++){

          out.print("<td style=text-align:center>" + copyInput[i] + "</td><td style=text-align:center>" + (i+1) + "</td>");
          if(aCB != null && i == copyInput.length-1){out.print("<td style=text-align:left><FONT size=2, COLOR=3F9E53>&nbsp;&nbsp;&nbsp;" + (Math.round((((aFragList.get(i)+ 2*1.00728)/3)+(n/3)+(c/3))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
          else if(aCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=3F9E53>&nbsp;&nbsp;&nbsp;" + (Math.round((((aFragList.get(i)+ 2*1.00728)/3)+(n/3))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
          if(bCB != null && i == copyInput.length-1){out.print("<td style=text-align:left><FONT size=2, COLOR=BLUE>&nbsp;&nbsp;&nbsp;" + (Math.round((((bFragList.get(i)+ 2*1.00728)/3)+(n/3)+(c/3))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
          else if(bCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=BLUE>&nbsp;&nbsp;&nbsp;" + (Math.round((((bFragList.get(i)+ 2*1.00728)/3)+(n/3))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
          if((cCB != null) && (i == copyInput.length-1) && (cCB.equals("1"))){
            out.println("<td style=text-align:center><FONT size=2, COLOR=PURPLE>&nbsp;&nbsp;&nbsp;" + "-------" + "&nbsp;&nbsp;&nbsp;</FONT></td>");
          }else if(cCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=PURPLE>&nbsp;&nbsp;&nbsp;" + (Math.round((((cFragList.get(i)+ 2*1.00728)/3)+(n/3))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
          if((xCB != null) && (i == 0) && (xCB.equals("1")))
          {out.print("<td style=text-align:center><FONT size=2, COLOR=BROWN>&nbsp;&nbsp;&nbsp;" + "-------" + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
          else if(xCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=BROWN>&nbsp;&nbsp;&nbsp;" + (Math.round((((xFragList.get(i)+ 2*1.00728)/3)+(c/3))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
          if(yCB != null && i == 0){out.print("<td style=text-align:left><FONT size=2, COLOR=RED>&nbsp;&nbsp;&nbsp;" + (Math.round((((yFragList.get(i)+ 2*1.00728)/3)+(n/3)+(c/3))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
          else if(yCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=RED>&nbsp;&nbsp;&nbsp;" + (Math.round((((yFragList.get(i)+ 2*1.00728)/3)+(c/3))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
          if(zCB != null && i == 0){out.print("<td style=text-align:left><FONT size=2, COLOR=ff8c00>&nbsp;&nbsp;&nbsp;" + (Math.round((((zFragList.get(i)+ 2*1.00728)/3)+(n/3)+(c/3))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
          else if(zCB != null){out.print("<td style=text-align:left><FONT size=2, COLOR=ff8c00>&nbsp;&nbsp;&nbsp;" + (Math.round((((zFragList.get(i)+ 2*1.00728)/3)+(c/3))*1000000.0)/1000000.0) + "&nbsp;&nbsp;&nbsp;</FONT></td>");}
            out.print("<td style=text-align:center>" + (copyInput.length -i)  +"</td>");
            out.print("</tr>");

       }

        double total = bFragList.get(copyInput.length-1);
        %>
        </td></tr></table><p>




                        <!––-------------------------------mass/charge table––-------------------------------->
<br>
<CENTER><H2>Mass/Charge Table</H2></CENTER>
<B><TABLE BORDER CELLPADDING=5><TR><TH><PRE>              </PRE></th><th  BGCOLOR=#D1E5EC colspan="2"><FONT size =4><PRE>      Mono Mass      </PRE></FONT></th>
    <tr><td style=text-align:left>       (M)      </td> <td><%= (Math.round((total +18.0101022656 - 1.00729+ n + c)*1000000.0)/1000000.0) %> </td></tr>
    <tr><td style=text-align:left>    (M+H)<sup>+</sup>    </td><td><%= (Math.round((total + 18.0101022656 + n + c)*1000000.0)/1000000.0) %> </td></tr>
    <tr><td style=text-align:left>   (M+2H)<sup>2+</sup>     </td><td><%= (Math.round(((total + 18.0101022656+1.00729+ n + c)/2)*1000000.0)/1000000.0) %> </td></tr>
    <tr><td style=text-align:left>    (M+3H)<sup>3+</sup>     </td><td><%= (Math.round(((total + n + c+ 18.0101022656+(2*1.00729))/3)*1000000.0)/1000000.0) %> </td></tr>
    <tr><td style=text-align:left>   (M+4H)<sup>4+</sup>     </B></td><td><%= (Math.round(((total +18.0101022656+ n + c+ (3*1.00729))/4)*1000000.0)/1000000.0) %> </td></tr>


</td></tr></table><p>

</table>
</body>
</html>





<%
                            if(nT.equals("") || nT.equals("0.0")){
                                out.println("");
                            }else{
                                out.println("N-terminus modification: " + nT + "<br>");
                            }

                            if(cT.equals("") || cT.equals("0.0")){
                                out.println("");
                            }else{
                               out.println("C-terminus modification: " + cT + "<br>");
                            }%>
