
-- [ca_address] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'ca_address'));

    IF condition THEN
        RAISE NOTICE 'ca_address exists.';
    ELSE

    CREATE TABLE ca_address (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Caption VARCHAR(256)
        ,Bind BIGINT
        ,AddressType INT
        ,Line1 VARCHAR(300)
        ,Line2 VARCHAR(300)
        ,State VARCHAR(16)
        ,County VARCHAR(16)
        ,Town VARCHAR(16)
        ,Contact VARCHAR(64)
        ,Tel VARCHAR(20)
        ,Email VARCHAR(256)
        ,Zip VARCHAR(16)
        ,City BIGINT
        ,Country BIGINT
        ,Remarks TEXT);

   END IF;
END $$;


-- [ca_address.Caption] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_address' AND column_name='Caption'));

    IF condition THEN
        RAISE NOTICE 'Caption exists.';
    ELSE
        ALTER TABLE ca_address ADD Caption VARCHAR(256);
    END IF;
END $$;

-- [ca_address.Bind] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_address' AND column_name='Bind'));

    IF condition THEN
        RAISE NOTICE 'Bind exists.';
    ELSE
        ALTER TABLE ca_address ADD Bind BIGINT;
    END IF;
END $$;

-- [ca_address.AddressType] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_address' AND column_name='AddressType'));

    IF condition THEN
        RAISE NOTICE 'AddressType exists.';
    ELSE
        ALTER TABLE ca_address ADD AddressType INT;
    END IF;
END $$;

-- [ca_address.Line1] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_address' AND column_name='Line1'));

    IF condition THEN
        RAISE NOTICE 'Line1 exists.';
    ELSE
        ALTER TABLE ca_address ADD Line1 VARCHAR(300);
    END IF;
END $$;

-- [ca_address.Line2] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_address' AND column_name='Line2'));

    IF condition THEN
        RAISE NOTICE 'Line2 exists.';
    ELSE
        ALTER TABLE ca_address ADD Line2 VARCHAR(300);
    END IF;
END $$;

-- [ca_address.State] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_address' AND column_name='State'));

    IF condition THEN
        RAISE NOTICE 'State exists.';
    ELSE
        ALTER TABLE ca_address ADD State VARCHAR(16);
    END IF;
END $$;

-- [ca_address.County] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_address' AND column_name='County'));

    IF condition THEN
        RAISE NOTICE 'County exists.';
    ELSE
        ALTER TABLE ca_address ADD County VARCHAR(16);
    END IF;
END $$;

-- [ca_address.Town] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_address' AND column_name='Town'));

    IF condition THEN
        RAISE NOTICE 'Town exists.';
    ELSE
        ALTER TABLE ca_address ADD Town VARCHAR(16);
    END IF;
END $$;

-- [ca_address.Contact] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_address' AND column_name='Contact'));

    IF condition THEN
        RAISE NOTICE 'Contact exists.';
    ELSE
        ALTER TABLE ca_address ADD Contact VARCHAR(64);
    END IF;
END $$;

-- [ca_address.Tel] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_address' AND column_name='Tel'));

    IF condition THEN
        RAISE NOTICE 'Tel exists.';
    ELSE
        ALTER TABLE ca_address ADD Tel VARCHAR(20);
    END IF;
END $$;

-- [ca_address.Email] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_address' AND column_name='Email'));

    IF condition THEN
        RAISE NOTICE 'Email exists.';
    ELSE
        ALTER TABLE ca_address ADD Email VARCHAR(256);
    END IF;
END $$;

-- [ca_address.Zip] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_address' AND column_name='Zip'));

    IF condition THEN
        RAISE NOTICE 'Zip exists.';
    ELSE
        ALTER TABLE ca_address ADD Zip VARCHAR(16);
    END IF;
END $$;

-- [ca_address.City] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_address' AND column_name='City'));

    IF condition THEN
        RAISE NOTICE 'City exists.';
    ELSE
        ALTER TABLE ca_address ADD City BIGINT;
    END IF;
END $$;

-- [ca_address.Country] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_address' AND column_name='Country'));

    IF condition THEN
        RAISE NOTICE 'Country exists.';
    ELSE
        ALTER TABLE ca_address ADD Country BIGINT;
    END IF;
END $$;

-- [ca_address.Remarks] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_address' AND column_name='Remarks'));

    IF condition THEN
        RAISE NOTICE 'Remarks exists.';
    ELSE
        ALTER TABLE ca_address ADD Remarks TEXT;
    END IF;
END $$;
-- [ca_biz] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'ca_biz'));

    IF condition THEN
        RAISE NOTICE 'ca_biz exists.';
    ELSE

    CREATE TABLE ca_biz (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Code VARCHAR(256)
        ,Caption VARCHAR(256)
        ,Parent BIGINT
        ,BasicAcct BIGINT
        ,DescTxt TEXT
        ,Website VARCHAR(256)
        ,Icon VARCHAR(256)
        ,City BIGINT
        ,Country BIGINT
        ,Lang BIGINT
        ,IsSocial BIT
        ,IsCmsSource BIT
        ,IsPay BIT
        ,MomentLatest BIGINT
        ,CountFollowers BIGINT
        ,CountFollows BIGINT
        ,CountMoments BIGINT
        ,CountViews BIGINT
        ,CountComments BIGINT
        ,CountThumbUps BIGINT
        ,CountThumbDns BIGINT
        ,IsCrawling BIT
        ,IsGSeries BIT
        ,RemarksCentral TEXT
        ,Agent BIGINT
        ,SiteCats TEXT
        ,ConfiguredCats TEXT);

   END IF;
END $$;


-- [ca_biz.Code] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='Code'));

    IF condition THEN
        RAISE NOTICE 'Code exists.';
    ELSE
        ALTER TABLE ca_biz ADD Code VARCHAR(256);
    END IF;
END $$;

-- [ca_biz.Caption] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='Caption'));

    IF condition THEN
        RAISE NOTICE 'Caption exists.';
    ELSE
        ALTER TABLE ca_biz ADD Caption VARCHAR(256);
    END IF;
END $$;

-- [ca_biz.Parent] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='Parent'));

    IF condition THEN
        RAISE NOTICE 'Parent exists.';
    ELSE
        ALTER TABLE ca_biz ADD Parent BIGINT;
    END IF;
END $$;

-- [ca_biz.BasicAcct] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='BasicAcct'));

    IF condition THEN
        RAISE NOTICE 'BasicAcct exists.';
    ELSE
        ALTER TABLE ca_biz ADD BasicAcct BIGINT;
    END IF;
END $$;

-- [ca_biz.DescTxt] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='DescTxt'));

    IF condition THEN
        RAISE NOTICE 'DescTxt exists.';
    ELSE
        ALTER TABLE ca_biz ADD DescTxt TEXT;
    END IF;
END $$;

-- [ca_biz.Website] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='Website'));

    IF condition THEN
        RAISE NOTICE 'Website exists.';
    ELSE
        ALTER TABLE ca_biz ADD Website VARCHAR(256);
    END IF;
END $$;

-- [ca_biz.Icon] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='Icon'));

    IF condition THEN
        RAISE NOTICE 'Icon exists.';
    ELSE
        ALTER TABLE ca_biz ADD Icon VARCHAR(256);
    END IF;
END $$;

-- [ca_biz.City] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='City'));

    IF condition THEN
        RAISE NOTICE 'City exists.';
    ELSE
        ALTER TABLE ca_biz ADD City BIGINT;
    END IF;
END $$;

-- [ca_biz.Country] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='Country'));

    IF condition THEN
        RAISE NOTICE 'Country exists.';
    ELSE
        ALTER TABLE ca_biz ADD Country BIGINT;
    END IF;
END $$;

-- [ca_biz.Lang] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='Lang'));

    IF condition THEN
        RAISE NOTICE 'Lang exists.';
    ELSE
        ALTER TABLE ca_biz ADD Lang BIGINT;
    END IF;
END $$;

-- [ca_biz.IsSocial] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='IsSocial'));

    IF condition THEN
        RAISE NOTICE 'IsSocial exists.';
    ELSE
        ALTER TABLE ca_biz ADD IsSocial BIT;
    END IF;
END $$;

-- [ca_biz.IsCmsSource] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='IsCmsSource'));

    IF condition THEN
        RAISE NOTICE 'IsCmsSource exists.';
    ELSE
        ALTER TABLE ca_biz ADD IsCmsSource BIT;
    END IF;
END $$;

-- [ca_biz.IsPay] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='IsPay'));

    IF condition THEN
        RAISE NOTICE 'IsPay exists.';
    ELSE
        ALTER TABLE ca_biz ADD IsPay BIT;
    END IF;
END $$;

-- [ca_biz.MomentLatest] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='MomentLatest'));

    IF condition THEN
        RAISE NOTICE 'MomentLatest exists.';
    ELSE
        ALTER TABLE ca_biz ADD MomentLatest BIGINT;
    END IF;
END $$;

-- [ca_biz.CountFollowers] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='CountFollowers'));

    IF condition THEN
        RAISE NOTICE 'CountFollowers exists.';
    ELSE
        ALTER TABLE ca_biz ADD CountFollowers BIGINT;
    END IF;
END $$;

-- [ca_biz.CountFollows] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='CountFollows'));

    IF condition THEN
        RAISE NOTICE 'CountFollows exists.';
    ELSE
        ALTER TABLE ca_biz ADD CountFollows BIGINT;
    END IF;
END $$;

-- [ca_biz.CountMoments] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='CountMoments'));

    IF condition THEN
        RAISE NOTICE 'CountMoments exists.';
    ELSE
        ALTER TABLE ca_biz ADD CountMoments BIGINT;
    END IF;
END $$;

-- [ca_biz.CountViews] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='CountViews'));

    IF condition THEN
        RAISE NOTICE 'CountViews exists.';
    ELSE
        ALTER TABLE ca_biz ADD CountViews BIGINT;
    END IF;
END $$;

-- [ca_biz.CountComments] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='CountComments'));

    IF condition THEN
        RAISE NOTICE 'CountComments exists.';
    ELSE
        ALTER TABLE ca_biz ADD CountComments BIGINT;
    END IF;
END $$;

-- [ca_biz.CountThumbUps] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='CountThumbUps'));

    IF condition THEN
        RAISE NOTICE 'CountThumbUps exists.';
    ELSE
        ALTER TABLE ca_biz ADD CountThumbUps BIGINT;
    END IF;
END $$;

-- [ca_biz.CountThumbDns] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='CountThumbDns'));

    IF condition THEN
        RAISE NOTICE 'CountThumbDns exists.';
    ELSE
        ALTER TABLE ca_biz ADD CountThumbDns BIGINT;
    END IF;
END $$;

-- [ca_biz.IsCrawling] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='IsCrawling'));

    IF condition THEN
        RAISE NOTICE 'IsCrawling exists.';
    ELSE
        ALTER TABLE ca_biz ADD IsCrawling BIT;
    END IF;
END $$;

-- [ca_biz.IsGSeries] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='IsGSeries'));

    IF condition THEN
        RAISE NOTICE 'IsGSeries exists.';
    ELSE
        ALTER TABLE ca_biz ADD IsGSeries BIT;
    END IF;
