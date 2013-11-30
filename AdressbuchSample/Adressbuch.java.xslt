<?xml version="1.0"?>
<!-- 
	Stylesheet to create an java class.
	author Dirk Messetat
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" />
	
	<xsl:variable name="data" select="document(/data/@href)" />
	<xsl:variable name="name" >AdressesEnum</xsl:variable>
	<xsl:variable name="package" >com.messetat.sample</xsl:variable>
	
	<xsl:include href="include/Pascalize.xsl"/>
	
	<xsl:template match="/">
		<xsl:call-template name="main" />
 	</xsl:template>
		
	<xsl:template name="main">	
<xsl:for-each select="$data">
package <xsl:value-of select="$package" />;

import some.import.SampleImport;

/**
* Generated class
*
* xslt by Dirk Messetat
*/
public enum <xsl:value-of select="$name"/> {
<xsl:for-each select="Adressbuch/Kunde">
	@Property(default = "<xsl:value-of select="@label"/>", description = "<xsl:value-of select="Adresse/Strasse"/>")
	<xsl:value-of select="translate(translate(@Name,' ','_'), $vLower,$vUpper)"/>("<xsl:value-of select="Adresse/Ort"/>")<xsl:choose><xsl:when test="position()!=last()">,</xsl:when><xsl:otherwise>;</xsl:otherwise> </xsl:choose>
</xsl:for-each>

	private String city;

	/* Constructor */
	private <xsl:value-of select="$name"/>(String city ){
	  this.city = city;
	}

	public String getCity(){
	  return this.city;
	}
}
</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>