<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:output method="text" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>
        <xsl:template match="rss/channel">
            <text>
                <xsl:text>[playlist]</xsl:text>
                <xsl:value-of select="'&#10;'"/>
                <xsl:text>numberofentries=</xsl:text><xsl:value-of select="count(item)"/>
                <xsl:apply-templates select="item" />
            </text>
        </xsl:template>
        <xsl:template match="item">
                <xsl:variable name="item_enclosure" select="enclosure/@url"/>
                <xsl:if test="string-length(enclosure/@url) > 10">
 File<xsl:number value="position()" format="1" />=<xsl:value-of select="enclosure/@url" />
 Title<xsl:number value="position()" format="1" />=<xsl:value-of select="title" /> - <xsl:value-of select="pubDate" />
                </xsl:if>
        </xsl:template>
</xsl:stylesheet>
