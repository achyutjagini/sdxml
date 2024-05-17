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
<xsl:apply-templates select="$doc//Actor[not(@Name=following::Actor/@Name)]">
<xsl:sort select="@Name"/>
</xsl:apply-templates>
</table>

</body>
</html>
</xsl:template>
<xsl:template match="Actor">
<tr>
<td>
<xsl:value-of select="@Name"/>
</td>
<td>
<xsl:value-of select="@YearOfBirth"/>
</td>
<td>
<xsl:value-of select="@Country"/>
</td>
</tr>
</xsl:template>

</xsl:transform>


