﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;

#nullable disable

namespace ConsoleApp1
{
    public partial class CountryGroupToEquityFactorView
    {
        public long CountryGroupRatingCurrencyRecordId { get; set; }
        public long EquityFactorRecordId { get; set; }
        public decimal FromAmountInclusive { get; set; }
        public long RecordId { get; set; }
        public long CountryGroupRecordId { get; set; }
        public string CountryGroupId { get; set; }
        public bool Default { get; set; }
        public int Rank { get; set; }
        public string CurrencyId { get; set; }
        public long CurrencyRecordId { get; set; }
        public decimal? ToAmountExclusive { get; set; }
        public bool? AllowEdit { get; set; }
        public string EquityFactorId { get; set; }
        public long RatingSchemeRecordId { get; set; }
        public string SchemeName { get; set; }
        public int SchemeVersion { get; set; }
    }
}