END $$;

-- [ca_biz.RemarksCentral] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='RemarksCentral'));

    IF condition THEN
        RAISE NOTICE 'RemarksCentral exists.';
    ELSE
        ALTER TABLE ca_biz ADD RemarksCentral TEXT;
    END IF;
END $$;

-- [ca_biz.Agent] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='Agent'));

    IF condition THEN
        RAISE NOTICE 'Agent exists.';
    ELSE
        ALTER TABLE ca_biz ADD Agent BIGINT;
    END IF;
END $$;

-- [ca_biz.SiteCats] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='SiteCats'));

    IF condition THEN
        RAISE NOTICE 'SiteCats exists.';
    ELSE
        ALTER TABLE ca_biz ADD SiteCats TEXT;
    END IF;
END $$;

-- [ca_biz.ConfiguredCats] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_biz' AND column_name='ConfiguredCats'));

    IF condition THEN
        RAISE NOTICE 'ConfiguredCats exists.';
    ELSE
        ALTER TABLE ca_biz ADD ConfiguredCats TEXT;
    END IF;
END $$;
-- [ca_cat] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'ca_cat'));

    IF condition THEN
        RAISE NOTICE 'ca_cat exists.';
    ELSE

    CREATE TABLE ca_cat (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Caption VARCHAR(64)
        ,Lang BIGINT
        ,Zh BIGINT
        ,Parent BIGINT
        ,CatState INT);

   END IF;
END $$;


-- [ca_cat.Caption] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cat' AND column_name='Caption'));

    IF condition THEN
        RAISE NOTICE 'Caption exists.';
    ELSE
        ALTER TABLE ca_cat ADD Caption VARCHAR(64);
    END IF;
END $$;

-- [ca_cat.Lang] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cat' AND column_name='Lang'));

    IF condition THEN
        RAISE NOTICE 'Lang exists.';
    ELSE
        ALTER TABLE ca_cat ADD Lang BIGINT;
    END IF;
END $$;

-- [ca_cat.Zh] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cat' AND column_name='Zh'));

    IF condition THEN
        RAISE NOTICE 'Zh exists.';
    ELSE
        ALTER TABLE ca_cat ADD Zh BIGINT;
    END IF;
END $$;

-- [ca_cat.Parent] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cat' AND column_name='Parent'));

    IF condition THEN
        RAISE NOTICE 'Parent exists.';
    ELSE
        ALTER TABLE ca_cat ADD Parent BIGINT;
    END IF;
END $$;

-- [ca_cat.CatState] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cat' AND column_name='CatState'));

    IF condition THEN
        RAISE NOTICE 'CatState exists.';
    ELSE
        ALTER TABLE ca_cat ADD CatState INT;
    END IF;
END $$;
-- [ca_city] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'ca_city'));

    IF condition THEN
        RAISE NOTICE 'ca_city exists.';
    ELSE

    CREATE TABLE ca_city (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Fullname VARCHAR(64)
        ,MetropolitanCode3IATA VARCHAR(3)
        ,NameEn VARCHAR(64)
        ,Country BIGINT
        ,Place BIGINT
        ,Icon VARCHAR(256)
        ,Tel VARCHAR(4));

   END IF;
END $$;


-- [ca_city.Fullname] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_city' AND column_name='Fullname'));

    IF condition THEN
        RAISE NOTICE 'Fullname exists.';
    ELSE
        ALTER TABLE ca_city ADD Fullname VARCHAR(64);
    END IF;
END $$;

-- [ca_city.MetropolitanCode3IATA] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_city' AND column_name='MetropolitanCode3IATA'));

    IF condition THEN
        RAISE NOTICE 'MetropolitanCode3IATA exists.';
    ELSE
        ALTER TABLE ca_city ADD MetropolitanCode3IATA VARCHAR(3);
    END IF;
END $$;

-- [ca_city.NameEn] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_city' AND column_name='NameEn'));

    IF condition THEN
        RAISE NOTICE 'NameEn exists.';
    ELSE
        ALTER TABLE ca_city ADD NameEn VARCHAR(64);
    END IF;
END $$;

-- [ca_city.Country] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_city' AND column_name='Country'));

    IF condition THEN
        RAISE NOTICE 'Country exists.';
    ELSE
        ALTER TABLE ca_city ADD Country BIGINT;
    END IF;
END $$;

-- [ca_city.Place] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_city' AND column_name='Place'));

    IF condition THEN
        RAISE NOTICE 'Place exists.';
    ELSE
        ALTER TABLE ca_city ADD Place BIGINT;
    END IF;
END $$;

-- [ca_city.Icon] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_city' AND column_name='Icon'));

    IF condition THEN
        RAISE NOTICE 'Icon exists.';
    ELSE
        ALTER TABLE ca_city ADD Icon VARCHAR(256);
    END IF;
END $$;

-- [ca_city.Tel] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_city' AND column_name='Tel'));

    IF condition THEN
        RAISE NOTICE 'Tel exists.';
    ELSE
        ALTER TABLE ca_city ADD Tel VARCHAR(4);
    END IF;
END $$;
-- [ca_country] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'ca_country'));

    IF condition THEN
        RAISE NOTICE 'ca_country exists.';
    ELSE

    CREATE TABLE ca_country (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Code2 VARCHAR(2)
        ,Caption VARCHAR(64)
        ,Fullname VARCHAR(256)
        ,Icon VARCHAR(256)
        ,Tel VARCHAR(4)
        ,Cur BIGINT
        ,Capital BIGINT
        ,Place BIGINT
        ,Lang BIGINT);

   END IF;
END $$;


-- [ca_country.Code2] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_country' AND column_name='Code2'));

    IF condition THEN
        RAISE NOTICE 'Code2 exists.';
    ELSE
        ALTER TABLE ca_country ADD Code2 VARCHAR(2);
    END IF;
END $$;

-- [ca_country.Caption] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_country' AND column_name='Caption'));

    IF condition THEN
        RAISE NOTICE 'Caption exists.';
    ELSE
        ALTER TABLE ca_country ADD Caption VARCHAR(64);
    END IF;
END $$;

-- [ca_country.Fullname] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_country' AND column_name='Fullname'));

    IF condition THEN
        RAISE NOTICE 'Fullname exists.';
    ELSE
        ALTER TABLE ca_country ADD Fullname VARCHAR(256);
    END IF;
END $$;

-- [ca_country.Icon] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_country' AND column_name='Icon'));

    IF condition THEN
        RAISE NOTICE 'Icon exists.';
    ELSE
        ALTER TABLE ca_country ADD Icon VARCHAR(256);
    END IF;
END $$;

-- [ca_country.Tel] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_country' AND column_name='Tel'));

    IF condition THEN
        RAISE NOTICE 'Tel exists.';
    ELSE
        ALTER TABLE ca_country ADD Tel VARCHAR(4);
    END IF;
END $$;

-- [ca_country.Cur] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_country' AND column_name='Cur'));

    IF condition THEN
        RAISE NOTICE 'Cur exists.';
    ELSE
        ALTER TABLE ca_country ADD Cur BIGINT;
    END IF;
END $$;

-- [ca_country.Capital] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_country' AND column_name='Capital'));

    IF condition THEN
        RAISE NOTICE 'Capital exists.';
    ELSE
        ALTER TABLE ca_country ADD Capital BIGINT;
    END IF;
END $$;

-- [ca_country.Place] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_country' AND column_name='Place'));

    IF condition THEN
        RAISE NOTICE 'Place exists.';
    ELSE
        ALTER TABLE ca_country ADD Place BIGINT;
    END IF;
END $$;

-- [ca_country.Lang] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_country' AND column_name='Lang'));

    IF condition THEN
        RAISE NOTICE 'Lang exists.';
    ELSE
        ALTER TABLE ca_country ADD Lang BIGINT;
    END IF;
END $$;
-- [ca_cur] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'ca_cur'));

    IF condition THEN
        RAISE NOTICE 'ca_cur exists.';
    ELSE

    CREATE TABLE ca_cur (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Code VARCHAR(16)
        ,Caption VARCHAR(64)
        ,IsHidden BIT
        ,IsSac BIT
        ,IsTransfer BIT
        ,IsCash BIT
        ,EnableReward BIT
        ,EnableOTC BIT
        ,Icon VARCHAR(512)
        ,CurType INT
        ,FloatDec BIGINT
        ,AnchorRate FLOAT
        ,Freezable BIT
        ,Authorizable BIT
        ,ChaninID VARCHAR(256)
        ,ChaninName VARCHAR(256)
        ,ContractAddress VARCHAR(256)
        ,WalletAddress VARCHAR(256)
        ,BaseRate FLOAT);

   END IF;
END $$;


-- [ca_cur.Code] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cur' AND column_name='Code'));

    IF condition THEN
        RAISE NOTICE 'Code exists.';
    ELSE
        ALTER TABLE ca_cur ADD Code VARCHAR(16);
    END IF;
END $$;

-- [ca_cur.Caption] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cur' AND column_name='Caption'));

    IF condition THEN
        RAISE NOTICE 'Caption exists.';
    ELSE
        ALTER TABLE ca_cur ADD Caption VARCHAR(64);
    END IF;
END $$;

-- [ca_cur.IsHidden] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cur' AND column_name='IsHidden'));

    IF condition THEN
        RAISE NOTICE 'IsHidden exists.';
    ELSE
        ALTER TABLE ca_cur ADD IsHidden BIT;
    END IF;
END $$;

-- [ca_cur.IsSac] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cur' AND column_name='IsSac'));

    IF condition THEN
        RAISE NOTICE 'IsSac exists.';
    ELSE
        ALTER TABLE ca_cur ADD IsSac BIT;
    END IF;
END $$;

-- [ca_cur.IsTransfer] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cur' AND column_name='IsTransfer'));

    IF condition THEN
        RAISE NOTICE 'IsTransfer exists.';
    ELSE
        ALTER TABLE ca_cur ADD IsTransfer BIT;
    END IF;
END $$;

-- [ca_cur.IsCash] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cur' AND column_name='IsCash'));

    IF condition THEN
        RAISE NOTICE 'IsCash exists.';
    ELSE
        ALTER TABLE ca_cur ADD IsCash BIT;
    END IF;
END $$;

-- [ca_cur.EnableReward] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cur' AND column_name='EnableReward'));

    IF condition THEN
        RAISE NOTICE 'EnableReward exists.';
    ELSE
        ALTER TABLE ca_cur ADD EnableReward BIT;
    END IF;
END $$;

-- [ca_cur.EnableOTC] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cur' AND column_name='EnableOTC'));

    IF condition THEN
        RAISE NOTICE 'EnableOTC exists.';
    ELSE
        ALTER TABLE ca_cur ADD EnableOTC BIT;
    END IF;
END $$;

-- [ca_cur.Icon] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cur' AND column_name='Icon'));

    IF condition THEN
        RAISE NOTICE 'Icon exists.';
    ELSE
        ALTER TABLE ca_cur ADD Icon VARCHAR(512);
    END IF;
END $$;

-- [ca_cur.CurType] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cur' AND column_name='CurType'));

    IF condition THEN
        RAISE NOTICE 'CurType exists.';
    ELSE
        ALTER TABLE ca_cur ADD CurType INT;
    END IF;
