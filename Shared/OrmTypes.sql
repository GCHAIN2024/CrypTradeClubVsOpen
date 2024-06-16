IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Address' AND xtype='U')
BEGIN
    CREATE TABLE Ca_Address ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Bind] BIGINT,[Type] INT,[Line1] NVARCHAR(300) COLLATE Chinese_PRC_CI_AS,[Line2] NVARCHAR(300) COLLATE Chinese_PRC_CI_AS,[State] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS,[County] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS,[Town] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS,[Contact] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Tel] NVARCHAR(20) COLLATE Chinese_PRC_CI_AS,[Email] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Zip] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS,[City] BIGINT,[Country] BIGINT,[Remarks] NVARCHAR(MAX), CONSTRAINT [PK_Ca_Address] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Caption')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Bind')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Type')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Type] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Type] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Line1')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Line1] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Line1] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Line2')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Line2] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Line2] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='State')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [State] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [State] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='County')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [County] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [County] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Town')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Town] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Town] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Contact')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Contact] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Contact] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Tel')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Tel] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Tel] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Email')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Email] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Email] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Zip')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Zip] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Zip] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='City')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [City] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [City] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Country')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Country] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Country] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Address]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Address') AND name='Remarks')
BEGIN
 ALTER TABLE Ca_Address ALTER COLUMN [Remarks] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Address ADD [Remarks] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Airport' AND xtype='U')
BEGIN
    CREATE TABLE Ca_Airport ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Code3IATA] NVARCHAR(3) COLLATE Chinese_PRC_CI_AS,[Code4ICAO] NVARCHAR(4) COLLATE Chinese_PRC_CI_AS,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[CaptionEn] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Country] BIGINT,[City] BIGINT,[IsMetropolitan] BIT, CONSTRAINT [PK_Ca_Airport] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_Airport]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Airport') AND name='Code3IATA')
BEGIN
 ALTER TABLE Ca_Airport ALTER COLUMN [Code3IATA] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Airport ADD [Code3IATA] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Airport]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Airport') AND name='Code4ICAO')
BEGIN
 ALTER TABLE Ca_Airport ALTER COLUMN [Code4ICAO] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Airport ADD [Code4ICAO] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Airport]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Airport') AND name='Caption')
BEGIN
 ALTER TABLE Ca_Airport ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Airport ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Airport]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Airport') AND name='CaptionEn')
BEGIN
 ALTER TABLE Ca_Airport ALTER COLUMN [CaptionEn] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Airport ADD [CaptionEn] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Airport]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Airport') AND name='Country')
BEGIN
 ALTER TABLE Ca_Airport ALTER COLUMN [Country] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Airport ADD [Country] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Airport]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Airport') AND name='City')
BEGIN
 ALTER TABLE Ca_Airport ALTER COLUMN [City] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Airport ADD [City] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Airport]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Airport') AND name='IsMetropolitan')
BEGIN
 ALTER TABLE Ca_Airport ALTER COLUMN [IsMetropolitan] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Airport ADD [IsMetropolitan] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Biz' AND xtype='U')
BEGIN
    CREATE TABLE Ca_Biz ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Code] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Parent] BIGINT,[BasicAcct] BIGINT,[Desc] NVARCHAR(MAX),[Website] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[City] BIGINT,[Country] BIGINT,[Lang] BIGINT,[IsSocial] BIT,[IsCmsSource] BIT,[IsPay] BIT,[MomentLatest] BIGINT,[CountFollowers] BIGINT,[CountFollows] BIGINT,[CountMoments] BIGINT,[CountViews] BIGINT,[CountComments] BIGINT,[CountThumbUps] BIGINT,[CountThumbDns] BIGINT,[IsCrawling] BIT,[IsGSeries] BIT,[RemarksCentral] NVARCHAR(MAX),[Agent] BIGINT,[SiteCats] NVARCHAR(MAX),[ConfiguredCats] NVARCHAR(MAX), CONSTRAINT [PK_Ca_Biz] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Code')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Caption')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Parent')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [Parent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [Parent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='BasicAcct')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [BasicAcct] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [BasicAcct] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Desc')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Website')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [Website] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [Website] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Icon')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='City')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [City] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [City] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Country')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [Country] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [Country] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Lang')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsSocial')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [IsSocial] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [IsSocial] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsCmsSource')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [IsCmsSource] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [IsCmsSource] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsPay')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [IsPay] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [IsPay] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='MomentLatest')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [MomentLatest] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [MomentLatest] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountFollowers')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [CountFollowers] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [CountFollowers] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountFollows')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [CountFollows] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [CountFollows] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountMoments')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [CountMoments] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [CountMoments] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountViews')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [CountViews] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [CountViews] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountComments')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [CountComments] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [CountComments] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountThumbUps')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [CountThumbUps] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [CountThumbUps] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='CountThumbDns')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [CountThumbDns] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [CountThumbDns] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsCrawling')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [IsCrawling] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [IsCrawling] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='IsGSeries')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [IsGSeries] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [IsGSeries] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='RemarksCentral')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [RemarksCentral] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [RemarksCentral] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='Agent')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [Agent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [Agent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='SiteCats')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [SiteCats] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [SiteCats] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Biz]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Biz') AND name='ConfiguredCats')
BEGIN
 ALTER TABLE Ca_Biz ALTER COLUMN [ConfiguredCats] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Biz ADD [ConfiguredCats] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Cat' AND xtype='U')
BEGIN
    CREATE TABLE Ca_Cat ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Lang] BIGINT,[Zh] BIGINT,[Parent] BIGINT,[State] INT, CONSTRAINT [PK_Ca_Cat] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_Cat]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cat') AND name='Caption')
BEGIN
 ALTER TABLE Ca_Cat ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cat ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cat]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cat') AND name='Lang')
BEGIN
 ALTER TABLE Ca_Cat ALTER COLUMN [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cat ADD [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cat]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cat') AND name='Zh')
BEGIN
 ALTER TABLE Ca_Cat ALTER COLUMN [Zh] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cat ADD [Zh] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cat]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cat') AND name='Parent')
BEGIN
 ALTER TABLE Ca_Cat ALTER COLUMN [Parent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cat ADD [Parent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cat]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cat') AND name='State')
BEGIN
 ALTER TABLE Ca_Cat ALTER COLUMN [State] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cat ADD [State] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_City' AND xtype='U')
BEGIN
    CREATE TABLE Ca_City ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Name] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[MetropolitanCode3IATA] NVARCHAR(3) COLLATE Chinese_PRC_CI_AS,[NameEn] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Country] BIGINT,[Place] BIGINT,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Tel] NVARCHAR(4) COLLATE Chinese_PRC_CI_AS, CONSTRAINT [PK_Ca_City] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_City]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_City') AND name='Name')
