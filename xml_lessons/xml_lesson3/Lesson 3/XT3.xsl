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
					<xsl:apply-templates select="$doc//Director[not(@Name = preceding::Director/@Name)]">
						<xsl:sort select="@Name"/>
					</xsl:apply-templates>
				</ul>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="Director">
		<li>
			<xsl:value-of select="@Name"/>
			<ol>
				<xsl:apply-templates select="$doc//Movie[Director/@Name = current()/@Name]">
					<xsl:sort select="@Year"/>
				</xsl:apply-templates>
			</ol>
		</li>
	</xsl:template>
	<xsl:template match="Movie">
		<li>
			<xsl:value-of select="@Title"/> (<xsl:value-of select="@Year"/>)
		</li>
	</xsl:template>
</xsl:transform>