END $$;

-- [ca_cur.FloatDec] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cur' AND column_name='FloatDec'));

    IF condition THEN
        RAISE NOTICE 'FloatDec exists.';
    ELSE
        ALTER TABLE ca_cur ADD FloatDec BIGINT;
    END IF;
END $$;

-- [ca_cur.AnchorRate] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cur' AND column_name='AnchorRate'));

    IF condition THEN
        RAISE NOTICE 'AnchorRate exists.';
    ELSE
        ALTER TABLE ca_cur ADD AnchorRate FLOAT;
    END IF;
END $$;

-- [ca_cur.Freezable] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cur' AND column_name='Freezable'));

    IF condition THEN
        RAISE NOTICE 'Freezable exists.';
    ELSE
        ALTER TABLE ca_cur ADD Freezable BIT;
    END IF;
END $$;

-- [ca_cur.Authorizable] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cur' AND column_name='Authorizable'));

    IF condition THEN
        RAISE NOTICE 'Authorizable exists.';
    ELSE
        ALTER TABLE ca_cur ADD Authorizable BIT;
    END IF;
END $$;

-- [ca_cur.ChaninID] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cur' AND column_name='ChaninID'));

    IF condition THEN
        RAISE NOTICE 'ChaninID exists.';
    ELSE
        ALTER TABLE ca_cur ADD ChaninID VARCHAR(256);
    END IF;
END $$;

-- [ca_cur.ChaninName] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cur' AND column_name='ChaninName'));

    IF condition THEN
        RAISE NOTICE 'ChaninName exists.';
    ELSE
        ALTER TABLE ca_cur ADD ChaninName VARCHAR(256);
    END IF;
END $$;

-- [ca_cur.ContractAddress] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cur' AND column_name='ContractAddress'));

    IF condition THEN
        RAISE NOTICE 'ContractAddress exists.';
    ELSE
        ALTER TABLE ca_cur ADD ContractAddress VARCHAR(256);
    END IF;
END $$;

-- [ca_cur.WalletAddress] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cur' AND column_name='WalletAddress'));

    IF condition THEN
        RAISE NOTICE 'WalletAddress exists.';
    ELSE
        ALTER TABLE ca_cur ADD WalletAddress VARCHAR(256);
    END IF;
END $$;

-- [ca_cur.BaseRate] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_cur' AND column_name='BaseRate'));

    IF condition THEN
        RAISE NOTICE 'BaseRate exists.';
    ELSE
        ALTER TABLE ca_cur ADD BaseRate FLOAT;
    END IF;
END $$;
-- [ca_enduser] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'ca_enduser'));

    IF condition THEN
        RAISE NOTICE 'ca_enduser exists.';
    ELSE

    CREATE TABLE ca_enduser (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Caption VARCHAR(64)
        ,Username VARCHAR(64)
        ,SocialAuthBiz BIGINT
        ,SocialAuthId TEXT
        ,SocialAuthAvatar TEXT
        ,Email VARCHAR(256)
        ,Tel VARCHAR(32)
        ,Gender INT
        ,Status INT
        ,Admin INT
        ,BizPartner INT
        ,Privilege BIGINT
        ,Verify INT
        ,Pwd VARCHAR(16)
        ,Online BIT
        ,Icon VARCHAR(256)
        ,Background VARCHAR(256)
        ,BasicAcct BIGINT
        ,Citizen BIGINT
        ,Refer VARCHAR(7)
        ,Referer BIGINT
        ,Url TEXT
        ,About TEXT);

   END IF;
END $$;


-- [ca_enduser.Caption] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='Caption'));

    IF condition THEN
        RAISE NOTICE 'Caption exists.';
    ELSE
        ALTER TABLE ca_enduser ADD Caption VARCHAR(64);
    END IF;
END $$;

-- [ca_enduser.Username] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='Username'));

    IF condition THEN
        RAISE NOTICE 'Username exists.';
    ELSE
        ALTER TABLE ca_enduser ADD Username VARCHAR(64);
    END IF;
END $$;

-- [ca_enduser.SocialAuthBiz] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='SocialAuthBiz'));

    IF condition THEN
        RAISE NOTICE 'SocialAuthBiz exists.';
    ELSE
        ALTER TABLE ca_enduser ADD SocialAuthBiz BIGINT;
    END IF;
END $$;

-- [ca_enduser.SocialAuthId] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='SocialAuthId'));

    IF condition THEN
        RAISE NOTICE 'SocialAuthId exists.';
    ELSE
        ALTER TABLE ca_enduser ADD SocialAuthId TEXT;
    END IF;
END $$;

-- [ca_enduser.SocialAuthAvatar] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='SocialAuthAvatar'));

    IF condition THEN
        RAISE NOTICE 'SocialAuthAvatar exists.';
    ELSE
        ALTER TABLE ca_enduser ADD SocialAuthAvatar TEXT;
    END IF;
END $$;

-- [ca_enduser.Email] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='Email'));

    IF condition THEN
        RAISE NOTICE 'Email exists.';
    ELSE
        ALTER TABLE ca_enduser ADD Email VARCHAR(256);
    END IF;
END $$;

-- [ca_enduser.Tel] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='Tel'));

    IF condition THEN
        RAISE NOTICE 'Tel exists.';
    ELSE
        ALTER TABLE ca_enduser ADD Tel VARCHAR(32);
    END IF;
END $$;

-- [ca_enduser.Gender] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='Gender'));

    IF condition THEN
        RAISE NOTICE 'Gender exists.';
    ELSE
        ALTER TABLE ca_enduser ADD Gender INT;
    END IF;
END $$;

-- [ca_enduser.Status] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='Status'));

    IF condition THEN
        RAISE NOTICE 'Status exists.';
    ELSE
        ALTER TABLE ca_enduser ADD Status INT;
    END IF;
END $$;

-- [ca_enduser.Admin] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='Admin'));

    IF condition THEN
        RAISE NOTICE 'Admin exists.';
    ELSE
        ALTER TABLE ca_enduser ADD Admin INT;
    END IF;
END $$;

-- [ca_enduser.BizPartner] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='BizPartner'));

    IF condition THEN
        RAISE NOTICE 'BizPartner exists.';
    ELSE
        ALTER TABLE ca_enduser ADD BizPartner INT;
    END IF;
END $$;

-- [ca_enduser.Privilege] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='Privilege'));

    IF condition THEN
        RAISE NOTICE 'Privilege exists.';
    ELSE
        ALTER TABLE ca_enduser ADD Privilege BIGINT;
    END IF;
END $$;

-- [ca_enduser.Verify] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='Verify'));

    IF condition THEN
        RAISE NOTICE 'Verify exists.';
    ELSE
        ALTER TABLE ca_enduser ADD Verify INT;
    END IF;
END $$;

-- [ca_enduser.Pwd] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='Pwd'));

    IF condition THEN
        RAISE NOTICE 'Pwd exists.';
    ELSE
        ALTER TABLE ca_enduser ADD Pwd VARCHAR(16);
    END IF;
END $$;

-- [ca_enduser.Online] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='Online'));

    IF condition THEN
        RAISE NOTICE 'Online exists.';
    ELSE
        ALTER TABLE ca_enduser ADD Online BIT;
    END IF;
END $$;

-- [ca_enduser.Icon] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='Icon'));

    IF condition THEN
        RAISE NOTICE 'Icon exists.';
    ELSE
        ALTER TABLE ca_enduser ADD Icon VARCHAR(256);
    END IF;
END $$;

-- [ca_enduser.Background] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='Background'));

    IF condition THEN
        RAISE NOTICE 'Background exists.';
    ELSE
        ALTER TABLE ca_enduser ADD Background VARCHAR(256);
    END IF;
END $$;

-- [ca_enduser.BasicAcct] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='BasicAcct'));

    IF condition THEN
        RAISE NOTICE 'BasicAcct exists.';
    ELSE
        ALTER TABLE ca_enduser ADD BasicAcct BIGINT;
    END IF;
END $$;

-- [ca_enduser.Citizen] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='Citizen'));

    IF condition THEN
        RAISE NOTICE 'Citizen exists.';
    ELSE
        ALTER TABLE ca_enduser ADD Citizen BIGINT;
    END IF;
END $$;

-- [ca_enduser.Refer] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='Refer'));

    IF condition THEN
        RAISE NOTICE 'Refer exists.';
    ELSE
        ALTER TABLE ca_enduser ADD Refer VARCHAR(7);
    END IF;
END $$;

-- [ca_enduser.Referer] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='Referer'));

    IF condition THEN
        RAISE NOTICE 'Referer exists.';
    ELSE
        ALTER TABLE ca_enduser ADD Referer BIGINT;
    END IF;
END $$;

-- [ca_enduser.Url] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='Url'));

    IF condition THEN
        RAISE NOTICE 'Url exists.';
    ELSE
        ALTER TABLE ca_enduser ADD Url TEXT;
    END IF;
END $$;

-- [ca_enduser.About] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_enduser' AND column_name='About'));

    IF condition THEN
        RAISE NOTICE 'About exists.';
    ELSE
        ALTER TABLE ca_enduser ADD About TEXT;
    END IF;
END $$;
-- [ca_file] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'ca_file'));

    IF condition THEN
        RAISE NOTICE 'ca_file exists.';
    ELSE

    CREATE TABLE ca_file (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Caption VARCHAR(256)
        ,Encrypt INT
        ,SHA256 TEXT
        ,Size BIGINT
        ,Bind BIGINT
        ,BindType INT
        ,State INT
        ,Folder BIGINT
        ,FileType INT
        ,JSON TEXT);

   END IF;
END $$;


-- [ca_file.Caption] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_file' AND column_name='Caption'));

    IF condition THEN
        RAISE NOTICE 'Caption exists.';
    ELSE
        ALTER TABLE ca_file ADD Caption VARCHAR(256);
    END IF;
END $$;

-- [ca_file.Encrypt] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_file' AND column_name='Encrypt'));

    IF condition THEN
        RAISE NOTICE 'Encrypt exists.';
    ELSE
        ALTER TABLE ca_file ADD Encrypt INT;
    END IF;
END $$;

-- [ca_file.SHA256] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_file' AND column_name='SHA256'));

    IF condition THEN
        RAISE NOTICE 'SHA256 exists.';
    ELSE
        ALTER TABLE ca_file ADD SHA256 TEXT;
    END IF;
END $$;

-- [ca_file.Size] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_file' AND column_name='Size'));

    IF condition THEN
        RAISE NOTICE 'Size exists.';
    ELSE
        ALTER TABLE ca_file ADD Size BIGINT;
    END IF;
END $$;

-- [ca_file.Bind] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_file' AND column_name='Bind'));

    IF condition THEN
        RAISE NOTICE 'Bind exists.';
    ELSE
        ALTER TABLE ca_file ADD Bind BIGINT;
    END IF;
END $$;

-- [ca_file.BindType] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_file' AND column_name='BindType'));

    IF condition THEN
        RAISE NOTICE 'BindType exists.';
    ELSE
        ALTER TABLE ca_file ADD BindType INT;
    END IF;
END $$;