BEGIN
 ALTER TABLE Ca_City ALTER COLUMN [Name] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_City ADD [Name] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_City]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_City') AND name='MetropolitanCode3IATA')
BEGIN
 ALTER TABLE Ca_City ALTER COLUMN [MetropolitanCode3IATA] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_City ADD [MetropolitanCode3IATA] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_City]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_City') AND name='NameEn')
BEGIN
 ALTER TABLE Ca_City ALTER COLUMN [NameEn] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_City ADD [NameEn] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_City]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_City') AND name='Country')
BEGIN
 ALTER TABLE Ca_City ALTER COLUMN [Country] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_City ADD [Country] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_City]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_City') AND name='Place')
BEGIN
 ALTER TABLE Ca_City ALTER COLUMN [Place] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_City ADD [Place] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_City]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_City') AND name='Icon')
BEGIN
 ALTER TABLE Ca_City ALTER COLUMN [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_City ADD [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_City]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_City') AND name='Tel')
BEGIN
 ALTER TABLE Ca_City ALTER COLUMN [Tel] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_City ADD [Tel] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Country' AND xtype='U')
BEGIN
    CREATE TABLE Ca_Country ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Fullname] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Tel] NVARCHAR(4) COLLATE Chinese_PRC_CI_AS,[Cur] BIGINT,[Capital] BIGINT,[Place] BIGINT,[Lang] BIGINT, CONSTRAINT [PK_Ca_Country] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_Country]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Code2')
BEGIN
 ALTER TABLE Ca_Country ALTER COLUMN [Code2] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Country ADD [Code2] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Country]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Caption')
BEGIN
 ALTER TABLE Ca_Country ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Country ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Country]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Fullname')
BEGIN
 ALTER TABLE Ca_Country ALTER COLUMN [Fullname] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Country ADD [Fullname] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Country]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Icon')
BEGIN
 ALTER TABLE Ca_Country ALTER COLUMN [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Country ADD [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Country]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Tel')
BEGIN
 ALTER TABLE Ca_Country ALTER COLUMN [Tel] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Country ADD [Tel] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Country]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Cur')
BEGIN
 ALTER TABLE Ca_Country ALTER COLUMN [Cur] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Country ADD [Cur] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Country]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Capital')
BEGIN
 ALTER TABLE Ca_Country ALTER COLUMN [Capital] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Country ADD [Capital] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Country]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Place')
BEGIN
 ALTER TABLE Ca_Country ALTER COLUMN [Place] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Country ADD [Place] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Country]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Country') AND name='Lang')
BEGIN
 ALTER TABLE Ca_Country ALTER COLUMN [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Country ADD [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Cur' AND xtype='U')
BEGIN
    CREATE TABLE Ca_Cur ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Code] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Hidden] BIT,[IsSac] BIT,[IsTransfer] BIT,[IsCash] BIT,[EnableReward] BIT,[EnableOTC] BIT,[Icon] NVARCHAR(512) COLLATE Chinese_PRC_CI_AS,[CurType] INT,[Dec] BIGINT,[AnchorRate] FLOAT,[Freezable] BIT,[Authorizable] BIT,[ChaninID] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[ChaninName] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[ContractAddress] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[WalletAddress] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[BaseRate] FLOAT, CONSTRAINT [PK_Ca_Cur] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Code')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Caption')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Hidden')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [Hidden] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [Hidden] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='IsSac')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [IsSac] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [IsSac] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='IsTransfer')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [IsTransfer] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [IsTransfer] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='IsCash')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [IsCash] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [IsCash] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='EnableReward')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [EnableReward] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [EnableReward] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='EnableOTC')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [EnableOTC] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [EnableOTC] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Icon')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='CurType')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [CurType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [CurType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Dec')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [Dec] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [Dec] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='AnchorRate')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [AnchorRate] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [AnchorRate] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Freezable')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [Freezable] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [Freezable] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='Authorizable')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [Authorizable] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [Authorizable] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='ChaninID')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [ChaninID] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [ChaninID] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='ChaninName')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [ChaninName] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [ChaninName] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='ContractAddress')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [ContractAddress] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [ContractAddress] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='WalletAddress')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [WalletAddress] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [WalletAddress] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Cur]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Cur') AND name='BaseRate')
BEGIN
 ALTER TABLE Ca_Cur ALTER COLUMN [BaseRate] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Cur ADD [BaseRate] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_EndUser' AND xtype='U')
BEGIN
    CREATE TABLE Ca_EndUser ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Username] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Penname] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Rolfname] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Email] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Tel] NVARCHAR(32) COLLATE Chinese_PRC_CI_AS,[Domainname] BIGINT,[Gender] INT,[Status] INT,[Admin] INT,[Privilege] BIGINT,[Verify] INT,[Pwd] NVARCHAR(16) COLLATE Chinese_PRC_CI_AS,[Online] BIT,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Background] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[BasicAcct] BIGINT,[Citizen] BIGINT,[Refer] NVARCHAR(7) COLLATE Chinese_PRC_CI_AS,[Referer] BIGINT,[Discord] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[DiscordId] BIGINT,[Google] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[GoogleId] BIGINT,[Apple] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[AppleId] BIGINT,[OAuthProvider] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[OAuthID] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[GTV] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Gettr] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Farm] BIGINT,[CountFollows] BIGINT,[CountFollowers] BIGINT,[CountMoments] BIGINT,[CountViews] BIGINT,[CountComments] BIGINT,[CountThumbUps] BIGINT,[CountThumbDns] BIGINT,[Lang] BIGINT,[BizOperator] BIGINT,[Url] NVARCHAR(MAX),[About] NVARCHAR(MAX),[PublicPoints] BIGINT,[Json] NVARCHAR(MAX),[Agentable] INT, CONSTRAINT [PK_Ca_EndUser] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Caption')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Username')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Username] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Username] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Penname')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Penname] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Penname] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Rolfname')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Rolfname] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Rolfname] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Email')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Email] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Email] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Tel')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Tel] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Tel] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Domainname')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Domainname] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Domainname] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Gender')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Gender] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Gender] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Status')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Status] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Status] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Admin')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Admin] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Admin] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Privilege')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Privilege] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Privilege] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Verify')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Verify] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Verify] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Pwd')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Pwd] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Pwd] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Online')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Online] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Online] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Icon')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Background')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Background] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Background] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='BasicAcct')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [BasicAcct] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [BasicAcct] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Citizen')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Citizen] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Citizen] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Refer')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Refer] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Refer] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Referer')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Referer] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Referer] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Discord')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Discord] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Discord] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='DiscordId')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [DiscordId] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [DiscordId] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Google')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Google] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Google] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='GoogleId')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [GoogleId] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [GoogleId] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Apple')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Apple] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Apple] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='AppleId')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [AppleId] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [AppleId] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='OAuthProvider')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [OAuthProvider] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [OAuthProvider] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='OAuthID')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [OAuthID] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [OAuthID] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='GTV')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [GTV] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [GTV] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Gettr')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Gettr] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Gettr] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Farm')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Farm] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Farm] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='CountFollows')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [CountFollows] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [CountFollows] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='CountFollowers')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [CountFollowers] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [CountFollowers] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='CountMoments')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [CountMoments] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [CountMoments] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='CountViews')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [CountViews] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [CountViews] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='CountComments')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [CountComments] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [CountComments] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='CountThumbUps')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [CountThumbUps] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [CountThumbUps] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='CountThumbDns')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [CountThumbDns] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [CountThumbDns] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Lang')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='BizOperator')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [BizOperator] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [BizOperator] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Url')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Url] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Url] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='About')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [About] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [About] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='PublicPoints')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [PublicPoints] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [PublicPoints] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Json')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Json] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Json] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_EndUser]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_EndUser') AND name='Agentable')
