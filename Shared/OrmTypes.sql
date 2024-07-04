
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
        ,Type INT
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

-- [ca_airport] ----------------------

DO $$
DECLARE
    condition boolean;
BEGIN
    condition := (SELECT EXISTS(SELECT * FROM information_schema.tables WHERE table_name = 'ca_airport'));

    IF condition THEN
        RAISE NOTICE 'ca_airport exists.';
    ELSE

    CREATE TABLE ca_airport (ID BIGINT NOT NULL
        ,Createdat BIGINT NOT NULL
        ,Updatedat BIGINT NOT NULL
        ,Sort BIGINT NOT NULL
        ,Code3IATA VARCHAR(3)
        ,Code4ICAO VARCHAR(4)
        ,Caption VARCHAR(64)
        ,CaptionEn VARCHAR(64)
        ,Country BIGINT
        ,City BIGINT
        ,IsMetropolitan BIT);

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
        ,State INT);

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
        ,Name VARCHAR(64)
        ,MetropolitanCode3IATA VARCHAR(3)
        ,NameEn VARCHAR(64)
        ,Country BIGINT
        ,Place BIGINT
        ,Icon VARCHAR(256)
        ,Tel VARCHAR(4));

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
        ,Hidden BIT
        ,IsSac BIT
        ,IsTransfer BIT
        ,IsCash BIT
        ,EnableReward BIT
        ,EnableOTC BIT
        ,Icon VARCHAR(512)
        ,CurType INT
        ,Dec BIGINT
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
        ,Desc TEXT
        ,Code VARCHAR(64)
        ,Caption VARCHAR(64)
        ,Long BIGINT
        ,LongCode VARCHAR(16)
        ,Short BIGINT
        ,ShortCode VARCHAR(16));

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
        ,Desc TEXT);

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
        ,Desc TEXT);

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
        ,Group VARCHAR(64)
        ,Type BIGINT);

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
        ,Group BIGINT
        ,Postedat BIGINT
        ,Keywords TEXT
        ,MediaType INT
        ,UrlOriginal TEXT
        ,OID VARCHAR(256)
        ,PostType INT
        ,AudioUrl TEXT);

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
        ,Desc TEXT
        ,Ins BIGINT
        ,Stake FLOAT
        ,Entry FLOAT
        ,Exit FLOAT
        ,Fund BIGINT
        ,EndUser BIGINT);

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
        ,Desc TEXT
        ,Bind BIGINT
        ,BindType INT);

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
        ,Desc TEXT
        ,Fund BIGINT
        ,Bind BIGINT
        ,BindType INT);

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
        ,Desc TEXT
        ,Fund BIGINT
        ,Portfolio BIGINT
        ,EndUser BIGINT);

   END IF;
END $$;
