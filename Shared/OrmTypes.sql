USE [CTC]

-- [Ca_Address] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Address' AND xtype='U')

BEGIN

    CREATE TABLE Ca_Address ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Bind] BIGINT
        ,[Type] INT
        ,[Line1] NVARCHAR(300) COLLATE Chinese_PRC_CI_AS
        ,[Line2] NVARCHAR(300) COLLATE Chinese_PRC_CI_AS
        ,[State] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
        ,[County] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
        ,[Town] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
        ,[Contact] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Tel] NVARCHAR(20) COLLATE Chinese_PRC_CI_AS
        ,[Email] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Zip] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
        ,[City] BIGINT
        ,[Country] BIGINT
        ,[Remarks] NVARCHAR(MAX)
, CONSTRAINT [PK_Ca_Address] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_Address NVARCHAR(64)
DECLARE cursor_Ca_Address CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Caption','Bind','Type','Line1','Line2','State','County','Town','Contact','Tel','Email','Zip','City','Country','Remarks'))

OPEN cursor_Ca_Address
FETCH NEXT FROM cursor_Ca_Address INTO @name_Ca_Address

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_Address.' + @name_Ca_Address;
    
    DECLARE @sql_Ca_Address NVARCHAR(MAX);
    SET @sql_Ca_Address = 'ALTER TABLE Ca_Address DROP COLUMN ' + QUOTENAME(@name_Ca_Address)
    EXEC sp_executesql @sql_Ca_Address
    
    
    FETCH NEXT FROM cursor_Ca_Address INTO @name_Ca_Address
END

CLOSE cursor_Ca_Address;
DEALLOCATE cursor_Ca_Address;


-- [Ca_Address.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Caption = 'ALTER TABLE Ca_Address ADD [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressCaption')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressCaption]
    END

-- [Ca_Address.Bind] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Bind')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Bind] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Bind NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Bind = 'ALTER TABLE Ca_Address ADD [Bind] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Address_Bind
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressBind')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressBind]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressBind')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressBind]
    END

-- [Ca_Address.Type] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Type')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Type] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Type NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Type = 'ALTER TABLE Ca_Address ADD [Type] INT'
    EXEC sp_executesql @sql_add_Ca_Address_Type
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressType')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressType]
    END

-- [Ca_Address.Line1] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Line1')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Line1] NVARCHAR(300) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Line1 NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Line1 = 'ALTER TABLE Ca_Address ADD [Line1] NVARCHAR(300) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_Line1
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressLine1')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressLine1]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressLine1')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressLine1]
    END

-- [Ca_Address.Line2] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Line2')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Line2] NVARCHAR(300) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Line2 NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Line2 = 'ALTER TABLE Ca_Address ADD [Line2] NVARCHAR(300) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_Line2
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressLine2')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressLine2]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressLine2')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressLine2]
    END

-- [Ca_Address.State] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='State')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [State] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_State NVARCHAR(MAX);
    SET @sql_add_Ca_Address_State = 'ALTER TABLE Ca_Address ADD [State] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_State
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressState')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressState]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressState')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressState]
    END

-- [Ca_Address.County] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='County')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [County] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_County NVARCHAR(MAX);
    SET @sql_add_Ca_Address_County = 'ALTER TABLE Ca_Address ADD [County] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_County
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressCounty')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressCounty]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressCounty')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressCounty]
    END

-- [Ca_Address.Town] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Town')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Town] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Town NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Town = 'ALTER TABLE Ca_Address ADD [Town] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_Town
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressTown')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressTown]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressTown')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressTown]
    END

-- [Ca_Address.Contact] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Contact')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Contact] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Contact NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Contact = 'ALTER TABLE Ca_Address ADD [Contact] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_Contact
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressContact')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressContact]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressContact')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressContact]
    END

-- [Ca_Address.Tel] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Tel')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Tel] NVARCHAR(20) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Tel NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Tel = 'ALTER TABLE Ca_Address ADD [Tel] NVARCHAR(20) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_Tel
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressTel')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressTel]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressTel')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressTel]
    END

-- [Ca_Address.Email] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Email')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Email] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Email NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Email = 'ALTER TABLE Ca_Address ADD [Email] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_Email
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressEmail')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressEmail]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressEmail')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressEmail]
    END

-- [Ca_Address.Zip] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Zip')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Zip] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Zip NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Zip = 'ALTER TABLE Ca_Address ADD [Zip] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Address_Zip
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressZip')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressZip]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressZip')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressZip]
    END

-- [Ca_Address.City] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='City')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [City] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_City NVARCHAR(MAX);
    SET @sql_add_Ca_Address_City = 'ALTER TABLE Ca_Address ADD [City] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Address_City
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressCity')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressCity]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressCity')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressCity]
    END

-- [Ca_Address.Country] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Country')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Country] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Country NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Country = 'ALTER TABLE Ca_Address ADD [Country] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Address_Country
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressCountry')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressCountry]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressCountry')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressCountry]
    END

-- [Ca_Address.Remarks] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Remarks')
    BEGIN
     ALTER TABLE Ca_Address ALTER COLUMN [Remarks] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Address_Remarks NVARCHAR(MAX);
    SET @sql_add_Ca_Address_Remarks = 'ALTER TABLE Ca_Address ADD [Remarks] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_Address_Remarks
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AddressRemarks')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AddressRemarks]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AddressRemarks')
    BEGIN
    ALTER TABLE Ca_Address DROP  CONSTRAINT [UniqueNonclustered_Ca_AddressRemarks]
    END
-- [Ca_Airport] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Airport' AND xtype='U')

BEGIN

    CREATE TABLE Ca_Airport ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Code3IATA] NVARCHAR(3) COLLATE Chinese_PRC_CI_AS
        ,[Code4ICAO] NVARCHAR(4) COLLATE Chinese_PRC_CI_AS
        ,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[CaptionEn] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Country] BIGINT
        ,[City] BIGINT
        ,[IsMetropolitan] BIT
, CONSTRAINT [PK_Ca_Airport] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_Airport NVARCHAR(64)
DECLARE cursor_Ca_Airport CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Airport') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Code3IATA','Code4ICAO','Caption','CaptionEn','Country','City','IsMetropolitan'))

OPEN cursor_Ca_Airport
FETCH NEXT FROM cursor_Ca_Airport INTO @name_Ca_Airport

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_Airport.' + @name_Ca_Airport;
    
    DECLARE @sql_Ca_Airport NVARCHAR(MAX);
    SET @sql_Ca_Airport = 'ALTER TABLE Ca_Airport DROP COLUMN ' + QUOTENAME(@name_Ca_Airport)
    EXEC sp_executesql @sql_Ca_Airport
    
    
    FETCH NEXT FROM cursor_Ca_Airport INTO @name_Ca_Airport
END

CLOSE cursor_Ca_Airport;
DEALLOCATE cursor_Ca_Airport;


-- [Ca_Airport.Code3IATA] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Airport') AND name='Code3IATA')
    BEGIN
     ALTER TABLE Ca_Airport ALTER COLUMN [Code3IATA] NVARCHAR(3) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Airport_Code3IATA NVARCHAR(MAX);
    SET @sql_add_Ca_Airport_Code3IATA = 'ALTER TABLE Ca_Airport ADD [Code3IATA] NVARCHAR(3) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Airport_Code3IATA
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AirportCode3IATA')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AirportCode3IATA]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AirportCode3IATA')
    BEGIN
    ALTER TABLE Ca_Airport DROP  CONSTRAINT [UniqueNonclustered_Ca_AirportCode3IATA]
    END

-- [Ca_Airport.Code4ICAO] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Airport') AND name='Code4ICAO')
    BEGIN
     ALTER TABLE Ca_Airport ALTER COLUMN [Code4ICAO] NVARCHAR(4) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Airport_Code4ICAO NVARCHAR(MAX);
    SET @sql_add_Ca_Airport_Code4ICAO = 'ALTER TABLE Ca_Airport ADD [Code4ICAO] NVARCHAR(4) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Airport_Code4ICAO
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AirportCode4ICAO')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AirportCode4ICAO]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AirportCode4ICAO')
    BEGIN
    ALTER TABLE Ca_Airport DROP  CONSTRAINT [UniqueNonclustered_Ca_AirportCode4ICAO]
    END

-- [Ca_Airport.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Airport') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_Airport ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Airport_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_Airport_Caption = 'ALTER TABLE Ca_Airport ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Airport_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AirportCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AirportCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AirportCaption')
    BEGIN
    ALTER TABLE Ca_Airport DROP  CONSTRAINT [UniqueNonclustered_Ca_AirportCaption]
    END

-- [Ca_Airport.CaptionEn] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Airport') AND name='CaptionEn')
    BEGIN
     ALTER TABLE Ca_Airport ALTER COLUMN [CaptionEn] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Airport_CaptionEn NVARCHAR(MAX);
    SET @sql_add_Ca_Airport_CaptionEn = 'ALTER TABLE Ca_Airport ADD [CaptionEn] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Airport_CaptionEn
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AirportCaptionEn')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AirportCaptionEn]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AirportCaptionEn')
    BEGIN
    ALTER TABLE Ca_Airport DROP  CONSTRAINT [UniqueNonclustered_Ca_AirportCaptionEn]
    END

-- [Ca_Airport.Country] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Airport') AND name='Country')
    BEGIN
     ALTER TABLE Ca_Airport ALTER COLUMN [Country] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Airport_Country NVARCHAR(MAX);
    SET @sql_add_Ca_Airport_Country = 'ALTER TABLE Ca_Airport ADD [Country] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Airport_Country
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AirportCountry')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AirportCountry]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AirportCountry')
    BEGIN
    ALTER TABLE Ca_Airport DROP  CONSTRAINT [UniqueNonclustered_Ca_AirportCountry]
    END

-- [Ca_Airport.City] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Airport') AND name='City')
    BEGIN
     ALTER TABLE Ca_Airport ALTER COLUMN [City] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Airport_City NVARCHAR(MAX);
    SET @sql_add_Ca_Airport_City = 'ALTER TABLE Ca_Airport ADD [City] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Airport_City
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AirportCity')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AirportCity]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AirportCity')
    BEGIN
    ALTER TABLE Ca_Airport DROP  CONSTRAINT [UniqueNonclustered_Ca_AirportCity]
    END

-- [Ca_Airport.IsMetropolitan] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Airport') AND name='IsMetropolitan')
    BEGIN
     ALTER TABLE Ca_Airport ALTER COLUMN [IsMetropolitan] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Airport_IsMetropolitan NVARCHAR(MAX);
    SET @sql_add_Ca_Airport_IsMetropolitan = 'ALTER TABLE Ca_Airport ADD [IsMetropolitan] BIT'
    EXEC sp_executesql @sql_add_Ca_Airport_IsMetropolitan
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_AirportIsMetropolitan')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_AirportIsMetropolitan]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_AirportIsMetropolitan')
    BEGIN
    ALTER TABLE Ca_Airport DROP  CONSTRAINT [UniqueNonclustered_Ca_AirportIsMetropolitan]
    END
-- [Ca_Biz] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Biz' AND xtype='U')

BEGIN

    CREATE TABLE Ca_Biz ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Code] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Parent] BIGINT
        ,[BasicAcct] BIGINT
        ,[Desc] NVARCHAR(MAX)
        ,[Website] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[City] BIGINT
        ,[Country] BIGINT
        ,[Lang] BIGINT
        ,[IsSocial] BIT
        ,[IsCmsSource] BIT
        ,[IsPay] BIT
        ,[MomentLatest] BIGINT
        ,[CountFollowers] BIGINT
        ,[CountFollows] BIGINT
        ,[CountMoments] BIGINT
        ,[CountViews] BIGINT
        ,[CountComments] BIGINT
        ,[CountThumbUps] BIGINT
        ,[CountThumbDns] BIGINT
        ,[IsCrawling] BIT
        ,[IsGSeries] BIT
        ,[RemarksCentral] NVARCHAR(MAX)
        ,[Agent] BIGINT
        ,[SiteCats] NVARCHAR(MAX)
        ,[ConfiguredCats] NVARCHAR(MAX)
, CONSTRAINT [PK_Ca_Biz] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_Biz NVARCHAR(64)
DECLARE cursor_Ca_Biz CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Code','Caption','Parent','BasicAcct','Desc','Website','Icon','City','Country','Lang','IsSocial','IsCmsSource','IsPay','MomentLatest','CountFollowers','CountFollows','CountMoments','CountViews','CountComments','CountThumbUps','CountThumbDns','IsCrawling','IsGSeries','RemarksCentral','Agent','SiteCats','ConfiguredCats'))

OPEN cursor_Ca_Biz
FETCH NEXT FROM cursor_Ca_Biz INTO @name_Ca_Biz

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_Biz.' + @name_Ca_Biz;
    
    DECLARE @sql_Ca_Biz NVARCHAR(MAX);
    SET @sql_Ca_Biz = 'ALTER TABLE Ca_Biz DROP COLUMN ' + QUOTENAME(@name_Ca_Biz)
    EXEC sp_executesql @sql_Ca_Biz
    
    
    FETCH NEXT FROM cursor_Ca_Biz INTO @name_Ca_Biz
END

CLOSE cursor_Ca_Biz;
DEALLOCATE cursor_Ca_Biz;


-- [Ca_Biz.Code] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Code')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [Code] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_Code NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_Code = 'ALTER TABLE Ca_Biz ADD [Code] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Biz_Code
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCode')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCode]
    END

-- [Ca_Biz.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_Caption = 'ALTER TABLE Ca_Biz ADD [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Biz_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCaption')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCaption]
    END

-- [Ca_Biz.Parent] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Parent')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [Parent] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_Parent NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_Parent = 'ALTER TABLE Ca_Biz ADD [Parent] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_Parent
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizParent')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizParent]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizParent')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizParent]
    END

-- [Ca_Biz.BasicAcct] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='BasicAcct')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [BasicAcct] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_BasicAcct NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_BasicAcct = 'ALTER TABLE Ca_Biz ADD [BasicAcct] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_BasicAcct
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizBasicAcct')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizBasicAcct]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizBasicAcct')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizBasicAcct]
    END

-- [Ca_Biz.Desc] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Desc')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [Desc] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_Desc NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_Desc = 'ALTER TABLE Ca_Biz ADD [Desc] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_Biz_Desc
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizDesc')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizDesc]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizDesc')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizDesc]
    END

-- [Ca_Biz.Website] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Website')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [Website] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_Website NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_Website = 'ALTER TABLE Ca_Biz ADD [Website] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Biz_Website
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizWebsite')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizWebsite]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizWebsite')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizWebsite]
    END

-- [Ca_Biz.Icon] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Icon')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_Icon NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_Icon = 'ALTER TABLE Ca_Biz ADD [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Biz_Icon
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizIcon')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizIcon]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizIcon')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizIcon]
    END

-- [Ca_Biz.City] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='City')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [City] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_City NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_City = 'ALTER TABLE Ca_Biz ADD [City] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_City
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCity')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCity]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCity')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCity]
    END

-- [Ca_Biz.Country] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Country')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [Country] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_Country NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_Country = 'ALTER TABLE Ca_Biz ADD [Country] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_Country
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCountry')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCountry]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCountry')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCountry]
    END

-- [Ca_Biz.Lang] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Lang')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [Lang] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_Lang NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_Lang = 'ALTER TABLE Ca_Biz ADD [Lang] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_Lang
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizLang')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizLang]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizLang')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizLang]
    END

-- [Ca_Biz.IsSocial] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsSocial')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [IsSocial] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_IsSocial NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_IsSocial = 'ALTER TABLE Ca_Biz ADD [IsSocial] BIT'
    EXEC sp_executesql @sql_add_Ca_Biz_IsSocial
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizIsSocial')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizIsSocial]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizIsSocial')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizIsSocial]
    END

-- [Ca_Biz.IsCmsSource] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsCmsSource')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [IsCmsSource] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_IsCmsSource NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_IsCmsSource = 'ALTER TABLE Ca_Biz ADD [IsCmsSource] BIT'
    EXEC sp_executesql @sql_add_Ca_Biz_IsCmsSource
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizIsCmsSource')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizIsCmsSource]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizIsCmsSource')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizIsCmsSource]
    END

-- [Ca_Biz.IsPay] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsPay')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [IsPay] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_IsPay NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_IsPay = 'ALTER TABLE Ca_Biz ADD [IsPay] BIT'
    EXEC sp_executesql @sql_add_Ca_Biz_IsPay
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizIsPay')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizIsPay]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizIsPay')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizIsPay]
    END

-- [Ca_Biz.MomentLatest] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='MomentLatest')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [MomentLatest] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_MomentLatest NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_MomentLatest = 'ALTER TABLE Ca_Biz ADD [MomentLatest] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_MomentLatest
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizMomentLatest')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizMomentLatest]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizMomentLatest')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizMomentLatest]
    END

-- [Ca_Biz.CountFollowers] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountFollowers')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [CountFollowers] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_CountFollowers NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_CountFollowers = 'ALTER TABLE Ca_Biz ADD [CountFollowers] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_CountFollowers
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCountFollowers')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCountFollowers]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCountFollowers')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCountFollowers]
    END

-- [Ca_Biz.CountFollows] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountFollows')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [CountFollows] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_CountFollows NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_CountFollows = 'ALTER TABLE Ca_Biz ADD [CountFollows] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_CountFollows
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCountFollows')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCountFollows]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCountFollows')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCountFollows]
    END

-- [Ca_Biz.CountMoments] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountMoments')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [CountMoments] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_CountMoments NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_CountMoments = 'ALTER TABLE Ca_Biz ADD [CountMoments] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_CountMoments
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCountMoments')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCountMoments]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCountMoments')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCountMoments]
    END

-- [Ca_Biz.CountViews] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountViews')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [CountViews] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_CountViews NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_CountViews = 'ALTER TABLE Ca_Biz ADD [CountViews] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_CountViews
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCountViews')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCountViews]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCountViews')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCountViews]
    END

-- [Ca_Biz.CountComments] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountComments')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [CountComments] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_CountComments NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_CountComments = 'ALTER TABLE Ca_Biz ADD [CountComments] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_CountComments
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCountComments')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCountComments]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCountComments')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCountComments]
    END

-- [Ca_Biz.CountThumbUps] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountThumbUps')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [CountThumbUps] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_CountThumbUps NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_CountThumbUps = 'ALTER TABLE Ca_Biz ADD [CountThumbUps] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_CountThumbUps
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCountThumbUps')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCountThumbUps]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCountThumbUps')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCountThumbUps]
    END

-- [Ca_Biz.CountThumbDns] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountThumbDns')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [CountThumbDns] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_CountThumbDns NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_CountThumbDns = 'ALTER TABLE Ca_Biz ADD [CountThumbDns] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_CountThumbDns
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizCountThumbDns')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizCountThumbDns]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizCountThumbDns')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizCountThumbDns]
    END

-- [Ca_Biz.IsCrawling] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsCrawling')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [IsCrawling] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_IsCrawling NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_IsCrawling = 'ALTER TABLE Ca_Biz ADD [IsCrawling] BIT'
    EXEC sp_executesql @sql_add_Ca_Biz_IsCrawling
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizIsCrawling')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizIsCrawling]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizIsCrawling')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizIsCrawling]
    END

-- [Ca_Biz.IsGSeries] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsGSeries')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [IsGSeries] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_IsGSeries NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_IsGSeries = 'ALTER TABLE Ca_Biz ADD [IsGSeries] BIT'
    EXEC sp_executesql @sql_add_Ca_Biz_IsGSeries
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizIsGSeries')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizIsGSeries]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizIsGSeries')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizIsGSeries]
    END

-- [Ca_Biz.RemarksCentral] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='RemarksCentral')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [RemarksCentral] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_RemarksCentral NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_RemarksCentral = 'ALTER TABLE Ca_Biz ADD [RemarksCentral] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_Biz_RemarksCentral
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizRemarksCentral')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizRemarksCentral]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizRemarksCentral')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizRemarksCentral]
    END

-- [Ca_Biz.Agent] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Agent')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [Agent] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_Agent NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_Agent = 'ALTER TABLE Ca_Biz ADD [Agent] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Biz_Agent
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizAgent')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizAgent]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizAgent')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizAgent]
    END

-- [Ca_Biz.SiteCats] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='SiteCats')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [SiteCats] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_SiteCats NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_SiteCats = 'ALTER TABLE Ca_Biz ADD [SiteCats] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_Biz_SiteCats
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizSiteCats')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizSiteCats]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizSiteCats')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizSiteCats]
    END

-- [Ca_Biz.ConfiguredCats] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='ConfiguredCats')
    BEGIN
     ALTER TABLE Ca_Biz ALTER COLUMN [ConfiguredCats] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Biz_ConfiguredCats NVARCHAR(MAX);
    SET @sql_add_Ca_Biz_ConfiguredCats = 'ALTER TABLE Ca_Biz ADD [ConfiguredCats] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_Biz_ConfiguredCats
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_BizConfiguredCats')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_BizConfiguredCats]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_BizConfiguredCats')
    BEGIN
    ALTER TABLE Ca_Biz DROP  CONSTRAINT [UniqueNonclustered_Ca_BizConfiguredCats]
    END
-- [Ca_Cat] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Cat' AND xtype='U')

BEGIN

    CREATE TABLE Ca_Cat ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Lang] BIGINT
        ,[Zh] BIGINT
        ,[Parent] BIGINT
        ,[State] INT
, CONSTRAINT [PK_Ca_Cat] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_Cat NVARCHAR(64)
DECLARE cursor_Ca_Cat CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Cat') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Caption','Lang','Zh','Parent','State'))

OPEN cursor_Ca_Cat
FETCH NEXT FROM cursor_Ca_Cat INTO @name_Ca_Cat

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_Cat.' + @name_Ca_Cat;
    
    DECLARE @sql_Ca_Cat NVARCHAR(MAX);
    SET @sql_Ca_Cat = 'ALTER TABLE Ca_Cat DROP COLUMN ' + QUOTENAME(@name_Ca_Cat)
    EXEC sp_executesql @sql_Ca_Cat
    
    
    FETCH NEXT FROM cursor_Ca_Cat INTO @name_Ca_Cat
END

CLOSE cursor_Ca_Cat;
DEALLOCATE cursor_Ca_Cat;


-- [Ca_Cat.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cat') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_Cat ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cat_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_Cat_Caption = 'ALTER TABLE Ca_Cat ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Cat_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CatCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CatCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CatCaption')
    BEGIN
    ALTER TABLE Ca_Cat DROP  CONSTRAINT [UniqueNonclustered_Ca_CatCaption]
    END

-- [Ca_Cat.Lang] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cat') AND name='Lang')
    BEGIN
     ALTER TABLE Ca_Cat ALTER COLUMN [Lang] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cat_Lang NVARCHAR(MAX);
    SET @sql_add_Ca_Cat_Lang = 'ALTER TABLE Ca_Cat ADD [Lang] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Cat_Lang
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CatLang')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CatLang]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CatLang')
    BEGIN
    ALTER TABLE Ca_Cat DROP  CONSTRAINT [UniqueNonclustered_Ca_CatLang]
    END

-- [Ca_Cat.Zh] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cat') AND name='Zh')
    BEGIN
     ALTER TABLE Ca_Cat ALTER COLUMN [Zh] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cat_Zh NVARCHAR(MAX);
    SET @sql_add_Ca_Cat_Zh = 'ALTER TABLE Ca_Cat ADD [Zh] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Cat_Zh
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CatZh')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CatZh]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CatZh')
    BEGIN
    ALTER TABLE Ca_Cat DROP  CONSTRAINT [UniqueNonclustered_Ca_CatZh]
    END

-- [Ca_Cat.Parent] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cat') AND name='Parent')
    BEGIN
     ALTER TABLE Ca_Cat ALTER COLUMN [Parent] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cat_Parent NVARCHAR(MAX);
    SET @sql_add_Ca_Cat_Parent = 'ALTER TABLE Ca_Cat ADD [Parent] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Cat_Parent
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CatParent')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CatParent]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CatParent')
    BEGIN
    ALTER TABLE Ca_Cat DROP  CONSTRAINT [UniqueNonclustered_Ca_CatParent]
    END

-- [Ca_Cat.State] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cat') AND name='State')
    BEGIN
     ALTER TABLE Ca_Cat ALTER COLUMN [State] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cat_State NVARCHAR(MAX);
    SET @sql_add_Ca_Cat_State = 'ALTER TABLE Ca_Cat ADD [State] INT'
    EXEC sp_executesql @sql_add_Ca_Cat_State
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CatState')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CatState]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CatState')
    BEGIN
    ALTER TABLE Ca_Cat DROP  CONSTRAINT [UniqueNonclustered_Ca_CatState]
    END