BEGIN
 ALTER TABLE Ca_EndUser ALTER COLUMN [Agentable] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_EndUser ADD [Agentable] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_File' AND xtype='U')
BEGIN
    CREATE TABLE Ca_File ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Ipfs] NVARCHAR(MAX),[Encrypt] INT,[SHA256] NVARCHAR(MAX),[Size] BIGINT,[Bind] BIGINT,[BindType] INT,[State] INT,[Folder] BIGINT,[FileType] INT,[JSON] NVARCHAR(MAX), CONSTRAINT [PK_Ca_File] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Caption')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Ipfs')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [Ipfs] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [Ipfs] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Encrypt')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [Encrypt] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [Encrypt] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='SHA256')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [SHA256] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [SHA256] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Size')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [Size] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [Size] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Bind')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='BindType')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='State')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [State] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [State] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='Folder')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [Folder] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [Folder] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='FileType')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [FileType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [FileType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_File]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_File') AND name='JSON')
BEGIN
 ALTER TABLE Ca_File ALTER COLUMN [JSON] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_File ADD [JSON] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Folder' AND xtype='U')
BEGIN
    CREATE TABLE Ca_Folder ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Encrypt] INT,[Bind] BIGINT,[BindType] INT,[Parent] BIGINT, CONSTRAINT [PK_Ca_Folder] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_Folder]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='Caption')
BEGIN
 ALTER TABLE Ca_Folder ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Folder ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Folder]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='Encrypt')
BEGIN
 ALTER TABLE Ca_Folder ALTER COLUMN [Encrypt] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Folder ADD [Encrypt] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Folder]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='Bind')
BEGIN
 ALTER TABLE Ca_Folder ALTER COLUMN [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Folder ADD [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Folder]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='BindType')
BEGIN
 ALTER TABLE Ca_Folder ALTER COLUMN [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Folder ADD [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Folder]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Folder') AND name='Parent')
BEGIN
 ALTER TABLE Ca_Folder ALTER COLUMN [Parent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Folder ADD [Parent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Lang' AND xtype='U')
BEGIN
    CREATE TABLE Ca_Lang ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Code2] NVARCHAR(2) COLLATE Chinese_PRC_CI_AS,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Native] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[IsBlank] BIT,[IsLocale] BIT,[IsContent] BIT,[IsAutoTranslate] BIT,[IsMiles] BIT,[TextDirection] INT, CONSTRAINT [PK_Ca_Lang] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_Lang]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='Code2')
BEGIN
 ALTER TABLE Ca_Lang ALTER COLUMN [Code2] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Lang ADD [Code2] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Lang]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='Caption')
BEGIN
 ALTER TABLE Ca_Lang ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Lang ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Lang]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='Native')
BEGIN
 ALTER TABLE Ca_Lang ALTER COLUMN [Native] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Lang ADD [Native] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Lang]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='Icon')
BEGIN
 ALTER TABLE Ca_Lang ALTER COLUMN [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Lang ADD [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Lang]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='IsBlank')
BEGIN
 ALTER TABLE Ca_Lang ALTER COLUMN [IsBlank] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Lang ADD [IsBlank] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Lang]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='IsLocale')
BEGIN
 ALTER TABLE Ca_Lang ALTER COLUMN [IsLocale] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Lang ADD [IsLocale] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Lang]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='IsContent')
BEGIN
 ALTER TABLE Ca_Lang ALTER COLUMN [IsContent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Lang ADD [IsContent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Lang]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='IsAutoTranslate')
BEGIN
 ALTER TABLE Ca_Lang ALTER COLUMN [IsAutoTranslate] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Lang ADD [IsAutoTranslate] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Lang]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='IsMiles')
BEGIN
 ALTER TABLE Ca_Lang ALTER COLUMN [IsMiles] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Lang ADD [IsMiles] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Lang]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Lang') AND name='TextDirection')
BEGIN
 ALTER TABLE Ca_Lang ALTER COLUMN [TextDirection] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Lang ADD [TextDirection] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Locale' AND xtype='U')
BEGIN
    CREATE TABLE Ca_Locale ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Code] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Lang] BIGINT,[Zh] NVARCHAR(MAX),[Text] NVARCHAR(MAX), CONSTRAINT [PK_Ca_Locale] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_Locale]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Locale') AND name='Code')
BEGIN
 ALTER TABLE Ca_Locale ALTER COLUMN [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Locale ADD [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Locale]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Locale') AND name='Lang')
BEGIN
 ALTER TABLE Ca_Locale ALTER COLUMN [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Locale ADD [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Locale]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Locale') AND name='Zh')
BEGIN
 ALTER TABLE Ca_Locale ALTER COLUMN [Zh] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Locale ADD [Zh] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_Locale]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_Locale') AND name='Text')
BEGIN
 ALTER TABLE Ca_Locale ALTER COLUMN [Text] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_Locale ADD [Text] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_SpecialItem' AND xtype='U')
BEGIN
    CREATE TABLE Ca_SpecialItem ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Type] INT,[Lang] BIGINT,[Bind] BIGINT, CONSTRAINT [PK_Ca_SpecialItem] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_SpecialItem]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_SpecialItem') AND name='Type')
