<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml"/>
	<xsl:template match="/">
		<xsl:variable name="doc" select="document('movies.xml')" />
		<Actors>
			<xsl:for-each select="$doc//Actor[not(@Name = preceding::Actor/@Name)]">
				<xsl:sort select="@Name" order="ascending" />
				<xsl:copy-of select="."/>
				<!-- <xsl:element name="Actor"><xsl:value-of select="@Name"/></xsl:element> -->
			</xsl:for-each>
		</Actors>
	</xsl:template>
</xsl:transform>
