<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>
    
    <xsl:template match="/">
		<xsl:variable name="d" select="document('movies.xml')"/>
        <movies>
            <!-- Sort movies by year -->
            <xsl:for-each select="$d//Movies/Movie">
                <xsl:sort select="@Year" data-type="number" order="ascending"/>
                <movie>
                    <xsl:attribute name="title">
                        <xsl:value-of select="@Title"/>
                    </xsl:attribute>
                    <xsl:attribute name="year">
                        <xsl:value-of select="@Year"/>
                    </xsl:attribute>
                    <xsl:attribute name="productioncompany">
                        <xsl:value-of select="@ProductionCompany"/>
                    </xsl:attribute>
                    <xsl:attribute name="director">
                        <xsl:value-of select="Director/@Name"/>
                    </xsl:attribute>
                    <!-- Sort actors alphabetically by name -->
                    <xsl:for-each select="Actors/Actor">
                        <xsl:sort select="@Name"/>
                        <actor>
                            <xsl:value-of select="@Name"/>
                        </actor>
                    </xsl:for-each>
                </movie>
            </xsl:for-each>
        </movies>
    </xsl:template>
</xsl:transform>
