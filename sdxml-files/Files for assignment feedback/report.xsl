<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Report for assignment <xsl:value-of select="rapport/inlupp"/> by 
					<xsl:choose>
						<xsl:when test="rapport/grupp">
							group <xsl:value-of select="rapport/grupp/@nummer"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="rapport/student"/>
						</xsl:otherwise>
					</xsl:choose>
				</title>
				<link rel="stylesheet" type="text/css" href="report.css" />
			</head>
			<body>
				<h1>Report for assignment <xsl:value-of select="rapport/inlupp"/> - SDXML <xsl:value-of select="rapport/@termin"/></h1>
				<!-- Group submission -->
				<xsl:if test="rapport/grupp">
					<!-- Table with the group members -->
					<table class="green">
						<tr>
							<th>Grupp</th>
							<th>Medlemmar</th>
						</tr>
						<!-- First data row -->
						<tr>
							<td>
								<xsl:attribute name="rowspan"><xsl:value-of select="count(//medlem)"/></xsl:attribute>
								<xsl:value-of select="//grupp/@nummer"/>
							</td>
							<td><xsl:value-of select="//medlem[1]"/></td>
						</tr>
						<!-- All other data rows (if any) -->
						<xsl:apply-templates select="rapport//medlem[position() > 1]" />
					</table>
				</xsl:if>
				<!-- Individual submission -->
				<xsl:if test="rapport/student">
					<!-- Table with the student's name -->
					<table class="green">
						<tr>
							<th>Individual submission by</th>
						</tr>
						<tr>
							<td><xsl:value-of select="rapport/student"/></td>
						</tr>
					</table>
				</xsl:if>
				<!-- General comments about the submission -->
				<xsl:for-each select="rapport/kommentar">
					<p class="bold"><xsl:value-of select="."/></p>
				</xsl:for-each>
				<!-- Comments per exercise -->
				<xsl:apply-templates select="rapport//uppgift" />
				<!-- Assessment -->
				<h2>Assessment</h2>
				<p class="bold indent1"><xsl:value-of select="rapport/resultat/@bedömning"/></p>
				<ul>
					<xsl:for-each select="//resultat/kommentar">
						<li><xsl:value-of select="."/></li>
					</xsl:for-each>
				</ul>
				<p class="footer">The submission has been reviewed by <xsl:value-of select="rapport/@bedömare"/> on <xsl:value-of select="rapport/@datum"/></p>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="medlem">
		<tr>
			<td><xsl:value-of select="."/></td>
		</tr>
	</xsl:template>
	<xsl:template match="uppgift">
		<h2>Exercise <xsl:value-of select="@nummer"/></h2>
		<!-- possible paragraph for the whole exercise -->
		<p class="indent1"><xsl:value-of select="text()"/></p>
		<!-- possible parts (with heading and paragraph) -->
		<xsl:for-each select="del">
			<h3 class="indent1"><xsl:value-of select="@namn"/></h3>
			<p class="indent2"><xsl:value-of select="text()"/></p>
		</xsl:for-each>
	</xsl:template>
</xsl:transform>
