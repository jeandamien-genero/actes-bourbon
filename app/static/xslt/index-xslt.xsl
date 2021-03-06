<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    <!-- STRUCTURATION GLOBALE -->
    <!-- (une première <div> englobante est définie dans le document HTML) -->
    <xsl:template match="/">
        <!-- <div> pour les noms de roi -->
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>index-section-global</xsl:text>
            </xsl:attribute>
            <xsl:element name="h2">
                <xsl:attribute name="class">
                    <xsl:text>index-h2</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:text>rois</xsl:text>
                </xsl:attribute>
                <xsl:text>Rois</xsl:text>
            </xsl:element>
            <xsl:element name="div">
                <xsl:attribute name="class">
                    <xsl:text>index-sub-section</xsl:text>
                </xsl:attribute>
                <xsl:element name="div">
                    <xsl:attribute name="class">
                        <xsl:text>index-section-main</xsl:text>
                    </xsl:attribute>
                    <xsl:for-each select="//listPerson[@type='rois']//persName">
                        <xsl:element name="div">
                            <xsl:element name="p">
                                <xsl:attribute name="class">
                                    <xsl:text>index-entree</xsl:text>
                                </xsl:attribute>
                                <xsl:element name="b">
                                    <xsl:value-of select="."/>
                                </xsl:element>
                                <xsl:variable name="idPerson">
                                    <xsl:value-of select="parent::person/@xml:id"/>
                                </xsl:variable>
                                <xsl:text> (</xsl:text>
                                <xsl:for-each select="ancestor::TEI//body//persName[translate(@ref, '#','')=$idPerson]">
                                    <xsl:element name="a">
                                        <xsl:attribute name="href">
                                            <xsl:text>/actes/</xsl:text><xsl:value-of select="ancestor::div/@n"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="ancestor::div/@n"/>
                                    </xsl:element>
                                    <xsl:if test="position()!= last()">, </xsl:if>
                                    <xsl:if test="position() = last()"></xsl:if>
                                </xsl:for-each>
                                <xsl:text>).</xsl:text>
                            </xsl:element>
                            <xsl:element name="p">
                                <xsl:attribute name="class">
                                    <xsl:text>index-note</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="following::note"/>
                            </xsl:element>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        <!-- <div> pour les noms des hommes du roi de France -->
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>index-section-global</xsl:text>
            </xsl:attribute>
            <xsl:element name="h2">
                <xsl:attribute name="class">
                    <xsl:text>index-h2</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:text>h_roi_Fr</xsl:text>
                </xsl:attribute>
                <xsl:text>Hommes du roi de France</xsl:text>
            </xsl:element>
            <xsl:element name="div">
                <xsl:attribute name="class">
                    <xsl:text>index-sub-section</xsl:text>
                </xsl:attribute>
                <xsl:element name="div">
                    <xsl:attribute name="class">
                        <xsl:text>index-section-main</xsl:text>
                    </xsl:attribute>
                    <xsl:for-each select="//listPerson[@type='hommes_du_roi']//persName">
                        <xsl:element name="div">
                            <xsl:element name="p">
                                <xsl:attribute name="class">
                                    <xsl:text>index-entree</xsl:text>
                                </xsl:attribute>
                                <xsl:element name="b">
                                    <xsl:value-of select="."/>
                                </xsl:element>
                                <xsl:variable name="idPerson">
                                    <xsl:value-of select="parent::person/@xml:id"/>
                                </xsl:variable>
                                <xsl:text> (</xsl:text>
                                <xsl:for-each select="ancestor::TEI//body//persName[translate(@ref, '#','')=$idPerson]">
                                    <xsl:element name="a">
                                        <xsl:attribute name="href">
                                            <xsl:text>/actes/</xsl:text><xsl:value-of select="ancestor::div/@n"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="ancestor::div/@n"/>
                                    </xsl:element>
                                    <xsl:if test="position()!= last()">, </xsl:if>
                                    <xsl:if test="position() = last()"></xsl:if>
                                </xsl:for-each>
                                <xsl:text>).</xsl:text>
                            </xsl:element>
                            <xsl:element name="p">
                                <xsl:attribute name="class">
                                    <xsl:text>index-note</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="following::note"/>
                            </xsl:element>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        <!-- <div> pour les noms des Bourbon -->
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>index-section-global</xsl:text>
            </xsl:attribute>
            <xsl:element name="h2">
                <xsl:attribute name="class">
                    <xsl:text>index-h2</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:text>bourbon</xsl:text>
                </xsl:attribute>
                <xsl:text>Famille ducale de Bourbon</xsl:text>
            </xsl:element>
            <xsl:element name="div">
                <xsl:attribute name="class">
                    <xsl:text>index-sub-section</xsl:text>
                </xsl:attribute>
                <xsl:element name="div">
                    <xsl:attribute name="class">
                        <xsl:text>index-section-main</xsl:text>
                    </xsl:attribute>
                    <xsl:for-each select="//listPerson[@type='Bourbon']//persName">
                        <xsl:element name="p">
                            <xsl:attribute name="class">
                                <xsl:text>index-entree</xsl:text>
                            </xsl:attribute>
                            <xsl:element name="b">
                                <xsl:value-of select="."/>
                            </xsl:element>
                            <xsl:text> (</xsl:text>
                            <xsl:variable name="idPerson">
                                <xsl:value-of select="parent::person/@xml:id"/>
                            </xsl:variable>
                            <xsl:for-each select="ancestor::TEI//body//persName[translate(@ref, '#','')=$idPerson]">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:text>/actes/</xsl:text><xsl:value-of select="ancestor::div/@n"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="ancestor::div/@n"/>
                                </xsl:element>
                                <xsl:if test="position()!= last()">, </xsl:if>
                                <xsl:if test="position() = last()"></xsl:if>
                            </xsl:for-each>
                            <xsl:text>).</xsl:text>
                        </xsl:element>
                        <xsl:element name="p">
                            <xsl:attribute name="class">
                                <xsl:text>index-note</xsl:text>
                            </xsl:attribute>
                            <xsl:value-of select="following::note"/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        <!-- <div> pour les noms des hommes du duc de Bourbon -->
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>index-section-global</xsl:text>
            </xsl:attribute>
            <xsl:element name="h2">
                <xsl:attribute name="class">
                    <xsl:text>index-h2</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:text>h_bourbon</xsl:text>
                </xsl:attribute>
                <xsl:text>Hommes du duc de Bourbon</xsl:text>
            </xsl:element>
            <!-- Hôtel ducal -->
            <xsl:element name="div">
                <xsl:element name="h3">
                    <xsl:attribute name="class">
                        <xsl:text>index-h3</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:text>hotel</xsl:text>
                    </xsl:attribute>
                    <xsl:text>Hôtel ducal</xsl:text>
                </xsl:element>
                <xsl:element name="div">
                    <xsl:attribute name="class">
                        <xsl:text>index-sub-section</xsl:text>
                    </xsl:attribute>
                    <xsl:call-template name="hotel_ChI"/>
                </xsl:element>
            </xsl:element>
            <!-- Officiers de la chancellerie -->
            <xsl:element name="div">
                <xsl:element name="h3">
                    <xsl:attribute name="class">
                        <xsl:text>index-h3</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:text>chancellerie</xsl:text>
                    </xsl:attribute>
                    <xsl:text>Chancellerie</xsl:text>
                </xsl:element>
                <!-- Chanceliers -->
                <xsl:element name="div">
                    <xsl:element name="div">
                        <xsl:element name="h4">
                            <xsl:attribute name="class">
                                <xsl:text>index-h4</xsl:text>
                            </xsl:attribute>
                            <xsl:text>Chanceliers</xsl:text>
                        </xsl:element>
                        <xsl:element name="div">
                            <xsl:attribute name="class">
                                <xsl:text>index-sub-sub-section</xsl:text>
                            </xsl:attribute>
                            <xsl:call-template name="chanceliers"/>
                        </xsl:element>
                    </xsl:element>
                    <!-- Secrétaires -->
                    <xsl:element name="div">
                        <xsl:element name="h4">
                            <xsl:attribute name="class">
                                <xsl:text>index-h4</xsl:text>
                            </xsl:attribute>
                            <xsl:text>Secrétaires</xsl:text>
                        </xsl:element>
                        <xsl:element name="div">
                            <xsl:attribute name="class">
                                <xsl:text>index-sub-sub-section</xsl:text>
                            </xsl:attribute>
                            <xsl:call-template name="secretaires"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
            <!-- Officiers de la Chambre des comptes de Moulins -->
            <xsl:element name="div">
                <xsl:element name="h3">
                    <xsl:attribute name="class">
                        <xsl:text>index-h3</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:text>chbre_moulins</xsl:text>
                    </xsl:attribute>
                    <xsl:text>Chambre des comptes de Moulins</xsl:text>
                </xsl:element>
                <xsl:element name="div">
                    <xsl:attribute name="class">
                        <xsl:text>index-sub-section</xsl:text>
                    </xsl:attribute>
                    <xsl:call-template name="chambre_Moulins"/>
                </xsl:element>
            </xsl:element>
            <!-- Officiers du duché de Bourbonnais -->
            <xsl:element name="div">
                <xsl:element name="h3">
                    <xsl:attribute name="class">
                        <xsl:text>index-h3</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:text>off_bourbonnais</xsl:text>
                    </xsl:attribute>
                    <xsl:text>Duché de Bourbonnais</xsl:text>
                </xsl:element>
                <xsl:element name="div">
                    <xsl:attribute name="class">
                        <xsl:text>index-sub-section</xsl:text>
                    </xsl:attribute>
                    <xsl:call-template name="bourbon_off"/>
                </xsl:element>
            </xsl:element>
            <!-- Officiers du duché d'Auvergne -->
            <xsl:element name="div">
                <xsl:element name="h3">
                    <xsl:attribute name="class">
                        <xsl:text>index-h3</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:text>off_auvergne</xsl:text>
                    </xsl:attribute>
                    <xsl:text>Duché d'Auvergne</xsl:text>
                </xsl:element>
                <xsl:element name="div">
                    <xsl:attribute name="class">
                        <xsl:text>index-sub-section</xsl:text>
                    </xsl:attribute>
                    <xsl:call-template name="auvergne_off"/>
                </xsl:element>
            </xsl:element>
            <!-- Officiers du comté de Forez -->
            <xsl:element name="div">
                <xsl:element name="h3">
                    <xsl:attribute name="class">
                        <xsl:text>index-h3</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:text>off_forez</xsl:text>
                    </xsl:attribute>
                    <xsl:text>Comté de Forez</xsl:text>
                </xsl:element>
                <xsl:element name="div">
                    <xsl:attribute name="class">
                        <xsl:text>index-sub-section</xsl:text>
                    </xsl:attribute>
                    <xsl:call-template name="forez_off"/>
                </xsl:element>
            </xsl:element>
            <!-- Officiers de la seigneurie de Beaujolais -->
            <xsl:element name="div">
                <xsl:element name="h3">
                    <xsl:attribute name="class">
                        <xsl:text>index-h3</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:text>off_beaujolais</xsl:text>
                    </xsl:attribute>
                    <xsl:text>Seigneurie de Beaujolais</xsl:text>
                </xsl:element>
                <xsl:element name="div">
                    <xsl:attribute name="class">
                        <xsl:text>index-sub-section</xsl:text>
                    </xsl:attribute>
                    <xsl:call-template name="beaujolais_off"/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        <!-- <div> pour les noms de prince -->
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>index-section-global</xsl:text>
            </xsl:attribute>
            <xsl:element name="h2">
                <xsl:attribute name="class">
                    <xsl:text>index-h2</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:text>princes</xsl:text>
                </xsl:attribute>
                <xsl:text>Princes</xsl:text>
            </xsl:element>
            <xsl:element name="div">
                <xsl:attribute name="class">
                    <xsl:text>index-sub-section</xsl:text>
                </xsl:attribute>
                <xsl:call-template name="princes"/>
            </xsl:element>
        </xsl:element>
        <!-- <div> pour les noms des hommes du duc de Bourgogne -->
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>index-section-global</xsl:text>
            </xsl:attribute>
            <xsl:element name="h2">
                <xsl:attribute name="class">
                    <xsl:text>index-h2</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:text>h_bourgogne</xsl:text>
                </xsl:attribute>
                <xsl:text>Hommes du duc de Bourgogne</xsl:text>
            </xsl:element>
            <xsl:element name="div">
                <xsl:attribute name="class">
                    <xsl:text>index-sub-section</xsl:text>
                </xsl:attribute>
                <xsl:element name="div">
                    <xsl:attribute name="class">
                        <xsl:text>index-section-main</xsl:text>
                    </xsl:attribute>
                    <xsl:for-each select="//listPerson[@type='bourguignons']//persName">
                        <xsl:element name="p">
                            <xsl:attribute name="class">
                                <xsl:text>index-entree</xsl:text>
                            </xsl:attribute>
                            <xsl:element name="b"><xsl:value-of select="."/></xsl:element>
                            <xsl:variable name="idPerson">
                                <xsl:value-of select="parent::person/@xml:id"/>
                            </xsl:variable>
                            <xsl:text> (</xsl:text>
                            <xsl:for-each select="ancestor::TEI//body//persName[translate(@ref, '#','')=$idPerson]">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:text>/actes/</xsl:text><xsl:value-of select="ancestor::div/@n"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="ancestor::div/@n"/>
                                </xsl:element>
                                <xsl:if test="position()!= last()">, </xsl:if>
                                <xsl:if test="position() = last()"></xsl:if>
                            </xsl:for-each>
                            <xsl:text>).</xsl:text>
                        </xsl:element>
                        <xsl:element name="p">
                            <xsl:attribute name="class">
                                <xsl:text>index-note</xsl:text>
                            </xsl:attribute>
                            <xsl:value-of select="following::note"/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        <!-- <div> pour les noms des hommes du duc de Savoie -->
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>index-section-global</xsl:text>
            </xsl:attribute>
            <xsl:element name="h2">
                <xsl:attribute name="class">
                    <xsl:text>index-h2</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:text>h_savoie</xsl:text>
                </xsl:attribute>
                <xsl:text>Hommes du duc de Savoie</xsl:text>
            </xsl:element>
            <xsl:element name="div">
                <xsl:attribute name="class">
                    <xsl:text>index-sub-section</xsl:text>
                </xsl:attribute>
                <xsl:element name="div">
                    <xsl:attribute name="class">
                        <xsl:text>index-section-main</xsl:text>
                    </xsl:attribute>
                    <xsl:for-each select="//listPerson[@type='savoyards']//persName">
                        <xsl:element name="p">
                            <xsl:attribute name="class">
                                <xsl:text>index-entree</xsl:text>
                            </xsl:attribute>
                            <xsl:element name="b"><xsl:value-of select="."/></xsl:element>
                            <xsl:variable name="idPerson">
                                <xsl:value-of select="parent::person/@xml:id"/>
                            </xsl:variable>
                            <xsl:text> (</xsl:text>
                            <xsl:for-each select="ancestor::TEI//body//persName[translate(@ref, '#','')=$idPerson]">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:text>/actes/</xsl:text><xsl:value-of select="ancestor::div/@n"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="ancestor::div/@n"/>
                                </xsl:element>
                                <xsl:if test="position()!= last()">, </xsl:if>
                                <xsl:if test="position() = last()"></xsl:if>
                            </xsl:for-each>
                            <xsl:text>).</xsl:text>
                        </xsl:element>
                        <xsl:element name="p">
                            <xsl:attribute name="class">
                                <xsl:text>index-note</xsl:text>
                            </xsl:attribute>
                            <xsl:value-of select="following::note"/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <!-- Templates avec les règles pour les hommes du duc de Bourbon -->
    <xsl:template name="bourbon_off">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>index-section-main</xsl:text>
            </xsl:attribute>
            <xsl:for-each select="//listPerson[@type='Bourbonnais']//persName">
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:text>index-entree</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="b"><xsl:value-of select="."/></xsl:element>
                    <xsl:variable name="idPerson">
                        <xsl:value-of select="parent::person/@xml:id"/>
                    </xsl:variable>
                    <xsl:text> (</xsl:text>
                    <xsl:for-each select="ancestor::TEI//body//persName[translate(@ref, '#','')=$idPerson]">
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:text>/actes/</xsl:text><xsl:value-of select="ancestor::div/@n"/>
                            </xsl:attribute>
                            <xsl:value-of select="ancestor::div/@n"/>
                        </xsl:element>
                        <xsl:if test="position()!= last()">, </xsl:if>
                        <xsl:if test="position() = last()"></xsl:if>
                    </xsl:for-each>
                    <xsl:text>).</xsl:text>
                </xsl:element>
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:text>index-note</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="following::note"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    <xsl:template name="auvergne_off">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>index-section-main</xsl:text>
            </xsl:attribute>
            <xsl:for-each select="//listPerson[@type='Auvergne']//persName">
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:text>index-entree</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="b"><xsl:value-of select="."/></xsl:element>
                    <xsl:variable name="idPerson">
                        <xsl:value-of select="parent::person/@xml:id"/>
                    </xsl:variable>
                    <xsl:text> (</xsl:text>
                    <xsl:for-each select="ancestor::TEI//body//persName[translate(@ref, '#','')=$idPerson]">
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:text>/actes/</xsl:text><xsl:value-of select="ancestor::div/@n"/>
                            </xsl:attribute>
                            <xsl:value-of select="ancestor::div/@n"/>
                        </xsl:element>
                        <xsl:if test="position()!= last()">, </xsl:if>
                        <xsl:if test="position() = last()"></xsl:if>
                    </xsl:for-each>
                    <xsl:text>).</xsl:text>
                </xsl:element>
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:text>index-note</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="following::note"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    <xsl:template name="forez_off">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>index-section-main</xsl:text>
            </xsl:attribute>
            <xsl:for-each select="//listPerson[@type='Forez']//persName">
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:text>index-entree</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="b"><xsl:value-of select="."/></xsl:element>
                    <xsl:variable name="idPerson">
                        <xsl:value-of select="parent::person/@xml:id"/>
                    </xsl:variable>
                    <xsl:text> (</xsl:text>
                    <xsl:for-each select="ancestor::TEI//body//persName[translate(@ref, '#','')=$idPerson]">
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:text>/actes/</xsl:text><xsl:value-of select="ancestor::div/@n"/>
                            </xsl:attribute>
                            <xsl:value-of select="ancestor::div/@n"/>
                        </xsl:element>
                        <xsl:if test="position()!= last()">, </xsl:if>
                        <xsl:if test="position() = last()"></xsl:if>
                    </xsl:for-each>
                    <xsl:text>).</xsl:text>
                </xsl:element>
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:text>index-note</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="following::note"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    <xsl:template name="beaujolais_off">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>index-section-main</xsl:text>
            </xsl:attribute>
            <xsl:for-each select="//listPerson[@type='Beaujolais']//persName">
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:text>index-entree</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="b"><xsl:value-of select="."/></xsl:element>
                    <xsl:variable name="idPerson">
                        <xsl:value-of select="parent::person/@xml:id"/>
                    </xsl:variable>
                    <xsl:text> (</xsl:text>
                    <xsl:for-each select="ancestor::TEI//body//persName[translate(@ref, '#','')=$idPerson]">
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:text>/actes/</xsl:text><xsl:value-of select="ancestor::div/@n"/>
                            </xsl:attribute>
                            <xsl:value-of select="ancestor::div/@n"/>
                        </xsl:element>
                        <xsl:if test="position()!= last()">, </xsl:if>
                        <xsl:if test="position() = last()"></xsl:if>
                    </xsl:for-each>
                    <xsl:text>).</xsl:text>
                </xsl:element>
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:text>index-note</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="following::note"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    <xsl:template name="hotel_ChI">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>index-section-main</xsl:text>
            </xsl:attribute>
            <xsl:for-each select="//listPerson[@type='hotel_ChI']//persName">
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:text>index-entree</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="b">
                        <xsl:value-of select="forename"/>
                        <xsl:text> </xsl:text>
                        <xsl:if test="nameLink">
                            <xsl:value-of select="nameLink"/>
                            <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="surname"/>
                        <xsl:if test="addName">
                            <xsl:text>, dit </xsl:text>
                            <xsl:value-of select="addName"/>
                        </xsl:if>
                    </xsl:element>
                    <xsl:variable name="idPerson">
                        <xsl:value-of select="parent::person/@xml:id"/>
                    </xsl:variable>
                    <xsl:text> (</xsl:text>
                    <xsl:for-each select="ancestor::TEI//body//persName[translate(@ref, '#','')=$idPerson]">
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:text>/actes/</xsl:text><xsl:value-of select="ancestor::div/@n"/>
                            </xsl:attribute>
                            <xsl:value-of select="ancestor::div/@n"/>
                        </xsl:element>
                        <xsl:if test="position()!= last()">, </xsl:if>
                        <xsl:if test="position() = last()"></xsl:if>
                    </xsl:for-each>
                    <xsl:text>).</xsl:text>
                </xsl:element>
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:text>index-note</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="following::note"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    <xsl:template name="chambre_Moulins">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>index-section-main</xsl:text>
            </xsl:attribute>
            <xsl:for-each select="//listPerson[@type='Ch_Moulins']//persName">
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:text>index-entree</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="b"><xsl:value-of select="."/></xsl:element>
                    <xsl:variable name="idPerson">
                        <xsl:value-of select="parent::person/@xml:id"/>
                    </xsl:variable>
                    <xsl:text> (</xsl:text>
                    <xsl:for-each select="ancestor::TEI//body//persName[translate(@ref, '#','')=$idPerson]">
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:text>/actes/</xsl:text><xsl:value-of select="ancestor::div/@n"/>
                            </xsl:attribute>
                            <xsl:value-of select="ancestor::div/@n"/>
                        </xsl:element>
                        <xsl:if test="position()!= last()">, </xsl:if>
                        <xsl:if test="position() = last()"></xsl:if>
                    </xsl:for-each>
                    <xsl:text>).</xsl:text>
                </xsl:element>
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:text>index-note</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="following::note"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    <xsl:template name="chanceliers">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>index-section-main</xsl:text>
            </xsl:attribute>
            <xsl:for-each select="//listPerson[@type='chanceliers_Ch']//persName">
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:text>index-entree</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="b"><xsl:value-of select="."/></xsl:element>
                    <xsl:variable name="idPerson">
                        <xsl:value-of select="parent::person/@xml:id"/>
                    </xsl:variable>
                    <xsl:text> (</xsl:text>
                    <xsl:for-each select="ancestor::TEI//body//persName[translate(@ref, '#','')=$idPerson]">
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:text>/actes/</xsl:text><xsl:value-of select="ancestor::div/@n"/>
                            </xsl:attribute>
                            <xsl:value-of select="ancestor::div/@n"/>
                        </xsl:element>
                        <xsl:if test="position()!= last()">, </xsl:if>
                        <xsl:if test="position() = last()"></xsl:if>
                    </xsl:for-each>
                    <xsl:text>).</xsl:text>
                </xsl:element>
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:text>index-note</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="following::note"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    <xsl:template name="secretaires">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>index-section-main</xsl:text>
            </xsl:attribute>
            <xsl:for-each select="//listPerson[@type='secretaires_Bourbon']//persName">
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:text>index-entree</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="b"><xsl:value-of select="."/></xsl:element>
                    <xsl:variable name="idPerson">
                        <xsl:value-of select="parent::person/@xml:id"/>
                    </xsl:variable>
                    <xsl:text> (</xsl:text>
                    <xsl:for-each select="ancestor::TEI//body//persName[translate(@ref, '#','')=$idPerson]">
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:text>/actes/</xsl:text><xsl:value-of select="ancestor::div/@n"/>
                            </xsl:attribute>
                            <xsl:value-of select="ancestor::div/@n"/>
                        </xsl:element>
                        <xsl:if test="position()!= last()">, </xsl:if>
                        <xsl:if test="position() = last()"></xsl:if>
                    </xsl:for-each>
                    <xsl:text>).</xsl:text>
                </xsl:element>
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:text>index-note</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="following::note"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    <xsl:template name="princes">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>index-section-main</xsl:text>
            </xsl:attribute>
            <xsl:for-each select="//listPerson[@type='princes']//persName">
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:text>index-entree</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="b"><xsl:value-of select="."/></xsl:element>
                    <xsl:variable name="idPerson">
                        <xsl:value-of select="parent::person/@xml:id"/>
                    </xsl:variable>
                    <xsl:text> (</xsl:text>
                    <xsl:for-each select="ancestor::TEI//body//persName[translate(@ref, '#','')=$idPerson]">
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:text>/actes/</xsl:text><xsl:value-of select="ancestor::div/@n"/>
                            </xsl:attribute>
                            <xsl:value-of select="ancestor::div/@n"/>
                        </xsl:element>
                        <xsl:if test="position()!= last()">, </xsl:if>
                        <xsl:if test="position() = last()"></xsl:if>
                    </xsl:for-each>
                    <xsl:text>).</xsl:text>
                </xsl:element>
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:text>index-note</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="following::note"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>