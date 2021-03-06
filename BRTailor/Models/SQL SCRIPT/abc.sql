

USE [BRTailor]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/29/2020 6:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/29/2020 6:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/29/2020 6:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/29/2020 6:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/29/2020 6:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/29/2020 6:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Booking]    Script Date: 12/29/2020 6:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[Bookin_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NULL,
	[Customer_Name] [nvarchar](50) NULL,
	[Customer_Address] [nvarchar](50) NULL,
	[Customer_Phone] [nvarchar](50) NULL,
	[Customer_City] [nvarchar](50) NULL,
	[Total] [int] NULL,
	[Discount] [int] NULL,
	[Payable] [int] NULL,
	[date] [datetime] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[Bookin_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookingItem]    Script Date: 12/29/2020 6:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingItem](
	[BT_ID] [int] IDENTITY(1,1) NOT NULL,
	[Booking_ID] [int] NULL,
	[Price] [int] NULL,
	[D_Price] [int] NULL,
	[sName] [nvarchar](150) NULL,
	[sPrice] [int] NULL,
	[SubTotal] [int] NULL,
	[Measurment_Type] [nvarchar](50) NULL,
	[D_Code] [nvarchar](50) NULL,
	[date] [datetime] NULL,
	[Quantity] [nvarchar](50) NULL,
 CONSTRAINT [PK_BookingItem] PRIMARY KEY CLUSTERED 
(
	[BT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/29/2020 6:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Name] [nvarchar](50) NULL,
	[Customer_Phone] [nvarchar](50) NULL,
	[Customer_City] [nvarchar](50) NULL,
	[Customer_Address] [nvarchar](150) NULL,
	[Customer_image] [nvarchar](150) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Designs]    Script Date: 12/29/2020 6:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designs](
	[Design_ID] [int] IDENTITY(1,1) NOT NULL,
	[Design_Code] [nvarchar](50) NULL,
	[Design_Image] [nvarchar](50) NULL,
	[Design_Price] [int] NULL,
 CONSTRAINT [PK_Designs] PRIMARY KEY CLUSTERED 
(
	[Design_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Measurment]    Script Date: 12/29/2020 6:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurment](
	[Measurment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Measurment_Type_ID] [int] NULL,
	[Measurment_Type] [nvarchar](50) NULL,
	[Customer_ID] [int] NULL,
	[Length] [float] NULL,
	[Hip] [float] NULL,
	[Gidrii] [float] NULL,
	[CrossBack] [float] NULL,
	[Chest] [float] NULL,
	[Shoulder] [float] NULL,
	[Waist] [int] NULL,
	[Sleeves] [nvarchar](20) NULL,
	[arms] [float] NULL,
	[CollarSize] [float] NULL,
	[Tera] [float] NULL,
	[Dcollor] [nvarchar](20) NULL,
	[Bottom] [float] NULL,
	[SidePocket] [nvarchar](10) NULL,
	[FrontPocket] [nvarchar](10) NULL,
	[Ghera] [nvarchar](20) NULL,
	[suitDesign] [nvarchar](20) NULL,
	[btnDesign] [nvarchar](20) NULL,
	[Stitch] [nvarchar](20) NULL,
	[CoatButton] [nvarchar](20) NULL,
	[CoatFitting] [nvarchar](20) NULL,
	[Ghera_num] [int] NULL,
	[Comments] [nvarchar](500) NULL,
	[Kaaf] [float] NULL,
	[shalwarPocket] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Measurment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MeasurmentType]    Script Date: 12/29/2020 6:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeasurmentType](
	[Measurment_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Measurment_Type] [nvarchar](50) NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_MeasurmentType] PRIMARY KEY CLUSTERED 
