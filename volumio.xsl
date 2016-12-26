<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>
        <xsl:template match="/">
            <text>
                <xsl:text>[</xsl:text>
                <xsl:apply-templates select="rss/channel/item" />
            </text>
        </xsl:template>

                <xsl:template match="item">
                        <xsl:variable name="item_enclosure" select="enclosure/@url"/>
                        <xsl:if test="string-length(enclosure/@url) > 10">
 { "service": "webradio", "uri": "<xsl:value-of select="enclosure/@url" />",
  "title": "<xsl:value-of select="title" /> - <xsl:value-of select="pubDate" />" },
</xsl:if>
</xsl:template>
</xsl:stylesheet>
