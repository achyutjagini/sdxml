<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:output method="xml"/>
    <xsl:template match="/">
		<xsl:variable name="d" select="document('movies.xml')"/>
        <movies>
            <!-- Sort movies by year -->
            <xsl:for-each select="$d//Movies/Movie">
                <xsl:sort select="@Year" order="ascending"/>
                <movie title="{@Title}" year="{@Year}" productioncompany="{@ProductionCompany}" director="{Director/@Name}">
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
