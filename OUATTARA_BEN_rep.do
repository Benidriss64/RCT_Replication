/*===========================================================
Project  : Nudging Farmers to Use Fertilizer (Replication)
Author   : OUATTARA BEN IDRISS
Date     : April 2026
Data     : SAFI_main_dataset_AER.dta
===========================================================*/

* --------
version 16
clear all
set more off
capture log close
log using "replication_duflo.log", replace

cd "C:\Users\HP\Desktop\MIT\Replication_Duflo\Nudging-Farmers-to-Use-Fertilizer"

********************
* Table 1 : percentage of farmers buying early
********************
use time_buying_fert_AER, clear

sum used_tdfert_LR09
sum bought_td_immed_postharv_LR09
sum bought_td_immed_postharv_LR09 if used_tdfert_LR09==1
sum always_used_TD
sum always_bought_td_early

********************
* Table 3 : balance check before treatment
********************
use SAFI_main_dataset_AER, clear
gen incomeK_04 = income_04 / 1000

foreach var of varlist incomeK_04 educ_04 house_ever_anyfert_04 ///
                       mud_walls_04 mud_floor_04 thatch_roof_04 {
    ttest `var', by(safi_lr04)
}

********************
* Table 4 Panel A : RCT saison 1
********************

* Moyennes par groupe avant régression
sum anyfert_plus1_05 if safi_lr04==0
sum anyfert_plus1_05 if safi_lr04==1

* Sans contrôles
reg anyfert_plus1_05 safi_lr04 sbsk1 sbsk1_demo demo ///
    house_ever_anyfert_05 

* Avec contrôles
reg anyfert_plus1_05 safi_lr04 sbsk1 sbsk1_demo demo ///
    house_ever_anyfert_05 gender_05 mud_walls_04 ///
    educ_04 incomeK_04 thatch_roof_04 mud_floor_04 ///
    std5parent 

********************
* Table 4 Panel B : RCT saison 2
********************

* Moyennes par groupe avant régression
sum anyfert_plus2_05 if safi_sr04==0
sum anyfert_plus2_05 if safi_sr04==1

* Sans contrôles
reg anyfert_plus2_05 safi_sr04 choice subsidy fullprice ///
    buy buy_safi_sr04 house_ever_anyfert_05 ///
    safi_lr04 sbsk1 sbsk1_demo demo 

* Avec contrôles
reg anyfert_plus2_05 safi_sr04 choice subsidy fullprice ///
    buy buy_safi_sr04 house_ever_anyfert_05 ///
    gender_05 mud_walls_04 educ_04 incomeK_04 ///
    thatch_roof_04 mud_floor_04 std5parent ///
    safi_lr04 sbsk1 sbsk1_demo demo 

log close