-- [Ca_City] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_City' AND xtype='U')

BEGIN

    CREATE TABLE Ca_City ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Name] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[MetropolitanCode3IATA] NVARCHAR(3) COLLATE Chinese_PRC_CI_AS
        ,[NameEn] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Country] BIGINT
        ,[Place] BIGINT
        ,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Tel] NVARCHAR(4) COLLATE Chinese_PRC_CI_AS
, CONSTRAINT [PK_Ca_City] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_City NVARCHAR(64)
DECLARE cursor_Ca_City CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_City') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Name','MetropolitanCode3IATA','NameEn','Country','Place','Icon','Tel'))

OPEN cursor_Ca_City
FETCH NEXT FROM cursor_Ca_City INTO @name_Ca_City

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_City.' + @name_Ca_City;
    
    DECLARE @sql_Ca_City NVARCHAR(MAX);
    SET @sql_Ca_City = 'ALTER TABLE Ca_City DROP COLUMN ' + QUOTENAME(@name_Ca_City)
    EXEC sp_executesql @sql_Ca_City
    
    
    FETCH NEXT FROM cursor_Ca_City INTO @name_Ca_City
END

CLOSE cursor_Ca_City;
DEALLOCATE cursor_Ca_City;


-- [Ca_City.Name] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_City') AND name='Name')
    BEGIN
     ALTER TABLE Ca_City ALTER COLUMN [Name] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_City_Name NVARCHAR(MAX);
    SET @sql_add_Ca_City_Name = 'ALTER TABLE Ca_City ADD [Name] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_City_Name
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CityName')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CityName]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CityName')
    BEGIN
    ALTER TABLE Ca_City DROP  CONSTRAINT [UniqueNonclustered_Ca_CityName]
    END

-- [Ca_City.MetropolitanCode3IATA] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_City') AND name='MetropolitanCode3IATA')
    BEGIN
     ALTER TABLE Ca_City ALTER COLUMN [MetropolitanCode3IATA] NVARCHAR(3) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_City_MetropolitanCode3IATA NVARCHAR(MAX);
    SET @sql_add_Ca_City_MetropolitanCode3IATA = 'ALTER TABLE Ca_City ADD [MetropolitanCode3IATA] NVARCHAR(3) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_City_MetropolitanCode3IATA
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CityMetropolitanCode3IATA')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CityMetropolitanCode3IATA]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CityMetropolitanCode3IATA')
    BEGIN
    ALTER TABLE Ca_City DROP  CONSTRAINT [UniqueNonclustered_Ca_CityMetropolitanCode3IATA]
    END

-- [Ca_City.NameEn] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_City') AND name='NameEn')
    BEGIN
     ALTER TABLE Ca_City ALTER COLUMN [NameEn] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_City_NameEn NVARCHAR(MAX);
    SET @sql_add_Ca_City_NameEn = 'ALTER TABLE Ca_City ADD [NameEn] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_City_NameEn
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CityNameEn')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CityNameEn]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CityNameEn')
    BEGIN
    ALTER TABLE Ca_City DROP  CONSTRAINT [UniqueNonclustered_Ca_CityNameEn]
    END

-- [Ca_City.Country] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_City') AND name='Country')
    BEGIN
     ALTER TABLE Ca_City ALTER COLUMN [Country] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_City_Country NVARCHAR(MAX);
    SET @sql_add_Ca_City_Country = 'ALTER TABLE Ca_City ADD [Country] BIGINT'
    EXEC sp_executesql @sql_add_Ca_City_Country
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CityCountry')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CityCountry]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CityCountry')
    BEGIN
    ALTER TABLE Ca_City DROP  CONSTRAINT [UniqueNonclustered_Ca_CityCountry]
    END

-- [Ca_City.Place] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_City') AND name='Place')
    BEGIN
     ALTER TABLE Ca_City ALTER COLUMN [Place] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_City_Place NVARCHAR(MAX);
    SET @sql_add_Ca_City_Place = 'ALTER TABLE Ca_City ADD [Place] BIGINT'
    EXEC sp_executesql @sql_add_Ca_City_Place
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CityPlace')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CityPlace]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CityPlace')
    BEGIN
    ALTER TABLE Ca_City DROP  CONSTRAINT [UniqueNonclustered_Ca_CityPlace]
    END

-- [Ca_City.Icon] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_City') AND name='Icon')
    BEGIN
     ALTER TABLE Ca_City ALTER COLUMN [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_City_Icon NVARCHAR(MAX);
    SET @sql_add_Ca_City_Icon = 'ALTER TABLE Ca_City ADD [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_City_Icon
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CityIcon')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CityIcon]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CityIcon')
    BEGIN
    ALTER TABLE Ca_City DROP  CONSTRAINT [UniqueNonclustered_Ca_CityIcon]
    END

-- [Ca_City.Tel] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_City') AND name='Tel')
    BEGIN
     ALTER TABLE Ca_City ALTER COLUMN [Tel] NVARCHAR(4) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_City_Tel NVARCHAR(MAX);
    SET @sql_add_Ca_City_Tel = 'ALTER TABLE Ca_City ADD [Tel] NVARCHAR(4) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_City_Tel
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CityTel')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CityTel]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CityTel')
    BEGIN
    ALTER TABLE Ca_City DROP  CONSTRAINT [UniqueNonclustered_Ca_CityTel]
    END
-- [Ca_Country] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Country' AND xtype='U')

BEGIN

    CREATE TABLE Ca_Country ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS
        ,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Fullname] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Tel] NVARCHAR(4) COLLATE Chinese_PRC_CI_AS
        ,[Cur] BIGINT
        ,[Capital] BIGINT
        ,[Place] BIGINT
        ,[Lang] BIGINT
, CONSTRAINT [PK_Ca_Country] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_Country NVARCHAR(64)
DECLARE cursor_Ca_Country CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Code2','Caption','Fullname','Icon','Tel','Cur','Capital','Place','Lang'))

OPEN cursor_Ca_Country
FETCH NEXT FROM cursor_Ca_Country INTO @name_Ca_Country

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_Country.' + @name_Ca_Country;
    
    DECLARE @sql_Ca_Country NVARCHAR(MAX);
    SET @sql_Ca_Country = 'ALTER TABLE Ca_Country DROP COLUMN ' + QUOTENAME(@name_Ca_Country)
    EXEC sp_executesql @sql_Ca_Country
    
    
    FETCH NEXT FROM cursor_Ca_Country INTO @name_Ca_Country
END

CLOSE cursor_Ca_Country;
DEALLOCATE cursor_Ca_Country;


-- [Ca_Country.Code2] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Code2')
    BEGIN
     ALTER TABLE Ca_Country ALTER COLUMN [Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Country_Code2 NVARCHAR(MAX);
    SET @sql_add_Ca_Country_Code2 = 'ALTER TABLE Ca_Country ADD [Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Country_Code2
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CountryCode2')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CountryCode2]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CountryCode2')
    BEGIN
    ALTER TABLE Ca_Country DROP  CONSTRAINT [UniqueNonclustered_Ca_CountryCode2]
    END

-- [Ca_Country.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_Country ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Country_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_Country_Caption = 'ALTER TABLE Ca_Country ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Country_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CountryCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CountryCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CountryCaption')
    BEGIN
    ALTER TABLE Ca_Country DROP  CONSTRAINT [UniqueNonclustered_Ca_CountryCaption]
    END

-- [Ca_Country.Fullname] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Fullname')
    BEGIN
     ALTER TABLE Ca_Country ALTER COLUMN [Fullname] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Country_Fullname NVARCHAR(MAX);
    SET @sql_add_Ca_Country_Fullname = 'ALTER TABLE Ca_Country ADD [Fullname] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Country_Fullname
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CountryFullname')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CountryFullname]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CountryFullname')
    BEGIN
    ALTER TABLE Ca_Country DROP  CONSTRAINT [UniqueNonclustered_Ca_CountryFullname]
    END

-- [Ca_Country.Icon] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Icon')
    BEGIN
     ALTER TABLE Ca_Country ALTER COLUMN [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Country_Icon NVARCHAR(MAX);
    SET @sql_add_Ca_Country_Icon = 'ALTER TABLE Ca_Country ADD [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Country_Icon
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CountryIcon')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CountryIcon]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CountryIcon')
    BEGIN
    ALTER TABLE Ca_Country DROP  CONSTRAINT [UniqueNonclustered_Ca_CountryIcon]
    END

-- [Ca_Country.Tel] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Tel')
    BEGIN
     ALTER TABLE Ca_Country ALTER COLUMN [Tel] NVARCHAR(4) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Country_Tel NVARCHAR(MAX);
    SET @sql_add_Ca_Country_Tel = 'ALTER TABLE Ca_Country ADD [Tel] NVARCHAR(4) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Country_Tel
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CountryTel')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CountryTel]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CountryTel')
    BEGIN
    ALTER TABLE Ca_Country DROP  CONSTRAINT [UniqueNonclustered_Ca_CountryTel]
    END

-- [Ca_Country.Cur] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Cur')
    BEGIN
     ALTER TABLE Ca_Country ALTER COLUMN [Cur] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Country_Cur NVARCHAR(MAX);
    SET @sql_add_Ca_Country_Cur = 'ALTER TABLE Ca_Country ADD [Cur] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Country_Cur
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CountryCur')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CountryCur]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CountryCur')
    BEGIN
    ALTER TABLE Ca_Country DROP  CONSTRAINT [UniqueNonclustered_Ca_CountryCur]
    END

-- [Ca_Country.Capital] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Capital')
    BEGIN
     ALTER TABLE Ca_Country ALTER COLUMN [Capital] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Country_Capital NVARCHAR(MAX);
    SET @sql_add_Ca_Country_Capital = 'ALTER TABLE Ca_Country ADD [Capital] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Country_Capital
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CountryCapital')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CountryCapital]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CountryCapital')
    BEGIN
    ALTER TABLE Ca_Country DROP  CONSTRAINT [UniqueNonclustered_Ca_CountryCapital]
    END

-- [Ca_Country.Place] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Place')
    BEGIN
     ALTER TABLE Ca_Country ALTER COLUMN [Place] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Country_Place NVARCHAR(MAX);
    SET @sql_add_Ca_Country_Place = 'ALTER TABLE Ca_Country ADD [Place] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Country_Place
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CountryPlace')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CountryPlace]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CountryPlace')
    BEGIN
    ALTER TABLE Ca_Country DROP  CONSTRAINT [UniqueNonclustered_Ca_CountryPlace]
    END

-- [Ca_Country.Lang] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Lang')
    BEGIN
     ALTER TABLE Ca_Country ALTER COLUMN [Lang] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Country_Lang NVARCHAR(MAX);
    SET @sql_add_Ca_Country_Lang = 'ALTER TABLE Ca_Country ADD [Lang] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Country_Lang
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CountryLang')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CountryLang]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CountryLang')
    BEGIN
    ALTER TABLE Ca_Country DROP  CONSTRAINT [UniqueNonclustered_Ca_CountryLang]
    END
-- [Ca_Cur] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Cur' AND xtype='U')

BEGIN

    CREATE TABLE Ca_Cur ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Code] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
        ,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Hidden] BIT
        ,[IsSac] BIT
        ,[IsTransfer] BIT
        ,[IsCash] BIT
        ,[EnableReward] BIT
        ,[EnableOTC] BIT
        ,[Icon] NVARCHAR(512) COLLATE Chinese_PRC_CI_AS
        ,[CurType] INT
        ,[Dec] BIGINT
        ,[AnchorRate] FLOAT
        ,[Freezable] BIT
        ,[Authorizable] BIT
        ,[ChaninID] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[ChaninName] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[ContractAddress] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[WalletAddress] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[BaseRate] FLOAT
, CONSTRAINT [PK_Ca_Cur] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_Cur NVARCHAR(64)
DECLARE cursor_Ca_Cur CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Code','Caption','Hidden','IsSac','IsTransfer','IsCash','EnableReward','EnableOTC','Icon','CurType','Dec','AnchorRate','Freezable','Authorizable','ChaninID','ChaninName','ContractAddress','WalletAddress','BaseRate'))

OPEN cursor_Ca_Cur
FETCH NEXT FROM cursor_Ca_Cur INTO @name_Ca_Cur

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_Cur.' + @name_Ca_Cur;
    
    DECLARE @sql_Ca_Cur NVARCHAR(MAX);
    SET @sql_Ca_Cur = 'ALTER TABLE Ca_Cur DROP COLUMN ' + QUOTENAME(@name_Ca_Cur)
    EXEC sp_executesql @sql_Ca_Cur
    
    
    FETCH NEXT FROM cursor_Ca_Cur INTO @name_Ca_Cur
END

CLOSE cursor_Ca_Cur;
DEALLOCATE cursor_Ca_Cur;


-- [Ca_Cur.Code] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Code')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [Code] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_Code NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_Code = 'ALTER TABLE Ca_Cur ADD [Code] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Cur_Code
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurCode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurCode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurCode')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurCode]
    END

-- [Ca_Cur.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_Caption = 'ALTER TABLE Ca_Cur ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Cur_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurCaption')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurCaption]
    END

-- [Ca_Cur.Hidden] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Hidden')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [Hidden] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_Hidden NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_Hidden = 'ALTER TABLE Ca_Cur ADD [Hidden] BIT'
    EXEC sp_executesql @sql_add_Ca_Cur_Hidden
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurHidden')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurHidden]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurHidden')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurHidden]
    END

-- [Ca_Cur.IsSac] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='IsSac')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [IsSac] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_IsSac NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_IsSac = 'ALTER TABLE Ca_Cur ADD [IsSac] BIT'
    EXEC sp_executesql @sql_add_Ca_Cur_IsSac
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurIsSac')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurIsSac]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurIsSac')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurIsSac]
    END

-- [Ca_Cur.IsTransfer] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='IsTransfer')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [IsTransfer] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_IsTransfer NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_IsTransfer = 'ALTER TABLE Ca_Cur ADD [IsTransfer] BIT'
    EXEC sp_executesql @sql_add_Ca_Cur_IsTransfer
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurIsTransfer')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurIsTransfer]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurIsTransfer')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurIsTransfer]
    END

-- [Ca_Cur.IsCash] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='IsCash')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [IsCash] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_IsCash NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_IsCash = 'ALTER TABLE Ca_Cur ADD [IsCash] BIT'
    EXEC sp_executesql @sql_add_Ca_Cur_IsCash
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurIsCash')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurIsCash]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurIsCash')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurIsCash]
    END

-- [Ca_Cur.EnableReward] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='EnableReward')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [EnableReward] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_EnableReward NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_EnableReward = 'ALTER TABLE Ca_Cur ADD [EnableReward] BIT'
    EXEC sp_executesql @sql_add_Ca_Cur_EnableReward
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurEnableReward')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurEnableReward]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurEnableReward')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurEnableReward]
    END

-- [Ca_Cur.EnableOTC] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='EnableOTC')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [EnableOTC] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_EnableOTC NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_EnableOTC = 'ALTER TABLE Ca_Cur ADD [EnableOTC] BIT'
    EXEC sp_executesql @sql_add_Ca_Cur_EnableOTC
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurEnableOTC')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurEnableOTC]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurEnableOTC')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurEnableOTC]
    END

-- [Ca_Cur.Icon] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Icon')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [Icon] NVARCHAR(512) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_Icon NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_Icon = 'ALTER TABLE Ca_Cur ADD [Icon] NVARCHAR(512) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Cur_Icon
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurIcon')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurIcon]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurIcon')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurIcon]
    END

-- [Ca_Cur.CurType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='CurType')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [CurType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_CurType NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_CurType = 'ALTER TABLE Ca_Cur ADD [CurType] INT'
    EXEC sp_executesql @sql_add_Ca_Cur_CurType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurCurType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurCurType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurCurType')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurCurType]
    END

-- [Ca_Cur.Dec] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Dec')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [Dec] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_Dec NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_Dec = 'ALTER TABLE Ca_Cur ADD [Dec] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Cur_Dec
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurDec')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurDec]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurDec')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurDec]
    END

-- [Ca_Cur.AnchorRate] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='AnchorRate')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [AnchorRate] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_AnchorRate NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_AnchorRate = 'ALTER TABLE Ca_Cur ADD [AnchorRate] FLOAT'
    EXEC sp_executesql @sql_add_Ca_Cur_AnchorRate
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurAnchorRate')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurAnchorRate]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurAnchorRate')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurAnchorRate]
    END

-- [Ca_Cur.Freezable] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Freezable')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [Freezable] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_Freezable NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_Freezable = 'ALTER TABLE Ca_Cur ADD [Freezable] BIT'
    EXEC sp_executesql @sql_add_Ca_Cur_Freezable
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurFreezable')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurFreezable]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurFreezable')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurFreezable]
    END

-- [Ca_Cur.Authorizable] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Authorizable')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [Authorizable] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_Authorizable NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_Authorizable = 'ALTER TABLE Ca_Cur ADD [Authorizable] BIT'
    EXEC sp_executesql @sql_add_Ca_Cur_Authorizable
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurAuthorizable')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurAuthorizable]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurAuthorizable')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurAuthorizable]
    END

-- [Ca_Cur.ChaninID] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='ChaninID')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [ChaninID] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_ChaninID NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_ChaninID = 'ALTER TABLE Ca_Cur ADD [ChaninID] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Cur_ChaninID
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurChaninID')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurChaninID]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurChaninID')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurChaninID]
    END

-- [Ca_Cur.ChaninName] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='ChaninName')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [ChaninName] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_ChaninName NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_ChaninName = 'ALTER TABLE Ca_Cur ADD [ChaninName] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Cur_ChaninName
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurChaninName')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurChaninName]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurChaninName')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurChaninName]
    END

-- [Ca_Cur.ContractAddress] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='ContractAddress')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [ContractAddress] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_ContractAddress NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_ContractAddress = 'ALTER TABLE Ca_Cur ADD [ContractAddress] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Cur_ContractAddress
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurContractAddress')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurContractAddress]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurContractAddress')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurContractAddress]
    END

-- [Ca_Cur.WalletAddress] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='WalletAddress')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [WalletAddress] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_WalletAddress NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_WalletAddress = 'ALTER TABLE Ca_Cur ADD [WalletAddress] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Cur_WalletAddress
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurWalletAddress')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurWalletAddress]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurWalletAddress')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurWalletAddress]
    END

-- [Ca_Cur.BaseRate] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='BaseRate')
    BEGIN
     ALTER TABLE Ca_Cur ALTER COLUMN [BaseRate] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Cur_BaseRate NVARCHAR(MAX);
    SET @sql_add_Ca_Cur_BaseRate = 'ALTER TABLE Ca_Cur ADD [BaseRate] FLOAT'
    EXEC sp_executesql @sql_add_Ca_Cur_BaseRate
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_CurBaseRate')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_CurBaseRate]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_CurBaseRate')
    BEGIN
    ALTER TABLE Ca_Cur DROP  CONSTRAINT [UniqueNonclustered_Ca_CurBaseRate]
    END
-- [Ca_EndUser] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_EndUser' AND xtype='U')

BEGIN

    CREATE TABLE Ca_EndUser ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Username] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[SocialAuthBiz] BIGINT
        ,[SocialAuthId] NVARCHAR(MAX)
        ,[SocialAuthAvatar] NVARCHAR(MAX)
        ,[Email] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Tel] NVARCHAR(32) COLLATE Chinese_PRC_CI_AS
        ,[Gender] INT
        ,[Status] INT
        ,[Admin] INT
        ,[BizPartner] INT
        ,[Privilege] BIGINT
        ,[Verify] INT
        ,[Pwd] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
        ,[Online] BIT
        ,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Background] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[BasicAcct] BIGINT
        ,[Citizen] BIGINT
        ,[Refer] NVARCHAR(7) COLLATE Chinese_PRC_CI_AS
        ,[Referer] BIGINT
        ,[Url] NVARCHAR(MAX)
        ,[About] NVARCHAR(MAX)
, CONSTRAINT [PK_Ca_EndUser] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_EndUser NVARCHAR(64)
DECLARE cursor_Ca_EndUser CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Caption','Username','SocialAuthBiz','SocialAuthId','SocialAuthAvatar','Email','Tel','Gender','Status','Admin','BizPartner','Privilege','Verify','Pwd','Online','Icon','Background','BasicAcct','Citizen','Refer','Referer','Url','About'))

OPEN cursor_Ca_EndUser
FETCH NEXT FROM cursor_Ca_EndUser INTO @name_Ca_EndUser

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_EndUser.' + @name_Ca_EndUser;
    
    DECLARE @sql_Ca_EndUser NVARCHAR(MAX);
    SET @sql_Ca_EndUser = 'ALTER TABLE Ca_EndUser DROP COLUMN ' + QUOTENAME(@name_Ca_EndUser)
    EXEC sp_executesql @sql_Ca_EndUser
    
    
    FETCH NEXT FROM cursor_Ca_EndUser INTO @name_Ca_EndUser
END

CLOSE cursor_Ca_EndUser;
DEALLOCATE cursor_Ca_EndUser;


-- [Ca_EndUser.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Caption = 'ALTER TABLE Ca_EndUser ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_EndUser_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserCaption')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserCaption]
    END

-- [Ca_EndUser.Username] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Username')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Username] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Username NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Username = 'ALTER TABLE Ca_EndUser ADD [Username] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_EndUser_Username
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserUsername')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserUsername]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserUsername')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserUsername]
    END

-- [Ca_EndUser.SocialAuthBiz] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='SocialAuthBiz')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [SocialAuthBiz] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_SocialAuthBiz NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_SocialAuthBiz = 'ALTER TABLE Ca_EndUser ADD [SocialAuthBiz] BIGINT'
    EXEC sp_executesql @sql_add_Ca_EndUser_SocialAuthBiz
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserSocialAuthBiz')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserSocialAuthBiz]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserSocialAuthBiz')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserSocialAuthBiz]
    END

-- [Ca_EndUser.SocialAuthId] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='SocialAuthId')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [SocialAuthId] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_SocialAuthId NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_SocialAuthId = 'ALTER TABLE Ca_EndUser ADD [SocialAuthId] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_EndUser_SocialAuthId
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserSocialAuthId')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserSocialAuthId]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserSocialAuthId')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserSocialAuthId]
    END

-- [Ca_EndUser.SocialAuthAvatar] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='SocialAuthAvatar')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [SocialAuthAvatar] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_SocialAuthAvatar NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_SocialAuthAvatar = 'ALTER TABLE Ca_EndUser ADD [SocialAuthAvatar] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_EndUser_SocialAuthAvatar
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserSocialAuthAvatar')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserSocialAuthAvatar]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserSocialAuthAvatar')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserSocialAuthAvatar]
    END

-- [Ca_EndUser.Email] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Email')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Email] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Email NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Email = 'ALTER TABLE Ca_EndUser ADD [Email] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_EndUser_Email
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserEmail')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserEmail]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserEmail')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserEmail]
    END

-- [Ca_EndUser.Tel] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Tel')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Tel] NVARCHAR(32) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Tel NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Tel = 'ALTER TABLE Ca_EndUser ADD [Tel] NVARCHAR(32) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_EndUser_Tel
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserTel')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserTel]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserTel')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserTel]
    END

-- [Ca_EndUser.Gender] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Gender')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Gender] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Gender NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Gender = 'ALTER TABLE Ca_EndUser ADD [Gender] INT'
    EXEC sp_executesql @sql_add_Ca_EndUser_Gender
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserGender')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserGender]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserGender')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserGender]
    END

-- [Ca_EndUser.Status] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Status')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Status] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Status NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Status = 'ALTER TABLE Ca_EndUser ADD [Status] INT'
    EXEC sp_executesql @sql_add_Ca_EndUser_Status
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserStatus')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserStatus]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserStatus')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserStatus]
    END

-- [Ca_EndUser.Admin] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Admin')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Admin] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Admin NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Admin = 'ALTER TABLE Ca_EndUser ADD [Admin] INT'
    EXEC sp_executesql @sql_add_Ca_EndUser_Admin
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserAdmin')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserAdmin]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserAdmin')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserAdmin]
    END

-- [Ca_EndUser.BizPartner] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='BizPartner')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [BizPartner] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_BizPartner NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_BizPartner = 'ALTER TABLE Ca_EndUser ADD [BizPartner] INT'
    EXEC sp_executesql @sql_add_Ca_EndUser_BizPartner
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserBizPartner')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserBizPartner]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserBizPartner')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserBizPartner]
    END

