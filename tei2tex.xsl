<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="#all"
  version="3.0">
  <xsl:output method="text" />
  
  <xsl:template match="/">
    <xsl:apply-templates />
  </xsl:template>
  
  <xsl:template match="tei:*">
    <xsl:value-of select="'\' || local-name()" />
    <xsl:if test="@*">
      <xsl:text>[</xsl:text>
      <xsl:variable name="attribs">
        <xsl:apply-templates select="@*" />
      </xsl:variable>
      <xsl:value-of select="substring($attribs, 1, string-length($attribs) - 1)"/>
      <xsl:text>]</xsl:text>
    </xsl:if>
    <xsl:text>{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>
  
  <xsl:template match="@*">
    <xsl:value-of select="local-name() || '=' || normalize-space() || ','"/>
  </xsl:template>
</xsl:stylesheet>