<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:variable name="doc" select="document('movies.xml')" />
	<xsl:template match="/">
		<html>
			<head><title>Movies by Tri-Star (XT4)</title></head>
			<body>
				<h1>Movies by Tri-Star</h1>
				<xsl:apply-templates select="$doc//Movie[ProductionCompany = 'Tri-Star']" />
			</body>
		</html>
	</xsl:template>
	<xsl:template match="Movie">
		<h2><xsl:value-of select="@Title"/> (<xsl:value-of select="@Year"/>)</h2>
		<h3>Director</h3>
		<p><xsl:value-of select="Director/@Name"/></p>
		<h3>Actors</h3>
		<xsl:for-each select="Actor">
			<p><xsl:value-of select="@Name"/></p>
		</xsl:for-each>
	</xsl:template>
</xsl:transform>
