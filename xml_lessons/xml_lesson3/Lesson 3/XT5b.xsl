<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<Movies>
			<xsl:for-each-group select="//Movie" group-by="ProductionCompany">
				<xsl:sort select="current-grouping-key()" order="ascending"/>
				<ProductionCompany Name="{current-grouping-key()}">
					<xsl:for-each-group select="current-group()" group-by="@Year">
						<xsl:sort select="current-grouping-key()" order="ascending"/>
						<ProducedMovies Year="{current-grouping-key()}">
							<xsl:apply-templates select="current-group()"/>
						</ProducedMovies>
					</xsl:for-each-group>
				</ProductionCompany>
			</xsl:for-each-group>
		</Movies>
	</xsl:template>
	<xsl:template match="Movie">
		<Movie>
			<xsl:copy-of select="@Title"/>
			<xsl:copy-of select="Director"/>
			<xsl:for-each-group select="Actor" group-by="@Country">
				<xsl:sort select="current-grouping-key()" order="ascending"/>
				<Actors Country="{current-grouping-key()}">
					<xsl:apply-templates select="current-group()"/>
				</Actors>
			</xsl:for-each-group>
		</Movie>
	</xsl:template>
	<xsl:template match="Actor">
		<Actor>
			<xsl:copy-of select="@Name"/>
			<xsl:copy-of select="@YearOfBirth"/>
		</Actor>
	</xsl:template>
</xsl:transform>
