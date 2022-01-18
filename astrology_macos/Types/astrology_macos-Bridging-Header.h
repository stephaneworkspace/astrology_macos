//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

int version2(int a);

// Swe02
void swe_set_ephe_path(char *path);

void swe_close();

void swe_set_jpl_file(char *fname);

char *swe_version(char *s);

char *swe_get_library_path(char *path);

// Swe03
int swe_calc_ut(double tjd_ut, int ipl, int iflag, double *p_xx, char *p_serr);

// Swe08
double swe_julday(int year, int month, int day, double hour, int calandar);

void swe_utc_time_zone(int year, int month, int day, int hour, int min, double sec, double dtz, int *p_year_out, int *p_month_out, int *p_day_out, int *p_hour_out, int *p_min_out, double *p_sec_out);