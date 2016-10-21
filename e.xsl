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
        document.getElementById('time').innerHTML = 
          (hours ? (hours > 9 ? hours : "0" + hours) : "00") + ":" + (minutes ? (minutes > 9 ? minutes : "0" + minutes) : "00") + ":" + (seconds > 9 ? seconds : "0" + seconds);
        timerA();
     }
     
     function timerA() {
       t = setTimeout(add, 1000);
     }

     var SVGRoot

     function timedText(){
       SVGRoot=evt.target
       <xsl:for-each select="/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[not(preceding::Event[NoteOn]/Absolute/. = .)]">
       <xsl:variable name="tick"     select="." />
       <xsl:variable name="msPERtic" select="/TOTAL/tick-to-time/millisec-duration div /TOTAL/tick-to-time/tick-duration" />
       <xsl:variable name="msec"     select="floor($msPERtic * $tick)" />
       <xsl:variable name="note1"    select="(/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[. = $tick]/../NoteOn/@Note)[1]"/>
       <xsl:variable name="t1"       select="/TOTAL/scent-map/smell[note=$note1]/scent/text()" />
       <xsl:variable name="note2"    select="(/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[. = $tick]/../NoteOn/@Note)[2]"/>
       <xsl:variable name="t2"       select="/TOTAL/scent-map/smell[note=$note2]/scent/text()" />
       <xsl:variable name="note3"    select="(/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[. = $tick]/../NoteOn/@Note)[3]"/>
       <xsl:variable name="t3"       select="/TOTAL/scent-map/smell[note=$note3]/scent/text()" />
      setTimeout(f,<xsl:value-of select="$msec"/>, &quot;row1tick1&quot;,&quot;<xsl:value-of select="$t1"/>&quot;,&quot;<xsl:value-of select="$msec"/>&quot;,&quot;100&quot;,&quot;30&quot;); 
      setTimeout(f,<xsl:value-of select="$msec"/>, &quot;row2tick1&quot;,&quot;<xsl:value-of select="$t2"/>&quot;,&quot;<xsl:value-of select="$msec"/>&quot;,&quot;100&quot;,&quot;60&quot;);
      setTimeout(f,<xsl:value-of select="$msec"/>, &quot;row3tick1&quot;,&quot;<xsl:value-of select="$t3"/>&quot;,&quot;<xsl:value-of select="$msec"/>&quot;,&quot;100&quot;,&quot;90&quot;);</xsl:for-each>
      }

     function f(lineID,scentTitle,b,x,y){
       var A=document.createElementNS(xmlns,"animate")
       A.setAttributeNS(null,"attributeName","y")
       A.setAttributeNS(null,"from","30")
       A.setAttributeNS(null,"to","50")
       A.setAttributeNS(null,"begin",b)
       A.setAttributeNS(null,"dur","20s")
       var T=document.createElementNS(xmlns,"text")
       T.setAttributeNS(null,"x",x)
       T.setAttributeNS(null,"y",y)
       T.setAttributeNS(null,"font-size","55pt")
       Msg=document.createTextNode(scentTitle)
       T.appendChild(Msg)
       T.appendChild(A)
       SVGRoot.appendChild(T)
     }

    </script>
  </head>
  <body style="background-color:#AABBCC" onload="timerA()">
    <center><br /><br /></center>
    <center>osmodrama.com</center>
    <center><br /><br /></center>
    <title>Scenting Phill Niblocks Baobap</title>
    <center><br /></center>
    <center>
      <svg width="30000" height="100" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" onload="timedText(evt)">
        <style> text { font-size: 16px; font-family: Tahoma, sans-serif;}</style>
        <title>Scenting Phill Niblocks Baobap</title>
        <desc>textfeld bewegen</desc>

        <!-- Definition des Textfeldes -->
        <g id="smeller">
          <xsl:for-each select="/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[not(preceding::Event[NoteOn]/Absolute/. = .)]">
          <xsl:variable name="tick"     select="." />
          <xsl:variable name="msPERtic" select="/TOTAL/tick-to-time/millisec-duration div /TOTAL/tick-to-time/tick-duration" />
          <xsl:variable name="msec"     select="floor( $msPERtic * $tick div 50)" />
          <xsl:variable name="note1"    select="(/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[. = $tick]/../NoteOn/@Note)[1]"/>
          <xsl:variable name="t1"       select="/TOTAL/scent-map/smell[note=$note1]/scent/text()" />
          <xsl:variable name="note2"    select="(/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[. = $tick]/../NoteOn/@Note)[2]"/>
          <xsl:variable name="t2"       select="/TOTAL/scent-map/smell[note=$note2]/scent/text()" />
          <xsl:variable name="note3"    select="(/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[. = $tick]/../NoteOn/@Note)[3]"/>
          <xsl:variable name="t3"       select="/TOTAL/scent-map/smell[note=$note3]/scent/text()" />
          <text x="{$msec}" y="30" id="row1tick1"><xsl:value-of select="$t1"/></text>
          <text x="{$msec}" y="50" id="row2tick1"><xsl:value-of select="$t2"/></text>          
          <text x="{$msec}" y="70" id="row3tick1"><xsl:value-of select="$t3"/></text></xsl:for-each>
        </g>
        <!-- hier beginnt die Animation -->
        <animateTransform xlink:href="#smeller"
          type="translate" attributeName="transform"
          begin="0s" dur="23min"
          from="1500" to="-30000"
          fill="freeze" />
      </svg>
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