BEGIN
 ALTER TABLE Ca_SpecialItem ALTER COLUMN [Type] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_SpecialItem ADD [Type] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_SpecialItem]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_SpecialItem') AND name='Lang')
BEGIN
 ALTER TABLE Ca_SpecialItem ALTER COLUMN [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_SpecialItem ADD [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_SpecialItem]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_SpecialItem') AND name='Bind')
BEGIN
 ALTER TABLE Ca_SpecialItem ALTER COLUMN [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_SpecialItem ADD [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_WebCredential' AND xtype='U')
BEGIN
    CREATE TABLE Ca_WebCredential ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[ExternalId] BIGINT,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[EU] BIGINT,[Biz] BIGINT,[Json] NVARCHAR(MAX), CONSTRAINT [PK_Ca_WebCredential] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ca_WebCredential]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='Caption')
BEGIN
 ALTER TABLE Ca_WebCredential ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_WebCredential ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_WebCredential]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='ExternalId')
BEGIN
 ALTER TABLE Ca_WebCredential ALTER COLUMN [ExternalId] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_WebCredential ADD [ExternalId] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_WebCredential]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='Icon')
BEGIN
 ALTER TABLE Ca_WebCredential ALTER COLUMN [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_WebCredential ADD [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_WebCredential]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='EU')
BEGIN
 ALTER TABLE Ca_WebCredential ALTER COLUMN [EU] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_WebCredential ADD [EU] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_WebCredential]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='Biz')
BEGIN
 ALTER TABLE Ca_WebCredential ALTER COLUMN [Biz] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_WebCredential ADD [Biz] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ca_WebCredential]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ca_WebCredential') AND name='Json')
BEGIN
 ALTER TABLE Ca_WebCredential ALTER COLUMN [Json] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ca_WebCredential ADD [Json] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ex_Instrument' AND xtype='U')
