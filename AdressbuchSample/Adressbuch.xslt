<?xml version="1.0"?>
<!-- author: Dirk Messetat -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="5.0" encoding="utf-8" indent="yes"/>
<xsl:variable name="data" select="document(/html/body/@href)" />
<xsl:template match="/">
<xsl:apply-templates select="*" />
		<table>
			<thead>
				<tr>
					<th>Kunde</th>
					<th>Strasse</th>
					<th>PLZ/Ort</th>
				</tr>
			</thead>
			<tbody>
			<xsl:for-each select="$data">
			<xsl:for-each select="Adressbuch/Kunde">
				<xsl:sort select="@Name" />
				<tr>
				<!--
				modern browser can do it by css
				<xsl:choose>
					<xsl:when test="position() mod 2 = 0"><xsl:attribute name="class">even</xsl:attribute></xsl:when>
					<xsl:otherwise><xsl:attribute name="class">odd</xsl:attribute> </xsl:otherwise>
				</xsl:choose>
				-->
					<td>
						<xsl:value-of select="@Name" />
					</td>
					<td>
						<xsl:value-of select="Adresse/Strasse" />
					</td>
					<td>
						<xsl:value-of select="Adresse/PLZ" />
						<xsl:text> </xsl:text>
						<xsl:value-of select="Adresse/Ort" />
					</td>
				</tr>
			</xsl:for-each>
			</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	
	
	<xsl:template match='*'>
		<xsl:copy-of select='.' />
	</xsl:template>	
	
	
</xsl:stylesheet>

