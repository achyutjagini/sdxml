<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1">
<xsl:output method="xml"/>
<xsl:template match="/">
<xsl:element name="Actors">
<xsl:for-each select="Movies/Movie/Actor[not(@Name=following::Actor/@Name)]">
<xsl:sort select="@Name"/>
<xsl:element name="Actor">
<xsl:attribute name="">
<xsl:value-of select="@Name">
</xsl:attribute>
</xsl:for-each>

</xsl:element>
</xsl:template>
</xsl:transform>

