<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0" exclude-result-prefixes="msxsl">
<xsl:output method="xml" indent="yes"/>
<xsl:template match="/">
<Records>
  <xsl:for-each select="adlibXML/recordList/record">
  <MetadataRecord>
    <xsl:if test="priref != ''">
      <xsl:attribute name="priref">
        <xsl:value-of select="priref"/>
      </xsl:attribute>
    </xsl:if>
    <Fields>  
      <xsl:if test="object_number != ''">
        <xsl:element name="IPTC.Title">
          <xsl:value-of select="object_number"/>
        </xsl:element>
      </xsl:if>
	  
      <xsl:if test="priref != ''">
        <xsl:element name="IPTC.Keywords">
          <xsl:text>priref: </xsl:text>
          <xsl:value-of select="priref"/>
        </xsl:element>
      </xsl:if>
	  
      <xsl:element name="IPTC.Headline">
	    <xsl:choose>
	    	<xsl:when test="Title[1]/title[1] !='' ">
          <xsl:apply-templates select="Title.title[1]" />
          <xsl:value-of select="Title[1]/title"/>
      	</xsl:when>
	    <xsl:otherwise>
			  <xsl:choose>
	    	    <xsl:when test="object_category !='' ">
			      <xsl:for-each select="object_category">
                    <xsl:value-of select="."/>
				    <xsl:if test="position()!=last()">
                      <xsl:text>,&#10;</xsl:text>
                    </xsl:if>
		          </xsl:for-each>
      	        </xsl:when>
	    	    <xsl:when test="Object_name/object_name !='' ">
			      <xsl:for-each select="Object_name">
                    <xsl:value-of select="object_name"/>
				    <xsl:if test="position()!=last()">
                      <xsl:text>,&#10;</xsl:text>
                    </xsl:if>
		          </xsl:for-each>
      	        </xsl:when>
			    <xsl:otherwise>
                    <xsl:text>Fitzwilliam Museum Image</xsl:text>	
			    </xsl:otherwise>					
			  </xsl:choose>
			</xsl:otherwise>
	    </xsl:choose>
      </xsl:element> 

      <xsl:element name="IPTC.Description">
        <xsl:for-each select="Production">
          <xsl:value-of select="creator"/>
           <xsl:if test="creator.role!='' and creator.date!=''">
            <xsl:value-of select="concat(' (',creator.role,', ',creator.date,')')" />
             <xsl:if test="position()!=last()">
               <xsl:text>,&#10;</xsl:text>
             </xsl:if>
             <xsl:if test="position()=last()">
               <xsl:text> </xsl:text>
             </xsl:if>
          </xsl:if>
           <xsl:if test="creator.role='' and creator.date!=''">
            <xsl:value-of select="concat(' (',creator.date,')')" />
             <xsl:if test="position()!=last()">
               <xsl:text>,&#10;</xsl:text>
             </xsl:if>
             <xsl:if test="position()=last()">
               <xsl:text> </xsl:text>
             </xsl:if>
          </xsl:if>
           <xsl:if test="creator.role!='' and creator.date=''">
            <xsl:value-of select="concat(' (',creator.role,')')" />
             <xsl:if test="position()!=last()">
               <xsl:text>,&#10;</xsl:text>
             </xsl:if>
             <xsl:if test="position()=last()">
               <xsl:text> </xsl:text>
             </xsl:if>
          </xsl:if>
        </xsl:for-each>
	    <xsl:if test="Description/description!=''">
          <xsl:value-of select="Description/description"/>
        </xsl:if>
      </xsl:element>  
      
      <xsl:element name="IPTC.Copyright">
	    <xsl:choose>
          <xsl:when test="Rights/rights.holder!=''">
		  <xsl:text>Copyright © </xsl:text>
          <xsl:value-of select="Rights/rights.holder"/>
           <xsl:text>; Photograph copyright © The Fitzwilliam Museum, Cambridge.</xsl:text>
         </xsl:when> 
          <xsl:otherwise>
           <xsl:text>Photograph copyright © The Fitzwilliam Museum, Cambridge.</xsl:text>
         </xsl:otherwise>  		 
	    </xsl:choose>
      </xsl:element>  

      <xsl:element name="IPTC.CopyrightNotice">
	    <xsl:choose>
          <xsl:when test="Rights/rights.credit!=''">
          <xsl:value-of select="Rights/rights.credit"/>
           <xsl:text>; Photograph copyright © The Fitzwilliam Museum, Cambridge.</xsl:text>
         </xsl:when> 
          <xsl:otherwise>
           <xsl:text>Photograph copyright © The Fitzwilliam Museum, Cambridge.</xsl:text>
         </xsl:otherwise>  		 
	    </xsl:choose>
      </xsl:element>  

      <xsl:element name="IPTC.Instructions">
         <xsl:text>May not be reproduced without prior written permission from the Museum’s Image Library</xsl:text>
      </xsl:element> 	  

	  <xsl:element name="IPTC.Source">
         <xsl:text>The Fitzwilliam Museum, Photographic Services</xsl:text>
      </xsl:element> 	 

	  <xsl:element name="IPTC.Provider">
         <xsl:text>The Fitzwilliam Museum, Image Library</xsl:text>
      </xsl:element> 	 

	  <xsl:element name="IPTC.RightsUsageTerms">
         <xsl:text>https://www.fitzmuseum.cam.ac.uk/aboutus/imagelibrary/termsandcondition</xsl:text>
      </xsl:element>	

	  <xsl:element name="IPTC.WebsiteURL">
         <xsl:text>Please visit: https://www.fitzmuseum.cam.ac.uk/aboutus/imagelibrary</xsl:text>
      </xsl:element>	
	  
	  <xsl:element name="IPTC.WebsiteName">
         <xsl:text>Please visit: https://www.fitzmuseum.cam.ac.uk/aboutus/imagelibrary</xsl:text>
      </xsl:element>	  
	  
	  <xsl:element name="IPTC.Credit">
         <xsl:text>The Fitzwilliam Museum, Image Library</xsl:text>
      </xsl:element>	
	  
	  <xsl:element name="IPTC.CreatorWebURL">
         <xsl:text>https://www.fitzmuseum.cam.ac.uk/aboutus/imagelibrary</xsl:text>
      </xsl:element>	
	  
	  <xsl:element name="IPTC.CreatorWebURLName">
         <xsl:text>The Fitzwilliam Museum, Image Library</xsl:text>
      </xsl:element>	
	  
	  	  <xsl:element name="IPTC.CreatorStateProvince">
         <xsl:text>Cambs</xsl:text>
      </xsl:element>	
	  
	  <xsl:element name="IPTC.CreatorPostalCode">
         <xsl:text>CB2 1RB</xsl:text>
      </xsl:element>	
	  
	  <xsl:element name="IPTC.CreatorPhone">
         <xsl:text>Tel: +44 (0)1223 332927</xsl:text>
      </xsl:element>	
	  
	  <xsl:element name="IPTC.CreatorEmail">
         <xsl:text>images@fitzmuseum.cam.ac.uk</xsl:text>
      </xsl:element>	
	  
	  <xsl:element name="IPTC.CreatorCity">
         <xsl:text>Cambridge</xsl:text>
      </xsl:element>	
	  
	  <xsl:element name="IPTC.CreatorAddress">
         <xsl:text>The Fitzwilliam Museum, Trumpington Street</xsl:text>
      </xsl:element>	
	  
	  <xsl:element name="IPTC.SubjectCode-IF-PUBLISH">
         <xsl:text>OPAC</xsl:text>
      </xsl:element>	
	  
	  <xsl:element name="IPTC.SubjectCode-IF-NO-PUBLISH">
         <xsl:text>Adlib only</xsl:text>
      </xsl:element>	
      
    </Fields>
  </MetadataRecord>
 </xsl:for-each>
</Records>
</xsl:template>

</xsl:stylesheet>