-- [ca_file.State] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_file' AND column_name='State'));

    IF condition THEN
        RAISE NOTICE 'State exists.';
    ELSE
        ALTER TABLE ca_file ADD State INT;
    END IF;
END $$;

-- [ca_file.Folder] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_file' AND column_name='Folder'));

    IF condition THEN
        RAISE NOTICE 'Folder exists.';
    ELSE
        ALTER TABLE ca_file ADD Folder BIGINT;
    END IF;
END $$;

-- [ca_file.FileType] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_file' AND column_name='FileType'));

    IF condition THEN
        RAISE NOTICE 'FileType exists.';
    ELSE
        ALTER TABLE ca_file ADD FileType INT;
    END IF;
END $$;

-- [ca_file.JSON] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_file' AND column_name='JSON'));

    IF condition THEN
        RAISE NOTICE 'JSON exists.';
    ELSE
        ALTER TABLE ca_file ADD JSON TEXT;
    END IF;
END $$;
-- [ca_folder] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'ca_folder'));

    IF condition THEN
        RAISE NOTICE 'ca_folder exists.';
    ELSE

    CREATE TABLE ca_folder (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Caption VARCHAR(256)
        ,Encrypt INT
        ,Bind BIGINT
        ,BindType INT
        ,Parent BIGINT);

   END IF;
END $$;


-- [ca_folder.Caption] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_folder' AND column_name='Caption'));

    IF condition THEN
        RAISE NOTICE 'Caption exists.';
    ELSE
        ALTER TABLE ca_folder ADD Caption VARCHAR(256);
    END IF;
END $$;

-- [ca_folder.Encrypt] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_folder' AND column_name='Encrypt'));

    IF condition THEN
        RAISE NOTICE 'Encrypt exists.';
    ELSE
        ALTER TABLE ca_folder ADD Encrypt INT;
    END IF;
END $$;

-- [ca_folder.Bind] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_folder' AND column_name='Bind'));

    IF condition THEN
        RAISE NOTICE 'Bind exists.';
    ELSE
        ALTER TABLE ca_folder ADD Bind BIGINT;
    END IF;
END $$;

-- [ca_folder.BindType] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_folder' AND column_name='BindType'));

    IF condition THEN
        RAISE NOTICE 'BindType exists.';
    ELSE
        ALTER TABLE ca_folder ADD BindType INT;
    END IF;
END $$;

-- [ca_folder.Parent] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_folder' AND column_name='Parent'));

    IF condition THEN
        RAISE NOTICE 'Parent exists.';
    ELSE
        ALTER TABLE ca_folder ADD Parent BIGINT;
    END IF;
END $$;
-- [ca_lang] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'ca_lang'));

    IF condition THEN
        RAISE NOTICE 'ca_lang exists.';
    ELSE

    CREATE TABLE ca_lang (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Code2 VARCHAR(2)
        ,Caption VARCHAR(64)
        ,Native VARCHAR(64)
        ,Icon VARCHAR(256)
        ,IsBlank BIT
        ,IsLocale BIT
        ,IsContent BIT
        ,IsAutoTranslate BIT
        ,IsMiles BIT
        ,TextDirection INT);

   END IF;
END $$;


-- [ca_lang.Code2] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_lang' AND column_name='Code2'));

    IF condition THEN
        RAISE NOTICE 'Code2 exists.';
    ELSE
        ALTER TABLE ca_lang ADD Code2 VARCHAR(2);
    END IF;
END $$;

-- [ca_lang.Caption] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_lang' AND column_name='Caption'));

    IF condition THEN
        RAISE NOTICE 'Caption exists.';
    ELSE
        ALTER TABLE ca_lang ADD Caption VARCHAR(64);
    END IF;
END $$;

-- [ca_lang.Native] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_lang' AND column_name='Native'));

    IF condition THEN
        RAISE NOTICE 'Native exists.';
    ELSE
        ALTER TABLE ca_lang ADD Native VARCHAR(64);
    END IF;
END $$;

-- [ca_lang.Icon] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_lang' AND column_name='Icon'));

    IF condition THEN
        RAISE NOTICE 'Icon exists.';
    ELSE
        ALTER TABLE ca_lang ADD Icon VARCHAR(256);
    END IF;
END $$;

-- [ca_lang.IsBlank] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_lang' AND column_name='IsBlank'));

    IF condition THEN
        RAISE NOTICE 'IsBlank exists.';
    ELSE
        ALTER TABLE ca_lang ADD IsBlank BIT;
    END IF;
END $$;

-- [ca_lang.IsLocale] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_lang' AND column_name='IsLocale'));

    IF condition THEN
        RAISE NOTICE 'IsLocale exists.';
    ELSE
        ALTER TABLE ca_lang ADD IsLocale BIT;
    END IF;
END $$;

-- [ca_lang.IsContent] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_lang' AND column_name='IsContent'));

    IF condition THEN
        RAISE NOTICE 'IsContent exists.';
    ELSE
        ALTER TABLE ca_lang ADD IsContent BIT;
    END IF;
END $$;

-- [ca_lang.IsAutoTranslate] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_lang' AND column_name='IsAutoTranslate'));

    IF condition THEN
        RAISE NOTICE 'IsAutoTranslate exists.';
    ELSE
        ALTER TABLE ca_lang ADD IsAutoTranslate BIT;
    END IF;
END $$;

-- [ca_lang.IsMiles] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_lang' AND column_name='IsMiles'));

    IF condition THEN
        RAISE NOTICE 'IsMiles exists.';
    ELSE
        ALTER TABLE ca_lang ADD IsMiles BIT;
    END IF;
END $$;

-- [ca_lang.TextDirection] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_lang' AND column_name='TextDirection'));

    IF condition THEN
        RAISE NOTICE 'TextDirection exists.';
    ELSE
        ALTER TABLE ca_lang ADD TextDirection INT;
    END IF;
END $$;
-- [ca_locale] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'ca_locale'));

    IF condition THEN
        RAISE NOTICE 'ca_locale exists.';
    ELSE

    CREATE TABLE ca_locale (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Code VARCHAR(64)
        ,Lang BIGINT
        ,Zh TEXT
        ,Text TEXT);

   END IF;
END $$;


-- [ca_locale.Code] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_locale' AND column_name='Code'));

    IF condition THEN
        RAISE NOTICE 'Code exists.';
    ELSE
        ALTER TABLE ca_locale ADD Code VARCHAR(64);
    END IF;
END $$;

-- [ca_locale.Lang] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_locale' AND column_name='Lang'));

    IF condition THEN
        RAISE NOTICE 'Lang exists.';
    ELSE
        ALTER TABLE ca_locale ADD Lang BIGINT;
    END IF;
END $$;

-- [ca_locale.Zh] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_locale' AND column_name='Zh'));

    IF condition THEN
        RAISE NOTICE 'Zh exists.';
    ELSE
        ALTER TABLE ca_locale ADD Zh TEXT;
    END IF;
END $$;

-- [ca_locale.Text] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_locale' AND column_name='Text'));

    IF condition THEN
        RAISE NOTICE 'Text exists.';
    ELSE
        ALTER TABLE ca_locale ADD Text TEXT;
    END IF;
END $$;
-- [ca_specialitem] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'ca_specialitem'));

    IF condition THEN
        RAISE NOTICE 'ca_specialitem exists.';
    ELSE

    CREATE TABLE ca_specialitem (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Type INT
        ,Lang BIGINT
        ,Bind BIGINT);

   END IF;
END $$;


-- [ca_specialitem.Type] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_specialitem' AND column_name='Type'));

    IF condition THEN
        RAISE NOTICE 'Type exists.';
    ELSE
        ALTER TABLE ca_specialitem ADD Type INT;
    END IF;
END $$;

-- [ca_specialitem.Lang] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_specialitem' AND column_name='Lang'));

    IF condition THEN
        RAISE NOTICE 'Lang exists.';
    ELSE
        ALTER TABLE ca_specialitem ADD Lang BIGINT;
    END IF;
END $$;

-- [ca_specialitem.Bind] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_specialitem' AND column_name='Bind'));

    IF condition THEN
        RAISE NOTICE 'Bind exists.';
    ELSE
        ALTER TABLE ca_specialitem ADD Bind BIGINT;
    END IF;
END $$;
-- [ca_webcredential] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'ca_webcredential'));

    IF condition THEN
        RAISE NOTICE 'ca_webcredential exists.';
    ELSE

    CREATE TABLE ca_webcredential (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Caption VARCHAR(64)
        ,ExternalId BIGINT
        ,Icon VARCHAR(256)
        ,EU BIGINT
        ,Biz BIGINT
        ,Json TEXT);

   END IF;
END $$;


-- [ca_webcredential.Caption] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_webcredential' AND column_name='Caption'));

    IF condition THEN
        RAISE NOTICE 'Caption exists.';
    ELSE
        ALTER TABLE ca_webcredential ADD Caption VARCHAR(64);
    END IF;
END $$;

-- [ca_webcredential.ExternalId] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_webcredential' AND column_name='ExternalId'));

    IF condition THEN
        RAISE NOTICE 'ExternalId exists.';
    ELSE
        ALTER TABLE ca_webcredential ADD ExternalId BIGINT;
    END IF;
END $$;

-- [ca_webcredential.Icon] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_webcredential' AND column_name='Icon'));

    IF condition THEN
        RAISE NOTICE 'Icon exists.';
    ELSE
        ALTER TABLE ca_webcredential ADD Icon VARCHAR(256);
    END IF;
END $$;

-- [ca_webcredential.EU] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_webcredential' AND column_name='EU'));

    IF condition THEN
        RAISE NOTICE 'EU exists.';
    ELSE
        ALTER TABLE ca_webcredential ADD EU BIGINT;
    END IF;
END $$;

-- [ca_webcredential.Biz] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_webcredential' AND column_name='Biz'));

    IF condition THEN
        RAISE NOTICE 'Biz exists.';
    ELSE
        ALTER TABLE ca_webcredential ADD Biz BIGINT;
    END IF;
END $$;

-- [ca_webcredential.Json] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='ca_webcredential' AND column_name='Json'));

    IF condition THEN
        RAISE NOTICE 'Json exists.';
    ELSE
        ALTER TABLE ca_webcredential ADD Json TEXT;
    END IF;
END $$;
-- [market_instrument] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'market_instrument'));

    IF condition THEN
        RAISE NOTICE 'market_instrument exists.';
    ELSE

    CREATE TABLE market_instrument (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,DescTxt TEXT
        ,Code VARCHAR(64)
        ,Caption VARCHAR(64)
        ,Long BIGINT
        ,LongCode VARCHAR(16)
        ,Short BIGINT
        ,ShortCode VARCHAR(16));

   END IF;
END $$;


-- [market_instrument.DescTxt] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_instrument' AND column_name='DescTxt'));

    IF condition THEN
        RAISE NOTICE 'DescTxt exists.';
    ELSE
        ALTER TABLE market_instrument ADD DescTxt TEXT;
    END IF;
END $$;

-- [market_instrument.Code] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_instrument' AND column_name='Code'));

    IF condition THEN
        RAISE NOTICE 'Code exists.';
    ELSE
        ALTER TABLE market_instrument ADD Code VARCHAR(64);
    END IF;
END $$;

