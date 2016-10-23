<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
  <head><style type="text/css">center {color:white; font-family: "Century Gothic", CenturyGothic, AppleGothic, sans-serif;} </style>

  </head>
  <body style="background-color:#AABBCC" onload="timerA()">
    <center><br /><br /></center>
    <center>osmodrama.com</center>
    <center><br /><br /></center>
    <title>Scenting Phill Niblocks Baobap</title>
    <center><br /></center>
    <center>
      <svg width="33000" height="100" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" onload="timedText(evt)">
        <style> text { font-size: 16px; font-family: Tahoma, sans-serif;}</style>
        <defs><symbol id="baobap">
        <title>Scenting Phill Niblocks Baobap</title>      <desc>textfeld bewegen</desc>
        <g id="symbol-smeller">                <!-- Definition des Textfeldes -->
          <xsl:for-each select="/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[not(preceding::Event[NoteOn]/Absolute/. = .)]">
          <xsl:variable name="tick"     select="." />
          <xsl:variable name="msPERtic" select="/TOTAL/tick-to-time/millisec-duration div /TOTAL/tick-to-time/tick-duration" />
          <xsl:variable name="msec"     select="floor( $msPERtic  * $tick)" />
          <xsl:variable name="msec2"    select="floor( $msec + 500)" />
          <xsl:variable name="msec3"    select="floor( $msec + 1000)" />
          <xsl:variable name="pos"      select="floor( $msPERtic * $tick div 2000)" />
          <xsl:variable name="note1"    select="(/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[. = $tick]/../NoteOn/@Note)[1]"/>
          <xsl:variable name="t1"       select="/TOTAL/scent-map/smell[note=$note1]/scent/text()" />
          <xsl:variable name="note2"    select="(/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[. = $tick]/../NoteOn/@Note)[2]"/>
          <xsl:variable name="t2"       select="/TOTAL/scent-map/smell[note=$note2]/scent/text()" />
          <xsl:variable name="note3"    select="(/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[. = $tick]/../NoteOn/@Note)[3]"/>
          <xsl:variable name="t3"       select="/TOTAL/scent-map/smell[note=$note3]/scent/text()" />
       
          <text x="{$pos}" y="70" id="row3tick1" fill="black">.<animate  attributeName="fill" from="black"  to="white"  begin="{$msec}ms" dur="5s" /></text></xsl:for-each>
        </g>                            <!-- Definition der Animation -->
      </symbol></defs>
      <svg x="0" y="0" width="33000" height="100">
        
        <g id="smeller">                <!-- Definition des Textfeldes -->
          <xsl:for-each select="/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[not(preceding::Event[NoteOn]/Absolute/. = .)]">
          <xsl:variable name="tick"     select="." />
          <xsl:variable name="msPERtic" select="/TOTAL/tick-to-time/millisec-duration div /TOTAL/tick-to-time/tick-duration" />
          <xsl:variable name="msec"     select="floor( ($msPERtic -0)* $tick)" />
          <xsl:variable name="msec2"    select="floor( $msec + 500)" />
          <xsl:variable name="msec3"    select="floor( $msec + 1000)" />

          <xsl:variable name="pos"      select="floor( $msPERtic * $tick div 55)" />
          <xsl:variable name="note1"    select="(/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[. = $tick]/../NoteOn/@Note)[1]"/>
          <xsl:variable name="t1"       select="/TOTAL/scent-map/smell[note=$note1]/scent/text()" />
          <xsl:variable name="note2"    select="(/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[. = $tick]/../NoteOn/@Note)[2]"/>
          <xsl:variable name="t2"       select="/TOTAL/scent-map/smell[note=$note2]/scent/text()" />
          <xsl:variable name="note3"    select="(/TOTAL/MIDIFile/Track/Event[NoteOn]/Absolute[. = $tick]/../NoteOn/@Note)[3]"/>
          <xsl:variable name="t3"       select="/TOTAL/scent-map/smell[note=$note3]/scent/text()" />
   
          <xsl:variable name="min"      select="floor($msec div 1000 div 60)" />
          <xsl:variable name="sec"      select="floor($msec div 1000 mod (60))" />
          <xsl:variable name="pre_m"><xsl:choose><xsl:when test="$min>=10"></xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable> 
          <xsl:variable name="pre_s"><xsl:choose><xsl:when test="$sec>=10"></xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable> 

          <text x="{$pos}" y="30" id="row1tick1" fill="red"  ><xsl:value-of select="$t1"/><animate attributeName="fill" from="red"   to="white"  begin="{$msec}ms"  dur="5s" /></text>
          <text x="{$pos}" y="40" id="row2tick1" fill="green"><xsl:value-of select="$t2"/><animate attributeName="fill" from="green" to="white"  begin="{$msec}ms" dur="5s" /></text>          
          <text x="{$pos}" y="50" id="row3tick1" fill="blue"><xsl:value-of select="$t3"/><animate  attributeName="fill" from="blue"  to="white"  begin="{$msec}ms" dur="5s" /></text>
          <text x="{$pos}" y="70" id="row3tick1" fill="gray">00:<xsl:value-of select="$pre_m"/><xsl:value-of select="$min"/>:<xsl:value-of select="$pre_s"/><xsl:value-of select="$sec"/><animate  attributeName="fill" from="gray"  to="white"  begin="{$msec}ms" dur="5s" /></text></xsl:for-each>
        </g>                            <!-- Definition der Animation -->
        <animateTransform xlink:href="#smeller"
          type="translate" attributeName="transform"
          begin="0s" dur="35min"
          from="350" to="-35000"
          fill="freeze" />
      <use xlink:href="#baobap" transform="translate(0,25) scale(1.02)" />
      <g> 
      <style> text { font-size: 10px; font-family: Tahoma, sans-serif;}</style>
      <text x="650" y="10" id="hauchmaul" fill="red"        >streamer</text>
      <text x="400" y="10" id="Latenz"    fill="green"      >latency</text>
      <text x="220" y="10" id="Reihe1"    fill="blue"       >row 1</text>
      <text x="170" y="10" id="Reihe2"    fill="light blue" >row 2</text>
      <text x="120" y="10" id="Reihe3"    fill="blue"       >row 3</text>
      <text x="70"  y="10" id="Reihe4"    fill="light blue" >row 4</text>
      <text x="20"  y="10" id="Reihe5"    fill="blue"       >row 5</text>
      </g> 
      </svg></svg>
    </center>
    <center><br /></center>
    <center>bit.ly/OsmoSmeller</center>
    <center><br /></center>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>