<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<html>
			<head><title>Movies by Tri-Star (XT4 with XSLT 3)</title></head>
			<body>
				<h1>Movies by Tri-Star</h1>
				<xsl:apply-templates select="//Movie[ProductionCompany = 'Tri-Star']" />
			</body>
		</html>
	</xsl:template>
	<xsl:template match="Movie" expand-text="yes">
		<h2>{@Title} ({@Year})</h2>
		<h3>Director</h3>
		<p>{Director/@Name}</p>
		<h3>Actors</h3>
		<xsl:for-each select="Actor">
			<p>{@Name}</p>
		</xsl:for-each>
	</xsl:template>
</xsl:transform>

