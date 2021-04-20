using ConsoleApp1.DTOs;
using System;
using System.Linq;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");

            TMG2_ALWContext context = new TMG2_ALWContext();

            IQueryable<CountryGroupToEquityFactor> query =
                from
                    CountryGroupToEquityFactor record
                in
                    context.Set<CountryGroupToEquityFactor>()
                select
                    record
                ;

            IQueryable<CountryGroupToEquityFactorOutDto> result =
                from
                    CountryGroupToEquityFactor model
                in
                    query
                join
                    CountryGroupToEquityFactorView v
                in
                    context.Set<CountryGroupToEquityFactorView>()
                on
                    model.RecordId equals v.RecordId
                group v by new { model.RecordId, v.CountryGroupRatingCurrencyRecordId, v.CountryGroupId, v.CurrencyId, v.RatingSchemeRecordId, v.SchemeName, v.Default } into temp
                select
                    new CountryGroupToEquityFactorOutDto()
                    {
                        CountryGroupId = temp.Key.CountryGroupId,
                        CurrencyId = temp.Key.CurrencyId,
                        RatingSchemeRecordId = temp.Key.RatingSchemeRecordId,
                        RecordId = temp.Key.CountryGroupRatingCurrencyRecordId,
                        SchemeName = temp.Key.SchemeName,
                        DefaultGroup = temp.Key.Default,
                        EquityFactorValues = (from t in temp
                                              select new EquityFactorValuesOutDto
                                              {
                                                  EquityFactorId = t.EquityFactorId,
                                                  FromAmountInclusive = t.FromAmountInclusive,
                                                  RecordId = t.RecordId,
                                                  Rank = t.Rank,
                                                  EquityFactorRecordId = t.EquityFactorRecordId
                                              })
                    };


            Console.WriteLine(result.Count());
            Console.ReadLine();
        }
    }
}