(
	[Measurment_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/29/2020 6:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NULL,
	[Customer_Name] [nvarchar](50) NULL,
	[Measurment_ID] [int] NULL,
	[Measurment_Type_ID] [int] NULL,
	[Measurment_Type] [nvarchar](50) NULL,
	[Staff_ID] [int] NULL,
	[Staff_Position] [nvarchar](50) NULL,
	[Staff_Name] [nvarchar](50) NULL,
	[Order_Date] [datetime] NULL,
	[Return_Date] [date] NULL,
	[Price] [int] NULL,
	[Status] [nvarchar](15) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Services]    Script Date: 12/29/2020 6:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[S_ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](150) NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[S_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 12/29/2020 6:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Staff_ID] [int] IDENTITY(1,1) NOT NULL,
	[Staff_Name] [nvarchar](50) NULL,
	[Staff_Address] [nvarchar](50) NULL,
	[Staff_Phone] [nvarchar](16) NULL,
	[Staff_Position] [nvarchar](50) NULL,
	[Staff_CNIC] [nvarchar](20) NULL,
	[Staff_image] [nvarchar](150) NULL,
	[Staff_Email] [nvarchar](50) NULL,
	[OrdersCompleted] [int] NULL,
	[OrdersInProcess] [int] NULL,
	[TotalAmount] [int] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[Staff_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202011271058193_InitialCreate', N'BRTailor.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EDC36107D2FD07F10F4D416CECA9726488DDD04CEDA6E8DC617649DA06F0157E2AE8548942A518E8DA25FD6877E527FA14389BAF1A2CBAEBCBB0E020416393C331C0EC9E170B8FFFDF3EFF8ED83EF19F7388ADD804CCC83D1BE696062078E4B961333A18B17AFCDB76FBEFF6E7CE6F80FC6A79CEE88D1414B124FCC3B4AC363CB8AED3BECA378E4BB7614C4C1828EECC0B790135887FBFBBF58070716060813B00C63FC2121D4F571FA019FD380D838A409F22E03077B312F879A598A6A5C211FC721B2F1C47CF7E116B95E108D3252D338F15C0462CCB0B7300D4448401105218F3FC67846A3802C67211420EFF631C440B7405E8CB9F0C72579D77EEC1FB27E5865C31CCA4E621AF83D010F8EB8622CB1F94AEA350BC581EACE40C5F491F53A55DFC4BC70705AF421F0400122C3E3A91731E2897959B03889C32B4C4779C35106791E01DCD720FA32AA22EE199DDBED15867438DA67FFF68C69E2D124C21382131A216FCFB849E69E6BFF8E1F6F832F984C8E0EE68BA3D72F5F21E7E8D5CFF8E865B5A7D057A0AB1540D14D14843802D9F0A2E8BF6958F57696D8B06856699369056C09E684695CA287F7982CE91DCC96C3D7A671EE3E60272FE1C6F591B83085A0118D12F8BC4A3C0FCD3D5CD45B8D3CD9FF0D5C0F5FBE1A84EB15BA7797E9D00BFC61E24430AF3E602FAD8DEFDC309B5EB5F1FECCC9CEA3C067DF75FBCA6A3FCF8224B25967022DC92D8A9698D6A51B5BA5F17632690635BC59E7A8BB6FDA4C52D9BC95A4AC43ABCC849CC5A667432EEFD3F2ED6C7127610883979A16D34893C1093BD54868BA67E404A5D11C74351A029DF996D7C0331F3433C022D8810B381F0B37F271D1CB7701981C22BD65BE41710C6B80F31B8AEF1A44873F07107D86ED2402D39C51E4874FCEEDE62E20F82AF1E7CCE237C76BB0A1B9FD1A9C239B06D11961ADD6C67B1FD85F82849E11E71451FC91DA3920FBBC75FDEE0083887362DB388ECFC198B1330DC0B7CE012F083D3AEC0DC756A76D3B21530FB9BEDA0B11D6D1CF3969E989A829246F4443A6F2489A447D1F2C5DD24DD49C542F6A46D12A2A27EB2B2A03EB2629A7D40B9A12B4CA99510DE6E3A52334BC9397C2EEBE97B7DEE6AD5B0B2A6A9CC10A897FC50447B08C393788521C917204BAAC1BDB7016D2E1634C9F7C6F4A397D425E3234AB956643BA080C3F1B52D8DD9F0DA998507CEF3ACC2BE970F4C98901BE13BDFA54D53EE704C9363D1D6ADDDC34F3CDAC01BAE97212C781EDA6B34011F4E2218BBAFCE0C319EDF18BAC37620C043A0686EEB22D0F4AA06FA66854D7E4147B9862E3C4CE82825314DBC891D5081D727A0896EFA80AC1CA58485DB89F249E60E938628D103B04C530535D42E569E112DB0D91D7AA25A165C72D8CF5BDE021D69CE21013C6B055135D98AB431F4C80828F30286D1A1A5B158B6B36448DD7AA1BF33617B61C772922B1119B6CF19D3576C9FDB72731CC668D6DC0389B55D245006D186F1B06CACF2A5D0D403CB8EC9A810A27268D8172976A23065AD7D8160CB4AE926767A0D911B5EBF80BE7D55D33CFFA4179F3DB7AA3BAB6609B357DEC986966BE27B4A1D00247B2799ECE59257EA08AC319C8C9CF67317775451361E0334CEB219BD2DF55FAA156338868444D80A5A1B580F20B4009489A503D84CB63798DD2712FA2076C1E776B84E56BBF005BB10119BB7A115A21D45F978AC6D9E9F451F4ACB006C9C83B1D162A380A831017AF7AC73B284517979515D3C517EEE30D573AC607A341412D9EAB4649796706D7526E9AED5A5239647D5CB2B5B424B84F1A2DE59D195C4BDC46DB95A4700A7AB8056BA9A8BE850F34D9F24847B1DB1475632B4B8EE205634B934535BE4461E8926525AB8A9718B32CA56AFA62D63FDDC8CF302C3B56641D15D2169C6810A125166A8135487AEE46313D4514CD118BF34C1D5F2253EEAD9AE53F6759DD3EE541CCF7819C9AFD9DB510AFED6B1BADEC89708073E89ECFDC993486AE187C757383A5B8210F458AB0FD34F0129FE8BD2B7DEBECF2AEDA3E2B9111C69620BFE43D49AA927CDCBADE3B8D8A3C238618A1C273597D94F4103A5DE77E6755DB3A5F548F9287A6AA28BA70D5D6464DE7C2741F29D135EC3F50AD084F33A3783E4A158017F5C4A8A434486095BAEEA8F5AC932A66BDA63BA2905A528514AA7A48594D20A90959AD58094FA3513545770E72CA48155DAEED8EAC481EA9422BAA57C056C82CD6754755E497548115D5DDB1CB64137105DDE13D4B7B60596DD3CA0EB4EBED5A1A8CA7590E87D9F42AF7F655A04A714F2C7E332F81F1F29D3425EDA96E3553CA8218EB99920643BFE6D4AEBBEB4B4EE31DBD1EB376875D5BD69BEEF0F578FD0CF649CD423AD1892405F7E264279CE0C6FC34D5FE58463A5E6524A691AB11B6F4C798627FC40846B33FBDA9E762B680E7049788B80B1CD32C6FC33CDC3F38149EDCECCEF3172B8E1D4F711AD5BD81A98FD90652B0C83D8AEC3B14C909116B3C112941A558F30571F0C3C4FC2B6D759C862DD85F69F19E71117F24EE9F0954DC460936FE96133C8749996F3E5BEDE80387EE5ABDF8E373D674CFB88E60C61C1BFB822E5719E1FAB3875ED2644DD79066E5C710CF7742D5DE1B28518509B1FAF382B94B07795A904BF9838F1E7EEC2B9AF2F9C05A888A270243E10DA242DD138055B0B4E9FF0E7CD234FDBF5F67D5CF0156114DFB14C025FDC1C48700DD97A1BCE516B71AC58168134B52AAE7D644EAB5B22AB7BD3749F9D66B4D7439A7BA07DC1A79D32B58C6334B391E6C775464140F86BD4DD37EF234E25DC91C2E733AB69B30BCC91CE186DBA06F2A35780792D914C939DB4F00DEB4ADE982B83B9E45D92FCD77C78C8DA76C6D3F9977D3C6A60BF3EEB8B1F54AD9DD315BDBD6FEB9654BEBBC856E3D0157CE25D25CC6A862C16D09B659E01C4EF8F3008C20F328B37791EA8CAEA66CD4168625899EA93E954C642C4D1C89AF44D1CCB65F5FF986DFD8594ED3CC569380D9C49BAFFF8DBC394D336F4D5AE3365283958985AA74ED9675AC29F7E939A502D77AD29279DEE6B336DEAC3FA7CCDF4194529B3D9A3BE2E793E83B884A869C3A3D127BE5EB5ED83B2BBFA008FB77EC2E4B08F67B8A04DBB55DB3A0B9208B20DFBC05897212214273892972604B3D89A8BB4036856A16634E1F76A7713B76D331C7CE05B94E689850E832F6E75E2DE0C59C8026FE69F6725DE6F17598FE46C9105D00315D169BBF26EF12D7730AB9CF1531210D04F32E7844978D256591DDE563817415908E405C7D8553748BFDD003B0F89ACCD03D5E453630BFF77889ECC73202A803691F88BADAC7A72E5A46C88F3946D91E3EC1861DFFE1CDFFABB553A148540000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'4', N'Operator')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'Receptionist')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'Super Admin')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'656dae6b-b92c-4c09-bd5b-4f52b2425a20', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'db47ee15-b3e1-40b4-a41d-c86200c34ce7', N'4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ef0dbfa4-c096-4978-8810-382d721777fe', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fdffae0c-2527-4e8e-9ce9-b6e0a0a8077c', N'1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'656dae6b-b92c-4c09-bd5b-4f52b2425a20', N'super@br.com', 0, N'AOp9PJ7CV3Q89FMaqxmaOFTrddFvcMziFrPAvrx1cBz8Smj568/ZdtTFqx4EWvCccg==', N'7b7be941-02db-4809-a6a1-d2131db0d5d0', NULL, 0, 0, NULL, 1, 0, N'super@br.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'db47ee15-b3e1-40b4-a41d-c86200c34ce7', N'Operator@Br.com', 0, N'APYr/tdceNlp254CyhIjzUInNF2c5/q6J5I6jv+G5ktyalJAJLi4Y7fTE/ahvhBOIw==', N'cc08a0ee-c18a-4bfb-a2e5-4a56df1ebd7b', NULL, 0, 0, NULL, 1, 0, N'Operator@Br.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ef0dbfa4-c096-4978-8810-382d721777fe', N'Receptionist@br.com', 0, N'AAk3Pi9POY/Hq6DbdVeLMb+tRpqq26qgqimAStWwsC68MZ8xA174jmOTQxeGGFtmLg==', N'aa6ce79f-89be-4910-872a-7c22df095d43', NULL, 0, 0, NULL, 1, 0, N'Receptionist@br.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fdffae0c-2527-4e8e-9ce9-b6e0a0a8077c', N'admin@br.com', 0, N'AErHGiCPv3+OF95dibSQsydRwcHrEj7158X6rKUEZ59udj2PYqvhyQxmOXia3skgZw==', N'51e3d4c0-8639-4764-b35c-17bfc97c9906', NULL, 0, 0, NULL, 1, 0, N'admin@br.com')
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([Bookin_ID], [Customer_ID], [Customer_Name], [Customer_Address], [Customer_Phone], [Customer_City], [Total], [Discount], [Payable], [date], [Quantity]) VALUES (19, 11, N'Hussnain', N'JT', N'03214200777', N'Karachi', 4800, 1800, 3000, CAST(N'2020-12-11 17:52:37.300' AS DateTime), NULL)
INSERT [dbo].[Booking] ([Bookin_ID], [Customer_ID], [Customer_Name], [Customer_Address], [Customer_Phone], [Customer_City], [Total], [Discount], [Payable], [date], [Quantity]) VALUES (23, 12, N'Haider', N'CT', N'0312888888', N'Lahore', 1200, 0, 1200, CAST(N'2020-12-13 10:54:18.660' AS DateTime), NULL)
INSERT [dbo].[Booking] ([Bookin_ID], [Customer_ID], [Customer_Name], [Customer_Address], [Customer_Phone], [Customer_City], [Total], [Discount], [Payable], [date], [Quantity]) VALUES (24, 12, N'Haider', N'CT', N'0312888888', N'Lahore', 2000, 0, 2000, CAST(N'2020-12-14 14:26:04.967' AS DateTime), NULL)
INSERT [dbo].[Booking] ([Bookin_ID], [Customer_ID], [Customer_Name], [Customer_Address], [Customer_Phone], [Customer_City], [Total], [Discount], [Payable], [date], [Quantity]) VALUES (25, 11, N'Hussnain', N'JT', N'03214200777', N'Karachi', 15500, 500, 15000, CAST(N'2020-12-15 12:39:23.417' AS DateTime), NULL)
INSERT [dbo].[Booking] ([Bookin_ID], [Customer_ID], [Customer_Name], [Customer_Address], [Customer_Phone], [Customer_City], [Total], [Discount], [Payable], [date], [Quantity]) VALUES (26, 13, N'Bilal', N'G-11', N'03123112311', N'ISB', 4800, 800, 4000, CAST(N'2020-12-15 13:00:44.117' AS DateTime), NULL)
INSERT [dbo].[Booking] ([Bookin_ID], [Customer_ID], [Customer_Name], [Customer_Address], [Customer_Phone], [Customer_City], [Total], [Discount], [Payable], [date], [Quantity]) VALUES (27, 14, N'Aslam', N'G1', N'998790000007', N'LHR', 3800, 800, 3000, CAST(N'2020-12-15 13:06:44.117' AS DateTime), NULL)
INSERT [dbo].[Booking] ([Bookin_ID], [Customer_ID], [Customer_Name], [Customer_Address], [Customer_Phone], [Customer_City], [Total], [Discount], [Payable], [date], [Quantity]) VALUES (32, 16, N'Sabir', N'ISB', N'987987', N'LHR', 5200, 0, 5200, CAST(N'2020-12-15 16:19:18.283' AS DateTime), NULL)
INSERT [dbo].[Booking] ([Bookin_ID], [Customer_ID], [Customer_Name], [Customer_Address], [Customer_Phone], [Customer_City], [Total], [Discount], [Payable], [date], [Quantity]) VALUES (34, 39, N'Rukhsar', N'johat town', N'03224356194', N'Lahore', 3800, 0, 3800, CAST(N'2020-12-24 17:34:42.480' AS DateTime), NULL)
INSERT [dbo].[Booking] ([Bookin_ID], [Customer_ID], [Customer_Name], [Customer_Address], [Customer_Phone], [Customer_City], [Total], [Discount], [Payable], [date], [Quantity]) VALUES (35, 14, N'Aslam', N'G1', N'998790000007', N'LHR', 3800, 0, 3800, CAST(N'2020-12-27 18:27:30.607' AS DateTime), NULL)
INSERT [dbo].[Booking] ([Bookin_ID], [Customer_ID], [Customer_Name], [Customer_Address], [Customer_Phone], [Customer_City], [Total], [Discount], [Payable], [date], [Quantity]) VALUES (40, 12, N'Haider', N'CT', N'0312888888', N'Lahore', 1500, 0, 1500, CAST(N'2020-12-27 22:43:58.003' AS DateTime), NULL)
INSERT [dbo].[Booking] ([Bookin_ID], [Customer_ID], [Customer_Name], [Customer_Address], [Customer_Phone], [Customer_City], [Total], [Discount], [Payable], [date], [Quantity]) VALUES (41, 16, N'Sabir', N'ISB', N'987987', N'LHR', 600, 0, 600, CAST(N'2020-12-27 22:46:10.917' AS DateTime), NULL)
INSERT [dbo].[Booking] ([Bookin_ID], [Customer_ID], [Customer_Name], [Customer_Address], [Customer_Phone], [Customer_City], [Total], [Discount], [Payable], [date], [Quantity]) VALUES (42, 16, N'Sabir', N'ISB', N'987987', N'LHR', 600, 0, 600, CAST(N'2020-12-27 23:27:18.703' AS DateTime), NULL)
INSERT [dbo].[Booking] ([Bookin_ID], [Customer_ID], [Customer_Name], [Customer_Address], [Customer_Phone], [Customer_City], [Total], [Discount], [Payable], [date], [Quantity]) VALUES (43, 11, N'Hussnain', N'JT', N'03214200777', N'Karachi', 600, 0, 600, CAST(N'2020-12-27 23:33:18.390' AS DateTime), NULL)
INSERT [dbo].[Booking] ([Bookin_ID], [Customer_ID], [Customer_Name], [Customer_Address], [Customer_Phone], [Customer_City], [Total], [Discount], [Payable], [date], [Quantity]) VALUES (44, 19, N'Rana Ajmad Ali', N'JT', N'03214200752', N'LHR', 5200, 0, 5200, CAST(N'2020-12-29 11:09:19.760' AS DateTime), NULL)
INSERT [dbo].[Booking] ([Bookin_ID], [Customer_ID], [Customer_Name], [Customer_Address], [Customer_Phone], [Customer_City], [Total], [Discount], [Payable], [date], [Quantity]) VALUES (45, 19, N'Rana Ajmad Ali', N'JT', N'03214200752', N'LHR', 2600, 600, 2000, CAST(N'2020-12-29 11:46:49.270' AS DateTime), NULL)
INSERT [dbo].[Booking] ([Bookin_ID], [Customer_ID], [Customer_Name], [Customer_Address], [Customer_Phone], [Customer_City], [Total], [Discount], [Payable], [date], [Quantity]) VALUES (46, 19, N'Rana Ajmad Ali', N'JT', N'03214200752', N'LHR', 1900, 600, 1900, CAST(N'2020-12-29 11:52:20.440' AS DateTime), NULL)
INSERT [dbo].[Booking] ([Bookin_ID], [Customer_ID], [Customer_Name], [Customer_Address], [Customer_Phone], [Customer_City], [Total], [Discount], [Payable], [date], [Quantity]) VALUES (47, 19, N'Rana Ajmad Ali', N'JT', N'03214200752', N'LHR', 2100, 600, 1500, CAST(N'2020-12-29 11:54:39.047' AS DateTime), NULL)
INSERT [dbo].[Booking] ([Bookin_ID], [Customer_ID], [Customer_Name], [Customer_Address], [Customer_Phone], [Customer_City], [Total], [Discount], [Payable], [date], [Quantity]) VALUES (1044, 41, N'Habib', N'Bilal Street', N'03095194417', N'Lahore', 3200, 500, 2700, CAST(N'2020-12-29 17:17:56.157' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Booking] OFF
SET IDENTITY_INSERT [dbo].[BookingItem] ON 

INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (13, 19, 1200, 2000, NULL, NULL, 3200, N'Kurta', N'PR_1', CAST(N'2020-12-11 17:52:37.300' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (14, 19, 600, 1000, NULL, NULL, 1600, N'Shalwar', N'PR_3', CAST(N'2020-12-11 17:52:37.300' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (19, 23, 1200, 0, NULL, NULL, 1200, N'Kurta', NULL, CAST(N'2020-12-13 10:54:18.660' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (20, 24, NULL, 2000, NULL, NULL, NULL, N'Shalwar', N'PR_1', CAST(N'2020-12-14 14:26:05.007' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (21, 25, 1500, 1300, NULL, NULL, 2800, N'Waist Coat', N'PR_4', CAST(N'2020-12-15 12:39:23.453' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (22, 25, 600, 2000, NULL, NULL, 2600, N'Shalwar', N'PR_1', CAST(N'2020-12-15 12:39:23.463' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (23, 25, 2000, 1000, NULL, NULL, 3000, N'Coat', N'PR_3', CAST(N'2020-12-15 12:39:23.467' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (24, 25, 1200, 1000, NULL, NULL, 2200, N'Kurta', N'PR_3', CAST(N'2020-12-15 12:39:23.470' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (25, 25, 600, 2000, NULL, NULL, 2600, N'Trouser', N'PR_1', CAST(N'2020-12-15 12:39:23.477' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (26, 25, 800, 1500, NULL, NULL, 2300, N'Pent', N'PR_2', CAST(N'2020-12-15 12:39:23.480' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (27, 26, 1200, 2000, NULL, NULL, 3200, N'Kurta', N'PR_1', CAST(N'2020-12-15 13:00:44.130' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (28, 26, 600, 1000, NULL, NULL, 1600, N'Trouser', N'PR_3', CAST(N'2020-12-15 13:00:44.140' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (29, 27, 1200, 2000, NULL, NULL, 3200, N'Kurta', N'PR_1', CAST(N'2020-12-15 13:06:44.123' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (30, 27, 600, 0, NULL, NULL, 600, N'Shalwar', NULL, CAST(N'2020-12-15 13:06:44.130' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (39, 32, 1200, 2000, NULL, NULL, 3200, N'Kurta', N'PR_1', CAST(N'2020-12-15 16:19:18.300' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (40, 32, 600, 0, NULL, NULL, 600, N'Shalwar', NULL, CAST(N'2020-12-15 16:19:18.323' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (41, 32, 600, 0, NULL, NULL, 600, N'Trouser', NULL, CAST(N'2020-12-15 16:19:18.337' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (42, 32, 800, 0, NULL, NULL, 800, N'Pent', NULL, CAST(N'2020-12-15 16:19:18.340' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (44, 34, 1200, 2000, NULL, NULL, 3200, N'Kurta', N'PR_1', CAST(N'2020-12-24 17:34:42.503' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (45, 34, 600, 0, NULL, NULL, 600, N'Shalwar', NULL, CAST(N'2020-12-24 17:34:42.520' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (46, 35, 1200, 2000, NULL, NULL, 3200, N'Kurta', N'PR_1', CAST(N'2020-12-27 18:27:38.587' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (47, 35, 600, 0, NULL, NULL, 600, N'Trouser', NULL, CAST(N'2020-12-27 18:27:42.570' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (51, 40, 1500, 0, NULL, NULL, 1500, N'Waist Coat', NULL, CAST(N'2020-12-27 22:44:00.433' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (52, 41, 600, 0, NULL, NULL, 600, N'Shalwar', NULL, CAST(N'2020-12-27 22:46:10.947' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (53, 42, 600, 0, NULL, NULL, 600, N'Shalwar', NULL, CAST(N'2020-12-27 23:27:21.583' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (54, 43, 600, 0, NULL, NULL, 600, N'Trouser', NULL, CAST(N'2020-12-27 23:33:18.420' AS DateTime), NULL)
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (55, 44, 600, 2000, NULL, NULL, 2600, N'Shalwar', N'PR_1', CAST(N'2020-12-29 11:09:26.297' AS DateTime), N'2')
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (56, 45, 600, 2000, NULL, NULL, 2600, N'Shalwar', N'PR_1', CAST(N'2020-12-29 11:46:58.090' AS DateTime), N'1')
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (57, 46, 600, 1300, NULL, NULL, 1900, N'Shalwar', N'PR_4', CAST(N'2020-12-29 11:52:20.453' AS DateTime), N'1')
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (58, 47, 600, 1500, NULL, NULL, 2100, N'Shalwar', N'PR_2', CAST(N'2020-12-29 11:54:39.057' AS DateTime), N'1')
INSERT [dbo].[BookingItem] ([BT_ID], [Booking_ID], [Price], [D_Price], [sName], [sPrice], [SubTotal], [Measurment_Type], [D_Code], [date], [Quantity]) VALUES (1055, 1044, 1200, 2000, NULL, NULL, 3200, N'Kurta', N'PR_1', CAST(N'2020-12-29 17:17:56.187' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[BookingItem] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_City], [Customer_Address], [Customer_image]) VALUES (11, N'Hussnain', N'03214200777', N'Karachi', N'JT', NULL)
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_City], [Customer_Address], [Customer_image]) VALUES (12, N'Haider', N'0312888888', N'Lahore', N'CT', NULL)
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_City], [Customer_Address], [Customer_image]) VALUES (13, N'Bilal', N'03123112311', N'ISB', N'G-11', NULL)
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_City], [Customer_Address], [Customer_image]) VALUES (14, N'Aslam', N'998790000007', N'LHR', N'G1', NULL)
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_City], [Customer_Address], [Customer_image]) VALUES (16, N'Sabir', N'987987', N'LHR', N'ISB', NULL)
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_City], [Customer_Address], [Customer_image]) VALUES (18, N'Kumil', N'1318778', N'LHR', N'LHR', NULL)
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_City], [Customer_Address], [Customer_image]) VALUES (19, N'Rana Ajmad Ali', N'03214200752', N'LHR', N'JT', NULL)
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_City], [Customer_Address], [Customer_image]) VALUES (20, N'Shahid Afridi', N'01234567891', N'LHR', N'LHR', NULL)
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_City], [Customer_Address], [Customer_image]) VALUES (21, N'Kumil', N'12345678', N'Multan', N'MUL', NULL)
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_City], [Customer_Address], [Customer_image]) VALUES (29, N'Hamza', N'03214200999', N'Lahore', N'JT', NULL)
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_City], [Customer_Address], [Customer_image]) VALUES (30, N'Azhar Ali', N'033344556677', N'Lahore', N'johat town', NULL)
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_City], [Customer_Address], [Customer_image]) VALUES (35, N'Test', N'0001', N'Lahore', N'johat town', NULL)
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_City], [Customer_Address], [Customer_image]) VALUES (36, N'sumbal', N'0003', N'ibh', N'iiii', NULL)
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_City], [Customer_Address], [Customer_image]) VALUES (37, N'test', N'0004', N'Lahore', N'johat town', NULL)
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_City], [Customer_Address], [Customer_image]) VALUES (38, N'test 5', N'005', N'kj', N'jlkjl', NULL)
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_City], [Customer_Address], [Customer_image]) VALUES (39, N'Rukhsar', N'03224356194', N'Lahore', N'johat town', NULL)
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_City], [Customer_Address], [Customer_image]) VALUES (40, N'New User', N'0009000', N'LHR', N'LHR', NULL)
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Phone], [Customer_City], [Customer_Address], [Customer_image]) VALUES (41, N'Habib', N'03095194417', N'Lahore', N'Bilal Street', NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Designs] ON 

INSERT [dbo].[Designs] ([Design_ID], [Design_Code], [Design_Image], [Design_Price]) VALUES (1, N'PR_1', N'/assets/images/admin-settings-male.png', 2000)
INSERT [dbo].[Designs] ([Design_ID], [Design_Code], [Design_Image], [Design_Price]) VALUES (2, N'PR_2', N'/assets/images/admin-settings-male.png', 1500)
INSERT [dbo].[Designs] ([Design_ID], [Design_Code], [Design_Image], [Design_Price]) VALUES (3, N'PR_3', N'/assets/images/admin-settings-male.png', 1000)
INSERT [dbo].[Designs] ([Design_ID], [Design_Code], [Design_Image], [Design_Price]) VALUES (4, N'PR_4', N'/Content/DesignImages/job.jpg', 1300)
SET IDENTITY_INSERT [dbo].[Designs] OFF
SET IDENTITY_INSERT [dbo].[Measurment] ON 

INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (10, 12, N'Trouser', 11, 1, NULL, NULL, NULL, 1, 1, NULL, N'Round', 1, NULL, 1, N'Bain', NULL, NULL, NULL, N'abcd', N'Simple', N'Simple', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (11, 11, N'Shalwar', 11, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, N'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (13, 10, N'Kurta', 13, 12, NULL, NULL, NULL, 12, 12, 12, N'stright', 12, NULL, 12, N'Bain', NULL, NULL, NULL, N'no', N'Simple', N'Simple', N'Double', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (14, 12, N'Trouser', 13, 12, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, N'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (15, 10, N'Kurta', 14, 12, NULL, NULL, NULL, 1, 1, 1, N'Round', 12, NULL, 12, N'Bain', NULL, NULL, NULL, N'no', N'Simple', N'Simple', N'Single', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (16, 12, N'Trouser', 14, 12, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, 12, N'Yes', NULL, N'no', NULL, NULL, NULL, NULL, NULL, NULL, N'No Need', NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (18, 11, N'Shalwar', 16, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, N'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (21, 11, N'Shalwar', 18, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, N'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (22, 12, N'Trouser', 18, 123, NULL, NULL, NULL, NULL, NULL, 1231, NULL, NULL, NULL, NULL, NULL, 123, NULL, NULL, N'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (23, 11, N'Shalwar', 19, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, N'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (24, 13, N'Pent', 20, 12, 12, 12, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, N'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (25, 12, N'Trouser', 21, 123, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, N'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (26, 10, N'Kurta', 21, 12, NULL, NULL, NULL, 12, 12, 12, N'Round', 12, NULL, 12, N'Bain', NULL, NULL, NULL, NULL, N'Simple', N'Simple', N'Single', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (27, 15, N'Waist Coat', 12, 12, 12, NULL, 12, 12, NULL, 12, NULL, NULL, NULL, 12, N'Bain', NULL, NULL, NULL, NULL, N'Simple', N'Design', N'Double', N'One Button', N'Fitted', NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (41, 11, N'Shalwar', 29, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (42, 10, N'Kurta', 30, 12, NULL, NULL, NULL, 12, 12, 12, N'stright', 12, NULL, 12, N'Collor', NULL, NULL, NULL, N'stright', N'Design', N'Design', N'Double', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (43, 11, N'Shalwar', 30, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (44, 12, N'Trouser', 30, 12, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (45, 13, N'Pent', 30, 22, 23, 3, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (46, 15, N'Waist Coat', 30, 12, 12, NULL, 12, 12, NULL, 12, NULL, NULL, NULL, 12, N'Bain', NULL, NULL, NULL, NULL, N'Design', N'Simple', N'Tripple', N'Normal', N'Normal', NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (54, 10, N'Kurta', 0, 12, NULL, NULL, NULL, 12, 12, 12, N'stright', 12, NULL, 12, N'Collor', NULL, N'No', N'No', N'stright', N'Design', N'Design', N'Double', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (55, 10, N'Kurta', 0, 1, NULL, NULL, NULL, 1, 1, 1, N'stright', 1, NULL, 1, N'Collor', NULL, N'No', N'No', N'stright', N'Design', N'Design', N'Double', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (56, 10, N'Kurta', 35, 1, NULL, NULL, NULL, 5, 8, 6, N'Round', 2, NULL, 3, N'Bain', NULL, N'Yes', N'Yes', N'Round', N'Simple', N'Simple', N'Single', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (57, 10, N'Kurta', 37, 1, NULL, NULL, NULL, 5, 8, 6, N'Round', 2, NULL, 3, N'Bain', NULL, N'Yes', N'Yes', N'Round', N'Simple', N'Simple', N'Single', NULL, NULL, 7, N'10', 9, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (59, 10, N'Kurta', 38, 1, NULL, NULL, NULL, 5, 8, 6, N'Round', 2, NULL, 3, N'Bain', NULL, N'Yes', N'Yes', N'Round', N'Simple', N'Simple', N'Single', NULL, NULL, 7, N'10', 9, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (60, 11, N'Shalwar', 38, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, N'Yes', NULL, NULL, NULL, NULL, NULL, NULL, 2, N'4', NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (61, 12, N'Trouser', 38, 1, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 4, N'Yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, N'5', NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (62, 13, N'Pent', 38, 1, 3, 4, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 5, N'Yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'6', NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (63, 15, N'Waist Coat', 38, 1, 5, NULL, 6, 3, NULL, 4, NULL, NULL, NULL, 2, N'Bain', NULL, NULL, NULL, NULL, N'Simple', N'Simple', N'Single', N'Normal', N'Normal', NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (64, 10, N'Kurta', 39, 1, NULL, NULL, NULL, 1, 1, 1, NULL, 1, NULL, 1, N'Bain', NULL, N'Yes', N'Yes', N'Round', N'Simple', N'Simple', N'Single', NULL, NULL, 1, N'1111', 1, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (65, 11, N'Shalwar', 39, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'111', NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (66, 10, N'Kurta', 40, 1, NULL, NULL, NULL, 5, 8, 6, N'Round', 2, 4, 3, N'Bain', NULL, N'1', N'Yes', N'Round', N'Simple', N'Simple', N'Single', NULL, NULL, 7, N'No need', 9, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (67, 11, N'Shalwar', 40, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, N'No need', NULL, N'yes')
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (68, 12, N'Trouser', 40, 1, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 4, N'2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, N'no need', NULL, N'Yes')
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (69, 13, N'Pent', 40, 1, 3, 4, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 5, N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'No need', NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (70, 15, N'Waist Coat', 40, 1, 5, NULL, 6, 3, NULL, 4, NULL, NULL, NULL, 2, N'Bain', NULL, NULL, NULL, NULL, N'Simple', N'Simple', N'Single', N'Normal', N'Normal', NULL, NULL, NULL, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (71, 10, N'Kurta', 41, 1, NULL, NULL, NULL, 5, 8, 6, N'Round', 2, NULL, 3, N'Bain', NULL, N'1', N'Yes', N'Round', N'Simple', N'Simple', N'Single', NULL, NULL, 7, N'ewae', 9, NULL)
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (72, 11, N'Shalwar', 41, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, N'jnkj', NULL, N'Yes')
INSERT [dbo].[Measurment] ([Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Customer_ID], [Length], [Hip], [Gidrii], [CrossBack], [Chest], [Shoulder], [Waist], [Sleeves], [arms], [CollarSize], [Tera], [Dcollor], [Bottom], [SidePocket], [FrontPocket], [Ghera], [suitDesign], [btnDesign], [Stitch], [CoatButton], [CoatFitting], [Ghera_num], [Comments], [Kaaf], [shalwarPocket]) VALUES (73, 12, N'Trouser', 41, 1, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 4, N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, N'jjnk', NULL, N'Yes')
SET IDENTITY_INSERT [dbo].[Measurment] OFF
SET IDENTITY_INSERT [dbo].[MeasurmentType] ON 

INSERT [dbo].[MeasurmentType] ([Measurment_Type_ID], [Measurment_Type], [Price]) VALUES (10, N'Kurta', 1200)
INSERT [dbo].[MeasurmentType] ([Measurment_Type_ID], [Measurment_Type], [Price]) VALUES (11, N'Shalwar', 600)
INSERT [dbo].[MeasurmentType] ([Measurment_Type_ID], [Measurment_Type], [Price]) VALUES (12, N'Trouser', 600)
INSERT [dbo].[MeasurmentType] ([Measurment_Type_ID], [Measurment_Type], [Price]) VALUES (13, N'Pent', 800)
INSERT [dbo].[MeasurmentType] ([Measurment_Type_ID], [Measurment_Type], [Price]) VALUES (14, N'Coat', 2000)
INSERT [dbo].[MeasurmentType] ([Measurment_Type_ID], [Measurment_Type], [Price]) VALUES (15, N'Waist Coat', 1500)
SET IDENTITY_INSERT [dbo].[MeasurmentType] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Order_ID], [Customer_ID], [Customer_Name], [Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Staff_ID], [Staff_Position], [Staff_Name], [Order_Date], [Return_Date], [Price], [Status]) VALUES (18, 11, N'Hussnain', 10, 12, N'Trouser', 1, N'Tailor', N'Haider ali', CAST(N'2020-12-15 13:02:35.000' AS DateTime), CAST(N'2020-12-24' AS Date), 200, N'In Process')
INSERT [dbo].[Order] ([Order_ID], [Customer_ID], [Customer_Name], [Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Staff_ID], [Staff_Position], [Staff_Name], [Order_Date], [Return_Date], [Price], [Status]) VALUES (19, 11, N'Hussnain', 11, 11, N'Shalwar', 1, N'Tailor', N'Haider ali', CAST(N'2020-12-15 13:02:50.000' AS DateTime), CAST(N'2020-12-18' AS Date), 1000, N'In Process')
INSERT [dbo].[Order] ([Order_ID], [Customer_ID], [Customer_Name], [Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Staff_ID], [Staff_Position], [Staff_Name], [Order_Date], [Return_Date], [Price], [Status]) VALUES (21, 12, N'Haider', NULL, 11, N'Shalwar', 1, N'Tailor', N'Haider ali', CAST(N'2020-12-14 16:34:45.000' AS DateTime), CAST(N'2020-12-19' AS Date), 200, N'In Process')
INSERT [dbo].[Order] ([Order_ID], [Customer_ID], [Customer_Name], [Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Staff_ID], [Staff_Position], [Staff_Name], [Order_Date], [Return_Date], [Price], [Status]) VALUES (22, 13, N'Bilal', 13, 10, N'Kurta', 1, N'Tailor', N'Haider ali', CAST(N'2020-12-15 13:01:39.000' AS DateTime), CAST(N'2020-12-24' AS Date), 1200, N'Received')
INSERT [dbo].[Order] ([Order_ID], [Customer_ID], [Customer_Name], [Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Staff_ID], [Staff_Position], [Staff_Name], [Order_Date], [Return_Date], [Price], [Status]) VALUES (30, 39, N'Rukhsar', 64, 10, N'Kurta', 1, N'Tailor', N'Haider ali', CAST(N'2020-12-24 17:39:52.000' AS DateTime), CAST(N'2020-12-17' AS Date), 300, N'Received')
INSERT [dbo].[Order] ([Order_ID], [Customer_ID], [Customer_Name], [Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Staff_ID], [Staff_Position], [Staff_Name], [Order_Date], [Return_Date], [Price], [Status]) VALUES (32, 14, N'Aslam', 15, 10, N'Kurta', NULL, NULL, NULL, NULL, NULL, NULL, N'Queue')
INSERT [dbo].[Order] ([Order_ID], [Customer_ID], [Customer_Name], [Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Staff_ID], [Staff_Position], [Staff_Name], [Order_Date], [Return_Date], [Price], [Status]) VALUES (33, 14, N'Aslam', 16, 12, N'Trouser', NULL, NULL, NULL, NULL, NULL, NULL, N'Queue')
INSERT [dbo].[Order] ([Order_ID], [Customer_ID], [Customer_Name], [Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Staff_ID], [Staff_Position], [Staff_Name], [Order_Date], [Return_Date], [Price], [Status]) VALUES (37, 12, N'Haider', 27, 15, N'Waist Coat', NULL, NULL, NULL, NULL, NULL, NULL, N'Queue')
INSERT [dbo].[Order] ([Order_ID], [Customer_ID], [Customer_Name], [Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Staff_ID], [Staff_Position], [Staff_Name], [Order_Date], [Return_Date], [Price], [Status]) VALUES (38, 16, N'Sabir', 18, 11, N'Shalwar', NULL, NULL, NULL, NULL, NULL, NULL, N'Queue')
INSERT [dbo].[Order] ([Order_ID], [Customer_ID], [Customer_Name], [Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Staff_ID], [Staff_Position], [Staff_Name], [Order_Date], [Return_Date], [Price], [Status]) VALUES (39, 16, N'Sabir', 18, 11, N'Shalwar', NULL, NULL, NULL, NULL, NULL, NULL, N'Queue')
INSERT [dbo].[Order] ([Order_ID], [Customer_ID], [Customer_Name], [Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Staff_ID], [Staff_Position], [Staff_Name], [Order_Date], [Return_Date], [Price], [Status]) VALUES (40, 11, N'Hussnain', 10, 12, N'Trouser', NULL, NULL, NULL, NULL, NULL, NULL, N'Queue')
INSERT [dbo].[Order] ([Order_ID], [Customer_ID], [Customer_Name], [Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Staff_ID], [Staff_Position], [Staff_Name], [Order_Date], [Return_Date], [Price], [Status]) VALUES (41, 11, N'Hussnain', 11, 11, N'Shalwar', NULL, NULL, NULL, NULL, NULL, NULL, N'Queue')
INSERT [dbo].[Order] ([Order_ID], [Customer_ID], [Customer_Name], [Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Staff_ID], [Staff_Position], [Staff_Name], [Order_Date], [Return_Date], [Price], [Status]) VALUES (42, 19, N'Rana Ajmad Ali', 23, 11, N'Shalwar', NULL, NULL, NULL, NULL, NULL, NULL, N'Queue')
INSERT [dbo].[Order] ([Order_ID], [Customer_ID], [Customer_Name], [Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Staff_ID], [Staff_Position], [Staff_Name], [Order_Date], [Return_Date], [Price], [Status]) VALUES (43, 19, N'Rana Ajmad Ali', 23, 11, N'Shalwar', NULL, NULL, NULL, NULL, NULL, NULL, N'Queue')
INSERT [dbo].[Order] ([Order_ID], [Customer_ID], [Customer_Name], [Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Staff_ID], [Staff_Position], [Staff_Name], [Order_Date], [Return_Date], [Price], [Status]) VALUES (44, 19, N'Rana Ajmad Ali', 23, 11, N'Shalwar', NULL, NULL, NULL, NULL, NULL, NULL, N'Queue')
INSERT [dbo].[Order] ([Order_ID], [Customer_ID], [Customer_Name], [Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Staff_ID], [Staff_Position], [Staff_Name], [Order_Date], [Return_Date], [Price], [Status]) VALUES (45, 19, N'Rana Ajmad Ali', 23, 11, N'Shalwar', NULL, NULL, NULL, NULL, NULL, NULL, N'Queue')
INSERT [dbo].[Order] ([Order_ID], [Customer_ID], [Customer_Name], [Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Staff_ID], [Staff_Position], [Staff_Name], [Order_Date], [Return_Date], [Price], [Status]) VALUES (1042, 41, N'Habib', 71, 10, N'Kurta', NULL, NULL, NULL, NULL, NULL, NULL, N'Queue')
INSERT [dbo].[Order] ([Order_ID], [Customer_ID], [Customer_Name], [Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Staff_ID], [Staff_Position], [Staff_Name], [Order_Date], [Return_Date], [Price], [Status]) VALUES (1043, 41, N'Habib', 72, 11, N'Shalwar', NULL, NULL, NULL, NULL, NULL, NULL, N'Queue')
INSERT [dbo].[Order] ([Order_ID], [Customer_ID], [Customer_Name], [Measurment_ID], [Measurment_Type_ID], [Measurment_Type], [Staff_ID], [Staff_Position], [Staff_Name], [Order_Date], [Return_Date], [Price], [Status]) VALUES (1044, 41, N'Habib', 73, 12, N'Trouser', NULL, NULL, NULL, NULL, NULL, NULL, N'Queue')
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([S_ID], [ServiceName], [Price]) VALUES (1, N'Round Button ', 20)
INSERT [dbo].[Services] ([S_ID], [ServiceName], [Price]) VALUES (2, N'Glitter Button', 30)
INSERT [dbo].[Services] ([S_ID], [ServiceName], [Price]) VALUES (3, N'Stitch Double', 100)
INSERT [dbo].[Services] ([S_ID], [ServiceName], [Price]) VALUES (4, N'Stitch triple', 200)
SET IDENTITY_INSERT [dbo].[Services] OFF
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([Staff_ID], [Staff_Name], [Staff_Address], [Staff_Phone], [Staff_Position], [Staff_CNIC], [Staff_image], [Staff_Email], [OrdersCompleted], [OrdersInProcess], [TotalAmount]) VALUES (1, N'Haider ali', N'Johar town', N'99999', N'Tailor', N'111111', NULL, N'haider@gmail.com', 0, 6, 3400)
SET IDENTITY_INSERT [dbo].[Staff] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/29/2020 6:19:12 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/29/2020 6:19:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/29/2020 6:19:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/29/2020 6:19:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/29/2020 6:19:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/29/2020 6:19:12 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Customer]
GO
ALTER TABLE [dbo].[BookingItem]  WITH CHECK ADD  CONSTRAINT [FK_BookingItem_Booking] FOREIGN KEY([Booking_ID])
REFERENCES [dbo].[Booking] ([Bookin_ID])
GO
ALTER TABLE [dbo].[BookingItem] CHECK CONSTRAINT [FK_BookingItem_Booking]
GO
ALTER TABLE [dbo].[Measurment]  WITH CHECK ADD  CONSTRAINT [FK_Measurment_MeasurmentType] FOREIGN KEY([Measurment_Type_ID])
REFERENCES [dbo].[MeasurmentType] ([Measurment_Type_ID])
GO
ALTER TABLE [dbo].[Measurment] CHECK CONSTRAINT [FK_Measurment_MeasurmentType]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Measurment] FOREIGN KEY([Measurment_ID])
REFERENCES [dbo].[Measurment] ([Measurment_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Measurment]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Staff] FOREIGN KEY([Staff_ID])
REFERENCES [dbo].[Staff] ([Staff_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Staff]
GO
USE [master]
GO
ALTER DATABASE [BRTailor] SET  READ_WRITE 
GO
