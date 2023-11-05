<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	 <xsl:variable name="totalSolde" select="sum(BanqueService/getComptes/solde)" />
    <xsl:template match="/">
        <html>
            <head>
                <title>Liste des Comptes</title>
            </head>
            <body>
            <h1>Liste des Comptes</h1>
                <table border="1">
                    <tr>
                        <th>Code</th>
                        <th>Solde</th>
                        <th>Date de Création</th>
                    </tr>
                    <xsl:apply-templates select="BanqueService/getComptes"/>
                </table>
                
                <p>Somme totale des soldes : <xsl:value-of select="$totalSolde"/></p>

<xsl:variable name="totalSoldeFiltré" select="sum(BanqueService/getComptes[substring(date, 1, 4) > 2000]/solde)" />

                <table border="1">
                    <tr>
                        <th>Code</th>
                        <th>Solde</th>
                        <th>Date de Création</th>
                    </tr>
                    <xsl:apply-templates select="BanqueService/getComptes[substring(date, 1, 4) > 2000]"/>
                </table>
                <p>Somme totale des soldes des comptes filtrés : <xsl:value-of select="$totalSoldeFiltré"/></p>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="getComptes">
        <tr>
            <td><xsl:value-of select="code"/></td>
            <td><xsl:value-of select="solde"/></td>
            <td><xsl:value-of select="date"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>