<HTML>
<HEAD>
<TITLE>PROTEOMICS TOOLKIT</TITLE>
</HEAD>

<BODY BGCOLOR="#F4F0EC">
<H1><CENTER><b><FONT FACE="Times New Roman" COLOR="#003366">Fragment Ion Calculator</CENTER></b></FONT></H1>

<HR WIDTH = 900> </hr><B>
<UL> <center>
  The calculator takes protein sequences in single-letter code (not including ambiguous amino acids).
  <br>Each sequence should be written on its own line.
  <br>Whitespace and numbers are ignored within the sequence.
  <br> Mass Type is automatically set to Mono
</UL>


<HR>

        <H3><FONT FACE="Arial" COLOR="#003366">Peptide Sequence</FONT></H3>

        <FORM METHOD=GET ACTION="frag.jsp">
        <TABLE BORDER=0><TR VALIGN = TOP><TR>
         <TD VALIGN=TOP WIDTH=300><B><TT><FONT COLOR="#003366">Peptide:</B></TT></FONT><BR>
         <TEXTAREA NAME="sequence" ROWS=2 COLS=30>PEPTIDE</TEXTAREA> &nbsp;
         <BR><INPUT TYPE=submit VALUE="Submit"> <INPUT TYPE=reset VALUE="Reset"></TD>
         <TD>&nbsp;</TD>
         <TD VALIGN=TOP WIDTH=135><PRE><B><FONT COLOR="#003366">Ion types:</FONT>
         <INPUT TYPE="checkbox" NAME="aCB" VALUE="1" >A  <INPUT TYPE="checkbox" NAME="xCB" VALUE="1" >X
         <INPUT TYPE="checkbox" NAME="bCB" VALUE="1" CHECKED>B  <INPUT TYPE="checkbox" NAME="yCB" VALUE="1" CHECKED>Y
         <INPUT TYPE="checkbox" NAME="cCB" VALUE="1" >C  <INPUT TYPE="checkbox" NAME="zCB" VALUE="1" >Z</PRE></TD>
        </TR>
        <TR>
        <TD COLSPAN=4 ALIGN=CENTER>
        </TD>
        </TR></TABLE>


<HR>
        <H3><FONT FACE="Arial" COLOR="#003366">Modifications (optional)</FONT></H3>

                <TABLE BORDER=0>
                <TR VALIGN=TOP>
                <TD ALIGN=RIGHT><TT><B><FONT COLOR="#003366">Add to N- or C-terminus: </FONT></TT></TD>
                <TD></TD>
                <TD WIDTH=150><TT><FONT COLOR="#003366">N-terminus</FONT></TT><BR>
                    <INPUT TYPE="TEXT" NAME="nterm" VALUE="0.0" SIZE="5" MAXLENTH="5"> </TD>
                <TD WIDTH=150><TT><FONT COLOR="#003366">C-terminus</FONT></TT><BR>
                    <INPUT TYPE="TEXT" NAME="cterm" VALUE="0.0" SIZE="5" MAXLENTH="5"> </TD>
                </TR>
                <TR VALIGN=TOP>

                <TD><PRE><B><FONT FACE="Arial" COLOR="#003366">Add to all AA residues and/or specific location: </FONT>

                  e.g.  C   57.0
                        3   80.0</B>
                  (add +57 to all Cys and
                   add +80 to 3rd AA residue)</TT></TD>
                <TD></TD>
                <TD><TT><FONT COLOR="#003366">AA or Pos &nbsp;</FONT></TT><BR>
                    <TEXTAREA NAME="addModifType" ROWS=3 COLS=3></TEXTAREA></TD>

                <TD><TT><FONT COLOR="#003366">Value</FONT></TT><BR>
                    <TEXTAREA NAME="addModifVal" ROWS=3 COLS=5></TEXTAREA></TD>
                </TR>
                </TABLE>

                </B>


</BODY>
</HTML>