-- [market_instrument.Caption] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_instrument' AND column_name='Caption'));

    IF condition THEN
        RAISE NOTICE 'Caption exists.';
    ELSE
        ALTER TABLE market_instrument ADD Caption VARCHAR(64);
    END IF;
END $$;

-- [market_instrument.Long] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_instrument' AND column_name='Long'));

    IF condition THEN
        RAISE NOTICE 'Long exists.';
    ELSE
        ALTER TABLE market_instrument ADD Long BIGINT;
    END IF;
END $$;

-- [market_instrument.LongCode] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_instrument' AND column_name='LongCode'));

    IF condition THEN
        RAISE NOTICE 'LongCode exists.';
    ELSE
        ALTER TABLE market_instrument ADD LongCode VARCHAR(16);
    END IF;
END $$;

-- [market_instrument.Short] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_instrument' AND column_name='Short'));

    IF condition THEN
        RAISE NOTICE 'Short exists.';
    ELSE
        ALTER TABLE market_instrument ADD Short BIGINT;
    END IF;
END $$;

-- [market_instrument.ShortCode] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_instrument' AND column_name='ShortCode'));

    IF condition THEN
        RAISE NOTICE 'ShortCode exists.';
    ELSE
        ALTER TABLE market_instrument ADD ShortCode VARCHAR(16);
    END IF;
END $$;
-- [market_ticket] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'market_ticket'));

    IF condition THEN
        RAISE NOTICE 'market_ticket exists.';
    ELSE

    CREATE TABLE market_ticket (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,EndUser BIGINT
        ,TradeAcct BIGINT
        ,Ins BIGINT
        ,Code VARCHAR(64)
        ,Caption VARCHAR(64)
        ,TradeMode INT
        ,Lot BIGINT
        ,PriceOpened BIGINT
        ,PriceOpen BIGINT
        ,PriceSL BIGINT
        ,PriceTP BIGINT
        ,PriceClose BIGINT
        ,Status INT
        ,CP BIGINT
        ,CptAcct BIGINT
        ,Ref BIGINT
        ,OpenRef BIGINT
        ,CloseRef BIGINT
        ,Origin BIGINT
        ,PnL FLOAT
        ,PnLSpread FLOAT
        ,Margin FLOAT
        ,RO FLOAT
        ,Tax FLOAT
        ,CloseType INT
        ,CommitType INT
        ,Cmt VARCHAR(64)
        ,Opendat BIGINT
        ,Closedat BIGINT
        ,CaStrategyAmt FLOAT
        ,CaRo BIT
        ,CaAsa BIT
        ,CaCmphsvCharge FLOAT
        ,RoCheckedat BIGINT
        ,Expiry BIGINT
        ,HedgetCP BIGINT
        ,PendingPrice BIGINT
        ,ClosedLot BIGINT
        ,ClosedAmt FLOAT
        ,PendingAmt FLOAT
        ,DrvPreminum FLOAT
        ,DrvExpiry BIGINT
        ,DrvPeriod BIGINT
        ,DrvDirection INT
        ,DrvPrice FLOAT
        ,DoubleCp BIGINT
        ,ClearStatus INT
        ,FollowTicket BIGINT
        ,Config TEXT
        ,OptionStatus INT
        ,NotionalPrincipal FLOAT
        ,ExercisedPrincipal FLOAT
        ,ExerciseMode FLOAT
        ,ExercisePrice FLOAT
        ,ExternalTicketOpen BIGINT
        ,ExternalTicketClose BIGINT
        ,ExternalTicketPending BIGINT
        ,ExternalTicketCancel BIGINT
        ,DescTxt TEXT);

   END IF;
END $$;


-- [market_ticket.EndUser] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='EndUser'));

    IF condition THEN
        RAISE NOTICE 'EndUser exists.';
    ELSE
        ALTER TABLE market_ticket ADD EndUser BIGINT;
    END IF;
END $$;

-- [market_ticket.TradeAcct] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='TradeAcct'));

    IF condition THEN
        RAISE NOTICE 'TradeAcct exists.';
    ELSE
        ALTER TABLE market_ticket ADD TradeAcct BIGINT;
    END IF;
END $$;

-- [market_ticket.Ins] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='Ins'));

    IF condition THEN
        RAISE NOTICE 'Ins exists.';
    ELSE
        ALTER TABLE market_ticket ADD Ins BIGINT;
    END IF;
END $$;

-- [market_ticket.Code] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='Code'));

    IF condition THEN
        RAISE NOTICE 'Code exists.';
    ELSE
        ALTER TABLE market_ticket ADD Code VARCHAR(64);
    END IF;
END $$;

-- [market_ticket.Caption] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='Caption'));

    IF condition THEN
        RAISE NOTICE 'Caption exists.';
    ELSE
        ALTER TABLE market_ticket ADD Caption VARCHAR(64);
    END IF;
END $$;

-- [market_ticket.TradeMode] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='TradeMode'));

    IF condition THEN
        RAISE NOTICE 'TradeMode exists.';
    ELSE
        ALTER TABLE market_ticket ADD TradeMode INT;
    END IF;
END $$;

-- [market_ticket.Lot] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='Lot'));

    IF condition THEN
        RAISE NOTICE 'Lot exists.';
    ELSE
        ALTER TABLE market_ticket ADD Lot BIGINT;
    END IF;
END $$;

-- [market_ticket.PriceOpened] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='PriceOpened'));

    IF condition THEN
        RAISE NOTICE 'PriceOpened exists.';
    ELSE
        ALTER TABLE market_ticket ADD PriceOpened BIGINT;
    END IF;
END $$;

-- [market_ticket.PriceOpen] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='PriceOpen'));

    IF condition THEN
        RAISE NOTICE 'PriceOpen exists.';
    ELSE
        ALTER TABLE market_ticket ADD PriceOpen BIGINT;
    END IF;
END $$;

-- [market_ticket.PriceSL] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='PriceSL'));

    IF condition THEN
        RAISE NOTICE 'PriceSL exists.';
    ELSE
        ALTER TABLE market_ticket ADD PriceSL BIGINT;
    END IF;
END $$;

-- [market_ticket.PriceTP] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='PriceTP'));

    IF condition THEN
        RAISE NOTICE 'PriceTP exists.';
    ELSE
        ALTER TABLE market_ticket ADD PriceTP BIGINT;
    END IF;
END $$;

-- [market_ticket.PriceClose] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='PriceClose'));

    IF condition THEN
        RAISE NOTICE 'PriceClose exists.';
    ELSE
        ALTER TABLE market_ticket ADD PriceClose BIGINT;
    END IF;
END $$;

-- [market_ticket.Status] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='Status'));

    IF condition THEN
        RAISE NOTICE 'Status exists.';
    ELSE
        ALTER TABLE market_ticket ADD Status INT;
    END IF;
END $$;

-- [market_ticket.CP] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='CP'));

    IF condition THEN
        RAISE NOTICE 'CP exists.';
    ELSE
        ALTER TABLE market_ticket ADD CP BIGINT;
    END IF;
END $$;

-- [market_ticket.CptAcct] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='CptAcct'));

    IF condition THEN
        RAISE NOTICE 'CptAcct exists.';
    ELSE
        ALTER TABLE market_ticket ADD CptAcct BIGINT;
    END IF;
END $$;

-- [market_ticket.Ref] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='Ref'));

    IF condition THEN
        RAISE NOTICE 'Ref exists.';
    ELSE
        ALTER TABLE market_ticket ADD Ref BIGINT;
    END IF;
END $$;

-- [market_ticket.OpenRef] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='OpenRef'));

    IF condition THEN
        RAISE NOTICE 'OpenRef exists.';
    ELSE
        ALTER TABLE market_ticket ADD OpenRef BIGINT;
    END IF;
END $$;

-- [market_ticket.CloseRef] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='CloseRef'));

    IF condition THEN
        RAISE NOTICE 'CloseRef exists.';
    ELSE
        ALTER TABLE market_ticket ADD CloseRef BIGINT;
    END IF;
END $$;

-- [market_ticket.Origin] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='Origin'));

    IF condition THEN
        RAISE NOTICE 'Origin exists.';
    ELSE
        ALTER TABLE market_ticket ADD Origin BIGINT;
    END IF;
END $$;

-- [market_ticket.PnL] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='PnL'));

    IF condition THEN
        RAISE NOTICE 'PnL exists.';
    ELSE
        ALTER TABLE market_ticket ADD PnL FLOAT;
    END IF;
END $$;

-- [market_ticket.PnLSpread] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='PnLSpread'));

    IF condition THEN
        RAISE NOTICE 'PnLSpread exists.';
    ELSE
        ALTER TABLE market_ticket ADD PnLSpread FLOAT;
    END IF;
END $$;

-- [market_ticket.Margin] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='Margin'));

    IF condition THEN
        RAISE NOTICE 'Margin exists.';
    ELSE
        ALTER TABLE market_ticket ADD Margin FLOAT;
    END IF;
END $$;

-- [market_ticket.RO] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='RO'));

    IF condition THEN
        RAISE NOTICE 'RO exists.';
    ELSE
        ALTER TABLE market_ticket ADD RO FLOAT;
    END IF;
END $$;

-- [market_ticket.Tax] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='Tax'));

    IF condition THEN
        RAISE NOTICE 'Tax exists.';
    ELSE
        ALTER TABLE market_ticket ADD Tax FLOAT;
    END IF;
END $$;

-- [market_ticket.CloseType] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='CloseType'));

    IF condition THEN
        RAISE NOTICE 'CloseType exists.';
    ELSE
        ALTER TABLE market_ticket ADD CloseType INT;
    END IF;
END $$;

-- [market_ticket.CommitType] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='CommitType'));

    IF condition THEN
        RAISE NOTICE 'CommitType exists.';
    ELSE
        ALTER TABLE market_ticket ADD CommitType INT;
    END IF;
END $$;

-- [market_ticket.Cmt] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='Cmt'));

    IF condition THEN
        RAISE NOTICE 'Cmt exists.';
    ELSE
        ALTER TABLE market_ticket ADD Cmt VARCHAR(64);
    END IF;
END $$;

-- [market_ticket.Opendat] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='Opendat'));

    IF condition THEN
        RAISE NOTICE 'Opendat exists.';
    ELSE
        ALTER TABLE market_ticket ADD Opendat BIGINT;
    END IF;
END $$;

-- [market_ticket.Closedat] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='Closedat'));

    IF condition THEN
        RAISE NOTICE 'Closedat exists.';
    ELSE
        ALTER TABLE market_ticket ADD Closedat BIGINT;
    END IF;
END $$;

-- [market_ticket.CaStrategyAmt] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='CaStrategyAmt'));

    IF condition THEN
        RAISE NOTICE 'CaStrategyAmt exists.';
    ELSE
        ALTER TABLE market_ticket ADD CaStrategyAmt FLOAT;
    END IF;
END $$;

-- [market_ticket.CaRo] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='CaRo'));

    IF condition THEN
        RAISE NOTICE 'CaRo exists.';
    ELSE
        ALTER TABLE market_ticket ADD CaRo BIT;
    END IF;
END $$;