-- [Ca_EndUser.Privilege] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Privilege')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Privilege] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Privilege NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Privilege = 'ALTER TABLE Ca_EndUser ADD [Privilege] BIGINT'
    EXEC sp_executesql @sql_add_Ca_EndUser_Privilege
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserPrivilege')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserPrivilege]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserPrivilege')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserPrivilege]
    END

-- [Ca_EndUser.Verify] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Verify')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Verify] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Verify NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Verify = 'ALTER TABLE Ca_EndUser ADD [Verify] INT'
    EXEC sp_executesql @sql_add_Ca_EndUser_Verify
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserVerify')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserVerify]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserVerify')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserVerify]
    END

-- [Ca_EndUser.Pwd] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Pwd')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Pwd] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Pwd NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Pwd = 'ALTER TABLE Ca_EndUser ADD [Pwd] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_EndUser_Pwd
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserPwd')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserPwd]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserPwd')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserPwd]
    END

-- [Ca_EndUser.Online] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Online')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Online] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Online NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Online = 'ALTER TABLE Ca_EndUser ADD [Online] BIT'
    EXEC sp_executesql @sql_add_Ca_EndUser_Online
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserOnline')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserOnline]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserOnline')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserOnline]
    END

-- [Ca_EndUser.Icon] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Icon')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Icon NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Icon = 'ALTER TABLE Ca_EndUser ADD [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_EndUser_Icon
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserIcon')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserIcon]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserIcon')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserIcon]
    END

-- [Ca_EndUser.Background] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Background')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Background] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Background NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Background = 'ALTER TABLE Ca_EndUser ADD [Background] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_EndUser_Background
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserBackground')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserBackground]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserBackground')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserBackground]
    END

-- [Ca_EndUser.BasicAcct] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='BasicAcct')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [BasicAcct] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_BasicAcct NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_BasicAcct = 'ALTER TABLE Ca_EndUser ADD [BasicAcct] BIGINT'
    EXEC sp_executesql @sql_add_Ca_EndUser_BasicAcct
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserBasicAcct')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserBasicAcct]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserBasicAcct')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserBasicAcct]
    END

-- [Ca_EndUser.Citizen] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Citizen')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Citizen] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Citizen NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Citizen = 'ALTER TABLE Ca_EndUser ADD [Citizen] BIGINT'
    EXEC sp_executesql @sql_add_Ca_EndUser_Citizen
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserCitizen')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserCitizen]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserCitizen')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserCitizen]
    END

-- [Ca_EndUser.Refer] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Refer')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Refer] NVARCHAR(7) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Refer NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Refer = 'ALTER TABLE Ca_EndUser ADD [Refer] NVARCHAR(7) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_EndUser_Refer
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserRefer')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserRefer]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserRefer')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserRefer]
    END

-- [Ca_EndUser.Referer] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Referer')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Referer] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Referer NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Referer = 'ALTER TABLE Ca_EndUser ADD [Referer] BIGINT'
    EXEC sp_executesql @sql_add_Ca_EndUser_Referer
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserReferer')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserReferer]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserReferer')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserReferer]
    END

-- [Ca_EndUser.Url] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Url')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [Url] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_Url NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_Url = 'ALTER TABLE Ca_EndUser ADD [Url] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_EndUser_Url
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserUrl')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserUrl]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserUrl')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserUrl]
    END

-- [Ca_EndUser.About] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='About')
    BEGIN
     ALTER TABLE Ca_EndUser ALTER COLUMN [About] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_EndUser_About NVARCHAR(MAX);
    SET @sql_add_Ca_EndUser_About = 'ALTER TABLE Ca_EndUser ADD [About] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_EndUser_About
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_EndUserAbout')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_EndUserAbout]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_EndUserAbout')
    BEGIN
    ALTER TABLE Ca_EndUser DROP  CONSTRAINT [UniqueNonclustered_Ca_EndUserAbout]
    END
-- [Ca_File] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_File' AND xtype='U')

BEGIN

    CREATE TABLE Ca_File ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Encrypt] INT
        ,[SHA256] NVARCHAR(MAX)
        ,[Size] BIGINT
        ,[Bind] BIGINT
        ,[BindType] INT
        ,[State] INT
        ,[Folder] BIGINT
        ,[FileType] INT
        ,[JSON] NVARCHAR(MAX)
, CONSTRAINT [PK_Ca_File] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_File NVARCHAR(64)
DECLARE cursor_Ca_File CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Caption','Encrypt','SHA256','Size','Bind','BindType','State','Folder','FileType','JSON'))

OPEN cursor_Ca_File
FETCH NEXT FROM cursor_Ca_File INTO @name_Ca_File

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_File.' + @name_Ca_File;
    
    DECLARE @sql_Ca_File NVARCHAR(MAX);
    SET @sql_Ca_File = 'ALTER TABLE Ca_File DROP COLUMN ' + QUOTENAME(@name_Ca_File)
    EXEC sp_executesql @sql_Ca_File
    
    
    FETCH NEXT FROM cursor_Ca_File INTO @name_Ca_File
END

CLOSE cursor_Ca_File;
DEALLOCATE cursor_Ca_File;


-- [Ca_File.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_File_Caption = 'ALTER TABLE Ca_File ADD [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_File_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileCaption')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileCaption]
    END

-- [Ca_File.Encrypt] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Encrypt')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [Encrypt] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_Encrypt NVARCHAR(MAX);
    SET @sql_add_Ca_File_Encrypt = 'ALTER TABLE Ca_File ADD [Encrypt] INT'
    EXEC sp_executesql @sql_add_Ca_File_Encrypt
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileEncrypt')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileEncrypt]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileEncrypt')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileEncrypt]
    END

-- [Ca_File.SHA256] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='SHA256')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [SHA256] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_SHA256 NVARCHAR(MAX);
    SET @sql_add_Ca_File_SHA256 = 'ALTER TABLE Ca_File ADD [SHA256] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_File_SHA256
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileSHA256')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileSHA256]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileSHA256')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileSHA256]
    END

-- [Ca_File.Size] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Size')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [Size] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_Size NVARCHAR(MAX);
    SET @sql_add_Ca_File_Size = 'ALTER TABLE Ca_File ADD [Size] BIGINT'
    EXEC sp_executesql @sql_add_Ca_File_Size
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileSize')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileSize]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileSize')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileSize]
    END

-- [Ca_File.Bind] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Bind')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [Bind] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_Bind NVARCHAR(MAX);
    SET @sql_add_Ca_File_Bind = 'ALTER TABLE Ca_File ADD [Bind] BIGINT'
    EXEC sp_executesql @sql_add_Ca_File_Bind
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileBind')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileBind]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileBind')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileBind]
    END

-- [Ca_File.BindType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='BindType')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [BindType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_BindType NVARCHAR(MAX);
    SET @sql_add_Ca_File_BindType = 'ALTER TABLE Ca_File ADD [BindType] INT'
    EXEC sp_executesql @sql_add_Ca_File_BindType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileBindType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileBindType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileBindType')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileBindType]
    END

-- [Ca_File.State] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='State')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [State] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_State NVARCHAR(MAX);
    SET @sql_add_Ca_File_State = 'ALTER TABLE Ca_File ADD [State] INT'
    EXEC sp_executesql @sql_add_Ca_File_State
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileState')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileState]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileState')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileState]
    END

-- [Ca_File.Folder] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Folder')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [Folder] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_Folder NVARCHAR(MAX);
    SET @sql_add_Ca_File_Folder = 'ALTER TABLE Ca_File ADD [Folder] BIGINT'
    EXEC sp_executesql @sql_add_Ca_File_Folder
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileFolder')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileFolder]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileFolder')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileFolder]
    END

-- [Ca_File.FileType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='FileType')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [FileType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_FileType NVARCHAR(MAX);
    SET @sql_add_Ca_File_FileType = 'ALTER TABLE Ca_File ADD [FileType] INT'
    EXEC sp_executesql @sql_add_Ca_File_FileType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileFileType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileFileType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileFileType')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileFileType]
    END

-- [Ca_File.JSON] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='JSON')
    BEGIN
     ALTER TABLE Ca_File ALTER COLUMN [JSON] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_File_JSON NVARCHAR(MAX);
    SET @sql_add_Ca_File_JSON = 'ALTER TABLE Ca_File ADD [JSON] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_File_JSON
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FileJSON')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FileJSON]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FileJSON')
    BEGIN
    ALTER TABLE Ca_File DROP  CONSTRAINT [UniqueNonclustered_Ca_FileJSON]
    END
-- [Ca_Folder] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Folder' AND xtype='U')

BEGIN

    CREATE TABLE Ca_Folder ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Encrypt] INT
        ,[Bind] BIGINT
        ,[BindType] INT
        ,[Parent] BIGINT
, CONSTRAINT [PK_Ca_Folder] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_Folder NVARCHAR(64)
DECLARE cursor_Ca_Folder CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Caption','Encrypt','Bind','BindType','Parent'))

OPEN cursor_Ca_Folder
FETCH NEXT FROM cursor_Ca_Folder INTO @name_Ca_Folder

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_Folder.' + @name_Ca_Folder;
    
    DECLARE @sql_Ca_Folder NVARCHAR(MAX);
    SET @sql_Ca_Folder = 'ALTER TABLE Ca_Folder DROP COLUMN ' + QUOTENAME(@name_Ca_Folder)
    EXEC sp_executesql @sql_Ca_Folder
    
    
    FETCH NEXT FROM cursor_Ca_Folder INTO @name_Ca_Folder
END

CLOSE cursor_Ca_Folder;
DEALLOCATE cursor_Ca_Folder;


-- [Ca_Folder.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_Folder ALTER COLUMN [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Folder_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_Folder_Caption = 'ALTER TABLE Ca_Folder ADD [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Folder_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FolderCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FolderCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FolderCaption')
    BEGIN
    ALTER TABLE Ca_Folder DROP  CONSTRAINT [UniqueNonclustered_Ca_FolderCaption]
    END

-- [Ca_Folder.Encrypt] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='Encrypt')
    BEGIN
     ALTER TABLE Ca_Folder ALTER COLUMN [Encrypt] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Folder_Encrypt NVARCHAR(MAX);
    SET @sql_add_Ca_Folder_Encrypt = 'ALTER TABLE Ca_Folder ADD [Encrypt] INT'
    EXEC sp_executesql @sql_add_Ca_Folder_Encrypt
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FolderEncrypt')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FolderEncrypt]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FolderEncrypt')
    BEGIN
    ALTER TABLE Ca_Folder DROP  CONSTRAINT [UniqueNonclustered_Ca_FolderEncrypt]
    END

-- [Ca_Folder.Bind] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='Bind')
    BEGIN
     ALTER TABLE Ca_Folder ALTER COLUMN [Bind] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Folder_Bind NVARCHAR(MAX);
    SET @sql_add_Ca_Folder_Bind = 'ALTER TABLE Ca_Folder ADD [Bind] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Folder_Bind
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FolderBind')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FolderBind]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FolderBind')
    BEGIN
    ALTER TABLE Ca_Folder DROP  CONSTRAINT [UniqueNonclustered_Ca_FolderBind]
    END

-- [Ca_Folder.BindType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='BindType')
    BEGIN
     ALTER TABLE Ca_Folder ALTER COLUMN [BindType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Folder_BindType NVARCHAR(MAX);
    SET @sql_add_Ca_Folder_BindType = 'ALTER TABLE Ca_Folder ADD [BindType] INT'
    EXEC sp_executesql @sql_add_Ca_Folder_BindType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FolderBindType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FolderBindType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FolderBindType')
    BEGIN
    ALTER TABLE Ca_Folder DROP  CONSTRAINT [UniqueNonclustered_Ca_FolderBindType]
    END

-- [Ca_Folder.Parent] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='Parent')
    BEGIN
     ALTER TABLE Ca_Folder ALTER COLUMN [Parent] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Folder_Parent NVARCHAR(MAX);
    SET @sql_add_Ca_Folder_Parent = 'ALTER TABLE Ca_Folder ADD [Parent] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Folder_Parent
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_FolderParent')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_FolderParent]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_FolderParent')
    BEGIN
    ALTER TABLE Ca_Folder DROP  CONSTRAINT [UniqueNonclustered_Ca_FolderParent]
    END
-- [Ca_Lang] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Lang' AND xtype='U')

BEGIN

    CREATE TABLE Ca_Lang ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS
        ,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Native] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[IsBlank] BIT
        ,[IsLocale] BIT
        ,[IsContent] BIT
        ,[IsAutoTranslate] BIT
        ,[IsMiles] BIT
        ,[TextDirection] INT
, CONSTRAINT [PK_Ca_Lang] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_Lang NVARCHAR(64)
DECLARE cursor_Ca_Lang CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Code2','Caption','Native','Icon','IsBlank','IsLocale','IsContent','IsAutoTranslate','IsMiles','TextDirection'))

OPEN cursor_Ca_Lang
FETCH NEXT FROM cursor_Ca_Lang INTO @name_Ca_Lang

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_Lang.' + @name_Ca_Lang;
    
    DECLARE @sql_Ca_Lang NVARCHAR(MAX);
    SET @sql_Ca_Lang = 'ALTER TABLE Ca_Lang DROP COLUMN ' + QUOTENAME(@name_Ca_Lang)
    EXEC sp_executesql @sql_Ca_Lang
    
    
    FETCH NEXT FROM cursor_Ca_Lang INTO @name_Ca_Lang
END

CLOSE cursor_Ca_Lang;
DEALLOCATE cursor_Ca_Lang;


-- [Ca_Lang.Code2] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='Code2')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Lang_Code2 NVARCHAR(MAX);
    SET @sql_add_Ca_Lang_Code2 = 'ALTER TABLE Ca_Lang ADD [Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Lang_Code2
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LangCode2')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LangCode2]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LangCode2')
    BEGIN
    ALTER TABLE Ca_Lang DROP  CONSTRAINT [UniqueNonclustered_Ca_LangCode2]
    END

-- [Ca_Lang.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Lang_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_Lang_Caption = 'ALTER TABLE Ca_Lang ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Lang_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LangCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LangCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LangCaption')
    BEGIN
    ALTER TABLE Ca_Lang DROP  CONSTRAINT [UniqueNonclustered_Ca_LangCaption]
    END

-- [Ca_Lang.Native] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='Native')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [Native] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Lang_Native NVARCHAR(MAX);
    SET @sql_add_Ca_Lang_Native = 'ALTER TABLE Ca_Lang ADD [Native] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Lang_Native
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LangNative')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LangNative]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LangNative')
    BEGIN
    ALTER TABLE Ca_Lang DROP  CONSTRAINT [UniqueNonclustered_Ca_LangNative]
    END

-- [Ca_Lang.Icon] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='Icon')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Lang_Icon NVARCHAR(MAX);
    SET @sql_add_Ca_Lang_Icon = 'ALTER TABLE Ca_Lang ADD [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Lang_Icon
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LangIcon')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LangIcon]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LangIcon')
    BEGIN
    ALTER TABLE Ca_Lang DROP  CONSTRAINT [UniqueNonclustered_Ca_LangIcon]
    END

-- [Ca_Lang.IsBlank] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='IsBlank')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [IsBlank] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Lang_IsBlank NVARCHAR(MAX);
    SET @sql_add_Ca_Lang_IsBlank = 'ALTER TABLE Ca_Lang ADD [IsBlank] BIT'
    EXEC sp_executesql @sql_add_Ca_Lang_IsBlank
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LangIsBlank')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LangIsBlank]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LangIsBlank')
    BEGIN
    ALTER TABLE Ca_Lang DROP  CONSTRAINT [UniqueNonclustered_Ca_LangIsBlank]
    END

-- [Ca_Lang.IsLocale] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='IsLocale')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [IsLocale] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Lang_IsLocale NVARCHAR(MAX);
    SET @sql_add_Ca_Lang_IsLocale = 'ALTER TABLE Ca_Lang ADD [IsLocale] BIT'
    EXEC sp_executesql @sql_add_Ca_Lang_IsLocale
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LangIsLocale')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LangIsLocale]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LangIsLocale')
    BEGIN
    ALTER TABLE Ca_Lang DROP  CONSTRAINT [UniqueNonclustered_Ca_LangIsLocale]
    END

-- [Ca_Lang.IsContent] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='IsContent')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [IsContent] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Lang_IsContent NVARCHAR(MAX);
    SET @sql_add_Ca_Lang_IsContent = 'ALTER TABLE Ca_Lang ADD [IsContent] BIT'
    EXEC sp_executesql @sql_add_Ca_Lang_IsContent
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LangIsContent')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LangIsContent]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LangIsContent')
    BEGIN
    ALTER TABLE Ca_Lang DROP  CONSTRAINT [UniqueNonclustered_Ca_LangIsContent]
    END

-- [Ca_Lang.IsAutoTranslate] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='IsAutoTranslate')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [IsAutoTranslate] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Lang_IsAutoTranslate NVARCHAR(MAX);
    SET @sql_add_Ca_Lang_IsAutoTranslate = 'ALTER TABLE Ca_Lang ADD [IsAutoTranslate] BIT'
    EXEC sp_executesql @sql_add_Ca_Lang_IsAutoTranslate
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LangIsAutoTranslate')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LangIsAutoTranslate]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LangIsAutoTranslate')
    BEGIN
    ALTER TABLE Ca_Lang DROP  CONSTRAINT [UniqueNonclustered_Ca_LangIsAutoTranslate]
    END

-- [Ca_Lang.IsMiles] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='IsMiles')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [IsMiles] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Lang_IsMiles NVARCHAR(MAX);
    SET @sql_add_Ca_Lang_IsMiles = 'ALTER TABLE Ca_Lang ADD [IsMiles] BIT'
    EXEC sp_executesql @sql_add_Ca_Lang_IsMiles
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LangIsMiles')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LangIsMiles]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LangIsMiles')
    BEGIN
    ALTER TABLE Ca_Lang DROP  CONSTRAINT [UniqueNonclustered_Ca_LangIsMiles]
    END

-- [Ca_Lang.TextDirection] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='TextDirection')
    BEGIN
     ALTER TABLE Ca_Lang ALTER COLUMN [TextDirection] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Lang_TextDirection NVARCHAR(MAX);
    SET @sql_add_Ca_Lang_TextDirection = 'ALTER TABLE Ca_Lang ADD [TextDirection] INT'
    EXEC sp_executesql @sql_add_Ca_Lang_TextDirection
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LangTextDirection')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LangTextDirection]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LangTextDirection')
    BEGIN
    ALTER TABLE Ca_Lang DROP  CONSTRAINT [UniqueNonclustered_Ca_LangTextDirection]
    END
-- [Ca_Locale] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Locale' AND xtype='U')

BEGIN

    CREATE TABLE Ca_Locale ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Code] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Lang] BIGINT
        ,[Zh] NVARCHAR(MAX)
        ,[Text] NVARCHAR(MAX)
, CONSTRAINT [PK_Ca_Locale] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_Locale NVARCHAR(64)
DECLARE cursor_Ca_Locale CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_Locale') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Code','Lang','Zh','Text'))

OPEN cursor_Ca_Locale
FETCH NEXT FROM cursor_Ca_Locale INTO @name_Ca_Locale

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_Locale.' + @name_Ca_Locale;
    
    DECLARE @sql_Ca_Locale NVARCHAR(MAX);
    SET @sql_Ca_Locale = 'ALTER TABLE Ca_Locale DROP COLUMN ' + QUOTENAME(@name_Ca_Locale)
    EXEC sp_executesql @sql_Ca_Locale
    
    
    FETCH NEXT FROM cursor_Ca_Locale INTO @name_Ca_Locale
END

CLOSE cursor_Ca_Locale;
DEALLOCATE cursor_Ca_Locale;


-- [Ca_Locale.Code] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Locale') AND name='Code')
    BEGIN
     ALTER TABLE Ca_Locale ALTER COLUMN [Code] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Locale_Code NVARCHAR(MAX);
    SET @sql_add_Ca_Locale_Code = 'ALTER TABLE Ca_Locale ADD [Code] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_Locale_Code
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LocaleCode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LocaleCode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LocaleCode')
    BEGIN
    ALTER TABLE Ca_Locale DROP  CONSTRAINT [UniqueNonclustered_Ca_LocaleCode]
    END

-- [Ca_Locale.Lang] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Locale') AND name='Lang')
    BEGIN
     ALTER TABLE Ca_Locale ALTER COLUMN [Lang] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Locale_Lang NVARCHAR(MAX);
    SET @sql_add_Ca_Locale_Lang = 'ALTER TABLE Ca_Locale ADD [Lang] BIGINT'
    EXEC sp_executesql @sql_add_Ca_Locale_Lang
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LocaleLang')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LocaleLang]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LocaleLang')
    BEGIN
    ALTER TABLE Ca_Locale DROP  CONSTRAINT [UniqueNonclustered_Ca_LocaleLang]
    END

-- [Ca_Locale.Zh] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Locale') AND name='Zh')
    BEGIN
     ALTER TABLE Ca_Locale ALTER COLUMN [Zh] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Locale_Zh NVARCHAR(MAX);
    SET @sql_add_Ca_Locale_Zh = 'ALTER TABLE Ca_Locale ADD [Zh] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_Locale_Zh
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LocaleZh')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LocaleZh]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LocaleZh')
    BEGIN
    ALTER TABLE Ca_Locale DROP  CONSTRAINT [UniqueNonclustered_Ca_LocaleZh]
    END

-- [Ca_Locale.Text] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Locale') AND name='Text')
    BEGIN
     ALTER TABLE Ca_Locale ALTER COLUMN [Text] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_Locale_Text NVARCHAR(MAX);
    SET @sql_add_Ca_Locale_Text = 'ALTER TABLE Ca_Locale ADD [Text] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_Locale_Text
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_LocaleText')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_LocaleText]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_LocaleText')
    BEGIN
    ALTER TABLE Ca_Locale DROP  CONSTRAINT [UniqueNonclustered_Ca_LocaleText]
    END
-- [Ca_SpecialItem] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_SpecialItem' AND xtype='U')

BEGIN

    CREATE TABLE Ca_SpecialItem ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Type] INT
        ,[Lang] BIGINT
        ,[Bind] BIGINT
, CONSTRAINT [PK_Ca_SpecialItem] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_SpecialItem NVARCHAR(64)
DECLARE cursor_Ca_SpecialItem CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_SpecialItem') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Type','Lang','Bind'))

OPEN cursor_Ca_SpecialItem
FETCH NEXT FROM cursor_Ca_SpecialItem INTO @name_Ca_SpecialItem

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_SpecialItem.' + @name_Ca_SpecialItem;
    
    DECLARE @sql_Ca_SpecialItem NVARCHAR(MAX);
    SET @sql_Ca_SpecialItem = 'ALTER TABLE Ca_SpecialItem DROP COLUMN ' + QUOTENAME(@name_Ca_SpecialItem)
    EXEC sp_executesql @sql_Ca_SpecialItem
    
    
    FETCH NEXT FROM cursor_Ca_SpecialItem INTO @name_Ca_SpecialItem
END

CLOSE cursor_Ca_SpecialItem;
DEALLOCATE cursor_Ca_SpecialItem;


-- [Ca_SpecialItem.Type] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_SpecialItem') AND name='Type')
    BEGIN
     ALTER TABLE Ca_SpecialItem ALTER COLUMN [Type] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_SpecialItem_Type NVARCHAR(MAX);
    SET @sql_add_Ca_SpecialItem_Type = 'ALTER TABLE Ca_SpecialItem ADD [Type] INT'
    EXEC sp_executesql @sql_add_Ca_SpecialItem_Type
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_SpecialItemType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_SpecialItemType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_SpecialItemType')
    BEGIN
    ALTER TABLE Ca_SpecialItem DROP  CONSTRAINT [UniqueNonclustered_Ca_SpecialItemType]
    END

-- [Ca_SpecialItem.Lang] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_SpecialItem') AND name='Lang')
    BEGIN
     ALTER TABLE Ca_SpecialItem ALTER COLUMN [Lang] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_SpecialItem_Lang NVARCHAR(MAX);
    SET @sql_add_Ca_SpecialItem_Lang = 'ALTER TABLE Ca_SpecialItem ADD [Lang] BIGINT'
    EXEC sp_executesql @sql_add_Ca_SpecialItem_Lang
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_SpecialItemLang')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_SpecialItemLang]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_SpecialItemLang')
    BEGIN
    ALTER TABLE Ca_SpecialItem DROP  CONSTRAINT [UniqueNonclustered_Ca_SpecialItemLang]
    END

