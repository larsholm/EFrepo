using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace ConsoleApp1.DTOs
{
    public class CountryGroupToEquityFactorOutDto //: RecordIdDto
    {
        [Key]
        public virtual long RecordId { get; set; }
        public string SchemeName { get; set; }

        public string CountryGroupId { get; set; }

        public bool DefaultGroup { get; set; }

        public string CurrencyId { get; set; }

        public long RatingSchemeRecordId { get; set; }

        public IEnumerable<EquityFactorValuesOutDto> EquityFactorValues { get; set; }

    }

    public class EquityFactorValuesOutDto //: RecordIdDto
    {
        [Key]
        public virtual long RecordId { get; set; }
        //[Column(TypeName = "decimal(28,8)")]
        public decimal FromAmountInclusive { get; set; }

        public string EquityFactorId { get; set; }

        public long EquityFactorRecordId { get; set; }

        public int Rank { get; set; }
    }
}
