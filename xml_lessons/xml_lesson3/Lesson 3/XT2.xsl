<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:variable name="doc" select="document('movies.xml')" />
		<html>
			<head><title>Actors as table (XT2)</title></head>
			<body>
				<h1>Actors</h1>
				<table border="1">
					<tr>
						<th>Name</th>
						<th>Year of birth</th>
						<th>Country</th>
					</tr>
					<xsl:for-each select="$doc//Actor[not(@Name = preceding::Actor/@Name)]">
						<xsl:sort select="@Name" order="ascending" />
						<xsl:element name="tr">
							<xsl:element name="td"><xsl:value-of select="@Name"/></xsl:element>
							<xsl:element name="td"><xsl:value-of select="@YearOfBirth"/></xsl:element>
							<xsl:element name="td"><xsl:value-of select="@Country"/></xsl:element>
						</xsl:element>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:transform>