-- [Ca_SpecialItem.Bind] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_SpecialItem') AND name='Bind')
    BEGIN
     ALTER TABLE Ca_SpecialItem ALTER COLUMN [Bind] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_SpecialItem_Bind NVARCHAR(MAX);
    SET @sql_add_Ca_SpecialItem_Bind = 'ALTER TABLE Ca_SpecialItem ADD [Bind] BIGINT'
    EXEC sp_executesql @sql_add_Ca_SpecialItem_Bind
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_SpecialItemBind')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_SpecialItemBind]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_SpecialItemBind')
    BEGIN
    ALTER TABLE Ca_SpecialItem DROP  CONSTRAINT [UniqueNonclustered_Ca_SpecialItemBind]
    END
-- [Ca_WebCredential] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_WebCredential' AND xtype='U')

BEGIN

    CREATE TABLE Ca_WebCredential ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[ExternalId] BIGINT
        ,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[EU] BIGINT
        ,[Biz] BIGINT
        ,[Json] NVARCHAR(MAX)
, CONSTRAINT [PK_Ca_WebCredential] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ca_WebCredential NVARCHAR(64)
DECLARE cursor_Ca_WebCredential CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Caption','ExternalId','Icon','EU','Biz','Json'))

OPEN cursor_Ca_WebCredential
FETCH NEXT FROM cursor_Ca_WebCredential INTO @name_Ca_WebCredential

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ca_WebCredential.' + @name_Ca_WebCredential;
    
    DECLARE @sql_Ca_WebCredential NVARCHAR(MAX);
    SET @sql_Ca_WebCredential = 'ALTER TABLE Ca_WebCredential DROP COLUMN ' + QUOTENAME(@name_Ca_WebCredential)
    EXEC sp_executesql @sql_Ca_WebCredential
    
    
    FETCH NEXT FROM cursor_Ca_WebCredential INTO @name_Ca_WebCredential
END

CLOSE cursor_Ca_WebCredential;
DEALLOCATE cursor_Ca_WebCredential;


-- [Ca_WebCredential.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='Caption')
    BEGIN
     ALTER TABLE Ca_WebCredential ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_WebCredential_Caption NVARCHAR(MAX);
    SET @sql_add_Ca_WebCredential_Caption = 'ALTER TABLE Ca_WebCredential ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_WebCredential_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_WebCredentialCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_WebCredentialCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_WebCredentialCaption')
    BEGIN
    ALTER TABLE Ca_WebCredential DROP  CONSTRAINT [UniqueNonclustered_Ca_WebCredentialCaption]
    END

-- [Ca_WebCredential.ExternalId] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='ExternalId')
    BEGIN
     ALTER TABLE Ca_WebCredential ALTER COLUMN [ExternalId] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_WebCredential_ExternalId NVARCHAR(MAX);
    SET @sql_add_Ca_WebCredential_ExternalId = 'ALTER TABLE Ca_WebCredential ADD [ExternalId] BIGINT'
    EXEC sp_executesql @sql_add_Ca_WebCredential_ExternalId
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_WebCredentialExternalId')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_WebCredentialExternalId]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_WebCredentialExternalId')
    BEGIN
    ALTER TABLE Ca_WebCredential DROP  CONSTRAINT [UniqueNonclustered_Ca_WebCredentialExternalId]
    END

-- [Ca_WebCredential.Icon] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='Icon')
    BEGIN
     ALTER TABLE Ca_WebCredential ALTER COLUMN [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_WebCredential_Icon NVARCHAR(MAX);
    SET @sql_add_Ca_WebCredential_Icon = 'ALTER TABLE Ca_WebCredential ADD [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ca_WebCredential_Icon
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_WebCredentialIcon')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_WebCredentialIcon]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_WebCredentialIcon')
    BEGIN
    ALTER TABLE Ca_WebCredential DROP  CONSTRAINT [UniqueNonclustered_Ca_WebCredentialIcon]
    END

-- [Ca_WebCredential.EU] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='EU')
    BEGIN
     ALTER TABLE Ca_WebCredential ALTER COLUMN [EU] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_WebCredential_EU NVARCHAR(MAX);
    SET @sql_add_Ca_WebCredential_EU = 'ALTER TABLE Ca_WebCredential ADD [EU] BIGINT'
    EXEC sp_executesql @sql_add_Ca_WebCredential_EU
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_WebCredentialEU')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_WebCredentialEU]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_WebCredentialEU')
    BEGIN
    ALTER TABLE Ca_WebCredential DROP  CONSTRAINT [UniqueNonclustered_Ca_WebCredentialEU]
    END

-- [Ca_WebCredential.Biz] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='Biz')
    BEGIN
     ALTER TABLE Ca_WebCredential ALTER COLUMN [Biz] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_WebCredential_Biz NVARCHAR(MAX);
    SET @sql_add_Ca_WebCredential_Biz = 'ALTER TABLE Ca_WebCredential ADD [Biz] BIGINT'
    EXEC sp_executesql @sql_add_Ca_WebCredential_Biz
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_WebCredentialBiz')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_WebCredentialBiz]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_WebCredentialBiz')
    BEGIN
    ALTER TABLE Ca_WebCredential DROP  CONSTRAINT [UniqueNonclustered_Ca_WebCredentialBiz]
    END

-- [Ca_WebCredential.Json] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='Json')
    BEGIN
     ALTER TABLE Ca_WebCredential ALTER COLUMN [Json] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ca_WebCredential_Json NVARCHAR(MAX);
    SET @sql_add_Ca_WebCredential_Json = 'ALTER TABLE Ca_WebCredential ADD [Json] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ca_WebCredential_Json
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ca_WebCredentialJson')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ca_WebCredentialJson]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ca_WebCredentialJson')
    BEGIN
    ALTER TABLE Ca_WebCredential DROP  CONSTRAINT [UniqueNonclustered_Ca_WebCredentialJson]
    END
-- [Ex_Instrument] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ex_Instrument' AND xtype='U')

BEGIN

    CREATE TABLE Ex_Instrument ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Desc] NVARCHAR(MAX)
        ,[Hidden] BIT
        ,[EnableQuote] BIT
        ,[Code] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Long] BIGINT
        ,[AssetName] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Short] BIGINT
        ,[Convertor] BIGINT
        ,[m] FLOAT
        ,[mu] FLOAT
        ,[eta] FLOAT
        ,[psi] FLOAT
        ,[MarginCalc] INT
        ,[MarginRateInit] FLOAT
        ,[MarginRateMntn] FLOAT
        ,[MarginMode] INT
        ,[Dec] BIGINT
        ,[Formatter] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Path] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Ask] BIGINT
        ,[Bid] BIGINT
        ,[Middle] FLOAT
        ,[FixedSpread] FLOAT
        ,[PercentageSpread] FLOAT
        ,[TaxOpenMode] INT
        ,[TaxOpen] FLOAT
        ,[TaxCloseMode] INT
        ,[TaxClose] FLOAT
        ,[Tax] FLOAT
        ,[TaxCur] BIGINT
        ,[TaxCurCode] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[LastPrice] FLOAT
        ,[LastUpdatedat] BIGINT
        ,[LastPriceChange] BIGINT
        ,[TradeStatus] INT
        ,[RoMode] INT
        ,[Schedule] NVARCHAR(MAX)
        ,[TradeMode] INT
        ,[DerivativeMode] INT
        ,[OptionsMode] INT
        ,[OptionsCP] INT
        ,[OptionsExpiry] BIGINT
        ,[OptionsStrike] FLOAT
        ,[OptionsPricing] NVARCHAR(MAX)
        ,[OptionsPeriod] NVARCHAR(MAX)
        ,[OptionsTax] FLOAT
        ,[OptionsPremiumPerTradeMin] FLOAT
        ,[OptionsPremiumPerTradeMax] FLOAT
        ,[LimitLotPerTrade] FLOAT
        ,[LimitLotPosition] FLOAT
        ,[CurrentOpen] FLOAT
        ,[CurrentHigh] FLOAT
        ,[CurrentLow] FLOAT
        ,[PrevClose] FLOAT
        ,[PrevClosedat] BIGINT
        ,[CurrentOpenat] BIGINT
        ,[ExtBiz] BIGINT
        ,[RefExternal] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[ItrnInss] NVARCHAR(MAX)
        ,[ItrnInssMode] INT
        ,[FlushType] INT
        ,[CurTrigger] INT
        ,[RobotType] INT
        ,[ExtLong] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[ExtShort] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[ExtPrice] FLOAT
        ,[SaveM1] BIT
        ,[HistSavedat] BIGINT
        ,[SaveD1] BIT
        ,[SlPips] FLOAT
        ,[TpPips] FLOAT
        ,[PendingLimitPips] FLOAT
        ,[PendingStopPips] FLOAT
        ,[LastDirection] INT
        ,[LiqMode] INT
        ,[LiqPeriodSince] BIGINT
        ,[LiqPeriodTill] BIGINT
        ,[LiqPeriod] INT
        ,[LiqTime] FLOAT
        ,[ConvertRatio] FLOAT
        ,[RoBuyMode] INT
        ,[RoBuy] FLOAT
        ,[RoSellMode] INT
        ,[RoSell] FLOAT
        ,[PosLimitBuy] FLOAT
        ,[PosLimitSell] FLOAT
        ,[RoCur] BIGINT
        ,[RoCurCode] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[AdjBias] FLOAT
        ,[TaxBuy] FLOAT
        ,[TaxSell] FLOAT
        ,[Misc] NVARCHAR(MAX)
        ,[RefLastPriceChange] BIGINT
        ,[HedgeExternal] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[OfferingPrice] FLOAT
        ,[IssuanceAmount] BIGINT
        ,[ListingStatus] INT
        ,[Turnover] FLOAT
        ,[PriceOpened] BIGINT
, CONSTRAINT [PK_Ex_Instrument] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ex_Instrument NVARCHAR(64)
DECLARE cursor_Ex_Instrument CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Desc','Hidden','EnableQuote','Code','Caption','Long','AssetName','Short','Convertor','m','mu','eta','psi','MarginCalc','MarginRateInit','MarginRateMntn','MarginMode','Dec','Formatter','Path','Ask','Bid','Middle','FixedSpread','PercentageSpread','TaxOpenMode','TaxOpen','TaxCloseMode','TaxClose','Tax','TaxCur','TaxCurCode','LastPrice','LastUpdatedat','LastPriceChange','TradeStatus','RoMode','Schedule','TradeMode','DerivativeMode','OptionsMode','OptionsCP','OptionsExpiry','OptionsStrike','OptionsPricing','OptionsPeriod','OptionsTax','OptionsPremiumPerTradeMin','OptionsPremiumPerTradeMax','LimitLotPerTrade','LimitLotPosition','CurrentOpen','CurrentHigh','CurrentLow','PrevClose','PrevClosedat','CurrentOpenat','ExtBiz','RefExternal','ItrnInss','ItrnInssMode','FlushType','CurTrigger','RobotType','ExtLong','ExtShort','ExtPrice','SaveM1','HistSavedat','SaveD1','SlPips','TpPips','PendingLimitPips','PendingStopPips','LastDirection','LiqMode','LiqPeriodSince','LiqPeriodTill','LiqPeriod','LiqTime','ConvertRatio','RoBuyMode','RoBuy','RoSellMode','RoSell','PosLimitBuy','PosLimitSell','RoCur','RoCurCode','AdjBias','TaxBuy','TaxSell','Misc','RefLastPriceChange','HedgeExternal','OfferingPrice','IssuanceAmount','ListingStatus','Turnover','PriceOpened'))

OPEN cursor_Ex_Instrument
FETCH NEXT FROM cursor_Ex_Instrument INTO @name_Ex_Instrument

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ex_Instrument.' + @name_Ex_Instrument;
    
    DECLARE @sql_Ex_Instrument NVARCHAR(MAX);
    SET @sql_Ex_Instrument = 'ALTER TABLE Ex_Instrument DROP COLUMN ' + QUOTENAME(@name_Ex_Instrument)
    EXEC sp_executesql @sql_Ex_Instrument
    
    
    FETCH NEXT FROM cursor_Ex_Instrument INTO @name_Ex_Instrument
END

CLOSE cursor_Ex_Instrument;
DEALLOCATE cursor_Ex_Instrument;


-- [Ex_Instrument.Desc] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Desc')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [Desc] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_Desc NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_Desc = 'ALTER TABLE Ex_Instrument ADD [Desc] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ex_Instrument_Desc
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentDesc')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentDesc]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentDesc')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentDesc]
    END

-- [Ex_Instrument.Hidden] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Hidden')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [Hidden] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_Hidden NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_Hidden = 'ALTER TABLE Ex_Instrument ADD [Hidden] BIT'
    EXEC sp_executesql @sql_add_Ex_Instrument_Hidden
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentHidden')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentHidden]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentHidden')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentHidden]
    END

-- [Ex_Instrument.EnableQuote] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='EnableQuote')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [EnableQuote] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_EnableQuote NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_EnableQuote = 'ALTER TABLE Ex_Instrument ADD [EnableQuote] BIT'
    EXEC sp_executesql @sql_add_Ex_Instrument_EnableQuote
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentEnableQuote')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentEnableQuote]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentEnableQuote')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentEnableQuote]
    END

-- [Ex_Instrument.Code] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Code')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [Code] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_Code NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_Code = 'ALTER TABLE Ex_Instrument ADD [Code] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ex_Instrument_Code
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentCode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentCode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentCode')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentCode]
    END

-- [Ex_Instrument.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Caption')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_Caption NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_Caption = 'ALTER TABLE Ex_Instrument ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ex_Instrument_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentCaption')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentCaption]
    END

-- [Ex_Instrument.Long] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Long')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [Long] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_Long NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_Long = 'ALTER TABLE Ex_Instrument ADD [Long] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_Long
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentLong')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentLong]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentLong')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentLong]
    END

-- [Ex_Instrument.AssetName] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='AssetName')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [AssetName] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_AssetName NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_AssetName = 'ALTER TABLE Ex_Instrument ADD [AssetName] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ex_Instrument_AssetName
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentAssetName')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentAssetName]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentAssetName')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentAssetName]
    END

-- [Ex_Instrument.Short] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Short')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [Short] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_Short NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_Short = 'ALTER TABLE Ex_Instrument ADD [Short] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_Short
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentShort')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentShort]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentShort')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentShort]
    END

-- [Ex_Instrument.Convertor] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Convertor')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [Convertor] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_Convertor NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_Convertor = 'ALTER TABLE Ex_Instrument ADD [Convertor] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_Convertor
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentConvertor')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentConvertor]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentConvertor')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentConvertor]
    END

-- [Ex_Instrument.m] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='m')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [m] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_m NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_m = 'ALTER TABLE Ex_Instrument ADD [m] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_m
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_Instrumentm')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_Instrumentm]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_Instrumentm')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_Instrumentm]
    END

-- [Ex_Instrument.mu] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='mu')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [mu] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_mu NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_mu = 'ALTER TABLE Ex_Instrument ADD [mu] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_mu
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_Instrumentmu')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_Instrumentmu]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_Instrumentmu')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_Instrumentmu]
    END

-- [Ex_Instrument.eta] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='eta')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [eta] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_eta NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_eta = 'ALTER TABLE Ex_Instrument ADD [eta] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_eta
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_Instrumenteta')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_Instrumenteta]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_Instrumenteta')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_Instrumenteta]
    END

-- [Ex_Instrument.psi] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='psi')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [psi] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_psi NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_psi = 'ALTER TABLE Ex_Instrument ADD [psi] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_psi
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_Instrumentpsi')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_Instrumentpsi]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_Instrumentpsi')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_Instrumentpsi]
    END

-- [Ex_Instrument.MarginCalc] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='MarginCalc')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [MarginCalc] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_MarginCalc NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_MarginCalc = 'ALTER TABLE Ex_Instrument ADD [MarginCalc] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_MarginCalc
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentMarginCalc')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentMarginCalc]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentMarginCalc')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentMarginCalc]
    END

-- [Ex_Instrument.MarginRateInit] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='MarginRateInit')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [MarginRateInit] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_MarginRateInit NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_MarginRateInit = 'ALTER TABLE Ex_Instrument ADD [MarginRateInit] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_MarginRateInit
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentMarginRateInit')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentMarginRateInit]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentMarginRateInit')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentMarginRateInit]
    END

-- [Ex_Instrument.MarginRateMntn] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='MarginRateMntn')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [MarginRateMntn] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_MarginRateMntn NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_MarginRateMntn = 'ALTER TABLE Ex_Instrument ADD [MarginRateMntn] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_MarginRateMntn
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentMarginRateMntn')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentMarginRateMntn]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentMarginRateMntn')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentMarginRateMntn]
    END

-- [Ex_Instrument.MarginMode] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='MarginMode')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [MarginMode] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_MarginMode NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_MarginMode = 'ALTER TABLE Ex_Instrument ADD [MarginMode] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_MarginMode
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentMarginMode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentMarginMode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentMarginMode')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentMarginMode]
    END

-- [Ex_Instrument.Dec] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Dec')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [Dec] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_Dec NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_Dec = 'ALTER TABLE Ex_Instrument ADD [Dec] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_Dec
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentDec')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentDec]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentDec')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentDec]
    END

-- [Ex_Instrument.Formatter] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Formatter')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [Formatter] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_Formatter NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_Formatter = 'ALTER TABLE Ex_Instrument ADD [Formatter] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ex_Instrument_Formatter
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentFormatter')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentFormatter]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentFormatter')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentFormatter]
    END

-- [Ex_Instrument.Path] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Path')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [Path] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_Path NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_Path = 'ALTER TABLE Ex_Instrument ADD [Path] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ex_Instrument_Path
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentPath')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentPath]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentPath')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentPath]
    END

-- [Ex_Instrument.Ask] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Ask')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [Ask] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_Ask NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_Ask = 'ALTER TABLE Ex_Instrument ADD [Ask] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_Ask
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentAsk')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentAsk]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentAsk')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentAsk]
    END

-- [Ex_Instrument.Bid] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Bid')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [Bid] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_Bid NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_Bid = 'ALTER TABLE Ex_Instrument ADD [Bid] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_Bid
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentBid')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentBid]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentBid')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentBid]
    END

-- [Ex_Instrument.Middle] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Middle')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [Middle] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_Middle NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_Middle = 'ALTER TABLE Ex_Instrument ADD [Middle] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_Middle
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentMiddle')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentMiddle]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentMiddle')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentMiddle]
    END

-- [Ex_Instrument.FixedSpread] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='FixedSpread')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [FixedSpread] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_FixedSpread NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_FixedSpread = 'ALTER TABLE Ex_Instrument ADD [FixedSpread] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_FixedSpread
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentFixedSpread')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentFixedSpread]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentFixedSpread')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentFixedSpread]
    END

-- [Ex_Instrument.PercentageSpread] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='PercentageSpread')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [PercentageSpread] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_PercentageSpread NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_PercentageSpread = 'ALTER TABLE Ex_Instrument ADD [PercentageSpread] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_PercentageSpread
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentPercentageSpread')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentPercentageSpread]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentPercentageSpread')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentPercentageSpread]
    END

-- [Ex_Instrument.TaxOpenMode] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TaxOpenMode')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [TaxOpenMode] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_TaxOpenMode NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_TaxOpenMode = 'ALTER TABLE Ex_Instrument ADD [TaxOpenMode] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_TaxOpenMode
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentTaxOpenMode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentTaxOpenMode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentTaxOpenMode')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentTaxOpenMode]
    END

-- [Ex_Instrument.TaxOpen] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TaxOpen')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [TaxOpen] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_TaxOpen NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_TaxOpen = 'ALTER TABLE Ex_Instrument ADD [TaxOpen] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_TaxOpen
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentTaxOpen')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentTaxOpen]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentTaxOpen')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentTaxOpen]
    END

-- [Ex_Instrument.TaxCloseMode] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TaxCloseMode')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [TaxCloseMode] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_TaxCloseMode NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_TaxCloseMode = 'ALTER TABLE Ex_Instrument ADD [TaxCloseMode] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_TaxCloseMode
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentTaxCloseMode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentTaxCloseMode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentTaxCloseMode')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentTaxCloseMode]
    END

-- [Ex_Instrument.TaxClose] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TaxClose')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [TaxClose] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_TaxClose NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_TaxClose = 'ALTER TABLE Ex_Instrument ADD [TaxClose] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_TaxClose
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentTaxClose')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentTaxClose]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentTaxClose')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentTaxClose]
    END

-- [Ex_Instrument.Tax] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Tax')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [Tax] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_Tax NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_Tax = 'ALTER TABLE Ex_Instrument ADD [Tax] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_Tax
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentTax')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentTax]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentTax')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentTax]
    END

-- [Ex_Instrument.TaxCur] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TaxCur')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [TaxCur] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_TaxCur NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_TaxCur = 'ALTER TABLE Ex_Instrument ADD [TaxCur] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_TaxCur
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentTaxCur')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentTaxCur]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentTaxCur')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentTaxCur]
    END

-- [Ex_Instrument.TaxCurCode] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TaxCurCode')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [TaxCurCode] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_TaxCurCode NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_TaxCurCode = 'ALTER TABLE Ex_Instrument ADD [TaxCurCode] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ex_Instrument_TaxCurCode
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentTaxCurCode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentTaxCurCode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentTaxCurCode')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentTaxCurCode]
    END

-- [Ex_Instrument.LastPrice] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LastPrice')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [LastPrice] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_LastPrice NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_LastPrice = 'ALTER TABLE Ex_Instrument ADD [LastPrice] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_LastPrice
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentLastPrice')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentLastPrice]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentLastPrice')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentLastPrice]
    END

-- [Ex_Instrument.LastUpdatedat] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LastUpdatedat')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [LastUpdatedat] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_LastUpdatedat NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_LastUpdatedat = 'ALTER TABLE Ex_Instrument ADD [LastUpdatedat] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_LastUpdatedat
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentLastUpdatedat')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentLastUpdatedat]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentLastUpdatedat')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentLastUpdatedat]
    END

-- [Ex_Instrument.LastPriceChange] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LastPriceChange')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [LastPriceChange] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_LastPriceChange NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_LastPriceChange = 'ALTER TABLE Ex_Instrument ADD [LastPriceChange] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_LastPriceChange
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentLastPriceChange')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentLastPriceChange]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentLastPriceChange')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentLastPriceChange]
    END

-- [Ex_Instrument.TradeStatus] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TradeStatus')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [TradeStatus] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_TradeStatus NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_TradeStatus = 'ALTER TABLE Ex_Instrument ADD [TradeStatus] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_TradeStatus
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentTradeStatus')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentTradeStatus]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentTradeStatus')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentTradeStatus]
    END

-- [Ex_Instrument.RoMode] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RoMode')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [RoMode] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_RoMode NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_RoMode = 'ALTER TABLE Ex_Instrument ADD [RoMode] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_RoMode
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentRoMode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentRoMode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentRoMode')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentRoMode]
    END

-- [Ex_Instrument.Schedule] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Schedule')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [Schedule] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_Schedule NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_Schedule = 'ALTER TABLE Ex_Instrument ADD [Schedule] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ex_Instrument_Schedule
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentSchedule')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentSchedule]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentSchedule')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentSchedule]
    END

-- [Ex_Instrument.TradeMode] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TradeMode')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [TradeMode] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_TradeMode NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_TradeMode = 'ALTER TABLE Ex_Instrument ADD [TradeMode] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_TradeMode
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentTradeMode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentTradeMode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentTradeMode')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentTradeMode]
    END

-- [Ex_Instrument.DerivativeMode] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='DerivativeMode')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [DerivativeMode] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_DerivativeMode NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_DerivativeMode = 'ALTER TABLE Ex_Instrument ADD [DerivativeMode] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_DerivativeMode
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentDerivativeMode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentDerivativeMode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentDerivativeMode')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentDerivativeMode]
    END

-- [Ex_Instrument.OptionsMode] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OptionsMode')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [OptionsMode] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_OptionsMode NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_OptionsMode = 'ALTER TABLE Ex_Instrument ADD [OptionsMode] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_OptionsMode
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentOptionsMode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentOptionsMode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentOptionsMode')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentOptionsMode]
    END

-- [Ex_Instrument.OptionsCP] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OptionsCP')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [OptionsCP] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_OptionsCP NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_OptionsCP = 'ALTER TABLE Ex_Instrument ADD [OptionsCP] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_OptionsCP
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentOptionsCP')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentOptionsCP]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentOptionsCP')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentOptionsCP]
    END

