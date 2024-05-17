<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:variable name="doc" select="document('movies.xml')" />
	<xsl:template match="/">
		<html>
			<head><title>Movies per director (XT3)</title></head>
			<body>
				<h1>Movies per director</h1>
				<ul>
				<xsl:for-each select="//Director[not(@Name=preceding::Director/@Name)]"/>
				</ul>
				<li>
				<xsl:value-of select="@Name"/> </li>
				</xsl:for-each>
				
				</ul>
			</body>
			</html>
			</xsl:template>
		</xsl:transform>
		