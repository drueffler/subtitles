<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
  <head><style type="text/css">center {color:white; font-family: "Century Gothic", CenturyGothic, AppleGothic, sans-serif;} </style>
    <script>
      var seconds = 0, minutes = 0, hours = 0, t;
      function add(){seconds++;if(seconds>=60){seconds=0;minutes++;if(minutes>=60){ minutes=0;hours++;}}
        document.getElementById('time').innerHTML = 
          (hours ? (hours > 9 ? hours : "0" + hours) : "00") + ":" + (minutes ? (minutes > 9 ? minutes : "0" + minutes) : "00") + ":" + (seconds > 9 ? seconds : "0" + seconds);
        timerA();}
      function timerA(){t=setTimeout(add,1000);}
    </script>
  </head>
  <body style="background-color:#AABBCC" onload="timerA()">
    <center><br /><br /></center>
    <center>osmodrama.com</center>
    <center><br /><br /></center>
    <title>Scenting Phill Niblocks Baobap</title>
    <center><br /></center>
    <center>
      <svg width="1700" height="100" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" onload="timedText(evt)">
        <style> text { font-size: 16px; font-family: Tahoma, sans-serif;}</style>
        <title>Scenting Phill Niblocks Baobap</title>      <desc>textfeld bewegen</desc>
        <g id="smeller">                <!-- Definition des Textfeldes -->
          <xsl:for-each select="/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[not(preceding::Event[NoteOn]/Absolute/. = .)]">
          <xsl:variable name="tick"     select="." />
          <xsl:variable name="msPERtic" select="/TOTAL/tick-to-time/millisec-duration div /TOTAL/tick-to-time/tick-duration" />
          <xsl:variable name="msec"     select="floor( $msPERtic * $tick)" />
          <xsl:variable name="msec2"    select="floor( $msec + 50)" />
          <xsl:variable name="pos"      select="floor( $msPERtic * $tick div 50)" />
          <xsl:variable name="note1"    select="(/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[. = $tick]/../NoteOn/@Note)[1]"/>
          <xsl:variable name="t1"       select="/TOTAL/scent-map/smell[note=$note1]/scent/text()" />
          <xsl:variable name="note2"    select="(/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[. = $tick]/../NoteOn/@Note)[2]"/>
          <xsl:variable name="t2"       select="/TOTAL/scent-map/smell[note=$note2]/scent/text()" />
          <xsl:variable name="note3"    select="(/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[. = $tick]/../NoteOn/@Note)[3]"/>
          <xsl:variable name="t3"       select="/TOTAL/scent-map/smell[note=$note3]/scent/text()" />
          <text x="{$pos}" y="30" id="row1tick1" fill="red"  ><xsl:value-of select="$t1"/><animate attributeName="fill" from="red" to="white"  begin="{$msec2}ms" dur="2s" /></text>
          <text x="{$pos}" y="50" id="row2tick1" fill="green"><xsl:value-of select="$t2"/><animate attributeName="fill" from="blue" to="white"  begin="{$msec}ms" dur="6s" /></text>          
          <text x="{$pos}" y="70" id="row3tick1" fill="blue"><xsl:value-of select="$t3"/><animate attributeName="fill" from="green" to="white"  begin="{$msec2}ms" dur="3s" /></text></xsl:for-each>
        </g>                            <!-- Definition der Animation -->
        <animateTransform xlink:href="#smeller"
          type="translate" attributeName="transform"
          begin="0s" dur="24min"
          from="750" to="-25000"
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