-- [Ex_Instrument.OptionsExpiry] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OptionsExpiry')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [OptionsExpiry] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_OptionsExpiry NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_OptionsExpiry = 'ALTER TABLE Ex_Instrument ADD [OptionsExpiry] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_OptionsExpiry
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentOptionsExpiry')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentOptionsExpiry]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentOptionsExpiry')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentOptionsExpiry]
    END

-- [Ex_Instrument.OptionsStrike] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OptionsStrike')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [OptionsStrike] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_OptionsStrike NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_OptionsStrike = 'ALTER TABLE Ex_Instrument ADD [OptionsStrike] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_OptionsStrike
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentOptionsStrike')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentOptionsStrike]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentOptionsStrike')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentOptionsStrike]
    END

-- [Ex_Instrument.OptionsPricing] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OptionsPricing')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [OptionsPricing] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_OptionsPricing NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_OptionsPricing = 'ALTER TABLE Ex_Instrument ADD [OptionsPricing] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ex_Instrument_OptionsPricing
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentOptionsPricing')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentOptionsPricing]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentOptionsPricing')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentOptionsPricing]
    END

-- [Ex_Instrument.OptionsPeriod] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OptionsPeriod')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [OptionsPeriod] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_OptionsPeriod NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_OptionsPeriod = 'ALTER TABLE Ex_Instrument ADD [OptionsPeriod] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ex_Instrument_OptionsPeriod
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentOptionsPeriod')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentOptionsPeriod]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentOptionsPeriod')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentOptionsPeriod]
    END

-- [Ex_Instrument.OptionsTax] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OptionsTax')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [OptionsTax] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_OptionsTax NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_OptionsTax = 'ALTER TABLE Ex_Instrument ADD [OptionsTax] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_OptionsTax
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentOptionsTax')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentOptionsTax]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentOptionsTax')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentOptionsTax]
    END

-- [Ex_Instrument.OptionsPremiumPerTradeMin] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OptionsPremiumPerTradeMin')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [OptionsPremiumPerTradeMin] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_OptionsPremiumPerTradeMin NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_OptionsPremiumPerTradeMin = 'ALTER TABLE Ex_Instrument ADD [OptionsPremiumPerTradeMin] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_OptionsPremiumPerTradeMin
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentOptionsPremiumPerTradeMin')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentOptionsPremiumPerTradeMin]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentOptionsPremiumPerTradeMin')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentOptionsPremiumPerTradeMin]
    END

-- [Ex_Instrument.OptionsPremiumPerTradeMax] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OptionsPremiumPerTradeMax')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [OptionsPremiumPerTradeMax] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_OptionsPremiumPerTradeMax NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_OptionsPremiumPerTradeMax = 'ALTER TABLE Ex_Instrument ADD [OptionsPremiumPerTradeMax] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_OptionsPremiumPerTradeMax
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentOptionsPremiumPerTradeMax')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentOptionsPremiumPerTradeMax]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentOptionsPremiumPerTradeMax')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentOptionsPremiumPerTradeMax]
    END

-- [Ex_Instrument.LimitLotPerTrade] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LimitLotPerTrade')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [LimitLotPerTrade] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_LimitLotPerTrade NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_LimitLotPerTrade = 'ALTER TABLE Ex_Instrument ADD [LimitLotPerTrade] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_LimitLotPerTrade
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentLimitLotPerTrade')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentLimitLotPerTrade]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentLimitLotPerTrade')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentLimitLotPerTrade]
    END

-- [Ex_Instrument.LimitLotPosition] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LimitLotPosition')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [LimitLotPosition] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_LimitLotPosition NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_LimitLotPosition = 'ALTER TABLE Ex_Instrument ADD [LimitLotPosition] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_LimitLotPosition
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentLimitLotPosition')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentLimitLotPosition]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentLimitLotPosition')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentLimitLotPosition]
    END

-- [Ex_Instrument.CurrentOpen] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='CurrentOpen')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [CurrentOpen] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_CurrentOpen NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_CurrentOpen = 'ALTER TABLE Ex_Instrument ADD [CurrentOpen] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_CurrentOpen
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentCurrentOpen')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentCurrentOpen]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentCurrentOpen')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentCurrentOpen]
    END

-- [Ex_Instrument.CurrentHigh] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='CurrentHigh')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [CurrentHigh] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_CurrentHigh NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_CurrentHigh = 'ALTER TABLE Ex_Instrument ADD [CurrentHigh] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_CurrentHigh
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentCurrentHigh')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentCurrentHigh]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentCurrentHigh')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentCurrentHigh]
    END

-- [Ex_Instrument.CurrentLow] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='CurrentLow')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [CurrentLow] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_CurrentLow NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_CurrentLow = 'ALTER TABLE Ex_Instrument ADD [CurrentLow] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_CurrentLow
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentCurrentLow')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentCurrentLow]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentCurrentLow')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentCurrentLow]
    END

-- [Ex_Instrument.PrevClose] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='PrevClose')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [PrevClose] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_PrevClose NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_PrevClose = 'ALTER TABLE Ex_Instrument ADD [PrevClose] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_PrevClose
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentPrevClose')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentPrevClose]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentPrevClose')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentPrevClose]
    END

-- [Ex_Instrument.PrevClosedat] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='PrevClosedat')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [PrevClosedat] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_PrevClosedat NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_PrevClosedat = 'ALTER TABLE Ex_Instrument ADD [PrevClosedat] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_PrevClosedat
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentPrevClosedat')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentPrevClosedat]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentPrevClosedat')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentPrevClosedat]
    END

-- [Ex_Instrument.CurrentOpenat] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='CurrentOpenat')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [CurrentOpenat] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_CurrentOpenat NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_CurrentOpenat = 'ALTER TABLE Ex_Instrument ADD [CurrentOpenat] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_CurrentOpenat
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentCurrentOpenat')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentCurrentOpenat]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentCurrentOpenat')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentCurrentOpenat]
    END

-- [Ex_Instrument.ExtBiz] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='ExtBiz')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [ExtBiz] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_ExtBiz NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_ExtBiz = 'ALTER TABLE Ex_Instrument ADD [ExtBiz] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_ExtBiz
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentExtBiz')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentExtBiz]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentExtBiz')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentExtBiz]
    END

-- [Ex_Instrument.RefExternal] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RefExternal')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [RefExternal] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_RefExternal NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_RefExternal = 'ALTER TABLE Ex_Instrument ADD [RefExternal] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ex_Instrument_RefExternal
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentRefExternal')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentRefExternal]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentRefExternal')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentRefExternal]
    END

-- [Ex_Instrument.ItrnInss] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='ItrnInss')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [ItrnInss] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_ItrnInss NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_ItrnInss = 'ALTER TABLE Ex_Instrument ADD [ItrnInss] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ex_Instrument_ItrnInss
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentItrnInss')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentItrnInss]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentItrnInss')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentItrnInss]
    END

-- [Ex_Instrument.ItrnInssMode] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='ItrnInssMode')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [ItrnInssMode] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_ItrnInssMode NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_ItrnInssMode = 'ALTER TABLE Ex_Instrument ADD [ItrnInssMode] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_ItrnInssMode
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentItrnInssMode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentItrnInssMode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentItrnInssMode')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentItrnInssMode]
    END

-- [Ex_Instrument.FlushType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='FlushType')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [FlushType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_FlushType NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_FlushType = 'ALTER TABLE Ex_Instrument ADD [FlushType] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_FlushType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentFlushType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentFlushType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentFlushType')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentFlushType]
    END

-- [Ex_Instrument.CurTrigger] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='CurTrigger')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [CurTrigger] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_CurTrigger NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_CurTrigger = 'ALTER TABLE Ex_Instrument ADD [CurTrigger] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_CurTrigger
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentCurTrigger')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentCurTrigger]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentCurTrigger')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentCurTrigger]
    END

-- [Ex_Instrument.RobotType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RobotType')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [RobotType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_RobotType NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_RobotType = 'ALTER TABLE Ex_Instrument ADD [RobotType] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_RobotType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentRobotType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentRobotType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentRobotType')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentRobotType]
    END

-- [Ex_Instrument.ExtLong] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='ExtLong')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [ExtLong] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_ExtLong NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_ExtLong = 'ALTER TABLE Ex_Instrument ADD [ExtLong] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ex_Instrument_ExtLong
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentExtLong')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentExtLong]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentExtLong')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentExtLong]
    END

-- [Ex_Instrument.ExtShort] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='ExtShort')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [ExtShort] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_ExtShort NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_ExtShort = 'ALTER TABLE Ex_Instrument ADD [ExtShort] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ex_Instrument_ExtShort
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentExtShort')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentExtShort]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentExtShort')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentExtShort]
    END

-- [Ex_Instrument.ExtPrice] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='ExtPrice')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [ExtPrice] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_ExtPrice NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_ExtPrice = 'ALTER TABLE Ex_Instrument ADD [ExtPrice] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_ExtPrice
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentExtPrice')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentExtPrice]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentExtPrice')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentExtPrice]
    END

-- [Ex_Instrument.SaveM1] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='SaveM1')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [SaveM1] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_SaveM1 NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_SaveM1 = 'ALTER TABLE Ex_Instrument ADD [SaveM1] BIT'
    EXEC sp_executesql @sql_add_Ex_Instrument_SaveM1
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentSaveM1')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentSaveM1]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentSaveM1')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentSaveM1]
    END

-- [Ex_Instrument.HistSavedat] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='HistSavedat')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [HistSavedat] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_HistSavedat NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_HistSavedat = 'ALTER TABLE Ex_Instrument ADD [HistSavedat] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_HistSavedat
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentHistSavedat')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentHistSavedat]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentHistSavedat')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentHistSavedat]
    END

-- [Ex_Instrument.SaveD1] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='SaveD1')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [SaveD1] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_SaveD1 NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_SaveD1 = 'ALTER TABLE Ex_Instrument ADD [SaveD1] BIT'
    EXEC sp_executesql @sql_add_Ex_Instrument_SaveD1
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentSaveD1')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentSaveD1]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentSaveD1')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentSaveD1]
    END

-- [Ex_Instrument.SlPips] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='SlPips')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [SlPips] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_SlPips NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_SlPips = 'ALTER TABLE Ex_Instrument ADD [SlPips] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_SlPips
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentSlPips')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentSlPips]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentSlPips')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentSlPips]
    END

-- [Ex_Instrument.TpPips] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TpPips')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [TpPips] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_TpPips NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_TpPips = 'ALTER TABLE Ex_Instrument ADD [TpPips] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_TpPips
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentTpPips')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentTpPips]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentTpPips')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentTpPips]
    END

-- [Ex_Instrument.PendingLimitPips] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='PendingLimitPips')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [PendingLimitPips] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_PendingLimitPips NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_PendingLimitPips = 'ALTER TABLE Ex_Instrument ADD [PendingLimitPips] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_PendingLimitPips
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentPendingLimitPips')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentPendingLimitPips]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentPendingLimitPips')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentPendingLimitPips]
    END

-- [Ex_Instrument.PendingStopPips] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='PendingStopPips')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [PendingStopPips] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_PendingStopPips NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_PendingStopPips = 'ALTER TABLE Ex_Instrument ADD [PendingStopPips] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_PendingStopPips
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentPendingStopPips')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentPendingStopPips]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentPendingStopPips')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentPendingStopPips]
    END

-- [Ex_Instrument.LastDirection] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LastDirection')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [LastDirection] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_LastDirection NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_LastDirection = 'ALTER TABLE Ex_Instrument ADD [LastDirection] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_LastDirection
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentLastDirection')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentLastDirection]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentLastDirection')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentLastDirection]
    END

-- [Ex_Instrument.LiqMode] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LiqMode')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [LiqMode] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_LiqMode NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_LiqMode = 'ALTER TABLE Ex_Instrument ADD [LiqMode] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_LiqMode
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentLiqMode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentLiqMode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentLiqMode')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentLiqMode]
    END

-- [Ex_Instrument.LiqPeriodSince] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LiqPeriodSince')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [LiqPeriodSince] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_LiqPeriodSince NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_LiqPeriodSince = 'ALTER TABLE Ex_Instrument ADD [LiqPeriodSince] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_LiqPeriodSince
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentLiqPeriodSince')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentLiqPeriodSince]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentLiqPeriodSince')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentLiqPeriodSince]
    END

-- [Ex_Instrument.LiqPeriodTill] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LiqPeriodTill')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [LiqPeriodTill] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_LiqPeriodTill NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_LiqPeriodTill = 'ALTER TABLE Ex_Instrument ADD [LiqPeriodTill] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_LiqPeriodTill
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentLiqPeriodTill')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentLiqPeriodTill]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentLiqPeriodTill')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentLiqPeriodTill]
    END

-- [Ex_Instrument.LiqPeriod] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LiqPeriod')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [LiqPeriod] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_LiqPeriod NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_LiqPeriod = 'ALTER TABLE Ex_Instrument ADD [LiqPeriod] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_LiqPeriod
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentLiqPeriod')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentLiqPeriod]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentLiqPeriod')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentLiqPeriod]
    END

-- [Ex_Instrument.LiqTime] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LiqTime')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [LiqTime] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_LiqTime NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_LiqTime = 'ALTER TABLE Ex_Instrument ADD [LiqTime] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_LiqTime
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentLiqTime')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentLiqTime]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentLiqTime')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentLiqTime]
    END

-- [Ex_Instrument.ConvertRatio] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='ConvertRatio')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [ConvertRatio] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_ConvertRatio NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_ConvertRatio = 'ALTER TABLE Ex_Instrument ADD [ConvertRatio] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_ConvertRatio
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentConvertRatio')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentConvertRatio]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentConvertRatio')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentConvertRatio]
    END

-- [Ex_Instrument.RoBuyMode] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RoBuyMode')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [RoBuyMode] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_RoBuyMode NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_RoBuyMode = 'ALTER TABLE Ex_Instrument ADD [RoBuyMode] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_RoBuyMode
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentRoBuyMode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentRoBuyMode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentRoBuyMode')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentRoBuyMode]
    END

-- [Ex_Instrument.RoBuy] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RoBuy')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [RoBuy] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_RoBuy NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_RoBuy = 'ALTER TABLE Ex_Instrument ADD [RoBuy] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_RoBuy
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentRoBuy')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentRoBuy]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentRoBuy')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentRoBuy]
    END

-- [Ex_Instrument.RoSellMode] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RoSellMode')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [RoSellMode] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_RoSellMode NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_RoSellMode = 'ALTER TABLE Ex_Instrument ADD [RoSellMode] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_RoSellMode
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentRoSellMode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentRoSellMode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentRoSellMode')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentRoSellMode]
    END

-- [Ex_Instrument.RoSell] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RoSell')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [RoSell] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_RoSell NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_RoSell = 'ALTER TABLE Ex_Instrument ADD [RoSell] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_RoSell
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentRoSell')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentRoSell]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentRoSell')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentRoSell]
    END

-- [Ex_Instrument.PosLimitBuy] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='PosLimitBuy')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [PosLimitBuy] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_PosLimitBuy NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_PosLimitBuy = 'ALTER TABLE Ex_Instrument ADD [PosLimitBuy] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_PosLimitBuy
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentPosLimitBuy')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentPosLimitBuy]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentPosLimitBuy')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentPosLimitBuy]
    END

-- [Ex_Instrument.PosLimitSell] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='PosLimitSell')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [PosLimitSell] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_PosLimitSell NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_PosLimitSell = 'ALTER TABLE Ex_Instrument ADD [PosLimitSell] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_PosLimitSell
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentPosLimitSell')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentPosLimitSell]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentPosLimitSell')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentPosLimitSell]
    END

-- [Ex_Instrument.RoCur] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RoCur')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [RoCur] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_RoCur NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_RoCur = 'ALTER TABLE Ex_Instrument ADD [RoCur] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_RoCur
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentRoCur')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentRoCur]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentRoCur')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentRoCur]
    END

-- [Ex_Instrument.RoCurCode] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RoCurCode')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [RoCurCode] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_RoCurCode NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_RoCurCode = 'ALTER TABLE Ex_Instrument ADD [RoCurCode] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ex_Instrument_RoCurCode
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentRoCurCode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentRoCurCode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentRoCurCode')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentRoCurCode]
    END

-- [Ex_Instrument.AdjBias] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='AdjBias')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [AdjBias] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_AdjBias NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_AdjBias = 'ALTER TABLE Ex_Instrument ADD [AdjBias] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_AdjBias
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentAdjBias')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentAdjBias]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentAdjBias')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentAdjBias]
    END

-- [Ex_Instrument.TaxBuy] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TaxBuy')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [TaxBuy] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_TaxBuy NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_TaxBuy = 'ALTER TABLE Ex_Instrument ADD [TaxBuy] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_TaxBuy
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentTaxBuy')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentTaxBuy]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentTaxBuy')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentTaxBuy]
    END

-- [Ex_Instrument.TaxSell] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TaxSell')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [TaxSell] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_TaxSell NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_TaxSell = 'ALTER TABLE Ex_Instrument ADD [TaxSell] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_TaxSell
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentTaxSell')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentTaxSell]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentTaxSell')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentTaxSell]
    END

-- [Ex_Instrument.Misc] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Misc')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [Misc] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_Misc NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_Misc = 'ALTER TABLE Ex_Instrument ADD [Misc] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ex_Instrument_Misc
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentMisc')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentMisc]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentMisc')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentMisc]
    END

-- [Ex_Instrument.RefLastPriceChange] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RefLastPriceChange')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [RefLastPriceChange] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_RefLastPriceChange NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_RefLastPriceChange = 'ALTER TABLE Ex_Instrument ADD [RefLastPriceChange] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_RefLastPriceChange
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentRefLastPriceChange')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentRefLastPriceChange]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentRefLastPriceChange')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentRefLastPriceChange]
    END

-- [Ex_Instrument.HedgeExternal] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='HedgeExternal')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [HedgeExternal] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_HedgeExternal NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_HedgeExternal = 'ALTER TABLE Ex_Instrument ADD [HedgeExternal] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ex_Instrument_HedgeExternal
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentHedgeExternal')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentHedgeExternal]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentHedgeExternal')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentHedgeExternal]
    END

-- [Ex_Instrument.OfferingPrice] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OfferingPrice')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [OfferingPrice] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_OfferingPrice NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_OfferingPrice = 'ALTER TABLE Ex_Instrument ADD [OfferingPrice] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_OfferingPrice
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentOfferingPrice')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentOfferingPrice]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentOfferingPrice')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentOfferingPrice]
    END

-- [Ex_Instrument.IssuanceAmount] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='IssuanceAmount')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [IssuanceAmount] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_IssuanceAmount NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_IssuanceAmount = 'ALTER TABLE Ex_Instrument ADD [IssuanceAmount] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_IssuanceAmount
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentIssuanceAmount')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentIssuanceAmount]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentIssuanceAmount')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentIssuanceAmount]
    END

-- [Ex_Instrument.ListingStatus] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='ListingStatus')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [ListingStatus] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_ListingStatus NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_ListingStatus = 'ALTER TABLE Ex_Instrument ADD [ListingStatus] INT'
    EXEC sp_executesql @sql_add_Ex_Instrument_ListingStatus
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentListingStatus')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentListingStatus]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentListingStatus')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentListingStatus]
    END

-- [Ex_Instrument.Turnover] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Turnover')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [Turnover] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_Turnover NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_Turnover = 'ALTER TABLE Ex_Instrument ADD [Turnover] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Instrument_Turnover
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentTurnover')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentTurnover]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentTurnover')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentTurnover]
    END

-- [Ex_Instrument.PriceOpened] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='PriceOpened')
    BEGIN
     ALTER TABLE Ex_Instrument ALTER COLUMN [PriceOpened] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Instrument_PriceOpened NVARCHAR(MAX);
    SET @sql_add_Ex_Instrument_PriceOpened = 'ALTER TABLE Ex_Instrument ADD [PriceOpened] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Instrument_PriceOpened
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_InstrumentPriceOpened')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_InstrumentPriceOpened]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_InstrumentPriceOpened')
    BEGIN
    ALTER TABLE Ex_Instrument DROP  CONSTRAINT [UniqueNonclustered_Ex_InstrumentPriceOpened]
    END
-- [Ex_Ticket] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ex_Ticket' AND xtype='U')

BEGIN

    CREATE TABLE Ex_Ticket ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [EndUser] BIGINT
        ,[TradeAcct] BIGINT
        ,[Ins] BIGINT
        ,[Code] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[TradeMode] INT
        ,[Lot] BIGINT
        ,[PriceOpened] BIGINT
        ,[PriceOpen] BIGINT
        ,[PriceSL] BIGINT
        ,[PriceTP] BIGINT
        ,[PriceClose] BIGINT
        ,[Status] INT
        ,[CP] BIGINT
        ,[CptAcct] BIGINT
        ,[Ref] BIGINT
        ,[OpenRef] BIGINT
        ,[CloseRef] BIGINT
        ,[Origin] BIGINT
        ,[PnL] FLOAT
        ,[PnLSpread] FLOAT
        ,[Margin] FLOAT
        ,[RO] FLOAT
        ,[Tax] FLOAT
        ,[CloseType] INT
        ,[CommitType] INT
        ,[Cmt] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Opendat] BIGINT
        ,[Closedat] BIGINT
        ,[CaStrategyAmt] FLOAT
        ,[CaRo] BIT
        ,[CaAsa] BIT
        ,[CaCmphsvCharge] FLOAT
        ,[RoCheckedat] BIGINT
        ,[Expiry] BIGINT
        ,[HedgetCP] BIGINT
        ,[PendingPrice] BIGINT
        ,[ClosedLot] BIGINT
        ,[ClosedAmt] FLOAT
        ,[PendingAmt] FLOAT
        ,[DrvPreminum] FLOAT
        ,[DrvExpiry] BIGINT
        ,[DrvPeriod] BIGINT
        ,[DrvDirection] INT
        ,[DrvPrice] FLOAT
        ,[DoubleCp] BIGINT
        ,[ClearStatus] INT
        ,[FollowTicket] BIGINT
        ,[Config] NVARCHAR(MAX)
        ,[OptionStatus] INT
        ,[NotionalPrincipal] FLOAT
        ,[ExercisedPrincipal] FLOAT
        ,[ExerciseMode] FLOAT
        ,[ExercisePrice] FLOAT
        ,[ExternalTicketOpen] BIGINT
        ,[ExternalTicketClose] BIGINT
        ,[ExternalTicketPending] BIGINT
        ,[ExternalTicketCancel] BIGINT
        ,[Desc] NVARCHAR(MAX)
, CONSTRAINT [PK_Ex_Ticket] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Ex_Ticket NVARCHAR(64)
DECLARE cursor_Ex_Ticket CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','EndUser','TradeAcct','Ins','Code','Caption','TradeMode','Lot','PriceOpened','PriceOpen','PriceSL','PriceTP','PriceClose','Status','CP','CptAcct','Ref','OpenRef','CloseRef','Origin','PnL','PnLSpread','Margin','RO','Tax','CloseType','CommitType','Cmt','Opendat','Closedat','CaStrategyAmt','CaRo','CaAsa','CaCmphsvCharge','RoCheckedat','Expiry','HedgetCP','PendingPrice','ClosedLot','ClosedAmt','PendingAmt','DrvPreminum','DrvExpiry','DrvPeriod','DrvDirection','DrvPrice','DoubleCp','ClearStatus','FollowTicket','Config','OptionStatus','NotionalPrincipal','ExercisedPrincipal','ExerciseMode','ExercisePrice','ExternalTicketOpen','ExternalTicketClose','ExternalTicketPending','ExternalTicketCancel','Desc'))

OPEN cursor_Ex_Ticket
FETCH NEXT FROM cursor_Ex_Ticket INTO @name_Ex_Ticket

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Ex_Ticket.' + @name_Ex_Ticket;
    
    DECLARE @sql_Ex_Ticket NVARCHAR(MAX);
    SET @sql_Ex_Ticket = 'ALTER TABLE Ex_Ticket DROP COLUMN ' + QUOTENAME(@name_Ex_Ticket)
    EXEC sp_executesql @sql_Ex_Ticket
    
    
    FETCH NEXT FROM cursor_Ex_Ticket INTO @name_Ex_Ticket
END

CLOSE cursor_Ex_Ticket;
DEALLOCATE cursor_Ex_Ticket;


-- [Ex_Ticket.EndUser] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='EndUser')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [EndUser] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_EndUser NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_EndUser = 'ALTER TABLE Ex_Ticket ADD [EndUser] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_EndUser
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketEndUser')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketEndUser]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketEndUser')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketEndUser]
    END

