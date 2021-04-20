USE [TMG2_ALW]
GO

/****** Object:  Table [dbo].[ActiveRatingScheme]    Script Date: 4/20/2021 10:26:09 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ActiveRatingScheme](
	[FromDate] [datetime] NOT NULL,
	[ToDate] [datetime] NOT NULL,
	[Error] [bit] NOT NULL,
	[RatingSchemeRecordId] [bigint] NOT NULL,
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ActiveRatingScheme] ADD  DEFAULT (CONVERT([date],getutcdate())) FOR [FromDate]
GO

ALTER TABLE [dbo].[ActiveRatingScheme] ADD  DEFAULT ((0)) FOR [Error]
GO

ALTER TABLE [dbo].[ActiveRatingScheme] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[ActiveRatingScheme]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([RecordId])
GO

ALTER TABLE [dbo].[ActiveRatingScheme]  WITH CHECK ADD  CONSTRAINT [fk_ActiveRatingScheme_Scheme] FOREIGN KEY([RatingSchemeRecordId])
REFERENCES [dbo].[RatingScheme] ([RecordId])
GO

ALTER TABLE [dbo].[ActiveRatingScheme] CHECK CONSTRAINT [fk_ActiveRatingScheme_Scheme]
GO

USE [TMG2_ALW]
GO

/****** Object:  Table [dbo].[CountryGroup]    Script Date: 4/20/2021 10:26:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CountryGroup](
	[CountryGroupId] [nvarchar](100) NOT NULL,
	[LabelRecordId] [bigint] NULL,
	[DescriptionLabelRecordId] [bigint] NULL,
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[OwnerPartyRecordId] [bigint] NULL,
	[OwnerBaseCompanyRecordId] [bigint] NULL,
	[PurposeRecordId] [bigint] NULL,
	[Default] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[UpdatedBy] [bigint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CountryGroup] ADD  DEFAULT ((0)) FOR [Default]
GO

ALTER TABLE [dbo].[CountryGroup] ADD  DEFAULT ((1)) FOR [Active]
GO

ALTER TABLE [dbo].[CountryGroup] ADD  DEFAULT (getutcdate()) FOR [CreateDate]
GO

ALTER TABLE [dbo].[CountryGroup] ADD  DEFAULT (getutcdate()) FOR [ChangeDate]
GO

ALTER TABLE [dbo].[CountryGroup]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([RecordId])
GO

ALTER TABLE [dbo].[CountryGroup]  WITH CHECK ADD  CONSTRAINT [fk_CountryGroup_ClientLabel] FOREIGN KEY([LabelRecordId])
REFERENCES [dbo].[ClientLabel] ([RecordId])
GO

ALTER TABLE [dbo].[CountryGroup] CHECK CONSTRAINT [fk_CountryGroup_ClientLabel]
GO

ALTER TABLE [dbo].[CountryGroup]  WITH CHECK ADD  CONSTRAINT [fk_CountryGroup_CompanyData] FOREIGN KEY([OwnerBaseCompanyRecordId])
REFERENCES [dbo].[CompanyData] ([RecordId])
GO

ALTER TABLE [dbo].[CountryGroup] CHECK CONSTRAINT [fk_CountryGroup_CompanyData]
GO

ALTER TABLE [dbo].[CountryGroup]  WITH CHECK ADD  CONSTRAINT [fk_CountryGroup_Description_ClientLabel] FOREIGN KEY([DescriptionLabelRecordId])
REFERENCES [dbo].[ClientLabel] ([RecordId])
GO

ALTER TABLE [dbo].[CountryGroup] CHECK CONSTRAINT [fk_CountryGroup_Description_ClientLabel]
GO

ALTER TABLE [dbo].[CountryGroup]  WITH CHECK ADD  CONSTRAINT [fk_CountryGroup_OwnerParty] FOREIGN KEY([OwnerPartyRecordId])
REFERENCES [dbo].[Party] ([RecordId])
GO

ALTER TABLE [dbo].[CountryGroup] CHECK CONSTRAINT [fk_CountryGroup_OwnerParty]
GO

ALTER TABLE [dbo].[CountryGroup]  WITH CHECK ADD  CONSTRAINT [fk_CountryGroup_Purpose] FOREIGN KEY([PurposeRecordId])
REFERENCES [dbo].[CountryGroupPurpose] ([RecordId])
GO

ALTER TABLE [dbo].[CountryGroup] CHECK CONSTRAINT [fk_CountryGroup_Purpose]
GO

USE [TMG2_ALW]
GO

/****** Object:  Table [dbo].[CountryGroupRatingCurrency]    Script Date: 4/20/2021 10:26:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CountryGroupRatingCurrency](
	[CountryGroupRatingOrderRecordId] [bigint] NOT NULL,
	[CurrencyRecordId] [bigint] NOT NULL,
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CountryGroupRatingCurrency]  WITH CHECK ADD  CONSTRAINT [fk_CountryGroupRatingCurrency_CountryGroupRatingOrder] FOREIGN KEY([CountryGroupRatingOrderRecordId])
REFERENCES [dbo].[CountryGroupRatingOrder] ([RecordId])
GO

ALTER TABLE [dbo].[CountryGroupRatingCurrency] CHECK CONSTRAINT [fk_CountryGroupRatingCurrency_CountryGroupRatingOrder]
GO

ALTER TABLE [dbo].[CountryGroupRatingCurrency]  WITH NOCHECK ADD  CONSTRAINT [fk_CountryGroupRatingCurrency_Currency] FOREIGN KEY([CurrencyRecordId])
REFERENCES [dbo].[Currency] ([RecordId])
GO

ALTER TABLE [dbo].[CountryGroupRatingCurrency] CHECK CONSTRAINT [fk_CountryGroupRatingCurrency_Currency]
GO

USE [TMG2_ALW]
GO

/****** Object:  Table [dbo].[CountryGroupRatingOrder]    Script Date: 4/20/2021 10:26:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CountryGroupRatingOrder](
	[RatingSchemeRecordId] [bigint] NOT NULL,
	[CountryGroupRecordId] [bigint] NOT NULL,
	[SortValue] [int] NOT NULL,
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CountryGroupRatingOrder]  WITH CHECK ADD  CONSTRAINT [fk_CountryGroupRatingOrder_CountryGroup] FOREIGN KEY([CountryGroupRecordId])
REFERENCES [dbo].[CountryGroup] ([RecordId])
GO

ALTER TABLE [dbo].[CountryGroupRatingOrder] CHECK CONSTRAINT [fk_CountryGroupRatingOrder_CountryGroup]
GO

ALTER TABLE [dbo].[CountryGroupRatingOrder]  WITH CHECK ADD  CONSTRAINT [fk_CountryGroupRatingOrder_Scheme] FOREIGN KEY([RatingSchemeRecordId])
REFERENCES [dbo].[RatingScheme] ([RecordId])
GO

ALTER TABLE [dbo].[CountryGroupRatingOrder] CHECK CONSTRAINT [fk_CountryGroupRatingOrder_Scheme]
GO

USE [TMG2_ALW]
GO

/****** Object:  Table [dbo].[CountryGroupToEquityFactor]    Script Date: 4/20/2021 10:27:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CountryGroupToEquityFactor](
	[RatingSchemeRecordId] [bigint] NOT NULL,
	[CountryGroupRatingCurrencyRecordId] [bigint] NOT NULL,
	[EquityFactorRecordId] [bigint] NOT NULL,
	[FromAmountInclusive] [numeric](28, 8) NOT NULL,
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CountryGroupToEquityFactor]  WITH CHECK ADD  CONSTRAINT [fk_CountryGroupToEquityFactor_Factor] FOREIGN KEY([EquityFactorRecordId])
REFERENCES [dbo].[EquityFactor] ([RecordId])
GO

ALTER TABLE [dbo].[CountryGroupToEquityFactor] CHECK CONSTRAINT [fk_CountryGroupToEquityFactor_Factor]
GO

ALTER TABLE [dbo].[CountryGroupToEquityFactor]  WITH CHECK ADD  CONSTRAINT [fk_CountryGroupToEquityFactor_Group] FOREIGN KEY([CountryGroupRatingCurrencyRecordId])
REFERENCES [dbo].[CountryGroupRatingCurrency] ([RecordId])
GO

ALTER TABLE [dbo].[CountryGroupToEquityFactor] CHECK CONSTRAINT [fk_CountryGroupToEquityFactor_Group]
GO

ALTER TABLE [dbo].[CountryGroupToEquityFactor]  WITH CHECK ADD  CONSTRAINT [fk_CountryGroupToEquityFactor_Scheme] FOREIGN KEY([RatingSchemeRecordId])
REFERENCES [dbo].[RatingScheme] ([RecordId])
GO

ALTER TABLE [dbo].[CountryGroupToEquityFactor] CHECK CONSTRAINT [fk_CountryGroupToEquityFactor_Scheme]
GO

USE [TMG2_ALW]
GO

/****** Object:  Table [dbo].[Currency]    Script Date: 4/20/2021 10:27:16 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Currency](
	[CurrencyId] [nvarchar](3) NOT NULL,
	[NumericId] [int] NULL,
	[AcceptedInternalUse] [bit] NOT NULL,
	[AcceptedExternalUse] [bit] NOT NULL,
	[AcceptedInternalNote] [nvarchar](200) NULL,
	[AcceptedInternalNoteDate] [datetime] NULL,
	[LabelRecordId] [bigint] NULL,
	[ExpiredDate] [datetime] NULL,
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[Active] [bit] NOT NULL,
	[UpdatedBy] [bigint] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Currency] ADD  DEFAULT ((0)) FOR [AcceptedInternalUse]
GO

ALTER TABLE [dbo].[Currency] ADD  DEFAULT ((0)) FOR [AcceptedExternalUse]
GO

ALTER TABLE [dbo].[Currency] ADD  DEFAULT ((1)) FOR [Active]
GO

ALTER TABLE [dbo].[Currency] ADD  DEFAULT (getutcdate()) FOR [ChangeDate]
GO

ALTER TABLE [dbo].[Currency]  WITH NOCHECK ADD  CONSTRAINT [fk_Currency_ClientLabel] FOREIGN KEY([LabelRecordId])
REFERENCES [dbo].[ClientLabel] ([RecordId])
GO

ALTER TABLE [dbo].[Currency] CHECK CONSTRAINT [fk_Currency_ClientLabel]
GO

ALTER TABLE [dbo].[Currency]  WITH CHECK ADD  CONSTRAINT [fk_currency_user] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([RecordId])
GO

ALTER TABLE [dbo].[Currency] CHECK CONSTRAINT [fk_currency_user]
GO

USE [TMG2_ALW]
GO

/****** Object:  Table [dbo].[EquityFactor]    Script Date: 4/20/2021 10:27:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EquityFactor](
	[EquityFactorId] [nvarchar](5) NOT NULL,
	[Active] [bit] NOT NULL,
	[Flags] [int] NOT NULL,
	[Rank] [int] NOT NULL,
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[UpdatedBy] [bigint] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EquityFactor] ADD  DEFAULT ((1)) FOR [Active]
GO

ALTER TABLE [dbo].[EquityFactor] ADD  DEFAULT ((0)) FOR [Flags]
GO

ALTER TABLE [dbo].[EquityFactor] ADD  DEFAULT ((0)) FOR [Rank]
GO

ALTER TABLE [dbo].[EquityFactor] ADD  DEFAULT (getutcdate()) FOR [ChangeDate]
GO

ALTER TABLE [dbo].[EquityFactor]  WITH CHECK ADD  CONSTRAINT [fk_EquityFactor_user] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([RecordId])
GO

ALTER TABLE [dbo].[EquityFactor] CHECK CONSTRAINT [fk_EquityFactor_user]
GO

USE [TMG2_ALW]
GO

/****** Object:  Table [dbo].[RatingScheme]    Script Date: 4/20/2021 10:27:46 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RatingScheme](
	[Name] [nvarchar](100) NOT NULL,
	[Version] [int] NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CurrencyRecordId] [bigint] NOT NULL,
	[CurrencyGroupRecordId] [bigint] NOT NULL,
	[AccountExpirationDate] [int] NOT NULL,
	[EquityFactorFormularRecordId] [bigint] NULL,
	[CompiledFormulars] [varbinary](max) NULL,
	[Dirty] [bit] NOT NULL,
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[UpdatedBy] [bigint] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[RatingScheme] ADD  DEFAULT ((2)) FOR [AccountExpirationDate]
GO

ALTER TABLE [dbo].[RatingScheme] ADD  DEFAULT ((0)) FOR [Dirty]
GO

ALTER TABLE [dbo].[RatingScheme] ADD  DEFAULT (getutcdate()) FOR [ChangeDate]
GO

ALTER TABLE [dbo].[RatingScheme] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[RatingScheme]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([RecordId])
GO

ALTER TABLE [dbo].[RatingScheme]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([RecordId])
GO

ALTER TABLE [dbo].[RatingScheme]  WITH CHECK ADD  CONSTRAINT [fk_RatingScheme_Currency] FOREIGN KEY([CurrencyRecordId])
REFERENCES [dbo].[Currency] ([RecordId])
GO

ALTER TABLE [dbo].[RatingScheme] CHECK CONSTRAINT [fk_RatingScheme_Currency]
GO

ALTER TABLE [dbo].[RatingScheme]  WITH CHECK ADD  CONSTRAINT [fk_RatingScheme_CurrencyGroup] FOREIGN KEY([CurrencyGroupRecordId])
REFERENCES [dbo].[CurrencyGroup] ([RecordId])
GO

ALTER TABLE [dbo].[RatingScheme] CHECK CONSTRAINT [fk_RatingScheme_CurrencyGroup]
GO

ALTER TABLE [dbo].[RatingScheme]  WITH CHECK ADD  CONSTRAINT [fk_RatingScheme_EquityFactor] FOREIGN KEY([EquityFactorFormularRecordId])
REFERENCES [dbo].[RatingFormular] ([RecordId])
GO

ALTER TABLE [dbo].[RatingScheme] CHECK CONSTRAINT [fk_RatingScheme_EquityFactor]
GO

USE [TMG2_ALW]
GO

/****** Object:  View [dbo].[CountryGroupToEquityFactorView]    Script Date: 4/20/2021 10:28:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[CountryGroupToEquityFactorView] as
	select
		model.CountryGroupRatingCurrencyRecordId,
		model.EquityFactorRecordId,
		model.FromAmountInclusive,
		model.RecordId,
		countryGroup.RecordId as CountryGroupRecordId,
		countryGroup.CountryGroupId,
		countryGroup.[Default],
		fact.[Rank],
		coalesce(modelCurrency.CurrencyId, refCurrency.CurrencyId) as 'CurrencyId',
		coalesce(modelCurrency.RecordId, refCurrency.RecordId) as 'CurrencyRecordId',
		(
			convert(numeric (28, 8),
				coalesce(
							(
								select top 1
									nextModel.FromAmountInclusive
								from
									CountryGroupToEquityFactor nextModel
								where
									nextModel.RatingSchemeRecordId = model.RatingSchemeRecordId and
									((nextModel.CountryGroupRatingCurrencyRecordId is null and model.CountryGroupRatingCurrencyRecordId is null) or nextModel.CountryGroupRatingCurrencyRecordId = model.CountryGroupRatingCurrencyRecordId) and
									nextModel.FromAmountInclusive > model.FromAmountInclusive
								order by
									FromAmountInclusive asc
							),
							9999999999999.0
						)
				)
		) as 'ToAmountExclusive',
		case 
			when (C.NumActive = 0) then
				convert(bit, 1)
			else
				convert(bit, 0)
		end as 'AllowEdit',
		fact.EquityFactorId,
		model.RatingSchemeRecordId,
		S.Name as 'SchemeName',
		S.Version as 'SchemeVersion'
	from
		CountryGroupToEquityFactor model
	join
		EquityFactor fact
	on
		fact.RecordId = model.EquityFactorRecordId
	join
		RatingScheme S
	on
		S.RecordId = model.RatingSchemeRecordId
	join
		CountryGroupRatingCurrency cgrc
	on
		cgrc.RecordId = model.CountryGroupRatingCurrencyRecordId
	join
		Currency refCurrency
	on
		refCurrency.RecordId = cgrc.CurrencyRecordId
	join
		CountryGroupRatingOrder cgro
	on
		cgrc.CountryGroupRatingOrderRecordId = cgro.RecordId
	join
		CountryGroup countryGroup
	on
		countryGroup.RecordId = cgro.CountryGroupRecordId
	join
		Currency modelCurrency
	on
		modelCurrency.RecordId = cgrc.CurrencyRecordId
	outer apply
		(
			select
				count(*) as 'NumActive'
			from
				ActiveRatingScheme ARS
			where
				ARS.RatingSchemeRecordId = model.RatingSchemeRecordId and
				ARS.Error = 0			
		) C
GO