-- [market_ticket.CaAsa] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='CaAsa'));

    IF condition THEN
        RAISE NOTICE 'CaAsa exists.';
    ELSE
        ALTER TABLE market_ticket ADD CaAsa BIT;
    END IF;
END $$;

-- [market_ticket.CaCmphsvCharge] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='CaCmphsvCharge'));

    IF condition THEN
        RAISE NOTICE 'CaCmphsvCharge exists.';
    ELSE
        ALTER TABLE market_ticket ADD CaCmphsvCharge FLOAT;
    END IF;
END $$;

-- [market_ticket.RoCheckedat] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='RoCheckedat'));

    IF condition THEN
        RAISE NOTICE 'RoCheckedat exists.';
    ELSE
        ALTER TABLE market_ticket ADD RoCheckedat BIGINT;
    END IF;
END $$;

-- [market_ticket.Expiry] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='Expiry'));

    IF condition THEN
        RAISE NOTICE 'Expiry exists.';
    ELSE
        ALTER TABLE market_ticket ADD Expiry BIGINT;
    END IF;
END $$;

-- [market_ticket.HedgetCP] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='HedgetCP'));

    IF condition THEN
        RAISE NOTICE 'HedgetCP exists.';
    ELSE
        ALTER TABLE market_ticket ADD HedgetCP BIGINT;
    END IF;
END $$;

-- [market_ticket.PendingPrice] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='PendingPrice'));

    IF condition THEN
        RAISE NOTICE 'PendingPrice exists.';
    ELSE
        ALTER TABLE market_ticket ADD PendingPrice BIGINT;
    END IF;
END $$;

-- [market_ticket.ClosedLot] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='ClosedLot'));

    IF condition THEN
        RAISE NOTICE 'ClosedLot exists.';
    ELSE
        ALTER TABLE market_ticket ADD ClosedLot BIGINT;
    END IF;
END $$;

-- [market_ticket.ClosedAmt] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='ClosedAmt'));

    IF condition THEN
        RAISE NOTICE 'ClosedAmt exists.';
    ELSE
        ALTER TABLE market_ticket ADD ClosedAmt FLOAT;
    END IF;
END $$;

-- [market_ticket.PendingAmt] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='PendingAmt'));

    IF condition THEN
        RAISE NOTICE 'PendingAmt exists.';
    ELSE
        ALTER TABLE market_ticket ADD PendingAmt FLOAT;
    END IF;
END $$;

-- [market_ticket.DrvPreminum] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='DrvPreminum'));

    IF condition THEN
        RAISE NOTICE 'DrvPreminum exists.';
    ELSE
        ALTER TABLE market_ticket ADD DrvPreminum FLOAT;
    END IF;
END $$;

-- [market_ticket.DrvExpiry] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='DrvExpiry'));

    IF condition THEN
        RAISE NOTICE 'DrvExpiry exists.';
    ELSE
        ALTER TABLE market_ticket ADD DrvExpiry BIGINT;
    END IF;
END $$;

-- [market_ticket.DrvPeriod] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='DrvPeriod'));

    IF condition THEN
        RAISE NOTICE 'DrvPeriod exists.';
    ELSE
        ALTER TABLE market_ticket ADD DrvPeriod BIGINT;
    END IF;
END $$;

-- [market_ticket.DrvDirection] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='DrvDirection'));

    IF condition THEN
        RAISE NOTICE 'DrvDirection exists.';
    ELSE
        ALTER TABLE market_ticket ADD DrvDirection INT;
    END IF;
END $$;

-- [market_ticket.DrvPrice] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='DrvPrice'));

    IF condition THEN
        RAISE NOTICE 'DrvPrice exists.';
    ELSE
        ALTER TABLE market_ticket ADD DrvPrice FLOAT;
    END IF;
END $$;

-- [market_ticket.DoubleCp] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='DoubleCp'));

    IF condition THEN
        RAISE NOTICE 'DoubleCp exists.';
    ELSE
        ALTER TABLE market_ticket ADD DoubleCp BIGINT;
    END IF;
END $$;

-- [market_ticket.ClearStatus] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='ClearStatus'));

    IF condition THEN
        RAISE NOTICE 'ClearStatus exists.';
    ELSE
        ALTER TABLE market_ticket ADD ClearStatus INT;
    END IF;
END $$;

-- [market_ticket.FollowTicket] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='FollowTicket'));

    IF condition THEN
        RAISE NOTICE 'FollowTicket exists.';
    ELSE
        ALTER TABLE market_ticket ADD FollowTicket BIGINT;
    END IF;
END $$;

-- [market_ticket.Config] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='Config'));

    IF condition THEN
        RAISE NOTICE 'Config exists.';
    ELSE
        ALTER TABLE market_ticket ADD Config TEXT;
    END IF;
END $$;

-- [market_ticket.OptionStatus] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='OptionStatus'));

    IF condition THEN
        RAISE NOTICE 'OptionStatus exists.';
    ELSE
        ALTER TABLE market_ticket ADD OptionStatus INT;
    END IF;
END $$;

-- [market_ticket.NotionalPrincipal] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='NotionalPrincipal'));

    IF condition THEN
        RAISE NOTICE 'NotionalPrincipal exists.';
    ELSE
        ALTER TABLE market_ticket ADD NotionalPrincipal FLOAT;
    END IF;
END $$;

-- [market_ticket.ExercisedPrincipal] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='ExercisedPrincipal'));

    IF condition THEN
        RAISE NOTICE 'ExercisedPrincipal exists.';
    ELSE
        ALTER TABLE market_ticket ADD ExercisedPrincipal FLOAT;
    END IF;
END $$;

-- [market_ticket.ExerciseMode] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='ExerciseMode'));

    IF condition THEN
        RAISE NOTICE 'ExerciseMode exists.';
    ELSE
        ALTER TABLE market_ticket ADD ExerciseMode FLOAT;
    END IF;
END $$;

-- [market_ticket.ExercisePrice] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='ExercisePrice'));

    IF condition THEN
        RAISE NOTICE 'ExercisePrice exists.';
    ELSE
        ALTER TABLE market_ticket ADD ExercisePrice FLOAT;
    END IF;
END $$;

-- [market_ticket.ExternalTicketOpen] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='ExternalTicketOpen'));

    IF condition THEN
        RAISE NOTICE 'ExternalTicketOpen exists.';
    ELSE
        ALTER TABLE market_ticket ADD ExternalTicketOpen BIGINT;
    END IF;
END $$;

-- [market_ticket.ExternalTicketClose] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='ExternalTicketClose'));

    IF condition THEN
        RAISE NOTICE 'ExternalTicketClose exists.';
    ELSE
        ALTER TABLE market_ticket ADD ExternalTicketClose BIGINT;
    END IF;
END $$;

-- [market_ticket.ExternalTicketPending] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='ExternalTicketPending'));

    IF condition THEN
        RAISE NOTICE 'ExternalTicketPending exists.';
    ELSE
        ALTER TABLE market_ticket ADD ExternalTicketPending BIGINT;
    END IF;
END $$;

-- [market_ticket.ExternalTicketCancel] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='ExternalTicketCancel'));

    IF condition THEN
        RAISE NOTICE 'ExternalTicketCancel exists.';
    ELSE
        ALTER TABLE market_ticket ADD ExternalTicketCancel BIGINT;
    END IF;
END $$;

-- [market_ticket.DescTxt] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_ticket' AND column_name='DescTxt'));

    IF condition THEN
        RAISE NOTICE 'DescTxt exists.';
    ELSE
        ALTER TABLE market_ticket ADD DescTxt TEXT;
    END IF;
END $$;
-- [market_tradeacct] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'market_tradeacct'));

    IF condition THEN
        RAISE NOTICE 'market_tradeacct exists.';
    ELSE

    CREATE TABLE market_tradeacct (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,SAC BIGINT
        ,State INT
        ,TradeType INT
        ,RealDemo INT
        ,PnL FLOAT
        ,Frozen FLOAT
        ,Leverage FLOAT
        ,Margin FLOAT
        ,MarginCallRateWarning FLOAT
        ,MarginCallRateWarningII FLOAT
        ,MarginCallRateLiq FLOAT
        ,PwdTrade VARCHAR(64)
        ,PwdReadonly VARCHAR(64)
        ,DescTxt TEXT);

   END IF;
END $$;


-- [market_tradeacct.SAC] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_tradeacct' AND column_name='SAC'));

    IF condition THEN
        RAISE NOTICE 'SAC exists.';
    ELSE
        ALTER TABLE market_tradeacct ADD SAC BIGINT;
    END IF;
END $$;

-- [market_tradeacct.State] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_tradeacct' AND column_name='State'));

    IF condition THEN
        RAISE NOTICE 'State exists.';
    ELSE
        ALTER TABLE market_tradeacct ADD State INT;
    END IF;
END $$;

-- [market_tradeacct.TradeType] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_tradeacct' AND column_name='TradeType'));

    IF condition THEN
        RAISE NOTICE 'TradeType exists.';
    ELSE
        ALTER TABLE market_tradeacct ADD TradeType INT;
    END IF;
END $$;

-- [market_tradeacct.RealDemo] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_tradeacct' AND column_name='RealDemo'));

    IF condition THEN
        RAISE NOTICE 'RealDemo exists.';
    ELSE
        ALTER TABLE market_tradeacct ADD RealDemo INT;
    END IF;
END $$;

-- [market_tradeacct.PnL] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_tradeacct' AND column_name='PnL'));

    IF condition THEN
        RAISE NOTICE 'PnL exists.';
    ELSE
        ALTER TABLE market_tradeacct ADD PnL FLOAT;
    END IF;
END $$;

-- [market_tradeacct.Frozen] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_tradeacct' AND column_name='Frozen'));

    IF condition THEN
        RAISE NOTICE 'Frozen exists.';
    ELSE
        ALTER TABLE market_tradeacct ADD Frozen FLOAT;
    END IF;
END $$;

-- [market_tradeacct.Leverage] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_tradeacct' AND column_name='Leverage'));

    IF condition THEN
        RAISE NOTICE 'Leverage exists.';
    ELSE
        ALTER TABLE market_tradeacct ADD Leverage FLOAT;
    END IF;
END $$;

-- [market_tradeacct.Margin] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_tradeacct' AND column_name='Margin'));

    IF condition THEN
        RAISE NOTICE 'Margin exists.';
    ELSE
        ALTER TABLE market_tradeacct ADD Margin FLOAT;
    END IF;
END $$;

-- [market_tradeacct.MarginCallRateWarning] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_tradeacct' AND column_name='MarginCallRateWarning'));

    IF condition THEN
        RAISE NOTICE 'MarginCallRateWarning exists.';
    ELSE
        ALTER TABLE market_tradeacct ADD MarginCallRateWarning FLOAT;
    END IF;
END $$;

-- [market_tradeacct.MarginCallRateWarningII] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_tradeacct' AND column_name='MarginCallRateWarningII'));

    IF condition THEN
        RAISE NOTICE 'MarginCallRateWarningII exists.';
    ELSE
        ALTER TABLE market_tradeacct ADD MarginCallRateWarningII FLOAT;
    END IF;
END $$;