BEGIN
    CREATE TABLE Ex_Instrument ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Desc] NVARCHAR(MAX),[Hidden] BIT,[EnableQuote] BIT,[Code] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Long] BIGINT,[AssetName] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Short] BIGINT,[Convertor] BIGINT,[m] FLOAT,[mu] FLOAT,[eta] FLOAT,[psi] FLOAT,[MarginCalc] INT,[MarginRateInit] FLOAT,[MarginRateMntn] FLOAT,[MarginMode] INT,[Dec] BIGINT,[Formatter] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Path] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Ask] BIGINT,[Bid] BIGINT,[Middle] FLOAT,[FixedSpread] FLOAT,[PercentageSpread] FLOAT,[TaxOpenMode] INT,[TaxOpen] FLOAT,[TaxCloseMode] INT,[TaxClose] FLOAT,[Tax] FLOAT,[TaxCur] BIGINT,[TaxCurCode] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[LastPrice] FLOAT,[LastUpdatedat] BIGINT,[LastPriceChange] BIGINT,[TradeStatus] INT,[RoMode] INT,[Schedule] NVARCHAR(MAX),[TradeMode] INT,[DerivativeMode] INT,[OptionsMode] INT,[OptionsCP] INT,[OptionsExpiry] BIGINT,[OptionsStrike] FLOAT,[OptionsPricing] NVARCHAR(MAX),[OptionsPeriod] NVARCHAR(MAX),[OptionsTax] FLOAT,[OptionsPremiumPerTradeMin] FLOAT,[OptionsPremiumPerTradeMax] FLOAT,[LimitLotPerTrade] FLOAT,[LimitLotPosition] FLOAT,[CurrentOpen] FLOAT,[CurrentHigh] FLOAT,[CurrentLow] FLOAT,[PrevClose] FLOAT,[PrevClosedat] BIGINT,[CurrentOpenat] BIGINT,[ExtBiz] BIGINT,[RefExternal] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[ItrnInss] NVARCHAR(MAX),[ItrnInssMode] INT,[FlushType] INT,[CurTrigger] INT,[RobotType] INT,[ExtLong] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[ExtShort] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[ExtPrice] FLOAT,[SaveM1] BIT,[HistSavedat] BIGINT,[SaveD1] BIT,[SlPips] FLOAT,[TpPips] FLOAT,[PendingLimitPips] FLOAT,[PendingStopPips] FLOAT,[LastDirection] INT,[LiqMode] INT,[LiqPeriodSince] BIGINT,[LiqPeriodTill] BIGINT,[LiqPeriod] INT,[LiqTime] FLOAT,[ConvertRatio] FLOAT,[RoBuyMode] INT,[RoBuy] FLOAT,[RoSellMode] INT,[RoSell] FLOAT,[PosLimitBuy] FLOAT,[PosLimitSell] FLOAT,[RoCur] BIGINT,[RoCurCode] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[AdjBias] FLOAT,[TaxBuy] FLOAT,[TaxSell] FLOAT,[Misc] NVARCHAR(MAX),[RefLastPriceChange] BIGINT,[HedgeExternal] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[OfferingPrice] FLOAT,[IssuanceAmount] BIGINT,[ListingStatus] INT,[Turnover] FLOAT,[PriceOpened] BIGINT, CONSTRAINT [PK_Ex_Instrument] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Desc')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Hidden')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [Hidden] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [Hidden] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='EnableQuote')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [EnableQuote] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [EnableQuote] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Code')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Caption')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Long')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [Long] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [Long] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='AssetName')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [AssetName] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [AssetName] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Short')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [Short] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [Short] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Convertor')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [Convertor] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [Convertor] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='m')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [m] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [m] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='mu')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [mu] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [mu] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='eta')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [eta] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [eta] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='psi')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [psi] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [psi] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='MarginCalc')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [MarginCalc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [MarginCalc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='MarginRateInit')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [MarginRateInit] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [MarginRateInit] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='MarginRateMntn')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [MarginRateMntn] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [MarginRateMntn] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='MarginMode')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [MarginMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [MarginMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Dec')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [Dec] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [Dec] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Formatter')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [Formatter] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [Formatter] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Path')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [Path] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [Path] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Ask')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [Ask] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [Ask] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Bid')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [Bid] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [Bid] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Middle')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [Middle] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [Middle] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='FixedSpread')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [FixedSpread] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [FixedSpread] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='PercentageSpread')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [PercentageSpread] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [PercentageSpread] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TaxOpenMode')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [TaxOpenMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [TaxOpenMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TaxOpen')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [TaxOpen] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [TaxOpen] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TaxCloseMode')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [TaxCloseMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [TaxCloseMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TaxClose')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [TaxClose] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [TaxClose] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Tax')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [Tax] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [Tax] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TaxCur')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [TaxCur] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [TaxCur] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TaxCurCode')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [TaxCurCode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [TaxCurCode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LastPrice')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [LastPrice] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [LastPrice] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LastUpdatedat')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [LastUpdatedat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [LastUpdatedat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LastPriceChange')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [LastPriceChange] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [LastPriceChange] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TradeStatus')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [TradeStatus] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [TradeStatus] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RoMode')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [RoMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [RoMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Schedule')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [Schedule] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [Schedule] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TradeMode')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [TradeMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [TradeMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='DerivativeMode')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [DerivativeMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [DerivativeMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OptionsMode')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [OptionsMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [OptionsMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OptionsCP')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [OptionsCP] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [OptionsCP] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OptionsExpiry')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [OptionsExpiry] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [OptionsExpiry] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OptionsStrike')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [OptionsStrike] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [OptionsStrike] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OptionsPricing')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [OptionsPricing] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [OptionsPricing] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OptionsPeriod')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [OptionsPeriod] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [OptionsPeriod] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OptionsTax')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [OptionsTax] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [OptionsTax] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OptionsPremiumPerTradeMin')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [OptionsPremiumPerTradeMin] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [OptionsPremiumPerTradeMin] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OptionsPremiumPerTradeMax')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [OptionsPremiumPerTradeMax] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [OptionsPremiumPerTradeMax] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LimitLotPerTrade')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [LimitLotPerTrade] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [LimitLotPerTrade] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LimitLotPosition')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [LimitLotPosition] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [LimitLotPosition] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='CurrentOpen')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [CurrentOpen] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [CurrentOpen] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='CurrentHigh')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [CurrentHigh] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [CurrentHigh] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='CurrentLow')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [CurrentLow] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [CurrentLow] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='PrevClose')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [PrevClose] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [PrevClose] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='PrevClosedat')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [PrevClosedat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [PrevClosedat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='CurrentOpenat')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [CurrentOpenat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [CurrentOpenat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='ExtBiz')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [ExtBiz] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [ExtBiz] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RefExternal')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [RefExternal] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [RefExternal] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='ItrnInss')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [ItrnInss] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [ItrnInss] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='ItrnInssMode')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [ItrnInssMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [ItrnInssMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='FlushType')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [FlushType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [FlushType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='CurTrigger')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [CurTrigger] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [CurTrigger] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RobotType')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [RobotType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [RobotType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='ExtLong')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [ExtLong] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [ExtLong] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='ExtShort')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [ExtShort] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [ExtShort] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='ExtPrice')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [ExtPrice] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [ExtPrice] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='SaveM1')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [SaveM1] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [SaveM1] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='HistSavedat')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [HistSavedat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [HistSavedat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='SaveD1')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [SaveD1] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [SaveD1] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='SlPips')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [SlPips] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [SlPips] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TpPips')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [TpPips] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [TpPips] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='PendingLimitPips')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [PendingLimitPips] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [PendingLimitPips] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='PendingStopPips')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [PendingStopPips] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [PendingStopPips] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LastDirection')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [LastDirection] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [LastDirection] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LiqMode')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [LiqMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [LiqMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LiqPeriodSince')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [LiqPeriodSince] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [LiqPeriodSince] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LiqPeriodTill')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [LiqPeriodTill] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [LiqPeriodTill] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LiqPeriod')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [LiqPeriod] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [LiqPeriod] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='LiqTime')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [LiqTime] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [LiqTime] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='ConvertRatio')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [ConvertRatio] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [ConvertRatio] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RoBuyMode')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [RoBuyMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [RoBuyMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RoBuy')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [RoBuy] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [RoBuy] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RoSellMode')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [RoSellMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [RoSellMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RoSell')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [RoSell] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [RoSell] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='PosLimitBuy')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [PosLimitBuy] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [PosLimitBuy] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='PosLimitSell')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [PosLimitSell] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [PosLimitSell] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RoCur')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [RoCur] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [RoCur] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RoCurCode')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [RoCurCode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [RoCurCode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='AdjBias')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [AdjBias] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [AdjBias] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TaxBuy')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [TaxBuy] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [TaxBuy] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='TaxSell')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [TaxSell] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [TaxSell] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Misc')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [Misc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [Misc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='RefLastPriceChange')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [RefLastPriceChange] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [RefLastPriceChange] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='HedgeExternal')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [HedgeExternal] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [HedgeExternal] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='OfferingPrice')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [OfferingPrice] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [OfferingPrice] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='IssuanceAmount')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [IssuanceAmount] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [IssuanceAmount] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='ListingStatus')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [ListingStatus] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [ListingStatus] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='Turnover')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [Turnover] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [Turnover] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Instrument]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Instrument') AND name='PriceOpened')
BEGIN
 ALTER TABLE Ex_Instrument ALTER COLUMN [PriceOpened] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Instrument ADD [PriceOpened] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ex_Ticket' AND xtype='U')