-- [Ex_Ticket.TradeAcct] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='TradeAcct')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [TradeAcct] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_TradeAcct NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_TradeAcct = 'ALTER TABLE Ex_Ticket ADD [TradeAcct] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_TradeAcct
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketTradeAcct')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketTradeAcct]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketTradeAcct')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketTradeAcct]
    END

-- [Ex_Ticket.Ins] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Ins')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [Ins] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_Ins NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_Ins = 'ALTER TABLE Ex_Ticket ADD [Ins] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_Ins
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketIns')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketIns]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketIns')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketIns]
    END

-- [Ex_Ticket.Code] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Code')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [Code] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_Code NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_Code = 'ALTER TABLE Ex_Ticket ADD [Code] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ex_Ticket_Code
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketCode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketCode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketCode')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketCode]
    END

-- [Ex_Ticket.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Caption')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_Caption NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_Caption = 'ALTER TABLE Ex_Ticket ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ex_Ticket_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketCaption')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketCaption]
    END

-- [Ex_Ticket.TradeMode] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='TradeMode')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [TradeMode] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_TradeMode NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_TradeMode = 'ALTER TABLE Ex_Ticket ADD [TradeMode] INT'
    EXEC sp_executesql @sql_add_Ex_Ticket_TradeMode
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketTradeMode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketTradeMode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketTradeMode')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketTradeMode]
    END

-- [Ex_Ticket.Lot] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Lot')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [Lot] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_Lot NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_Lot = 'ALTER TABLE Ex_Ticket ADD [Lot] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_Lot
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketLot')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketLot]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketLot')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketLot]
    END

-- [Ex_Ticket.PriceOpened] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='PriceOpened')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [PriceOpened] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_PriceOpened NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_PriceOpened = 'ALTER TABLE Ex_Ticket ADD [PriceOpened] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_PriceOpened
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketPriceOpened')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketPriceOpened]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketPriceOpened')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketPriceOpened]
    END

-- [Ex_Ticket.PriceOpen] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='PriceOpen')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [PriceOpen] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_PriceOpen NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_PriceOpen = 'ALTER TABLE Ex_Ticket ADD [PriceOpen] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_PriceOpen
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketPriceOpen')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketPriceOpen]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketPriceOpen')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketPriceOpen]
    END

-- [Ex_Ticket.PriceSL] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='PriceSL')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [PriceSL] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_PriceSL NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_PriceSL = 'ALTER TABLE Ex_Ticket ADD [PriceSL] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_PriceSL
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketPriceSL')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketPriceSL]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketPriceSL')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketPriceSL]
    END

-- [Ex_Ticket.PriceTP] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='PriceTP')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [PriceTP] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_PriceTP NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_PriceTP = 'ALTER TABLE Ex_Ticket ADD [PriceTP] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_PriceTP
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketPriceTP')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketPriceTP]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketPriceTP')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketPriceTP]
    END

-- [Ex_Ticket.PriceClose] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='PriceClose')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [PriceClose] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_PriceClose NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_PriceClose = 'ALTER TABLE Ex_Ticket ADD [PriceClose] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_PriceClose
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketPriceClose')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketPriceClose]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketPriceClose')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketPriceClose]
    END

-- [Ex_Ticket.Status] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Status')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [Status] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_Status NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_Status = 'ALTER TABLE Ex_Ticket ADD [Status] INT'
    EXEC sp_executesql @sql_add_Ex_Ticket_Status
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketStatus')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketStatus]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketStatus')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketStatus]
    END

-- [Ex_Ticket.CP] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='CP')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [CP] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_CP NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_CP = 'ALTER TABLE Ex_Ticket ADD [CP] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_CP
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketCP')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketCP]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketCP')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketCP]
    END

-- [Ex_Ticket.CptAcct] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='CptAcct')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [CptAcct] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_CptAcct NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_CptAcct = 'ALTER TABLE Ex_Ticket ADD [CptAcct] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_CptAcct
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketCptAcct')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketCptAcct]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketCptAcct')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketCptAcct]
    END

-- [Ex_Ticket.Ref] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Ref')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [Ref] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_Ref NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_Ref = 'ALTER TABLE Ex_Ticket ADD [Ref] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_Ref
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketRef')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketRef]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketRef')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketRef]
    END

-- [Ex_Ticket.OpenRef] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='OpenRef')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [OpenRef] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_OpenRef NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_OpenRef = 'ALTER TABLE Ex_Ticket ADD [OpenRef] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_OpenRef
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketOpenRef')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketOpenRef]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketOpenRef')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketOpenRef]
    END

-- [Ex_Ticket.CloseRef] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='CloseRef')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [CloseRef] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_CloseRef NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_CloseRef = 'ALTER TABLE Ex_Ticket ADD [CloseRef] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_CloseRef
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketCloseRef')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketCloseRef]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketCloseRef')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketCloseRef]
    END

-- [Ex_Ticket.Origin] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Origin')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [Origin] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_Origin NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_Origin = 'ALTER TABLE Ex_Ticket ADD [Origin] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_Origin
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketOrigin')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketOrigin]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketOrigin')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketOrigin]
    END

-- [Ex_Ticket.PnL] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='PnL')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [PnL] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_PnL NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_PnL = 'ALTER TABLE Ex_Ticket ADD [PnL] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Ticket_PnL
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketPnL')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketPnL]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketPnL')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketPnL]
    END

-- [Ex_Ticket.PnLSpread] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='PnLSpread')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [PnLSpread] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_PnLSpread NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_PnLSpread = 'ALTER TABLE Ex_Ticket ADD [PnLSpread] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Ticket_PnLSpread
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketPnLSpread')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketPnLSpread]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketPnLSpread')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketPnLSpread]
    END

-- [Ex_Ticket.Margin] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Margin')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [Margin] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_Margin NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_Margin = 'ALTER TABLE Ex_Ticket ADD [Margin] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Ticket_Margin
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketMargin')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketMargin]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketMargin')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketMargin]
    END

-- [Ex_Ticket.RO] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='RO')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [RO] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_RO NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_RO = 'ALTER TABLE Ex_Ticket ADD [RO] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Ticket_RO
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketRO')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketRO]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketRO')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketRO]
    END

-- [Ex_Ticket.Tax] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Tax')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [Tax] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_Tax NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_Tax = 'ALTER TABLE Ex_Ticket ADD [Tax] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Ticket_Tax
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketTax')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketTax]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketTax')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketTax]
    END

-- [Ex_Ticket.CloseType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='CloseType')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [CloseType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_CloseType NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_CloseType = 'ALTER TABLE Ex_Ticket ADD [CloseType] INT'
    EXEC sp_executesql @sql_add_Ex_Ticket_CloseType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketCloseType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketCloseType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketCloseType')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketCloseType]
    END

-- [Ex_Ticket.CommitType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='CommitType')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [CommitType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_CommitType NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_CommitType = 'ALTER TABLE Ex_Ticket ADD [CommitType] INT'
    EXEC sp_executesql @sql_add_Ex_Ticket_CommitType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketCommitType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketCommitType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketCommitType')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketCommitType]
    END

-- [Ex_Ticket.Cmt] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Cmt')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [Cmt] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_Cmt NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_Cmt = 'ALTER TABLE Ex_Ticket ADD [Cmt] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Ex_Ticket_Cmt
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketCmt')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketCmt]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketCmt')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketCmt]
    END

-- [Ex_Ticket.Opendat] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Opendat')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [Opendat] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_Opendat NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_Opendat = 'ALTER TABLE Ex_Ticket ADD [Opendat] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_Opendat
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketOpendat')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketOpendat]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketOpendat')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketOpendat]
    END

-- [Ex_Ticket.Closedat] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Closedat')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [Closedat] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_Closedat NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_Closedat = 'ALTER TABLE Ex_Ticket ADD [Closedat] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_Closedat
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketClosedat')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketClosedat]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketClosedat')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketClosedat]
    END

-- [Ex_Ticket.CaStrategyAmt] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='CaStrategyAmt')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [CaStrategyAmt] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_CaStrategyAmt NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_CaStrategyAmt = 'ALTER TABLE Ex_Ticket ADD [CaStrategyAmt] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Ticket_CaStrategyAmt
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketCaStrategyAmt')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketCaStrategyAmt]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketCaStrategyAmt')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketCaStrategyAmt]
    END

-- [Ex_Ticket.CaRo] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='CaRo')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [CaRo] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_CaRo NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_CaRo = 'ALTER TABLE Ex_Ticket ADD [CaRo] BIT'
    EXEC sp_executesql @sql_add_Ex_Ticket_CaRo
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketCaRo')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketCaRo]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketCaRo')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketCaRo]
    END

-- [Ex_Ticket.CaAsa] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='CaAsa')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [CaAsa] BIT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_CaAsa NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_CaAsa = 'ALTER TABLE Ex_Ticket ADD [CaAsa] BIT'
    EXEC sp_executesql @sql_add_Ex_Ticket_CaAsa
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketCaAsa')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketCaAsa]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketCaAsa')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketCaAsa]
    END

-- [Ex_Ticket.CaCmphsvCharge] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='CaCmphsvCharge')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [CaCmphsvCharge] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_CaCmphsvCharge NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_CaCmphsvCharge = 'ALTER TABLE Ex_Ticket ADD [CaCmphsvCharge] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Ticket_CaCmphsvCharge
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketCaCmphsvCharge')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketCaCmphsvCharge]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketCaCmphsvCharge')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketCaCmphsvCharge]
    END

-- [Ex_Ticket.RoCheckedat] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='RoCheckedat')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [RoCheckedat] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_RoCheckedat NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_RoCheckedat = 'ALTER TABLE Ex_Ticket ADD [RoCheckedat] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_RoCheckedat
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketRoCheckedat')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketRoCheckedat]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketRoCheckedat')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketRoCheckedat]
    END

-- [Ex_Ticket.Expiry] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Expiry')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [Expiry] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_Expiry NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_Expiry = 'ALTER TABLE Ex_Ticket ADD [Expiry] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_Expiry
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketExpiry')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketExpiry]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketExpiry')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketExpiry]
    END

-- [Ex_Ticket.HedgetCP] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='HedgetCP')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [HedgetCP] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_HedgetCP NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_HedgetCP = 'ALTER TABLE Ex_Ticket ADD [HedgetCP] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_HedgetCP
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketHedgetCP')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketHedgetCP]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketHedgetCP')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketHedgetCP]
    END

-- [Ex_Ticket.PendingPrice] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='PendingPrice')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [PendingPrice] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_PendingPrice NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_PendingPrice = 'ALTER TABLE Ex_Ticket ADD [PendingPrice] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_PendingPrice
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketPendingPrice')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketPendingPrice]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketPendingPrice')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketPendingPrice]
    END

-- [Ex_Ticket.ClosedLot] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ClosedLot')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [ClosedLot] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_ClosedLot NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_ClosedLot = 'ALTER TABLE Ex_Ticket ADD [ClosedLot] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_ClosedLot
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketClosedLot')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketClosedLot]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketClosedLot')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketClosedLot]
    END

-- [Ex_Ticket.ClosedAmt] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ClosedAmt')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [ClosedAmt] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_ClosedAmt NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_ClosedAmt = 'ALTER TABLE Ex_Ticket ADD [ClosedAmt] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Ticket_ClosedAmt
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketClosedAmt')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketClosedAmt]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketClosedAmt')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketClosedAmt]
    END

-- [Ex_Ticket.PendingAmt] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='PendingAmt')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [PendingAmt] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_PendingAmt NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_PendingAmt = 'ALTER TABLE Ex_Ticket ADD [PendingAmt] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Ticket_PendingAmt
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketPendingAmt')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketPendingAmt]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketPendingAmt')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketPendingAmt]
    END

-- [Ex_Ticket.DrvPreminum] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='DrvPreminum')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [DrvPreminum] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_DrvPreminum NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_DrvPreminum = 'ALTER TABLE Ex_Ticket ADD [DrvPreminum] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Ticket_DrvPreminum
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketDrvPreminum')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketDrvPreminum]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketDrvPreminum')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketDrvPreminum]
    END

-- [Ex_Ticket.DrvExpiry] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='DrvExpiry')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [DrvExpiry] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_DrvExpiry NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_DrvExpiry = 'ALTER TABLE Ex_Ticket ADD [DrvExpiry] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_DrvExpiry
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketDrvExpiry')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketDrvExpiry]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketDrvExpiry')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketDrvExpiry]
    END

-- [Ex_Ticket.DrvPeriod] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='DrvPeriod')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [DrvPeriod] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_DrvPeriod NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_DrvPeriod = 'ALTER TABLE Ex_Ticket ADD [DrvPeriod] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_DrvPeriod
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketDrvPeriod')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketDrvPeriod]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketDrvPeriod')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketDrvPeriod]
    END

-- [Ex_Ticket.DrvDirection] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='DrvDirection')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [DrvDirection] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_DrvDirection NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_DrvDirection = 'ALTER TABLE Ex_Ticket ADD [DrvDirection] INT'
    EXEC sp_executesql @sql_add_Ex_Ticket_DrvDirection
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketDrvDirection')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketDrvDirection]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketDrvDirection')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketDrvDirection]
    END

-- [Ex_Ticket.DrvPrice] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='DrvPrice')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [DrvPrice] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_DrvPrice NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_DrvPrice = 'ALTER TABLE Ex_Ticket ADD [DrvPrice] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Ticket_DrvPrice
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketDrvPrice')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketDrvPrice]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketDrvPrice')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketDrvPrice]
    END

-- [Ex_Ticket.DoubleCp] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='DoubleCp')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [DoubleCp] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_DoubleCp NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_DoubleCp = 'ALTER TABLE Ex_Ticket ADD [DoubleCp] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_DoubleCp
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketDoubleCp')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketDoubleCp]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketDoubleCp')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketDoubleCp]
    END

-- [Ex_Ticket.ClearStatus] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ClearStatus')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [ClearStatus] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_ClearStatus NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_ClearStatus = 'ALTER TABLE Ex_Ticket ADD [ClearStatus] INT'
    EXEC sp_executesql @sql_add_Ex_Ticket_ClearStatus
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketClearStatus')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketClearStatus]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketClearStatus')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketClearStatus]
    END

-- [Ex_Ticket.FollowTicket] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='FollowTicket')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [FollowTicket] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_FollowTicket NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_FollowTicket = 'ALTER TABLE Ex_Ticket ADD [FollowTicket] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_FollowTicket
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketFollowTicket')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketFollowTicket]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketFollowTicket')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketFollowTicket]
    END

-- [Ex_Ticket.Config] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Config')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [Config] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_Config NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_Config = 'ALTER TABLE Ex_Ticket ADD [Config] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ex_Ticket_Config
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketConfig')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketConfig]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketConfig')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketConfig]
    END

-- [Ex_Ticket.OptionStatus] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='OptionStatus')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [OptionStatus] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_OptionStatus NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_OptionStatus = 'ALTER TABLE Ex_Ticket ADD [OptionStatus] INT'
    EXEC sp_executesql @sql_add_Ex_Ticket_OptionStatus
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketOptionStatus')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketOptionStatus]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketOptionStatus')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketOptionStatus]
    END

-- [Ex_Ticket.NotionalPrincipal] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='NotionalPrincipal')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [NotionalPrincipal] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_NotionalPrincipal NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_NotionalPrincipal = 'ALTER TABLE Ex_Ticket ADD [NotionalPrincipal] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Ticket_NotionalPrincipal
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketNotionalPrincipal')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketNotionalPrincipal]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketNotionalPrincipal')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketNotionalPrincipal]
    END

-- [Ex_Ticket.ExercisedPrincipal] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ExercisedPrincipal')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [ExercisedPrincipal] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_ExercisedPrincipal NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_ExercisedPrincipal = 'ALTER TABLE Ex_Ticket ADD [ExercisedPrincipal] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Ticket_ExercisedPrincipal
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketExercisedPrincipal')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketExercisedPrincipal]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketExercisedPrincipal')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketExercisedPrincipal]
    END

-- [Ex_Ticket.ExerciseMode] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ExerciseMode')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [ExerciseMode] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_ExerciseMode NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_ExerciseMode = 'ALTER TABLE Ex_Ticket ADD [ExerciseMode] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Ticket_ExerciseMode
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketExerciseMode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketExerciseMode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketExerciseMode')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketExerciseMode]
    END

-- [Ex_Ticket.ExercisePrice] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ExercisePrice')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [ExercisePrice] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_ExercisePrice NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_ExercisePrice = 'ALTER TABLE Ex_Ticket ADD [ExercisePrice] FLOAT'
    EXEC sp_executesql @sql_add_Ex_Ticket_ExercisePrice
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketExercisePrice')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketExercisePrice]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketExercisePrice')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketExercisePrice]
    END

-- [Ex_Ticket.ExternalTicketOpen] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ExternalTicketOpen')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [ExternalTicketOpen] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_ExternalTicketOpen NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_ExternalTicketOpen = 'ALTER TABLE Ex_Ticket ADD [ExternalTicketOpen] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_ExternalTicketOpen
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketExternalTicketOpen')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketExternalTicketOpen]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketExternalTicketOpen')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketExternalTicketOpen]
    END

-- [Ex_Ticket.ExternalTicketClose] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ExternalTicketClose')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [ExternalTicketClose] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_ExternalTicketClose NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_ExternalTicketClose = 'ALTER TABLE Ex_Ticket ADD [ExternalTicketClose] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_ExternalTicketClose
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketExternalTicketClose')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketExternalTicketClose]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketExternalTicketClose')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketExternalTicketClose]
    END

-- [Ex_Ticket.ExternalTicketPending] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ExternalTicketPending')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [ExternalTicketPending] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_ExternalTicketPending NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_ExternalTicketPending = 'ALTER TABLE Ex_Ticket ADD [ExternalTicketPending] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_ExternalTicketPending
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketExternalTicketPending')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketExternalTicketPending]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketExternalTicketPending')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketExternalTicketPending]
    END

-- [Ex_Ticket.ExternalTicketCancel] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ExternalTicketCancel')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [ExternalTicketCancel] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_ExternalTicketCancel NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_ExternalTicketCancel = 'ALTER TABLE Ex_Ticket ADD [ExternalTicketCancel] BIGINT'
    EXEC sp_executesql @sql_add_Ex_Ticket_ExternalTicketCancel
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketExternalTicketCancel')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketExternalTicketCancel]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketExternalTicketCancel')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketExternalTicketCancel]
    END

-- [Ex_Ticket.Desc] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Desc')
    BEGIN
     ALTER TABLE Ex_Ticket ALTER COLUMN [Desc] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Ex_Ticket_Desc NVARCHAR(MAX);
    SET @sql_add_Ex_Ticket_Desc = 'ALTER TABLE Ex_Ticket ADD [Desc] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Ex_Ticket_Desc
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Ex_TicketDesc')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Ex_TicketDesc]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Ex_TicketDesc')
    BEGIN
    ALTER TABLE Ex_Ticket DROP  CONSTRAINT [UniqueNonclustered_Ex_TicketDesc]
    END
-- [Market_TradeAcct] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Market_TradeAcct' AND xtype='U')

BEGIN

    CREATE TABLE Market_TradeAcct ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [SAC] BIGINT
        ,[State] INT
        ,[TradeType] INT
        ,[RealDemo] INT
        ,[PnL] FLOAT
        ,[Frozen] FLOAT
        ,[Leverage] FLOAT
        ,[Margin] FLOAT
        ,[MarginCallRateWarning] FLOAT
        ,[MarginCallRateWarningII] FLOAT
        ,[MarginCallRateLiq] FLOAT
        ,[PwdTrade] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[PwdReadonly] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Desc] NVARCHAR(MAX)
, CONSTRAINT [PK_Market_TradeAcct] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Market_TradeAcct NVARCHAR(64)
DECLARE cursor_Market_TradeAcct CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','SAC','State','TradeType','RealDemo','PnL','Frozen','Leverage','Margin','MarginCallRateWarning','MarginCallRateWarningII','MarginCallRateLiq','PwdTrade','PwdReadonly','Desc'))

OPEN cursor_Market_TradeAcct
FETCH NEXT FROM cursor_Market_TradeAcct INTO @name_Market_TradeAcct

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Market_TradeAcct.' + @name_Market_TradeAcct;
    
    DECLARE @sql_Market_TradeAcct NVARCHAR(MAX);
    SET @sql_Market_TradeAcct = 'ALTER TABLE Market_TradeAcct DROP COLUMN ' + QUOTENAME(@name_Market_TradeAcct)
    EXEC sp_executesql @sql_Market_TradeAcct
    
    
    FETCH NEXT FROM cursor_Market_TradeAcct INTO @name_Market_TradeAcct
END

CLOSE cursor_Market_TradeAcct;
DEALLOCATE cursor_Market_TradeAcct;


-- [Market_TradeAcct.SAC] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='SAC')
    BEGIN
     ALTER TABLE Market_TradeAcct ALTER COLUMN [SAC] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Market_TradeAcct_SAC NVARCHAR(MAX);
    SET @sql_add_Market_TradeAcct_SAC = 'ALTER TABLE Market_TradeAcct ADD [SAC] BIGINT'
    EXEC sp_executesql @sql_add_Market_TradeAcct_SAC
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Market_TradeAcctSAC')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Market_TradeAcctSAC]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Market_TradeAcctSAC')
    BEGIN
    ALTER TABLE Market_TradeAcct DROP  CONSTRAINT [UniqueNonclustered_Market_TradeAcctSAC]
    END

-- [Market_TradeAcct.State] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='State')
    BEGIN
     ALTER TABLE Market_TradeAcct ALTER COLUMN [State] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Market_TradeAcct_State NVARCHAR(MAX);
    SET @sql_add_Market_TradeAcct_State = 'ALTER TABLE Market_TradeAcct ADD [State] INT'
    EXEC sp_executesql @sql_add_Market_TradeAcct_State
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Market_TradeAcctState')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Market_TradeAcctState]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Market_TradeAcctState')
    BEGIN
    ALTER TABLE Market_TradeAcct DROP  CONSTRAINT [UniqueNonclustered_Market_TradeAcctState]
    END

-- [Market_TradeAcct.TradeType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='TradeType')
    BEGIN
     ALTER TABLE Market_TradeAcct ALTER COLUMN [TradeType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Market_TradeAcct_TradeType NVARCHAR(MAX);
    SET @sql_add_Market_TradeAcct_TradeType = 'ALTER TABLE Market_TradeAcct ADD [TradeType] INT'
    EXEC sp_executesql @sql_add_Market_TradeAcct_TradeType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Market_TradeAcctTradeType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Market_TradeAcctTradeType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Market_TradeAcctTradeType')
    BEGIN
    ALTER TABLE Market_TradeAcct DROP  CONSTRAINT [UniqueNonclustered_Market_TradeAcctTradeType]
    END

-- [Market_TradeAcct.RealDemo] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='RealDemo')
    BEGIN
     ALTER TABLE Market_TradeAcct ALTER COLUMN [RealDemo] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Market_TradeAcct_RealDemo NVARCHAR(MAX);
    SET @sql_add_Market_TradeAcct_RealDemo = 'ALTER TABLE Market_TradeAcct ADD [RealDemo] INT'
    EXEC sp_executesql @sql_add_Market_TradeAcct_RealDemo
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Market_TradeAcctRealDemo')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Market_TradeAcctRealDemo]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Market_TradeAcctRealDemo')
    BEGIN
    ALTER TABLE Market_TradeAcct DROP  CONSTRAINT [UniqueNonclustered_Market_TradeAcctRealDemo]
    END

-- [Market_TradeAcct.PnL] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='PnL')
    BEGIN
     ALTER TABLE Market_TradeAcct ALTER COLUMN [PnL] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Market_TradeAcct_PnL NVARCHAR(MAX);
    SET @sql_add_Market_TradeAcct_PnL = 'ALTER TABLE Market_TradeAcct ADD [PnL] FLOAT'
    EXEC sp_executesql @sql_add_Market_TradeAcct_PnL
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Market_TradeAcctPnL')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Market_TradeAcctPnL]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Market_TradeAcctPnL')
    BEGIN
    ALTER TABLE Market_TradeAcct DROP  CONSTRAINT [UniqueNonclustered_Market_TradeAcctPnL]
    END

