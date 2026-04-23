let
    Source = Csv.Document(
        File.Contents("C:\Users\DEEPAK\Documents\Codex\2026-04-23-files-mentioned-by-the-user-healthcare\powerbi_dashboard\healthcare_powerbi_data.csv"),
        [Delimiter=",", Columns=19, Encoding=65001, QuoteStyle=QuoteStyle.Csv]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    ChangedType = Table.TransformColumnTypes(
        PromotedHeaders,
        {
            {"admission_id", type text},
            {"patient_id", type text},
            {"admission_date", type datetime},
            {"discharge_date", type datetime},
            {"admission_year", Int64.Type},
            {"admission_month", type text},
            {"admission_month_start", type date},
            {"primary_diagnosis", type text},
            {"procedure_performed", type text},
            {"total_charges", Currency.Type},
            {"readmitted_30_days", type logical},
            {"readmission_flag", Int64.Type},
            {"age", Int64.Type},
            {"age_group", type text},
            {"gender", type text},
            {"ethnicity", type text},
            {"insurance_type", type text},
            {"length_of_stay_days", Int64.Type},
            {"charge_per_day", Currency.Type}
        }
    )
in
    ChangedType