BEGIN
    CREATE TABLE Ex_Ticket ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[EndUser] BIGINT,[TradeAcct] BIGINT,[Ins] BIGINT,[Code] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[TradeMode] INT,[Lot] BIGINT,[PriceOpened] BIGINT,[PriceOpen] BIGINT,[PriceSL] BIGINT,[PriceTP] BIGINT,[PriceClose] BIGINT,[Status] INT,[CP] BIGINT,[CptAcct] BIGINT,[Ref] BIGINT,[OpenRef] BIGINT,[CloseRef] BIGINT,[Origin] BIGINT,[PnL] FLOAT,[PnLSpread] FLOAT,[Margin] FLOAT,[RO] FLOAT,[Tax] FLOAT,[CloseType] INT,[CommitType] INT,[Cmt] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Opendat] BIGINT,[Closedat] BIGINT,[CaStrategyAmt] FLOAT,[CaRo] BIT,[CaAsa] BIT,[CaCmphsvCharge] FLOAT,[RoCheckedat] BIGINT,[Expiry] BIGINT,[HedgetCP] BIGINT,[PendingPrice] BIGINT,[ClosedLot] BIGINT,[ClosedAmt] FLOAT,[PendingAmt] FLOAT,[DrvPreminum] FLOAT,[DrvExpiry] BIGINT,[DrvPeriod] BIGINT,[DrvDirection] INT,[DrvPrice] FLOAT,[DoubleCp] BIGINT,[ClearStatus] INT,[FollowTicket] BIGINT,[Config] NVARCHAR(MAX),[OptionStatus] INT,[NotionalPrincipal] FLOAT,[ExercisedPrincipal] FLOAT,[ExerciseMode] FLOAT,[ExercisePrice] FLOAT,[ExternalTicketOpen] BIGINT,[ExternalTicketClose] BIGINT,[ExternalTicketPending] BIGINT,[ExternalTicketCancel] BIGINT,[Desc] NVARCHAR(MAX), CONSTRAINT [PK_Ex_Ticket] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='EndUser')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [EndUser] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [EndUser] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='TradeAcct')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [TradeAcct] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [TradeAcct] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Ins')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [Ins] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [Ins] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Code')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [Code] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Caption')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='TradeMode')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [TradeMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [TradeMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Lot')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [Lot] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [Lot] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='PriceOpened')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [PriceOpened] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [PriceOpened] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='PriceOpen')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [PriceOpen] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [PriceOpen] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='PriceSL')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [PriceSL] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [PriceSL] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='PriceTP')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [PriceTP] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [PriceTP] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='PriceClose')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [PriceClose] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [PriceClose] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Status')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [Status] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [Status] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='CP')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [CP] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [CP] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='CptAcct')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [CptAcct] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [CptAcct] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Ref')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [Ref] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [Ref] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='OpenRef')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [OpenRef] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [OpenRef] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='CloseRef')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [CloseRef] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [CloseRef] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Origin')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [Origin] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [Origin] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='PnL')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [PnL] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [PnL] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='PnLSpread')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [PnLSpread] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [PnLSpread] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Margin')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [Margin] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [Margin] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='RO')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [RO] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [RO] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Tax')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [Tax] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [Tax] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='CloseType')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [CloseType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [CloseType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='CommitType')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [CommitType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [CommitType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Cmt')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [Cmt] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [Cmt] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Opendat')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [Opendat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [Opendat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Closedat')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [Closedat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [Closedat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='CaStrategyAmt')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [CaStrategyAmt] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [CaStrategyAmt] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='CaRo')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [CaRo] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [CaRo] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='CaAsa')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [CaAsa] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [CaAsa] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='CaCmphsvCharge')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [CaCmphsvCharge] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [CaCmphsvCharge] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='RoCheckedat')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [RoCheckedat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [RoCheckedat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Expiry')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [Expiry] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [Expiry] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='HedgetCP')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [HedgetCP] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [HedgetCP] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='PendingPrice')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [PendingPrice] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [PendingPrice] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ClosedLot')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [ClosedLot] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [ClosedLot] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ClosedAmt')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [ClosedAmt] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [ClosedAmt] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='PendingAmt')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [PendingAmt] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [PendingAmt] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='DrvPreminum')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [DrvPreminum] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [DrvPreminum] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='DrvExpiry')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [DrvExpiry] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [DrvExpiry] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='DrvPeriod')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [DrvPeriod] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [DrvPeriod] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='DrvDirection')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [DrvDirection] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [DrvDirection] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='DrvPrice')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [DrvPrice] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [DrvPrice] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='DoubleCp')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [DoubleCp] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [DoubleCp] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ClearStatus')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [ClearStatus] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [ClearStatus] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='FollowTicket')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [FollowTicket] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [FollowTicket] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Config')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [Config] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [Config] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='OptionStatus')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [OptionStatus] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [OptionStatus] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='NotionalPrincipal')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [NotionalPrincipal] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [NotionalPrincipal] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ExercisedPrincipal')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [ExercisedPrincipal] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [ExercisedPrincipal] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ExerciseMode')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [ExerciseMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [ExerciseMode] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ExercisePrice')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [ExercisePrice] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [ExercisePrice] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ExternalTicketOpen')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [ExternalTicketOpen] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [ExternalTicketOpen] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ExternalTicketClose')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [ExternalTicketClose] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [ExternalTicketClose] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ExternalTicketPending')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [ExternalTicketPending] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [ExternalTicketPending] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='ExternalTicketCancel')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [ExternalTicketCancel] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [ExternalTicketCancel] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Ex_Ticket]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Ex_Ticket') AND name='Desc')
BEGIN
 ALTER TABLE Ex_Ticket ALTER COLUMN [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Ex_Ticket ADD [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Market_TradeAcct' AND xtype='U')
BEGIN
    CREATE TABLE Market_TradeAcct ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[SAC] BIGINT,[State] INT,[TradeType] INT,[RealDemo] INT,[PnL] FLOAT,[Frozen] FLOAT,[Leverage] FLOAT,[Margin] FLOAT,[MarginCallRateWarning] FLOAT,[MarginCallRateWarningII] FLOAT,[MarginCallRateLiq] FLOAT,[PwdTrade] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[PwdReadonly] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Desc] NVARCHAR(MAX), CONSTRAINT [PK_Market_TradeAcct] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Market_TradeAcct]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='SAC')
BEGIN
 ALTER TABLE Market_TradeAcct ALTER COLUMN [SAC] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Market_TradeAcct ADD [SAC] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Market_TradeAcct]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='State')
BEGIN
 ALTER TABLE Market_TradeAcct ALTER COLUMN [State] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Market_TradeAcct ADD [State] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Market_TradeAcct]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='TradeType')
BEGIN
 ALTER TABLE Market_TradeAcct ALTER COLUMN [TradeType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Market_TradeAcct ADD [TradeType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Market_TradeAcct]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='RealDemo')
BEGIN
 ALTER TABLE Market_TradeAcct ALTER COLUMN [RealDemo] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Market_TradeAcct ADD [RealDemo] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Market_TradeAcct]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='PnL')
BEGIN
 ALTER TABLE Market_TradeAcct ALTER COLUMN [PnL] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Market_TradeAcct ADD [PnL] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Market_TradeAcct]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='Frozen')
BEGIN
 ALTER TABLE Market_TradeAcct ALTER COLUMN [Frozen] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Market_TradeAcct ADD [Frozen] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Market_TradeAcct]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='Leverage')
BEGIN
 ALTER TABLE Market_TradeAcct ALTER COLUMN [Leverage] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Market_TradeAcct ADD [Leverage] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Market_TradeAcct]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='Margin')