-- [Market_TradeAcct.Frozen] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='Frozen')
    BEGIN
     ALTER TABLE Market_TradeAcct ALTER COLUMN [Frozen] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Market_TradeAcct_Frozen NVARCHAR(MAX);
    SET @sql_add_Market_TradeAcct_Frozen = 'ALTER TABLE Market_TradeAcct ADD [Frozen] FLOAT'
    EXEC sp_executesql @sql_add_Market_TradeAcct_Frozen
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Market_TradeAcctFrozen')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Market_TradeAcctFrozen]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Market_TradeAcctFrozen')
    BEGIN
    ALTER TABLE Market_TradeAcct DROP  CONSTRAINT [UniqueNonclustered_Market_TradeAcctFrozen]
    END

-- [Market_TradeAcct.Leverage] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='Leverage')
    BEGIN
     ALTER TABLE Market_TradeAcct ALTER COLUMN [Leverage] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Market_TradeAcct_Leverage NVARCHAR(MAX);
    SET @sql_add_Market_TradeAcct_Leverage = 'ALTER TABLE Market_TradeAcct ADD [Leverage] FLOAT'
    EXEC sp_executesql @sql_add_Market_TradeAcct_Leverage
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Market_TradeAcctLeverage')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Market_TradeAcctLeverage]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Market_TradeAcctLeverage')
    BEGIN
    ALTER TABLE Market_TradeAcct DROP  CONSTRAINT [UniqueNonclustered_Market_TradeAcctLeverage]
    END

-- [Market_TradeAcct.Margin] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='Margin')
    BEGIN
     ALTER TABLE Market_TradeAcct ALTER COLUMN [Margin] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Market_TradeAcct_Margin NVARCHAR(MAX);
    SET @sql_add_Market_TradeAcct_Margin = 'ALTER TABLE Market_TradeAcct ADD [Margin] FLOAT'
    EXEC sp_executesql @sql_add_Market_TradeAcct_Margin
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Market_TradeAcctMargin')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Market_TradeAcctMargin]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Market_TradeAcctMargin')
    BEGIN
    ALTER TABLE Market_TradeAcct DROP  CONSTRAINT [UniqueNonclustered_Market_TradeAcctMargin]
    END

-- [Market_TradeAcct.MarginCallRateWarning] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='MarginCallRateWarning')
    BEGIN
     ALTER TABLE Market_TradeAcct ALTER COLUMN [MarginCallRateWarning] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Market_TradeAcct_MarginCallRateWarning NVARCHAR(MAX);
    SET @sql_add_Market_TradeAcct_MarginCallRateWarning = 'ALTER TABLE Market_TradeAcct ADD [MarginCallRateWarning] FLOAT'
    EXEC sp_executesql @sql_add_Market_TradeAcct_MarginCallRateWarning
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Market_TradeAcctMarginCallRateWarning')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Market_TradeAcctMarginCallRateWarning]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Market_TradeAcctMarginCallRateWarning')
    BEGIN
    ALTER TABLE Market_TradeAcct DROP  CONSTRAINT [UniqueNonclustered_Market_TradeAcctMarginCallRateWarning]
    END

-- [Market_TradeAcct.MarginCallRateWarningII] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='MarginCallRateWarningII')
    BEGIN
     ALTER TABLE Market_TradeAcct ALTER COLUMN [MarginCallRateWarningII] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Market_TradeAcct_MarginCallRateWarningII NVARCHAR(MAX);
    SET @sql_add_Market_TradeAcct_MarginCallRateWarningII = 'ALTER TABLE Market_TradeAcct ADD [MarginCallRateWarningII] FLOAT'
    EXEC sp_executesql @sql_add_Market_TradeAcct_MarginCallRateWarningII
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Market_TradeAcctMarginCallRateWarningII')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Market_TradeAcctMarginCallRateWarningII]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Market_TradeAcctMarginCallRateWarningII')
    BEGIN
    ALTER TABLE Market_TradeAcct DROP  CONSTRAINT [UniqueNonclustered_Market_TradeAcctMarginCallRateWarningII]
    END

-- [Market_TradeAcct.MarginCallRateLiq] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='MarginCallRateLiq')
    BEGIN
     ALTER TABLE Market_TradeAcct ALTER COLUMN [MarginCallRateLiq] FLOAT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Market_TradeAcct_MarginCallRateLiq NVARCHAR(MAX);
    SET @sql_add_Market_TradeAcct_MarginCallRateLiq = 'ALTER TABLE Market_TradeAcct ADD [MarginCallRateLiq] FLOAT'
    EXEC sp_executesql @sql_add_Market_TradeAcct_MarginCallRateLiq
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Market_TradeAcctMarginCallRateLiq')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Market_TradeAcctMarginCallRateLiq]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Market_TradeAcctMarginCallRateLiq')
    BEGIN
    ALTER TABLE Market_TradeAcct DROP  CONSTRAINT [UniqueNonclustered_Market_TradeAcctMarginCallRateLiq]
    END

-- [Market_TradeAcct.PwdTrade] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='PwdTrade')
    BEGIN
     ALTER TABLE Market_TradeAcct ALTER COLUMN [PwdTrade] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Market_TradeAcct_PwdTrade NVARCHAR(MAX);
    SET @sql_add_Market_TradeAcct_PwdTrade = 'ALTER TABLE Market_TradeAcct ADD [PwdTrade] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Market_TradeAcct_PwdTrade
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Market_TradeAcctPwdTrade')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Market_TradeAcctPwdTrade]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Market_TradeAcctPwdTrade')
    BEGIN
    ALTER TABLE Market_TradeAcct DROP  CONSTRAINT [UniqueNonclustered_Market_TradeAcctPwdTrade]
    END

-- [Market_TradeAcct.PwdReadonly] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='PwdReadonly')
    BEGIN
     ALTER TABLE Market_TradeAcct ALTER COLUMN [PwdReadonly] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Market_TradeAcct_PwdReadonly NVARCHAR(MAX);
    SET @sql_add_Market_TradeAcct_PwdReadonly = 'ALTER TABLE Market_TradeAcct ADD [PwdReadonly] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Market_TradeAcct_PwdReadonly
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Market_TradeAcctPwdReadonly')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Market_TradeAcctPwdReadonly]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Market_TradeAcctPwdReadonly')
    BEGIN
    ALTER TABLE Market_TradeAcct DROP  CONSTRAINT [UniqueNonclustered_Market_TradeAcctPwdReadonly]
    END

-- [Market_TradeAcct.Desc] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='Desc')
    BEGIN
     ALTER TABLE Market_TradeAcct ALTER COLUMN [Desc] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Market_TradeAcct_Desc NVARCHAR(MAX);
    SET @sql_add_Market_TradeAcct_Desc = 'ALTER TABLE Market_TradeAcct ADD [Desc] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Market_TradeAcct_Desc
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Market_TradeAcctDesc')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Market_TradeAcctDesc]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Market_TradeAcctDesc')
    BEGIN
    ALTER TABLE Market_TradeAcct DROP  CONSTRAINT [UniqueNonclustered_Market_TradeAcctDesc]
    END
-- [Social_Bookmark] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Social_Bookmark' AND xtype='U')

BEGIN

    CREATE TABLE Social_Bookmark ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Agent] BIGINT
        ,[EndUser] BIGINT
        ,[Bind] BIGINT
        ,[BindType] INT
        ,[BookmarkList] BIGINT
        ,[Notes] NVARCHAR(MAX)
        ,[Path] NVARCHAR(MAX)
        ,[Group] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Type] BIGINT
, CONSTRAINT [PK_Social_Bookmark] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Social_Bookmark NVARCHAR(64)
DECLARE cursor_Social_Bookmark CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Social_Bookmark') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Agent','EndUser','Bind','BindType','BookmarkList','Notes','Path','Group','Type'))

OPEN cursor_Social_Bookmark
FETCH NEXT FROM cursor_Social_Bookmark INTO @name_Social_Bookmark

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Social_Bookmark.' + @name_Social_Bookmark;
    
    DECLARE @sql_Social_Bookmark NVARCHAR(MAX);
    SET @sql_Social_Bookmark = 'ALTER TABLE Social_Bookmark DROP COLUMN ' + QUOTENAME(@name_Social_Bookmark)
    EXEC sp_executesql @sql_Social_Bookmark
    
    
    FETCH NEXT FROM cursor_Social_Bookmark INTO @name_Social_Bookmark
END

CLOSE cursor_Social_Bookmark;
DEALLOCATE cursor_Social_Bookmark;


-- [Social_Bookmark.Agent] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Bookmark') AND name='Agent')
    BEGIN
     ALTER TABLE Social_Bookmark ALTER COLUMN [Agent] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Bookmark_Agent NVARCHAR(MAX);
    SET @sql_add_Social_Bookmark_Agent = 'ALTER TABLE Social_Bookmark ADD [Agent] BIGINT'
    EXEC sp_executesql @sql_add_Social_Bookmark_Agent
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_BookmarkAgent')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_BookmarkAgent]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_BookmarkAgent')
    BEGIN
    ALTER TABLE Social_Bookmark DROP  CONSTRAINT [UniqueNonclustered_Social_BookmarkAgent]
    END

-- [Social_Bookmark.EndUser] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Bookmark') AND name='EndUser')
    BEGIN
     ALTER TABLE Social_Bookmark ALTER COLUMN [EndUser] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Bookmark_EndUser NVARCHAR(MAX);
    SET @sql_add_Social_Bookmark_EndUser = 'ALTER TABLE Social_Bookmark ADD [EndUser] BIGINT'
    EXEC sp_executesql @sql_add_Social_Bookmark_EndUser
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_BookmarkEndUser')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_BookmarkEndUser]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_BookmarkEndUser')
    BEGIN
    ALTER TABLE Social_Bookmark DROP  CONSTRAINT [UniqueNonclustered_Social_BookmarkEndUser]
    END

-- [Social_Bookmark.Bind] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Bookmark') AND name='Bind')
    BEGIN
     ALTER TABLE Social_Bookmark ALTER COLUMN [Bind] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Bookmark_Bind NVARCHAR(MAX);
    SET @sql_add_Social_Bookmark_Bind = 'ALTER TABLE Social_Bookmark ADD [Bind] BIGINT'
    EXEC sp_executesql @sql_add_Social_Bookmark_Bind
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_BookmarkBind')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_BookmarkBind]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_BookmarkBind')
    BEGIN
    ALTER TABLE Social_Bookmark DROP  CONSTRAINT [UniqueNonclustered_Social_BookmarkBind]
    END

-- [Social_Bookmark.BindType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Bookmark') AND name='BindType')
    BEGIN
     ALTER TABLE Social_Bookmark ALTER COLUMN [BindType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Bookmark_BindType NVARCHAR(MAX);
    SET @sql_add_Social_Bookmark_BindType = 'ALTER TABLE Social_Bookmark ADD [BindType] INT'
    EXEC sp_executesql @sql_add_Social_Bookmark_BindType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_BookmarkBindType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_BookmarkBindType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_BookmarkBindType')
    BEGIN
    ALTER TABLE Social_Bookmark DROP  CONSTRAINT [UniqueNonclustered_Social_BookmarkBindType]
    END

-- [Social_Bookmark.BookmarkList] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Bookmark') AND name='BookmarkList')
    BEGIN
     ALTER TABLE Social_Bookmark ALTER COLUMN [BookmarkList] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Bookmark_BookmarkList NVARCHAR(MAX);
    SET @sql_add_Social_Bookmark_BookmarkList = 'ALTER TABLE Social_Bookmark ADD [BookmarkList] BIGINT'
    EXEC sp_executesql @sql_add_Social_Bookmark_BookmarkList
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_BookmarkBookmarkList')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_BookmarkBookmarkList]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_BookmarkBookmarkList')
    BEGIN
    ALTER TABLE Social_Bookmark DROP  CONSTRAINT [UniqueNonclustered_Social_BookmarkBookmarkList]
    END

-- [Social_Bookmark.Notes] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Bookmark') AND name='Notes')
    BEGIN
     ALTER TABLE Social_Bookmark ALTER COLUMN [Notes] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Bookmark_Notes NVARCHAR(MAX);
    SET @sql_add_Social_Bookmark_Notes = 'ALTER TABLE Social_Bookmark ADD [Notes] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Social_Bookmark_Notes
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_BookmarkNotes')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_BookmarkNotes]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_BookmarkNotes')
    BEGIN
    ALTER TABLE Social_Bookmark DROP  CONSTRAINT [UniqueNonclustered_Social_BookmarkNotes]
    END

-- [Social_Bookmark.Path] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Bookmark') AND name='Path')
    BEGIN
     ALTER TABLE Social_Bookmark ALTER COLUMN [Path] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Bookmark_Path NVARCHAR(MAX);
    SET @sql_add_Social_Bookmark_Path = 'ALTER TABLE Social_Bookmark ADD [Path] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Social_Bookmark_Path
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_BookmarkPath')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_BookmarkPath]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_BookmarkPath')
    BEGIN
    ALTER TABLE Social_Bookmark DROP  CONSTRAINT [UniqueNonclustered_Social_BookmarkPath]
    END

-- [Social_Bookmark.Group] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Bookmark') AND name='Group')
    BEGIN
     ALTER TABLE Social_Bookmark ALTER COLUMN [Group] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Bookmark_Group NVARCHAR(MAX);
    SET @sql_add_Social_Bookmark_Group = 'ALTER TABLE Social_Bookmark ADD [Group] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Social_Bookmark_Group
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_BookmarkGroup')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_BookmarkGroup]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_BookmarkGroup')
    BEGIN
    ALTER TABLE Social_Bookmark DROP  CONSTRAINT [UniqueNonclustered_Social_BookmarkGroup]
    END

-- [Social_Bookmark.Type] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Bookmark') AND name='Type')
    BEGIN
     ALTER TABLE Social_Bookmark ALTER COLUMN [Type] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Bookmark_Type NVARCHAR(MAX);
    SET @sql_add_Social_Bookmark_Type = 'ALTER TABLE Social_Bookmark ADD [Type] BIGINT'
    EXEC sp_executesql @sql_add_Social_Bookmark_Type
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_BookmarkType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_BookmarkType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_BookmarkType')
    BEGIN
    ALTER TABLE Social_Bookmark DROP  CONSTRAINT [UniqueNonclustered_Social_BookmarkType]
    END
-- [Social_BookmarkList] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Social_BookmarkList' AND xtype='U')

BEGIN

    CREATE TABLE Social_BookmarkList ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [EndUser] BIGINT
        ,[Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Background] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Desc] NVARCHAR(MAX)
        ,[Privacy] INT
        ,[Moment] BIGINT
        ,[Type] INT
, CONSTRAINT [PK_Social_BookmarkList] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Social_BookmarkList NVARCHAR(64)
DECLARE cursor_Social_BookmarkList CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Social_BookmarkList') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','EndUser','Caption','Icon','Background','Desc','Privacy','Moment','Type'))

OPEN cursor_Social_BookmarkList
FETCH NEXT FROM cursor_Social_BookmarkList INTO @name_Social_BookmarkList

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Social_BookmarkList.' + @name_Social_BookmarkList;
    
    DECLARE @sql_Social_BookmarkList NVARCHAR(MAX);
    SET @sql_Social_BookmarkList = 'ALTER TABLE Social_BookmarkList DROP COLUMN ' + QUOTENAME(@name_Social_BookmarkList)
    EXEC sp_executesql @sql_Social_BookmarkList
    
    
    FETCH NEXT FROM cursor_Social_BookmarkList INTO @name_Social_BookmarkList
END

CLOSE cursor_Social_BookmarkList;
DEALLOCATE cursor_Social_BookmarkList;


-- [Social_BookmarkList.EndUser] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_BookmarkList') AND name='EndUser')
    BEGIN
     ALTER TABLE Social_BookmarkList ALTER COLUMN [EndUser] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_BookmarkList_EndUser NVARCHAR(MAX);
    SET @sql_add_Social_BookmarkList_EndUser = 'ALTER TABLE Social_BookmarkList ADD [EndUser] BIGINT'
    EXEC sp_executesql @sql_add_Social_BookmarkList_EndUser
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_BookmarkListEndUser')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_BookmarkListEndUser]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_BookmarkListEndUser')
    BEGIN
    ALTER TABLE Social_BookmarkList DROP  CONSTRAINT [UniqueNonclustered_Social_BookmarkListEndUser]
    END

-- [Social_BookmarkList.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_BookmarkList') AND name='Caption')
    BEGIN
     ALTER TABLE Social_BookmarkList ALTER COLUMN [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_BookmarkList_Caption NVARCHAR(MAX);
    SET @sql_add_Social_BookmarkList_Caption = 'ALTER TABLE Social_BookmarkList ADD [Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Social_BookmarkList_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_BookmarkListCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_BookmarkListCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_BookmarkListCaption')
    BEGIN
    ALTER TABLE Social_BookmarkList DROP  CONSTRAINT [UniqueNonclustered_Social_BookmarkListCaption]
    END

-- [Social_BookmarkList.Icon] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_BookmarkList') AND name='Icon')
    BEGIN
     ALTER TABLE Social_BookmarkList ALTER COLUMN [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_BookmarkList_Icon NVARCHAR(MAX);
    SET @sql_add_Social_BookmarkList_Icon = 'ALTER TABLE Social_BookmarkList ADD [Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Social_BookmarkList_Icon
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_BookmarkListIcon')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_BookmarkListIcon]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_BookmarkListIcon')
    BEGIN
    ALTER TABLE Social_BookmarkList DROP  CONSTRAINT [UniqueNonclustered_Social_BookmarkListIcon]
    END

-- [Social_BookmarkList.Background] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_BookmarkList') AND name='Background')
    BEGIN
     ALTER TABLE Social_BookmarkList ALTER COLUMN [Background] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_BookmarkList_Background NVARCHAR(MAX);
    SET @sql_add_Social_BookmarkList_Background = 'ALTER TABLE Social_BookmarkList ADD [Background] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Social_BookmarkList_Background
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_BookmarkListBackground')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_BookmarkListBackground]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_BookmarkListBackground')
    BEGIN
    ALTER TABLE Social_BookmarkList DROP  CONSTRAINT [UniqueNonclustered_Social_BookmarkListBackground]
    END

-- [Social_BookmarkList.Desc] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_BookmarkList') AND name='Desc')
    BEGIN
     ALTER TABLE Social_BookmarkList ALTER COLUMN [Desc] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_BookmarkList_Desc NVARCHAR(MAX);
    SET @sql_add_Social_BookmarkList_Desc = 'ALTER TABLE Social_BookmarkList ADD [Desc] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Social_BookmarkList_Desc
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_BookmarkListDesc')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_BookmarkListDesc]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_BookmarkListDesc')
    BEGIN
    ALTER TABLE Social_BookmarkList DROP  CONSTRAINT [UniqueNonclustered_Social_BookmarkListDesc]
    END

-- [Social_BookmarkList.Privacy] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_BookmarkList') AND name='Privacy')
    BEGIN
     ALTER TABLE Social_BookmarkList ALTER COLUMN [Privacy] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_BookmarkList_Privacy NVARCHAR(MAX);
    SET @sql_add_Social_BookmarkList_Privacy = 'ALTER TABLE Social_BookmarkList ADD [Privacy] INT'
    EXEC sp_executesql @sql_add_Social_BookmarkList_Privacy
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_BookmarkListPrivacy')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_BookmarkListPrivacy]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_BookmarkListPrivacy')
    BEGIN
    ALTER TABLE Social_BookmarkList DROP  CONSTRAINT [UniqueNonclustered_Social_BookmarkListPrivacy]
    END

-- [Social_BookmarkList.Moment] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_BookmarkList') AND name='Moment')
    BEGIN
     ALTER TABLE Social_BookmarkList ALTER COLUMN [Moment] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_BookmarkList_Moment NVARCHAR(MAX);
    SET @sql_add_Social_BookmarkList_Moment = 'ALTER TABLE Social_BookmarkList ADD [Moment] BIGINT'
    EXEC sp_executesql @sql_add_Social_BookmarkList_Moment
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_BookmarkListMoment')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_BookmarkListMoment]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_BookmarkListMoment')
    BEGIN
    ALTER TABLE Social_BookmarkList DROP  CONSTRAINT [UniqueNonclustered_Social_BookmarkListMoment]
    END

-- [Social_BookmarkList.Type] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_BookmarkList') AND name='Type')
    BEGIN
     ALTER TABLE Social_BookmarkList ALTER COLUMN [Type] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_BookmarkList_Type NVARCHAR(MAX);
    SET @sql_add_Social_BookmarkList_Type = 'ALTER TABLE Social_BookmarkList ADD [Type] INT'
    EXEC sp_executesql @sql_add_Social_BookmarkList_Type
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_BookmarkListType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_BookmarkListType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_BookmarkListType')
    BEGIN
    ALTER TABLE Social_BookmarkList DROP  CONSTRAINT [UniqueNonclustered_Social_BookmarkListType]
    END
-- [Social_Follow] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Social_Follow' AND xtype='U')

BEGIN

    CREATE TABLE Social_Follow ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [EndUser] BIGINT
        ,[Followee] BIGINT
        ,[FollowType] INT
, CONSTRAINT [PK_Social_Follow] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Social_Follow NVARCHAR(64)
DECLARE cursor_Social_Follow CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Social_Follow') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','EndUser','Followee','FollowType'))

OPEN cursor_Social_Follow
FETCH NEXT FROM cursor_Social_Follow INTO @name_Social_Follow

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Social_Follow.' + @name_Social_Follow;
    
    DECLARE @sql_Social_Follow NVARCHAR(MAX);
    SET @sql_Social_Follow = 'ALTER TABLE Social_Follow DROP COLUMN ' + QUOTENAME(@name_Social_Follow)
    EXEC sp_executesql @sql_Social_Follow
    
    
    FETCH NEXT FROM cursor_Social_Follow INTO @name_Social_Follow
END

CLOSE cursor_Social_Follow;
DEALLOCATE cursor_Social_Follow;


-- [Social_Follow.EndUser] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Follow') AND name='EndUser')
    BEGIN
     ALTER TABLE Social_Follow ALTER COLUMN [EndUser] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Follow_EndUser NVARCHAR(MAX);
    SET @sql_add_Social_Follow_EndUser = 'ALTER TABLE Social_Follow ADD [EndUser] BIGINT'
    EXEC sp_executesql @sql_add_Social_Follow_EndUser
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_FollowEndUser')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_FollowEndUser]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_FollowEndUser')
    BEGIN
    ALTER TABLE Social_Follow DROP  CONSTRAINT [UniqueNonclustered_Social_FollowEndUser]
    END

-- [Social_Follow.Followee] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Follow') AND name='Followee')
    BEGIN
     ALTER TABLE Social_Follow ALTER COLUMN [Followee] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Follow_Followee NVARCHAR(MAX);
    SET @sql_add_Social_Follow_Followee = 'ALTER TABLE Social_Follow ADD [Followee] BIGINT'
    EXEC sp_executesql @sql_add_Social_Follow_Followee
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_FollowFollowee')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_FollowFollowee]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_FollowFollowee')
    BEGIN
    ALTER TABLE Social_Follow DROP  CONSTRAINT [UniqueNonclustered_Social_FollowFollowee]
    END

