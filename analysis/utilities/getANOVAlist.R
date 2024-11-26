
getAnovaList = function(reglist_raw, reglist_clean){
    #user must supply one base_model_name
    # e.g. 'base_model_name = c("reg_base")'
    #base_model_name MUST be one of the names in reglist and reglist should be at least length of 2

    # Anova tests (nested models)
    anova_base__time_raw = anova(reglist_raw$base, reglist_raw$time)
    anova_base__fe_raw = anova(reglist_raw$base, reglist_raw$fe)
    anova_base__time_fe_raw = anova(reglist_raw$base, reglist_raw$time_fe)
    anova_fe__time_fe_raw = anova(reglist_raw$fe, reglist_raw$time_fe)
    anova_time__time_fe_raw = anova(reglist_raw$time, reglist_raw$time_fe)

    anova_base__time_clean = anova(reglist_clean$base, reglist_clean$time)
    anova_base__fe_clean = anova(reglist_clean$base, reglist_clean$fe)
    anova_base__time_fe_clean = anova(reglist_clean$base, reglist_clean$time_fe)
    anova_fe__time_fe_clean = anova(reglist_clean$fe, reglist_clean$time_fe)
    anova_time__time_fe_clean = anova(reglist_clean$time, reglist_clean$time_fe)

    return(
        list(
        "anova_base__time_raw" = anova_base__time_raw,
        "anova_base__fe_raw" = anova_base__fe_raw,
        "anova_base__time_fe_raw" = anova_base__time_fe_raw,
        "anova_fe__time_fe_raw" = anova_fe__time_fe_raw,
        "anova_time__time_fe_raw" = anova_time__time_fe_raw,
        "anova_base__time_clean" = anova_base__time_clean,
        "anova_base__fe_clean" = anova_base__fe_clean,
        "anova_base__time_fe_clean" = anova_base__time_fe_clean,
        "anova_fe__time_fe_clean" = anova_fe__time_fe_clean,
        "anova_time__time_fe_clean" = anova_time__time_fe_clean
        )
    )
}