BEGIN
 ALTER TABLE Market_TradeAcct ALTER COLUMN [Margin] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Market_TradeAcct ADD [Margin] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Market_TradeAcct]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='MarginCallRateWarning')
BEGIN
 ALTER TABLE Market_TradeAcct ALTER COLUMN [MarginCallRateWarning] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Market_TradeAcct ADD [MarginCallRateWarning] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Market_TradeAcct]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='MarginCallRateWarningII')
BEGIN
 ALTER TABLE Market_TradeAcct ALTER COLUMN [MarginCallRateWarningII] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Market_TradeAcct ADD [MarginCallRateWarningII] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Market_TradeAcct]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='MarginCallRateLiq')
BEGIN
 ALTER TABLE Market_TradeAcct ALTER COLUMN [MarginCallRateLiq] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Market_TradeAcct ADD [MarginCallRateLiq] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Market_TradeAcct]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='PwdTrade')
BEGIN
 ALTER TABLE Market_TradeAcct ALTER COLUMN [PwdTrade] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Market_TradeAcct ADD [PwdTrade] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Market_TradeAcct]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='PwdReadonly')
BEGIN
 ALTER TABLE Market_TradeAcct ALTER COLUMN [PwdReadonly] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Market_TradeAcct ADD [PwdReadonly] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Market_TradeAcct]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Market_TradeAcct') AND name='Desc')
BEGIN
 ALTER TABLE Market_TradeAcct ALTER COLUMN [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Market_TradeAcct ADD [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Social_Bookmark' AND xtype='U')
BEGIN
    CREATE TABLE Social_Bookmark ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Agent] BIGINT,[EndUser] BIGINT,[Bind] BIGINT,[BindType] INT,[BookmarkList] BIGINT,[Notes] NVARCHAR(MAX),[Path] NVARCHAR(MAX),[Group] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Type] BIGINT, CONSTRAINT [PK_Social_Bookmark] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Social_Bookmark]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Bookmark') AND name='Agent')
BEGIN
 ALTER TABLE Social_Bookmark ALTER COLUMN [Agent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Bookmark ADD [Agent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Bookmark]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Bookmark') AND name='EndUser')
BEGIN
 ALTER TABLE Social_Bookmark ALTER COLUMN [EndUser] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Bookmark ADD [EndUser] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Bookmark]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Bookmark') AND name='Bind')
BEGIN
 ALTER TABLE Social_Bookmark ALTER COLUMN [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Bookmark ADD [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Bookmark]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Bookmark') AND name='BindType')
BEGIN
 ALTER TABLE Social_Bookmark ALTER COLUMN [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Bookmark ADD [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Bookmark]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Bookmark') AND name='BookmarkList')
BEGIN
 ALTER TABLE Social_Bookmark ALTER COLUMN [BookmarkList] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Bookmark ADD [BookmarkList] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Bookmark]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Bookmark') AND name='Notes')
BEGIN
 ALTER TABLE Social_Bookmark ALTER COLUMN [Notes] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Bookmark ADD [Notes] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Bookmark]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Bookmark') AND name='Path')
BEGIN
 ALTER TABLE Social_Bookmark ALTER COLUMN [Path] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Bookmark ADD [Path] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Bookmark]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Bookmark') AND name='Group')
BEGIN
 ALTER TABLE Social_Bookmark ALTER COLUMN [Group] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Bookmark ADD [Group] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Bookmark]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Bookmark') AND name='Type')
BEGIN
 ALTER TABLE Social_Bookmark ALTER COLUMN [Type] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Bookmark ADD [Type] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Social_BookmarkList' AND xtype='U')
BEGIN
    CREATE TABLE Social_BookmarkList ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[EndUser] BIGINT,[Caption] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Icon] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Background] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[Desc] NVARCHAR(MAX),[Privacy] INT,[Moment] BIGINT,[Type] INT, CONSTRAINT [PK_Social_BookmarkList] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Social_BookmarkList]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_BookmarkList') AND name='EndUser')
BEGIN
 ALTER TABLE Social_BookmarkList ALTER COLUMN [EndUser] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_BookmarkList ADD [EndUser] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_BookmarkList]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_BookmarkList') AND name='Caption')
BEGIN
 ALTER TABLE Social_BookmarkList ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_BookmarkList ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_BookmarkList]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_BookmarkList') AND name='Icon')
BEGIN
 ALTER TABLE Social_BookmarkList ALTER COLUMN [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_BookmarkList ADD [Icon] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_BookmarkList]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_BookmarkList') AND name='Background')
BEGIN
 ALTER TABLE Social_BookmarkList ALTER COLUMN [Background] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_BookmarkList ADD [Background] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_BookmarkList]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_BookmarkList') AND name='Desc')
BEGIN
 ALTER TABLE Social_BookmarkList ALTER COLUMN [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_BookmarkList ADD [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_BookmarkList]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_BookmarkList') AND name='Privacy')
BEGIN
 ALTER TABLE Social_BookmarkList ALTER COLUMN [Privacy] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_BookmarkList ADD [Privacy] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_BookmarkList]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_BookmarkList') AND name='Moment')
BEGIN
 ALTER TABLE Social_BookmarkList ALTER COLUMN [Moment] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_BookmarkList ADD [Moment] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_BookmarkList]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_BookmarkList') AND name='Type')
BEGIN
 ALTER TABLE Social_BookmarkList ALTER COLUMN [Type] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_BookmarkList ADD [Type] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Social_Follow' AND xtype='U')
BEGIN
    CREATE TABLE Social_Follow ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[EndUser] BIGINT,[Followee] BIGINT,[FollowType] INT, CONSTRAINT [PK_Social_Follow] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Social_Follow]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Follow') AND name='EndUser')
BEGIN
 ALTER TABLE Social_Follow ALTER COLUMN [EndUser] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Follow ADD [EndUser] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Follow]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Follow') AND name='Followee')
BEGIN
 ALTER TABLE Social_Follow ALTER COLUMN [Followee] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Follow ADD [Followee] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Follow]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Follow') AND name='FollowType')
