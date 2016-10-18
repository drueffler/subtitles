<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <head><style type="text/css">center {color:white; font-family: "Century Gothic", CenturyGothic, AppleGothic, sans-serif;} </style>
    <script>
     var seconds = 0, minutes = 0, hours = 0, t;
     function add() {
       seconds++;
       if (seconds >= 60) { seconds = 0; minutes++;
          if (minutes >= 60) { minutes = 0; hours++;
       }  }
       document.getElementById('time').innerHTML = (hours ? (hours > 9 ? hours : "0" + hours) : "00") + ":" + (minutes ? (minutes > 9 ? minutes : "0" + minutes) : "00") + ":" + (seconds > 9 ? seconds : "0" + seconds);
       timerA();
     }
     function timerA() {
       t = setTimeout(add, 1000);
     }
     function timedText(){<xsl:for-each select="/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[not(preceding::Event[NoteOn]/Absolute/. = .)]">
                <xsl:variable name="tick"           select="." />
                <xsl:variable name="millisecPERtic" select="/TOTAL/tick-to-time/millisec-duration div /TOTAL/tick-to-time/tick-duration" />
                <xsl:variable name="msec"           select="floor($millisecPERtic * $tick)" />
                <xsl:variable name="note1"          select="(/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[. = $tick]/../NoteOn/@Note)[1]"/>
                <xsl:variable name="t1"             select="/TOTAL/scent-map/smell[note=$note1]/scent/text()" />
                <xsl:variable name="note2"          select="(/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[. = $tick]/../NoteOn/@Note)[2]"/>
                <xsl:variable name="t2"             select="/TOTAL/scent-map/smell[note=$note2]/scent/text()" />
                <xsl:variable name="note3"          select="(/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[. = $tick]/../NoteOn/@Note)[3]"/>
                <xsl:variable name="t3"             select="/TOTAL/scent-map/smell[note=$note3]/scent/text()" />

                <xsl:variable name="c1"><xsl:choose><xsl:when test="position() mod 6 = 1">'green'</xsl:when><xsl:when test="position() mod 6 = 2">'black'</xsl:when><xsl:when test="position() mod 6 = 3">'red'</xsl:when><xsl:when test="position() mod 6 = 4">'black'</xsl:when><xsl:when test="position() mod 6 = 5">'blue'</xsl:when><xsl:otherwise>'black'</xsl:otherwise></xsl:choose></xsl:variable>
                <xsl:variable name="c2"><xsl:choose><xsl:when test="position() mod 6 = 1">'green'</xsl:when><xsl:when test="position() mod 6 = 2">'black'</xsl:when><xsl:when test="position() mod 6 = 3">'red'</xsl:when><xsl:when test="position() mod 6 = 4">'black'</xsl:when><xsl:when test="position() mod 6 = 5">'blue'</xsl:when><xsl:otherwise>'black'</xsl:otherwise></xsl:choose></xsl:variable>
                <xsl:variable name="c3"><xsl:choose><xsl:when test="position() mod 6 = 1">'green'</xsl:when><xsl:when test="position() mod 6 = 2">'black'</xsl:when><xsl:when test="position() mod 6 = 3">'red'</xsl:when><xsl:when test="position() mod 6 = 4">'black'</xsl:when><xsl:when test="position() mod 6 = 5">'blue'</xsl:when><xsl:otherwise>'black'</xsl:otherwise></xsl:choose></xsl:variable>
                <xsl:variable name="c4"><xsl:choose><xsl:when test="position() mod 6 = 1">'green'</xsl:when><xsl:when test="position() mod 6 = 2">'black'</xsl:when><xsl:when test="position() mod 6 = 3">'red'</xsl:when><xsl:when test="position() mod 6 = 4">'black'</xsl:when><xsl:when test="position() mod 6 = 5">'blue'</xsl:when><xsl:otherwise>'black'</xsl:otherwise></xsl:choose></xsl:variable>

     setTimeout(f,<xsl:value-of select="$msec"/>,      &quot;scent11&quot;,&quot;<xsl:value-of select="$t1"/>&quot;,&quot;id1&quot;,&quot;<xsl:value-of select="$c1"/>&quot;); 
     setTimeout(f,<xsl:value-of select="$msec"/>,      &quot;scent12&quot;,&quot;<xsl:value-of select="$t2"/>&quot;,&quot;id1&quot;,&quot;<xsl:value-of select="$c1"/>&quot;);
     setTimeout(f,<xsl:value-of select="$msec"/>,      &quot;scent13&quot;,&quot;<xsl:value-of select="$t3"/>&quot;,&quot;id1&quot;,&quot;<xsl:value-of select="$c1"/>&quot;);

     setTimeout(f,<xsl:value-of select="$msec+5000"/>, &quot;scent21&quot;,&quot;<xsl:value-of select="$t1"/>&quot;,&quot;id2&quot;,&quot;<xsl:value-of select="$c2"/>&quot;);
     setTimeout(f,<xsl:value-of select="$msec+5000"/>, &quot;scent22&quot;,&quot;<xsl:value-of select="$t2"/>&quot;,&quot;id2&quot;,&quot;<xsl:value-of select="$c2"/>&quot;);
     setTimeout(f,<xsl:value-of select="$msec+5000"/>, &quot;scent23&quot;,&quot;<xsl:value-of select="$t3"/>&quot;,&quot;id2&quot;,&quot;<xsl:value-of select="$c2"/>&quot;);

     setTimeout(f,<xsl:value-of select="$msec+10000"/>,&quot;scent31&quot;,&quot;<xsl:value-of select="$t1"/>&quot;,&quot;id3&quot;,&quot;<xsl:value-of select="$c3"/>&quot;);
     setTimeout(f,<xsl:value-of select="$msec+10000"/>,&quot;scent32&quot;,&quot;<xsl:value-of select="$t2"/>&quot;,&quot;id3&quot;,&quot;<xsl:value-of select="$c3"/>&quot;);
     setTimeout(f,<xsl:value-of select="$msec+10000"/>,&quot;scent33&quot;,&quot;<xsl:value-of select="$t3"/>&quot;,&quot;id3&quot;,&quot;<xsl:value-of select="$c3"/>&quot;);

     setTimeout(f,<xsl:value-of select="$msec+15000"/>,&quot;scent41&quot;,&quot;<xsl:value-of select="$t1"/>&quot;,&quot;id4&quot;,&quot;<xsl:value-of select="$c4"/>&quot;);
     setTimeout(f,<xsl:value-of select="$msec+15000"/>,&quot;scent42&quot;,&quot;<xsl:value-of select="$t2"/>&quot;,&quot;id4&quot;,&quot;<xsl:value-of select="$c4"/>&quot;);
     setTimeout(f,<xsl:value-of select="$msec+15000"/>,&quot;scent43&quot;,&quot;<xsl:value-of select="$t3"/>&quot;,&quot;id4&quot;,&quot;<xsl:value-of select="$c4"/>&quot;
);</xsl:for-each>

     setTimeout(f,<xsl:value-of select="/TOTAL/tick-to-time/millisec-duration+15000"/>,      &quot;scent11&quot;,&quot;-&quot;,&quot;id1&quot;,&quot;black&quot;); 
     setTimeout(f,<xsl:value-of select="/TOTAL/tick-to-time/millisec-duration+15000"/>,      &quot;scent12&quot;,&quot;-&quot;,&quot;id1&quot;,&quot;black&quot;);
     setTimeout(f,<xsl:value-of select="/TOTAL/tick-to-time/millisec-duration+15000"/>,      &quot;scent13&quot;,&quot;-&quot;,&quot;id1&quot;,&quot;black&quot;);

     setTimeout(f,<xsl:value-of select="/TOTAL/tick-to-time/millisec-duration+20000"/>, &quot;scent21&quot;,&quot;-&quot;,&quot;id2&quot;,&quot;black&quot;);
     setTimeout(f,<xsl:value-of select="/TOTAL/tick-to-time/millisec-duration+20000"/>, &quot;scent22&quot;,&quot;-&quot;,&quot;id2&quot;,&quot;black&quot;);
     setTimeout(f,<xsl:value-of select="/TOTAL/tick-to-time/millisec-duration+20000"/>, &quot;scent23&quot;,&quot;-&quot;,&quot;id2&quot;,&quot;black&quot;);

     setTimeout(f,<xsl:value-of select="/TOTAL/tick-to-time/millisec-duration+25000"/>,&quot;scent31&quot;,&quot;-&quot;,&quot;id3&quot;,&quot;black&quot;);
     setTimeout(f,<xsl:value-of select="/TOTAL/tick-to-time/millisec-duration+25000"/>,&quot;scent32&quot;,&quot;-&quot;,&quot;id3&quot;,&quot;black&quot;);
     setTimeout(f,<xsl:value-of select="/TOTAL/tick-to-time/millisec-duration+25000"/>,&quot;scent33&quot;,&quot;-&quot;,&quot;id3&quot;,&quot;black&quot;);

     setTimeout(f,<xsl:value-of select="/TOTAL/tick-to-time/millisec-duration+30000"/>,&quot;scent41&quot;,&quot;-&quot;,&quot;id4&quot;,&quot;black&quot;);
     setTimeout(f,<xsl:value-of select="/TOTAL/tick-to-time/millisec-duration+30000"/>,&quot;scent42&quot;,&quot;-&quot;,&quot;id4&quot;,&quot;black&quot;);
     setTimeout(f,<xsl:value-of select="/TOTAL/tick-to-time/millisec-duration+30000"/>,&quot;scent43&quot;,&quot;-&quot;,&quot;id4&quot;,&quot;black&quot;);
}
     function f(lineID,scentTitle,columnID,columnColor){
        document.getElementById(lineID).innerHTML = scentTitle;
        document.getElementById(columnID).style.backgroundColor=columnColor;
     }
   </script>
  </head>
  <body style="background-color:#000000">
    <center><br /><br /></center>
    <center>osmodrama.com</center>
    <center><br /><br /></center>
    <center><button onclick="timerA(); timedText()">Scenting Phill Niblocks Baobap</button></center>
    <center><br /></center>
    <center>
    <table>
      <tr>
        <td id="id1" style="background-color:black">
           <b><center><div id="scent10">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</div><div id="scent11">-</div><div id="scent12">-</div><div id="scent13">-</div><div>&#160;</div></center></b>
        </td>
        <td id="id2" style="background-color:black">
           <b><center><div id="scent20">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</div><div id="scent21">-</div><div id="scent22">-</div><div id="scent23">-</div><div>&#160;</div></center></b>
        </td>
        <td id="id3" style="background-color:black">
           <b><center><div id="scent30">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</div><div id="scent31">-</div><div id="scent32">-</div><div id="scent33">-</div><div>&#160;</div></center></b>
        </td>
        <td id="id4" style="background-color:black">
           <b><center><div id="scent40">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</div><div id="scent41">-</div><div id="scent42">-</div><div id="scent43">-</div><div>&#160;</div></center></b>
        </td>
      </tr>
    </table>
    </center>
    <center><br /></center>
    <center><div id="time">--:--:--</div></center>
    <center><br /></center>
    <center>bit.ly/OsmoSmeller</center>
    <center><br /></center>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>