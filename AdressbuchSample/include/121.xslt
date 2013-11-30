<stylesheet version='2.0' xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:java='java' xmlns:xalan='http://xml.apache.org/xalan'>
	
	<xsl:template match='*'>
		<xsl:copy-of select='.' />
	</xsl:template>	
</stylesheet>