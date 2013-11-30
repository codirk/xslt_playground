<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="2.0">
	<!-- 
		see http://stackoverflow.com/questions/2647327/how-to-format-a-string-to-pascal-case-in-xslt
		
		<xsl:include href="include/Pascalize.xsl"/>
		...
		<xsl:variable name="test">
			<xsl:call-template name="Pascalize">
				<xsl:with-param name="pText" select="."/>
 			</xsl:call-template>
	 	</xsl:variable>
	 	..
	 -->
	<xsl:variable name="vLower" select="'abcdefghijklmnopqrstuvwxyz'"/>
	<xsl:variable name="vUpper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>

	<xsl:template name="Pascalize">
	    <xsl:param name="pText" />
	    <xsl:if test="$pText">
	        <xsl:value-of select="translate(substring($pText,1,1), $vLower, $vUpper)" />
	        <xsl:choose>
	            <xsl:when test="contains($pText, '_')"> 
	                <xsl:value-of select="translate(substring-before(substring($pText,2), '_'),$vUpper,$vLower)" />
	            </xsl:when>
	            <xsl:otherwise>
	                <xsl:value-of select="translate(substring($pText,2),$vUpper,$vLower)" />
	            </xsl:otherwise>
	        </xsl:choose>
	        <xsl:call-template name="Pascalize">
	            <xsl:with-param name="pText" select="substring-after(substring($pText,2), '_')" />
	        </xsl:call-template>
	    </xsl:if>
	</xsl:template>
</xsl:stylesheet>