-- [market_tradeacct.MarginCallRateLiq] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_tradeacct' AND column_name='MarginCallRateLiq'));

    IF condition THEN
        RAISE NOTICE 'MarginCallRateLiq exists.';
    ELSE
        ALTER TABLE market_tradeacct ADD MarginCallRateLiq FLOAT;
    END IF;
END $$;

-- [market_tradeacct.PwdTrade] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_tradeacct' AND column_name='PwdTrade'));

    IF condition THEN
        RAISE NOTICE 'PwdTrade exists.';
    ELSE
        ALTER TABLE market_tradeacct ADD PwdTrade VARCHAR(64);
    END IF;
END $$;

-- [market_tradeacct.PwdReadonly] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_tradeacct' AND column_name='PwdReadonly'));

    IF condition THEN
        RAISE NOTICE 'PwdReadonly exists.';
    ELSE
        ALTER TABLE market_tradeacct ADD PwdReadonly VARCHAR(64);
    END IF;
END $$;

-- [market_tradeacct.DescTxt] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='market_tradeacct' AND column_name='DescTxt'));

    IF condition THEN
        RAISE NOTICE 'DescTxt exists.';
    ELSE
        ALTER TABLE market_tradeacct ADD DescTxt TEXT;
    END IF;
END $$;
-- [social_bookmark] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'social_bookmark'));

    IF condition THEN
        RAISE NOTICE 'social_bookmark exists.';
    ELSE

    CREATE TABLE social_bookmark (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Agent BIGINT
        ,EndUser BIGINT
        ,Bind BIGINT
        ,BindType INT
        ,BookmarkList BIGINT
        ,Notes TEXT
        ,Path TEXT
        ,UserGroup VARCHAR(64)
        ,Type BIGINT);

   END IF;
END $$;


-- [social_bookmark.Agent] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_bookmark' AND column_name='Agent'));

    IF condition THEN
        RAISE NOTICE 'Agent exists.';
    ELSE
        ALTER TABLE social_bookmark ADD Agent BIGINT;
    END IF;
END $$;

-- [social_bookmark.EndUser] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_bookmark' AND column_name='EndUser'));

    IF condition THEN
        RAISE NOTICE 'EndUser exists.';
    ELSE
        ALTER TABLE social_bookmark ADD EndUser BIGINT;
    END IF;
END $$;

-- [social_bookmark.Bind] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_bookmark' AND column_name='Bind'));

    IF condition THEN
        RAISE NOTICE 'Bind exists.';
    ELSE
        ALTER TABLE social_bookmark ADD Bind BIGINT;
    END IF;
END $$;

-- [social_bookmark.BindType] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_bookmark' AND column_name='BindType'));

    IF condition THEN
        RAISE NOTICE 'BindType exists.';
    ELSE
        ALTER TABLE social_bookmark ADD BindType INT;
    END IF;
END $$;

-- [social_bookmark.BookmarkList] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_bookmark' AND column_name='BookmarkList'));

    IF condition THEN
        RAISE NOTICE 'BookmarkList exists.';
    ELSE
        ALTER TABLE social_bookmark ADD BookmarkList BIGINT;
    END IF;
END $$;

-- [social_bookmark.Notes] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_bookmark' AND column_name='Notes'));

    IF condition THEN
        RAISE NOTICE 'Notes exists.';
    ELSE
        ALTER TABLE social_bookmark ADD Notes TEXT;
    END IF;
END $$;

-- [social_bookmark.Path] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_bookmark' AND column_name='Path'));

    IF condition THEN
        RAISE NOTICE 'Path exists.';
    ELSE
        ALTER TABLE social_bookmark ADD Path TEXT;
    END IF;
END $$;

-- [social_bookmark.UserGroup] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_bookmark' AND column_name='UserGroup'));

    IF condition THEN
        RAISE NOTICE 'UserGroup exists.';
    ELSE
        ALTER TABLE social_bookmark ADD UserGroup VARCHAR(64);
    END IF;
END $$;

-- [social_bookmark.Type] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_bookmark' AND column_name='Type'));

    IF condition THEN
        RAISE NOTICE 'Type exists.';
    ELSE
        ALTER TABLE social_bookmark ADD Type BIGINT;
    END IF;
END $$;
-- [social_bookmarklist] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'social_bookmarklist'));

    IF condition THEN
        RAISE NOTICE 'social_bookmarklist exists.';
    ELSE

    CREATE TABLE social_bookmarklist (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,EndUser BIGINT
        ,Caption VARCHAR(256)
        ,Icon VARCHAR(256)
        ,Background VARCHAR(256)
        ,DescTxt TEXT
        ,Privacy INT
        ,Moment BIGINT
        ,Type INT);

   END IF;
END $$;


-- [social_bookmarklist.EndUser] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_bookmarklist' AND column_name='EndUser'));

    IF condition THEN
        RAISE NOTICE 'EndUser exists.';
    ELSE
        ALTER TABLE social_bookmarklist ADD EndUser BIGINT;
    END IF;
END $$;

-- [social_bookmarklist.Caption] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_bookmarklist' AND column_name='Caption'));

    IF condition THEN
        RAISE NOTICE 'Caption exists.';
    ELSE
        ALTER TABLE social_bookmarklist ADD Caption VARCHAR(256);
    END IF;
END $$;

-- [social_bookmarklist.Icon] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_bookmarklist' AND column_name='Icon'));

    IF condition THEN
        RAISE NOTICE 'Icon exists.';
    ELSE
        ALTER TABLE social_bookmarklist ADD Icon VARCHAR(256);
    END IF;
END $$;

-- [social_bookmarklist.Background] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_bookmarklist' AND column_name='Background'));

    IF condition THEN
        RAISE NOTICE 'Background exists.';
    ELSE
        ALTER TABLE social_bookmarklist ADD Background VARCHAR(256);
    END IF;
END $$;

-- [social_bookmarklist.DescTxt] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_bookmarklist' AND column_name='DescTxt'));

    IF condition THEN
        RAISE NOTICE 'DescTxt exists.';
    ELSE
        ALTER TABLE social_bookmarklist ADD DescTxt TEXT;
    END IF;
END $$;

-- [social_bookmarklist.Privacy] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_bookmarklist' AND column_name='Privacy'));

    IF condition THEN
        RAISE NOTICE 'Privacy exists.';
    ELSE
        ALTER TABLE social_bookmarklist ADD Privacy INT;
    END IF;
END $$;

-- [social_bookmarklist.Moment] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_bookmarklist' AND column_name='Moment'));

    IF condition THEN
        RAISE NOTICE 'Moment exists.';
    ELSE
        ALTER TABLE social_bookmarklist ADD Moment BIGINT;
    END IF;
END $$;

-- [social_bookmarklist.Type] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_bookmarklist' AND column_name='Type'));

    IF condition THEN
        RAISE NOTICE 'Type exists.';
    ELSE
        ALTER TABLE social_bookmarklist ADD Type INT;
    END IF;
END $$;
-- [social_follow] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'social_follow'));

    IF condition THEN
        RAISE NOTICE 'social_follow exists.';
    ELSE

    CREATE TABLE social_follow (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,EndUser BIGINT
        ,Followee BIGINT
        ,FollowType INT);

   END IF;
END $$;


-- [social_follow.EndUser] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_follow' AND column_name='EndUser'));

    IF condition THEN
        RAISE NOTICE 'EndUser exists.';
    ELSE
        ALTER TABLE social_follow ADD EndUser BIGINT;
    END IF;
END $$;

-- [social_follow.Followee] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_follow' AND column_name='Followee'));

    IF condition THEN
        RAISE NOTICE 'Followee exists.';
    ELSE
        ALTER TABLE social_follow ADD Followee BIGINT;
    END IF;
END $$;

-- [social_follow.FollowType] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_follow' AND column_name='FollowType'));

    IF condition THEN
        RAISE NOTICE 'FollowType exists.';
    ELSE
        ALTER TABLE social_follow ADD FollowType INT;
    END IF;
END $$;
-- [social_moment] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'social_moment'));

    IF condition THEN
        RAISE NOTICE 'social_moment exists.';
    ELSE

    CREATE TABLE social_moment (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Agent BIGINT
        ,Bind BIGINT
        ,BindType INT
        ,BizCode VARCHAR(256)
        ,Lang BIGINT
        ,Title TEXT
        ,Summary TEXT
        ,FullText TEXT
        ,PreviewImgUrl TEXT
        ,Link TEXT
        ,Type INT
        ,Question BIGINT
        ,State INT
        ,UserGroup BIGINT
        ,Postedat BIGINT
        ,Keywords TEXT
        ,MediaType INT
        ,UrlOriginal TEXT
        ,OID VARCHAR(256)
        ,PostType INT
        ,AudioUrl TEXT);

   END IF;
END $$;


-- [social_moment.Agent] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='Agent'));

    IF condition THEN
        RAISE NOTICE 'Agent exists.';
    ELSE
        ALTER TABLE social_moment ADD Agent BIGINT;
    END IF;
END $$;

-- [social_moment.Bind] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='Bind'));

    IF condition THEN
        RAISE NOTICE 'Bind exists.';
    ELSE
        ALTER TABLE social_moment ADD Bind BIGINT;
    END IF;
END $$;

-- [social_moment.BindType] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='BindType'));

    IF condition THEN
        RAISE NOTICE 'BindType exists.';
    ELSE
        ALTER TABLE social_moment ADD BindType INT;
    END IF;
END $$;

-- [social_moment.BizCode] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='BizCode'));

    IF condition THEN
        RAISE NOTICE 'BizCode exists.';
    ELSE
        ALTER TABLE social_moment ADD BizCode VARCHAR(256);
    END IF;
END $$;

-- [social_moment.Lang] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='Lang'));

    IF condition THEN
        RAISE NOTICE 'Lang exists.';
    ELSE
        ALTER TABLE social_moment ADD Lang BIGINT;
    END IF;
END $$;

-- [social_moment.Title] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='Title'));

    IF condition THEN
        RAISE NOTICE 'Title exists.';
    ELSE
        ALTER TABLE social_moment ADD Title TEXT;
    END IF;
END $$;

-- [social_moment.Summary] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='Summary'));

    IF condition THEN
        RAISE NOTICE 'Summary exists.';
    ELSE
        ALTER TABLE social_moment ADD Summary TEXT;
    END IF;
END $$;

-- [social_moment.FullText] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='FullText'));

    IF condition THEN
        RAISE NOTICE 'FullText exists.';
    ELSE
        ALTER TABLE social_moment ADD FullText TEXT;
    END IF;
END $$;

-- [social_moment.PreviewImgUrl] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='PreviewImgUrl'));

    IF condition THEN
        RAISE NOTICE 'PreviewImgUrl exists.';
    ELSE
        ALTER TABLE social_moment ADD PreviewImgUrl TEXT;
    END IF;
END $$;

-- [social_moment.Link] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='Link'));

    IF condition THEN
        RAISE NOTICE 'Link exists.';
    ELSE
        ALTER TABLE social_moment ADD Link TEXT;
    END IF;
END $$;

-- [social_moment.Type] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='Type'));

    IF condition THEN
        RAISE NOTICE 'Type exists.';
    ELSE
        ALTER TABLE social_moment ADD Type INT;
    END IF;
END $$;