-- [Social_Follow.FollowType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Follow') AND name='FollowType')
    BEGIN
     ALTER TABLE Social_Follow ALTER COLUMN [FollowType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Follow_FollowType NVARCHAR(MAX);
    SET @sql_add_Social_Follow_FollowType = 'ALTER TABLE Social_Follow ADD [FollowType] INT'
    EXEC sp_executesql @sql_add_Social_Follow_FollowType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_FollowFollowType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_FollowFollowType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_FollowFollowType')
    BEGIN
    ALTER TABLE Social_Follow DROP  CONSTRAINT [UniqueNonclustered_Social_FollowFollowType]
    END
-- [Social_Moment] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Social_Moment' AND xtype='U')

BEGIN

    CREATE TABLE Social_Moment ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Agent] BIGINT
        ,[Bind] BIGINT
        ,[BindType] INT
        ,[BizCode] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[Lang] BIGINT
        ,[Title] NVARCHAR(MAX)
        ,[Summary] NVARCHAR(MAX)
        ,[FullText] NVARCHAR(MAX)
        ,[PreviewImgUrl] NVARCHAR(MAX)
        ,[Link] NVARCHAR(MAX)
        ,[Type] INT
        ,[Question] BIGINT
        ,[State] INT
        ,[Group] BIGINT
        ,[Postedat] BIGINT
        ,[Keywords] NVARCHAR(MAX)
        ,[MediaType] INT
        ,[UrlOriginal] NVARCHAR(MAX)
        ,[OID] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
        ,[PostType] INT
        ,[AudioUrl] NVARCHAR(MAX)
, CONSTRAINT [PK_Social_Moment] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Social_Moment NVARCHAR(64)
DECLARE cursor_Social_Moment CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Agent','Bind','BindType','BizCode','Lang','Title','Summary','FullText','PreviewImgUrl','Link','Type','Question','State','Group','Postedat','Keywords','MediaType','UrlOriginal','OID','PostType','AudioUrl'))

OPEN cursor_Social_Moment
FETCH NEXT FROM cursor_Social_Moment INTO @name_Social_Moment

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Social_Moment.' + @name_Social_Moment;
    
    DECLARE @sql_Social_Moment NVARCHAR(MAX);
    SET @sql_Social_Moment = 'ALTER TABLE Social_Moment DROP COLUMN ' + QUOTENAME(@name_Social_Moment)
    EXEC sp_executesql @sql_Social_Moment
    
    
    FETCH NEXT FROM cursor_Social_Moment INTO @name_Social_Moment
END

CLOSE cursor_Social_Moment;
DEALLOCATE cursor_Social_Moment;


-- [Social_Moment.Agent] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Agent')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [Agent] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_Agent NVARCHAR(MAX);
    SET @sql_add_Social_Moment_Agent = 'ALTER TABLE Social_Moment ADD [Agent] BIGINT'
    EXEC sp_executesql @sql_add_Social_Moment_Agent
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentAgent')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentAgent]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentAgent')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentAgent]
    END

-- [Social_Moment.Bind] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Bind')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [Bind] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_Bind NVARCHAR(MAX);
    SET @sql_add_Social_Moment_Bind = 'ALTER TABLE Social_Moment ADD [Bind] BIGINT'
    EXEC sp_executesql @sql_add_Social_Moment_Bind
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentBind')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentBind]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentBind')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentBind]
    END

-- [Social_Moment.BindType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='BindType')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [BindType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_BindType NVARCHAR(MAX);
    SET @sql_add_Social_Moment_BindType = 'ALTER TABLE Social_Moment ADD [BindType] INT'
    EXEC sp_executesql @sql_add_Social_Moment_BindType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentBindType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentBindType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentBindType')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentBindType]
    END

-- [Social_Moment.BizCode] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='BizCode')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [BizCode] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_BizCode NVARCHAR(MAX);
    SET @sql_add_Social_Moment_BizCode = 'ALTER TABLE Social_Moment ADD [BizCode] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Social_Moment_BizCode
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentBizCode')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentBizCode]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentBizCode')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentBizCode]
    END

-- [Social_Moment.Lang] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Lang')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [Lang] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_Lang NVARCHAR(MAX);
    SET @sql_add_Social_Moment_Lang = 'ALTER TABLE Social_Moment ADD [Lang] BIGINT'
    EXEC sp_executesql @sql_add_Social_Moment_Lang
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentLang')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentLang]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentLang')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentLang]
    END

-- [Social_Moment.Title] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Title')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [Title] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_Title NVARCHAR(MAX);
    SET @sql_add_Social_Moment_Title = 'ALTER TABLE Social_Moment ADD [Title] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Social_Moment_Title
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentTitle')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentTitle]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentTitle')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentTitle]
    END

-- [Social_Moment.Summary] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Summary')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [Summary] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_Summary NVARCHAR(MAX);
    SET @sql_add_Social_Moment_Summary = 'ALTER TABLE Social_Moment ADD [Summary] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Social_Moment_Summary
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentSummary')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentSummary]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentSummary')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentSummary]
    END

-- [Social_Moment.FullText] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='FullText')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [FullText] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_FullText NVARCHAR(MAX);
    SET @sql_add_Social_Moment_FullText = 'ALTER TABLE Social_Moment ADD [FullText] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Social_Moment_FullText
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentFullText')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentFullText]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentFullText')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentFullText]
    END

-- [Social_Moment.PreviewImgUrl] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='PreviewImgUrl')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [PreviewImgUrl] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_PreviewImgUrl NVARCHAR(MAX);
    SET @sql_add_Social_Moment_PreviewImgUrl = 'ALTER TABLE Social_Moment ADD [PreviewImgUrl] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Social_Moment_PreviewImgUrl
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentPreviewImgUrl')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentPreviewImgUrl]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentPreviewImgUrl')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentPreviewImgUrl]
    END

-- [Social_Moment.Link] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Link')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [Link] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_Link NVARCHAR(MAX);
    SET @sql_add_Social_Moment_Link = 'ALTER TABLE Social_Moment ADD [Link] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Social_Moment_Link
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentLink')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentLink]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentLink')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentLink]
    END

-- [Social_Moment.Type] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Type')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [Type] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_Type NVARCHAR(MAX);
    SET @sql_add_Social_Moment_Type = 'ALTER TABLE Social_Moment ADD [Type] INT'
    EXEC sp_executesql @sql_add_Social_Moment_Type
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentType')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentType]
    END

-- [Social_Moment.Question] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Question')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [Question] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_Question NVARCHAR(MAX);
    SET @sql_add_Social_Moment_Question = 'ALTER TABLE Social_Moment ADD [Question] BIGINT'
    EXEC sp_executesql @sql_add_Social_Moment_Question
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentQuestion')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentQuestion]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentQuestion')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentQuestion]
    END

-- [Social_Moment.State] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='State')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [State] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_State NVARCHAR(MAX);
    SET @sql_add_Social_Moment_State = 'ALTER TABLE Social_Moment ADD [State] INT'
    EXEC sp_executesql @sql_add_Social_Moment_State
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentState')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentState]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentState')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentState]
    END

-- [Social_Moment.Group] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Group')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [Group] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_Group NVARCHAR(MAX);
    SET @sql_add_Social_Moment_Group = 'ALTER TABLE Social_Moment ADD [Group] BIGINT'
    EXEC sp_executesql @sql_add_Social_Moment_Group
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentGroup')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentGroup]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentGroup')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentGroup]
    END

-- [Social_Moment.Postedat] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Postedat')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [Postedat] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_Postedat NVARCHAR(MAX);
    SET @sql_add_Social_Moment_Postedat = 'ALTER TABLE Social_Moment ADD [Postedat] BIGINT'
    EXEC sp_executesql @sql_add_Social_Moment_Postedat
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentPostedat')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentPostedat]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentPostedat')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentPostedat]
    END

-- [Social_Moment.Keywords] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Keywords')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [Keywords] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_Keywords NVARCHAR(MAX);
    SET @sql_add_Social_Moment_Keywords = 'ALTER TABLE Social_Moment ADD [Keywords] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Social_Moment_Keywords
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentKeywords')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentKeywords]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentKeywords')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentKeywords]
    END

-- [Social_Moment.MediaType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='MediaType')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [MediaType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_MediaType NVARCHAR(MAX);
    SET @sql_add_Social_Moment_MediaType = 'ALTER TABLE Social_Moment ADD [MediaType] INT'
    EXEC sp_executesql @sql_add_Social_Moment_MediaType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentMediaType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentMediaType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentMediaType')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentMediaType]
    END

-- [Social_Moment.UrlOriginal] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='UrlOriginal')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [UrlOriginal] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_UrlOriginal NVARCHAR(MAX);
    SET @sql_add_Social_Moment_UrlOriginal = 'ALTER TABLE Social_Moment ADD [UrlOriginal] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Social_Moment_UrlOriginal
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentUrlOriginal')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentUrlOriginal]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentUrlOriginal')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentUrlOriginal]
    END

-- [Social_Moment.OID] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='OID')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [OID] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_OID NVARCHAR(MAX);
    SET @sql_add_Social_Moment_OID = 'ALTER TABLE Social_Moment ADD [OID] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Social_Moment_OID
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentOID')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentOID]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentOID')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentOID]
    END

-- [Social_Moment.PostType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='PostType')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [PostType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_PostType NVARCHAR(MAX);
    SET @sql_add_Social_Moment_PostType = 'ALTER TABLE Social_Moment ADD [PostType] INT'
    EXEC sp_executesql @sql_add_Social_Moment_PostType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentPostType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentPostType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentPostType')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentPostType]
    END

-- [Social_Moment.AudioUrl] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='AudioUrl')
    BEGIN
     ALTER TABLE Social_Moment ALTER COLUMN [AudioUrl] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Social_Moment_AudioUrl NVARCHAR(MAX);
    SET @sql_add_Social_Moment_AudioUrl = 'ALTER TABLE Social_Moment ADD [AudioUrl] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Social_Moment_AudioUrl
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Social_MomentAudioUrl')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Social_MomentAudioUrl]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Social_MomentAudioUrl')
    BEGIN
    ALTER TABLE Social_Moment DROP  CONSTRAINT [UniqueNonclustered_Social_MomentAudioUrl]
    END
-- [Sys_Log] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_Log' AND xtype='U')

BEGIN

    CREATE TABLE Sys_Log ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Location] NVARCHAR(MAX)
        ,[Content] NVARCHAR(MAX)
        ,[Sql] NVARCHAR(MAX)
, CONSTRAINT [PK_Sys_Log] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Sys_Log NVARCHAR(64)
DECLARE cursor_Sys_Log CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Sys_Log') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Location','Content','Sql'))

OPEN cursor_Sys_Log
FETCH NEXT FROM cursor_Sys_Log INTO @name_Sys_Log

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Sys_Log.' + @name_Sys_Log;
    
    DECLARE @sql_Sys_Log NVARCHAR(MAX);
    SET @sql_Sys_Log = 'ALTER TABLE Sys_Log DROP COLUMN ' + QUOTENAME(@name_Sys_Log)
    EXEC sp_executesql @sql_Sys_Log
    
    
    FETCH NEXT FROM cursor_Sys_Log INTO @name_Sys_Log
END

CLOSE cursor_Sys_Log;
DEALLOCATE cursor_Sys_Log;


-- [Sys_Log.Location] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Log') AND name='Location')
    BEGIN
     ALTER TABLE Sys_Log ALTER COLUMN [Location] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Sys_Log_Location NVARCHAR(MAX);
    SET @sql_add_Sys_Log_Location = 'ALTER TABLE Sys_Log ADD [Location] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Sys_Log_Location
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Sys_LogLocation')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Sys_LogLocation]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Sys_LogLocation')
    BEGIN
    ALTER TABLE Sys_Log DROP  CONSTRAINT [UniqueNonclustered_Sys_LogLocation]
    END

-- [Sys_Log.Content] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Log') AND name='Content')
    BEGIN
     ALTER TABLE Sys_Log ALTER COLUMN [Content] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Sys_Log_Content NVARCHAR(MAX);
    SET @sql_add_Sys_Log_Content = 'ALTER TABLE Sys_Log ADD [Content] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Sys_Log_Content
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Sys_LogContent')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Sys_LogContent]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Sys_LogContent')
    BEGIN
    ALTER TABLE Sys_Log DROP  CONSTRAINT [UniqueNonclustered_Sys_LogContent]
    END

-- [Sys_Log.Sql] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Log') AND name='Sql')
    BEGIN
     ALTER TABLE Sys_Log ALTER COLUMN [Sql] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Sys_Log_Sql NVARCHAR(MAX);
    SET @sql_add_Sys_Log_Sql = 'ALTER TABLE Sys_Log ADD [Sql] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Sys_Log_Sql
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Sys_LogSql')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Sys_LogSql]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Sys_LogSql')
    BEGIN
    ALTER TABLE Sys_Log DROP  CONSTRAINT [UniqueNonclustered_Sys_LogSql]
    END
-- [Trade_Fund] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Trade_Fund' AND xtype='U')

BEGIN

    CREATE TABLE Trade_Fund ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Desc] NVARCHAR(MAX)
        ,[Bind] BIGINT
        ,[BindType] INT
, CONSTRAINT [PK_Trade_Fund] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Trade_Fund NVARCHAR(64)
DECLARE cursor_Trade_Fund CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Trade_Fund') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Caption','Desc','Bind','BindType'))

OPEN cursor_Trade_Fund
FETCH NEXT FROM cursor_Trade_Fund INTO @name_Trade_Fund

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Trade_Fund.' + @name_Trade_Fund;
    
    DECLARE @sql_Trade_Fund NVARCHAR(MAX);
    SET @sql_Trade_Fund = 'ALTER TABLE Trade_Fund DROP COLUMN ' + QUOTENAME(@name_Trade_Fund)
    EXEC sp_executesql @sql_Trade_Fund
    
    
    FETCH NEXT FROM cursor_Trade_Fund INTO @name_Trade_Fund
END

CLOSE cursor_Trade_Fund;
DEALLOCATE cursor_Trade_Fund;


-- [Trade_Fund.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Fund') AND name='Caption')
    BEGIN
     ALTER TABLE Trade_Fund ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Trade_Fund_Caption NVARCHAR(MAX);
    SET @sql_add_Trade_Fund_Caption = 'ALTER TABLE Trade_Fund ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Trade_Fund_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Trade_FundCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Trade_FundCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Trade_FundCaption')
    BEGIN
    ALTER TABLE Trade_Fund DROP  CONSTRAINT [UniqueNonclustered_Trade_FundCaption]
    END

-- [Trade_Fund.Desc] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Fund') AND name='Desc')
    BEGIN
     ALTER TABLE Trade_Fund ALTER COLUMN [Desc] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Trade_Fund_Desc NVARCHAR(MAX);
    SET @sql_add_Trade_Fund_Desc = 'ALTER TABLE Trade_Fund ADD [Desc] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Trade_Fund_Desc
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Trade_FundDesc')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Trade_FundDesc]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Trade_FundDesc')
    BEGIN
    ALTER TABLE Trade_Fund DROP  CONSTRAINT [UniqueNonclustered_Trade_FundDesc]
    END

-- [Trade_Fund.Bind] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Fund') AND name='Bind')
    BEGIN
     ALTER TABLE Trade_Fund ALTER COLUMN [Bind] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Trade_Fund_Bind NVARCHAR(MAX);
    SET @sql_add_Trade_Fund_Bind = 'ALTER TABLE Trade_Fund ADD [Bind] BIGINT'
    EXEC sp_executesql @sql_add_Trade_Fund_Bind
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Trade_FundBind')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Trade_FundBind]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Trade_FundBind')
    BEGIN
    ALTER TABLE Trade_Fund DROP  CONSTRAINT [UniqueNonclustered_Trade_FundBind]
    END

-- [Trade_Fund.BindType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Fund') AND name='BindType')
    BEGIN
     ALTER TABLE Trade_Fund ALTER COLUMN [BindType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Trade_Fund_BindType NVARCHAR(MAX);
    SET @sql_add_Trade_Fund_BindType = 'ALTER TABLE Trade_Fund ADD [BindType] INT'
    EXEC sp_executesql @sql_add_Trade_Fund_BindType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Trade_FundBindType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Trade_FundBindType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Trade_FundBindType')
    BEGIN
    ALTER TABLE Trade_Fund DROP  CONSTRAINT [UniqueNonclustered_Trade_FundBindType]
    END
-- [Trade_Porfolio] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Trade_Porfolio' AND xtype='U')

BEGIN

    CREATE TABLE Trade_Porfolio ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Desc] NVARCHAR(MAX)
        ,[Fund] BIGINT
        ,[Bind] BIGINT
        ,[BindType] INT
, CONSTRAINT [PK_Trade_Porfolio] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Trade_Porfolio NVARCHAR(64)
DECLARE cursor_Trade_Porfolio CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Trade_Porfolio') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Caption','Desc','Fund','Bind','BindType'))

OPEN cursor_Trade_Porfolio
FETCH NEXT FROM cursor_Trade_Porfolio INTO @name_Trade_Porfolio

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Trade_Porfolio.' + @name_Trade_Porfolio;
    
    DECLARE @sql_Trade_Porfolio NVARCHAR(MAX);
    SET @sql_Trade_Porfolio = 'ALTER TABLE Trade_Porfolio DROP COLUMN ' + QUOTENAME(@name_Trade_Porfolio)
    EXEC sp_executesql @sql_Trade_Porfolio
    
    
    FETCH NEXT FROM cursor_Trade_Porfolio INTO @name_Trade_Porfolio
END

CLOSE cursor_Trade_Porfolio;
DEALLOCATE cursor_Trade_Porfolio;


-- [Trade_Porfolio.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Porfolio') AND name='Caption')
    BEGIN
     ALTER TABLE Trade_Porfolio ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Trade_Porfolio_Caption NVARCHAR(MAX);
    SET @sql_add_Trade_Porfolio_Caption = 'ALTER TABLE Trade_Porfolio ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Trade_Porfolio_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Trade_PorfolioCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Trade_PorfolioCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Trade_PorfolioCaption')
    BEGIN
    ALTER TABLE Trade_Porfolio DROP  CONSTRAINT [UniqueNonclustered_Trade_PorfolioCaption]
    END

-- [Trade_Porfolio.Desc] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Porfolio') AND name='Desc')
    BEGIN
     ALTER TABLE Trade_Porfolio ALTER COLUMN [Desc] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Trade_Porfolio_Desc NVARCHAR(MAX);
    SET @sql_add_Trade_Porfolio_Desc = 'ALTER TABLE Trade_Porfolio ADD [Desc] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Trade_Porfolio_Desc
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Trade_PorfolioDesc')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Trade_PorfolioDesc]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Trade_PorfolioDesc')
    BEGIN
    ALTER TABLE Trade_Porfolio DROP  CONSTRAINT [UniqueNonclustered_Trade_PorfolioDesc]
    END

-- [Trade_Porfolio.Fund] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Porfolio') AND name='Fund')
    BEGIN
     ALTER TABLE Trade_Porfolio ALTER COLUMN [Fund] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Trade_Porfolio_Fund NVARCHAR(MAX);
    SET @sql_add_Trade_Porfolio_Fund = 'ALTER TABLE Trade_Porfolio ADD [Fund] BIGINT'
    EXEC sp_executesql @sql_add_Trade_Porfolio_Fund
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Trade_PorfolioFund')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Trade_PorfolioFund]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Trade_PorfolioFund')
    BEGIN
    ALTER TABLE Trade_Porfolio DROP  CONSTRAINT [UniqueNonclustered_Trade_PorfolioFund]
    END

-- [Trade_Porfolio.Bind] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Porfolio') AND name='Bind')
    BEGIN
     ALTER TABLE Trade_Porfolio ALTER COLUMN [Bind] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Trade_Porfolio_Bind NVARCHAR(MAX);
    SET @sql_add_Trade_Porfolio_Bind = 'ALTER TABLE Trade_Porfolio ADD [Bind] BIGINT'
    EXEC sp_executesql @sql_add_Trade_Porfolio_Bind
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Trade_PorfolioBind')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Trade_PorfolioBind]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Trade_PorfolioBind')
    BEGIN
    ALTER TABLE Trade_Porfolio DROP  CONSTRAINT [UniqueNonclustered_Trade_PorfolioBind]
    END

-- [Trade_Porfolio.BindType] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Porfolio') AND name='BindType')
    BEGIN
     ALTER TABLE Trade_Porfolio ALTER COLUMN [BindType] INT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Trade_Porfolio_BindType NVARCHAR(MAX);
    SET @sql_add_Trade_Porfolio_BindType = 'ALTER TABLE Trade_Porfolio ADD [BindType] INT'
    EXEC sp_executesql @sql_add_Trade_Porfolio_BindType
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Trade_PorfolioBindType')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Trade_PorfolioBindType]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Trade_PorfolioBindType')
    BEGIN
    ALTER TABLE Trade_Porfolio DROP  CONSTRAINT [UniqueNonclustered_Trade_PorfolioBindType]
    END
-- [Trade_Trader] ----------------------

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Trade_Trader' AND xtype='U')

BEGIN

    CREATE TABLE Trade_Trader ([ID] BIGINT NOT NULL
        ,[Createdat] BIGINT NOT NULL
        ,[Updatedat] BIGINT NOT NULL
        ,[Sort] BIGINT NOT NULL,
        [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
        ,[Desc] NVARCHAR(MAX)
        ,[Fund] BIGINT
        ,[EndUser] BIGINT
, CONSTRAINT [PK_Trade_Trader] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END


-- Dropping obsolete fields -----------
DECLARE @name_Trade_Trader NVARCHAR(64)
DECLARE cursor_Trade_Trader CURSOR FOR 
    SELECT name FROM SYSCOLUMNS WHERE id=object_id('Trade_Trader') AND (name NOT IN ('ID','Createdat','Updatedat','Sort','Caption','Desc','Fund','EndUser'))

OPEN cursor_Trade_Trader
FETCH NEXT FROM cursor_Trade_Trader INTO @name_Trade_Trader

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Dropping Trade_Trader.' + @name_Trade_Trader;
    
    DECLARE @sql_Trade_Trader NVARCHAR(MAX);
    SET @sql_Trade_Trader = 'ALTER TABLE Trade_Trader DROP COLUMN ' + QUOTENAME(@name_Trade_Trader)
    EXEC sp_executesql @sql_Trade_Trader
    
    
    FETCH NEXT FROM cursor_Trade_Trader INTO @name_Trade_Trader
END

CLOSE cursor_Trade_Trader;
DEALLOCATE cursor_Trade_Trader;


-- [Trade_Trader.Caption] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Trader') AND name='Caption')
    BEGIN
     ALTER TABLE Trade_Trader ALTER COLUMN [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS
    END
ELSE
    BEGIN
    DECLARE @sql_add_Trade_Trader_Caption NVARCHAR(MAX);
    SET @sql_add_Trade_Trader_Caption = 'ALTER TABLE Trade_Trader ADD [Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS'
    EXEC sp_executesql @sql_add_Trade_Trader_Caption
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Trade_TraderCaption')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Trade_TraderCaption]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Trade_TraderCaption')
    BEGIN
    ALTER TABLE Trade_Trader DROP  CONSTRAINT [UniqueNonclustered_Trade_TraderCaption]
    END

-- [Trade_Trader.Desc] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Trader') AND name='Desc')
    BEGIN
     ALTER TABLE Trade_Trader ALTER COLUMN [Desc] NVARCHAR(MAX)
    END
ELSE
    BEGIN
    DECLARE @sql_add_Trade_Trader_Desc NVARCHAR(MAX);
    SET @sql_add_Trade_Trader_Desc = 'ALTER TABLE Trade_Trader ADD [Desc] NVARCHAR(MAX)'
    EXEC sp_executesql @sql_add_Trade_Trader_Desc
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Trade_TraderDesc')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Trade_TraderDesc]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Trade_TraderDesc')
    BEGIN
    ALTER TABLE Trade_Trader DROP  CONSTRAINT [UniqueNonclustered_Trade_TraderDesc]
    END

-- [Trade_Trader.Fund] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Trader') AND name='Fund')
    BEGIN
     ALTER TABLE Trade_Trader ALTER COLUMN [Fund] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Trade_Trader_Fund NVARCHAR(MAX);
    SET @sql_add_Trade_Trader_Fund = 'ALTER TABLE Trade_Trader ADD [Fund] BIGINT'
    EXEC sp_executesql @sql_add_Trade_Trader_Fund
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Trade_TraderFund')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Trade_TraderFund]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Trade_TraderFund')
    BEGIN
    ALTER TABLE Trade_Trader DROP  CONSTRAINT [UniqueNonclustered_Trade_TraderFund]
    END

-- [Trade_Trader.EndUser] -------------

IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Trader') AND name='EndUser')
    BEGIN
     ALTER TABLE Trade_Trader ALTER COLUMN [EndUser] BIGINT
    END
ELSE
    BEGIN
    DECLARE @sql_add_Trade_Trader_EndUser NVARCHAR(MAX);
    SET @sql_add_Trade_Trader_EndUser = 'ALTER TABLE Trade_Trader ADD [EndUser] BIGINT'
    EXEC sp_executesql @sql_add_Trade_Trader_EndUser
    END


IF EXISTS(SELECT object_id FROM [sys].[objects] WHERE name='Constraint_Trade_TraderEndUser')
    BEGIN
    ALTER TABLE Ca_Staff DROP  CONSTRAINT [Constraint_Trade_TraderEndUser]
    END

IF EXISTS(SELECT * FROM SYSINDEXES WHERE name='UniqueNonclustered_Trade_TraderEndUser')
    BEGIN
    ALTER TABLE Trade_Trader DROP  CONSTRAINT [UniqueNonclustered_Trade_TraderEndUser]
    END