<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml"/>
	<xsl:template match="/">
		<xsl:variable name="doc" select="document('movies.xml')"/>
		<Movies>
			<xsl:for-each select="$doc//ProductionCompany[not(text() = preceding::ProductionCompany/text())]">
				<xsl:sort select="." order="ascending"/>
				<xsl:variable name="pc" select="."/>
				<ProductionCompany Name="{text()}">
					<xsl:for-each select="$doc//Movie[ProductionCompany = $pc and not(@Year = preceding::Movie[ProductionCompany = $pc]/@Year)]/@Year">
						<ProducedMovies Year="{.}">
							<xsl:apply-templates select="$doc//Movie[ProductionCompany = $pc and @Year = current()]"/>
						</ProducedMovies>  						
					</xsl:for-each>
				</ProductionCompany>				
			</xsl:for-each>
		</Movies>
	</xsl:template>
	<xsl:template match="Movie">
		<xsl:variable name="m" select="."/>
		<Movie>
			<xsl:copy-of select="@Title"/>
			<xsl:copy-of select="Director"/>
			<xsl:for-each select="Actor[not(@Country = preceding-sibling::Actor/@Country)]/@Country">
				<xsl:sort select="." order="ascending"/>
				<Actors Country="{.}">
					<xsl:apply-templates select="$m/Actor[@Country = current()]"/>
				</Actors>
			</xsl:for-each>
		</Movie>
	</xsl:template>
	<xsl:template match="Actor">
		<Actor>
			<xsl:copy-of select="@Name"/>
			<xsl:copy-of select="@YearOfBirth"/>
		</Actor>
	</xsl:template>
</xsl:transform>