-- [social_moment.Question] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='Question'));

    IF condition THEN
        RAISE NOTICE 'Question exists.';
    ELSE
        ALTER TABLE social_moment ADD Question BIGINT;
    END IF;
END $$;

-- [social_moment.State] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='State'));

    IF condition THEN
        RAISE NOTICE 'State exists.';
    ELSE
        ALTER TABLE social_moment ADD State INT;
    END IF;
END $$;

-- [social_moment.UserGroup] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='UserGroup'));

    IF condition THEN
        RAISE NOTICE 'UserGroup exists.';
    ELSE
        ALTER TABLE social_moment ADD UserGroup BIGINT;
    END IF;
END $$;

-- [social_moment.Postedat] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='Postedat'));

    IF condition THEN
        RAISE NOTICE 'Postedat exists.';
    ELSE
        ALTER TABLE social_moment ADD Postedat BIGINT;
    END IF;
END $$;

-- [social_moment.Keywords] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='Keywords'));

    IF condition THEN
        RAISE NOTICE 'Keywords exists.';
    ELSE
        ALTER TABLE social_moment ADD Keywords TEXT;
    END IF;
END $$;

-- [social_moment.MediaType] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='MediaType'));

    IF condition THEN
        RAISE NOTICE 'MediaType exists.';
    ELSE
        ALTER TABLE social_moment ADD MediaType INT;
    END IF;
END $$;

-- [social_moment.UrlOriginal] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='UrlOriginal'));

    IF condition THEN
        RAISE NOTICE 'UrlOriginal exists.';
    ELSE
        ALTER TABLE social_moment ADD UrlOriginal TEXT;
    END IF;
END $$;

-- [social_moment.OID] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='OID'));

    IF condition THEN
        RAISE NOTICE 'OID exists.';
    ELSE
        ALTER TABLE social_moment ADD OID VARCHAR(256);
    END IF;
END $$;

-- [social_moment.PostType] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='PostType'));

    IF condition THEN
        RAISE NOTICE 'PostType exists.';
    ELSE
        ALTER TABLE social_moment ADD PostType INT;
    END IF;
END $$;

-- [social_moment.AudioUrl] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='social_moment' AND column_name='AudioUrl'));

    IF condition THEN
        RAISE NOTICE 'AudioUrl exists.';
    ELSE
        ALTER TABLE social_moment ADD AudioUrl TEXT;
    END IF;
END $$;
-- [sys_log] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'sys_log'));

    IF condition THEN
        RAISE NOTICE 'sys_log exists.';
    ELSE

    CREATE TABLE sys_log (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Location TEXT
        ,Content TEXT
        ,Sql TEXT);

   END IF;
END $$;


-- [sys_log.Location] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='sys_log' AND column_name='Location'));

    IF condition THEN
        RAISE NOTICE 'Location exists.';
    ELSE
        ALTER TABLE sys_log ADD Location TEXT;
    END IF;
END $$;

-- [sys_log.Content] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='sys_log' AND column_name='Content'));

    IF condition THEN
        RAISE NOTICE 'Content exists.';
    ELSE
        ALTER TABLE sys_log ADD Content TEXT;
    END IF;
END $$;

-- [sys_log.Sql] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='sys_log' AND column_name='Sql'));

    IF condition THEN
        RAISE NOTICE 'Sql exists.';
    ELSE
        ALTER TABLE sys_log ADD Sql TEXT;
    END IF;
END $$;
-- [trade_arbitrage] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'trade_arbitrage'));

    IF condition THEN
        RAISE NOTICE 'trade_arbitrage exists.';
    ELSE

    CREATE TABLE trade_arbitrage (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Caption VARCHAR(64)
        ,Code VARCHAR(64)
        ,DescTxt TEXT
        ,Ins BIGINT
        ,Stake FLOAT
        ,Entry FLOAT
        ,Exit FLOAT
        ,Fund BIGINT
        ,EndUser BIGINT);

   END IF;
END $$;


-- [trade_arbitrage.Caption] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_arbitrage' AND column_name='Caption'));

    IF condition THEN
        RAISE NOTICE 'Caption exists.';
    ELSE
        ALTER TABLE trade_arbitrage ADD Caption VARCHAR(64);
    END IF;
END $$;

-- [trade_arbitrage.Code] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_arbitrage' AND column_name='Code'));

    IF condition THEN
        RAISE NOTICE 'Code exists.';
    ELSE
        ALTER TABLE trade_arbitrage ADD Code VARCHAR(64);
    END IF;
END $$;

-- [trade_arbitrage.DescTxt] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_arbitrage' AND column_name='DescTxt'));

    IF condition THEN
        RAISE NOTICE 'DescTxt exists.';
    ELSE
        ALTER TABLE trade_arbitrage ADD DescTxt TEXT;
    END IF;
END $$;

-- [trade_arbitrage.Ins] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_arbitrage' AND column_name='Ins'));

    IF condition THEN
        RAISE NOTICE 'Ins exists.';
    ELSE
        ALTER TABLE trade_arbitrage ADD Ins BIGINT;
    END IF;
END $$;

-- [trade_arbitrage.Stake] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_arbitrage' AND column_name='Stake'));

    IF condition THEN
        RAISE NOTICE 'Stake exists.';
    ELSE
        ALTER TABLE trade_arbitrage ADD Stake FLOAT;
    END IF;
END $$;

-- [trade_arbitrage.Entry] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_arbitrage' AND column_name='Entry'));

    IF condition THEN
        RAISE NOTICE 'Entry exists.';
    ELSE
        ALTER TABLE trade_arbitrage ADD Entry FLOAT;
    END IF;
END $$;

-- [trade_arbitrage.Exit] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_arbitrage' AND column_name='Exit'));

    IF condition THEN
        RAISE NOTICE 'Exit exists.';
    ELSE
        ALTER TABLE trade_arbitrage ADD Exit FLOAT;
    END IF;
END $$;

-- [trade_arbitrage.Fund] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_arbitrage' AND column_name='Fund'));

    IF condition THEN
        RAISE NOTICE 'Fund exists.';
    ELSE
        ALTER TABLE trade_arbitrage ADD Fund BIGINT;
    END IF;
END $$;

-- [trade_arbitrage.EndUser] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_arbitrage' AND column_name='EndUser'));

    IF condition THEN
        RAISE NOTICE 'EndUser exists.';
    ELSE
        ALTER TABLE trade_arbitrage ADD EndUser BIGINT;
    END IF;
END $$;
-- [trade_fund] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'trade_fund'));

    IF condition THEN
        RAISE NOTICE 'trade_fund exists.';
    ELSE

    CREATE TABLE trade_fund (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Caption VARCHAR(64)
        ,DescTxt TEXT
        ,Bind BIGINT
        ,BindType INT);

   END IF;
END $$;


-- [trade_fund.Caption] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_fund' AND column_name='Caption'));

    IF condition THEN
        RAISE NOTICE 'Caption exists.';
    ELSE
        ALTER TABLE trade_fund ADD Caption VARCHAR(64);
    END IF;
END $$;

-- [trade_fund.DescTxt] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_fund' AND column_name='DescTxt'));

    IF condition THEN
        RAISE NOTICE 'DescTxt exists.';
    ELSE
        ALTER TABLE trade_fund ADD DescTxt TEXT;
    END IF;
END $$;

-- [trade_fund.Bind] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_fund' AND column_name='Bind'));

    IF condition THEN
        RAISE NOTICE 'Bind exists.';
    ELSE
        ALTER TABLE trade_fund ADD Bind BIGINT;
    END IF;
END $$;

-- [trade_fund.BindType] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_fund' AND column_name='BindType'));

    IF condition THEN
        RAISE NOTICE 'BindType exists.';
    ELSE
        ALTER TABLE trade_fund ADD BindType INT;
    END IF;
END $$;
-- [trade_porfolio] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'trade_porfolio'));

    IF condition THEN
        RAISE NOTICE 'trade_porfolio exists.';
    ELSE

    CREATE TABLE trade_porfolio (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Caption VARCHAR(64)
        ,DescTxt TEXT
        ,Fund BIGINT
        ,Bind BIGINT
        ,BindType INT);

   END IF;
END $$;


-- [trade_porfolio.Caption] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_porfolio' AND column_name='Caption'));

    IF condition THEN
        RAISE NOTICE 'Caption exists.';
    ELSE
        ALTER TABLE trade_porfolio ADD Caption VARCHAR(64);
    END IF;
END $$;

-- [trade_porfolio.DescTxt] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_porfolio' AND column_name='DescTxt'));

    IF condition THEN
        RAISE NOTICE 'DescTxt exists.';
    ELSE
        ALTER TABLE trade_porfolio ADD DescTxt TEXT;
    END IF;
END $$;

-- [trade_porfolio.Fund] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_porfolio' AND column_name='Fund'));

    IF condition THEN
        RAISE NOTICE 'Fund exists.';
    ELSE
        ALTER TABLE trade_porfolio ADD Fund BIGINT;
    END IF;
END $$;

-- [trade_porfolio.Bind] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_porfolio' AND column_name='Bind'));

    IF condition THEN
        RAISE NOTICE 'Bind exists.';
    ELSE
        ALTER TABLE trade_porfolio ADD Bind BIGINT;
    END IF;
END $$;

-- [trade_porfolio.BindType] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_porfolio' AND column_name='BindType'));

    IF condition THEN
        RAISE NOTICE 'BindType exists.';
    ELSE
        ALTER TABLE trade_porfolio ADD BindType INT;
    END IF;
END $$;
-- [trade_trader] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'trade_trader'));

    IF condition THEN
        RAISE NOTICE 'trade_trader exists.';
    ELSE

    CREATE TABLE trade_trader (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Caption VARCHAR(64)
        ,DescTxt TEXT
        ,Fund BIGINT
        ,Portfolio BIGINT
        ,EndUser BIGINT);

   END IF;
END $$;


-- [trade_trader.Caption] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_trader' AND column_name='Caption'));

    IF condition THEN
        RAISE NOTICE 'Caption exists.';
    ELSE
        ALTER TABLE trade_trader ADD Caption VARCHAR(64);
    END IF;
END $$;

-- [trade_trader.DescTxt] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_trader' AND column_name='DescTxt'));

    IF condition THEN
        RAISE NOTICE 'DescTxt exists.';
    ELSE
        ALTER TABLE trade_trader ADD DescTxt TEXT;
    END IF;
END $$;

-- [trade_trader.Fund] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_trader' AND column_name='Fund'));

    IF condition THEN
        RAISE NOTICE 'Fund exists.';
    ELSE
        ALTER TABLE trade_trader ADD Fund BIGINT;
    END IF;
END $$;

-- [trade_trader.Portfolio] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_trader' AND column_name='Portfolio'));

    IF condition THEN
        RAISE NOTICE 'Portfolio exists.';
    ELSE
        ALTER TABLE trade_trader ADD Portfolio BIGINT;
    END IF;
END $$;

-- [trade_trader.EndUser] -------------


DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT column_name FROM information_schema.columns WHERE table_name='trade_trader' AND column_name='EndUser'));

    IF condition THEN
        RAISE NOTICE 'EndUser exists.';
    ELSE
        ALTER TABLE trade_trader ADD EndUser BIGINT;
    END IF;
END $$;