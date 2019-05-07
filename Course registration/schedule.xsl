<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="4.0" />
  <xsl:template match="/">
    <html>
      <head>
        <title>Course_Registration_Form.pdf</title>
	<style type="text/css">
		
	table, td, th {
    			border: 1px solid black;
			empty-cells: hide;
		      }
		.hide_right{
            border-right-style:hidden;
          }
		.hide_left{
            border-left-style:hidden;
          }	
		.hide_bottom{
            border-bottom-style:hidden;
          }
          }
		
	</style>
      </head>
     <body>
      
          <tr>
            <th>CRN#</th>
	    <th><p>Course</p>
		<p>number</p> 
	        <p>(ENGS100)</p></th>
	    <th><p>Section</p>
		<p>(0W1)</p></th>
	    <th>Title</th>
	    <th>Credits</th>
            <th>Alternates:</th>
          </tr>
          <xsl:for-each select="/schedule/class">
            <xsl:sort select="Title" />
            <tr>
              <td align="middle"><xsl:value-of select="CRN" /></td>
              <td align="middle"><xsl:value-of select="CourseNumber" /></td>
              <td align="middle"><xsl:value-of select="Section" /></td>
              <td class="hide_left hide_bottom" align="middle"><xsl:value-of select="Title" /></td>
              <td align="middle"><xsl:value-of select="Credits" /></td>
              <td align="middle"><xsl:apply-templates select="Alternates" /></td>
	</tr>
          </xsl:for-each>
        
      </body>
    </html>
  </xsl:template>
<xsl:template match="Alternates">
	<xsl:if test="not(position()=1)"><hr/></xsl:if>
<xsl:value-of select="."/>
</xsl:template>
</xsl:stylesheet>