BEGIN
 ALTER TABLE Social_Follow ALTER COLUMN [FollowType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Follow ADD [FollowType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Social_Moment' AND xtype='U')
BEGIN
    CREATE TABLE Social_Moment ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Agent] BIGINT,[Bind] BIGINT,[BindType] INT,[Lang] BIGINT,[ShortText] NVARCHAR(MAX),[MediaUrls] NVARCHAR(MAX),[PreviewImgUrl] NVARCHAR(MAX),[Link] NVARCHAR(MAX),[Type] INT,[Question] BIGINT,[State] INT,[Group] BIGINT,[AutoTranslate] BIGINT,[OriginalMoment] BIGINT,[Postedat] BIGINT,[ContentBind] BIGINT,[Keywords] NVARCHAR(MAX),[Sticky] BIGINT,[Protection] INT,[MediaType] INT,[UrlOriginal] NVARCHAR(MAX),[OID] NVARCHAR(256) COLLATE Chinese_PRC_CI_AS,[PostType] INT,[AudioUrl] NVARCHAR(MAX), CONSTRAINT [PK_Social_Moment] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Agent')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [Agent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [Agent] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Bind')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='BindType')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Lang')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [Lang] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='ShortText')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [ShortText] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [ShortText] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='MediaUrls')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [MediaUrls] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [MediaUrls] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='PreviewImgUrl')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [PreviewImgUrl] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [PreviewImgUrl] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Link')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [Link] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [Link] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Type')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [Type] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [Type] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Question')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [Question] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [Question] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='State')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [State] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [State] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Group')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [Group] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [Group] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='AutoTranslate')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [AutoTranslate] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [AutoTranslate] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='OriginalMoment')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [OriginalMoment] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [OriginalMoment] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Postedat')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [Postedat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [Postedat] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='ContentBind')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [ContentBind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [ContentBind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Keywords')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [Keywords] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [Keywords] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Sticky')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [Sticky] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [Sticky] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='Protection')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [Protection] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [Protection] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='MediaType')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [MediaType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [MediaType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='UrlOriginal')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [UrlOriginal] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [UrlOriginal] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='OID')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [OID] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [OID] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='PostType')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [PostType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [PostType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Social_Moment]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Social_Moment') AND name='AudioUrl')
BEGIN
 ALTER TABLE Social_Moment ALTER COLUMN [AudioUrl] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Social_Moment ADD [AudioUrl] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_Log' AND xtype='U')
BEGIN
    CREATE TABLE Sys_Log ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Location] NVARCHAR(MAX),[Content] NVARCHAR(MAX),[Sql] NVARCHAR(MAX), CONSTRAINT [PK_Sys_Log] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Sys_Log]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Log') AND name='Location')
BEGIN
 ALTER TABLE Sys_Log ALTER COLUMN [Location] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Log ADD [Location] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Log]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Log') AND name='Content')
BEGIN
 ALTER TABLE Sys_Log ALTER COLUMN [Content] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Log ADD [Content] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Sys_Log]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Sys_Log') AND name='Sql')
BEGIN
 ALTER TABLE Sys_Log ALTER COLUMN [Sql] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Sys_Log ADD [Sql] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Trade_Fund' AND xtype='U')
BEGIN
    CREATE TABLE Trade_Fund ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Desc] NVARCHAR(MAX),[Bind] BIGINT,[BindType] INT, CONSTRAINT [PK_Trade_Fund] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Trade_Fund]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Fund') AND name='Caption')
BEGIN
 ALTER TABLE Trade_Fund ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Trade_Fund ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Trade_Fund]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Fund') AND name='Desc')
BEGIN
 ALTER TABLE Trade_Fund ALTER COLUMN [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Trade_Fund ADD [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Trade_Fund]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Fund') AND name='Bind')
BEGIN
 ALTER TABLE Trade_Fund ALTER COLUMN [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Trade_Fund ADD [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Trade_Fund]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Fund') AND name='BindType')
BEGIN
 ALTER TABLE Trade_Fund ALTER COLUMN [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Trade_Fund ADD [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Trade_Porfolio' AND xtype='U')
BEGIN
    CREATE TABLE Trade_Porfolio ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Desc] NVARCHAR(MAX),[Fund] BIGINT,[Bind] BIGINT,[BindType] INT, CONSTRAINT [PK_Trade_Porfolio] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Trade_Porfolio]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Porfolio') AND name='Caption')
BEGIN
 ALTER TABLE Trade_Porfolio ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Trade_Porfolio ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Trade_Porfolio]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Porfolio') AND name='Desc')
BEGIN
 ALTER TABLE Trade_Porfolio ALTER COLUMN [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Trade_Porfolio ADD [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Trade_Porfolio]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Porfolio') AND name='Fund')
BEGIN
 ALTER TABLE Trade_Porfolio ALTER COLUMN [Fund] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Trade_Porfolio ADD [Fund] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Trade_Porfolio]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Porfolio') AND name='Bind')
BEGIN
 ALTER TABLE Trade_Porfolio ALTER COLUMN [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Trade_Porfolio ADD [Bind] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Trade_Porfolio]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Porfolio') AND name='BindType')
BEGIN
 ALTER TABLE Trade_Porfolio ALTER COLUMN [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Trade_Porfolio ADD [BindType] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Trade_Trader' AND xtype='U')
BEGIN
    CREATE TABLE Trade_Trader ([ID] BIGINT NOT NULL,[Createdat] BIGINT NOT NULL,[Updatedat] BIGINT NOT NULL,[Sort] BIGINT NOT NULL,[Caption] NVARCHAR(64) COLLATE Chinese_PRC_CI_AS,[Desc] NVARCHAR(MAX),[Fund] BIGINT,[EndUser] BIGINT, CONSTRAINT [PK_Trade_Trader] PRIMARY KEY CLUSTERED ([ID] ASC)) ON [PRIMARY]
END
--[Trade_Trader]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Trader') AND name='Caption')
BEGIN
 ALTER TABLE Trade_Trader ALTER COLUMN [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Trade_Trader ADD [Caption] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Trade_Trader]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Trader') AND name='Desc')
BEGIN
 ALTER TABLE Trade_Trader ALTER COLUMN [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Trade_Trader ADD [Desc] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Trade_Trader]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Trader') AND name='Fund')
BEGIN
 ALTER TABLE Trade_Trader ALTER COLUMN [Fund] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Trade_Trader ADD [Fund] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
--[Trade_Trader]--------------------
IF EXISTS(SELECT * FROM SYSCOLUMNS WHERE id=object_id('Trade_Trader') AND name='EndUser')
BEGIN
 ALTER TABLE Trade_Trader ALTER COLUMN [EndUser] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
ELSE
BEGIN
 ALTER TABLE Trade_Trader ADD [EndUser] NCHAR(64) COLLATE Chinese_PRC_CI_AS 
END
