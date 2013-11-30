<?xml version="1.0"?>
<!-- author: Dirk Messetat -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="utf-8" indent="yes"/>
<xsl:variable name="data" select="document(/json/@href)" />
<xsl:template match="/">{ 
	adresses:[
			<xsl:for-each select="$data">
				<xsl:for-each select="Adressbuch/Kunde">
				<xsl:sort select="@Name" />
		{
			name:"<xsl:value-of select="@Name" />",
			street:"<xsl:value-of select="Adresse/Strasse" />",
			city:"<xsl:value-of select="Adresse/PLZ" />","
			zip:"<xsl:value-of select="Adresse/Ort" />"
		}<xsl:choose><xsl:when test="position()!=last()">,</xsl:when></xsl:choose>
				</xsl:for-each>
			</xsl:for-each>
]}
	</xsl:template>
</xsl:stylesheet>

