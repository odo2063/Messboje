function data=read_sensors()

# Hole Messdaten von Sauerstoffsensor
system('/home/chip/boje/oxygen.py')
pause(2)

# Lese Sauerstoffsensordaten
[oxy T8]=read_oxy;
#oxy=0
#T0=0

# Hole Wassertemperaturdaten
T=sen_read;
T0=T(8);
T1=T(7);
T2=T(6);
T3=T(5);
T4=T(4);
T5=T(3);
T6=T(2);
T7=T(1);

# Hole Luftdaten
[TL PL HL]=env_read;

# Messe Wasserleitwert
U_leit=leitw_volt;
S=100e-6/U_leit;

# Messe Batteriespannung
U_batt=batt_volt;

# Messe Tiefe
#depth=system('/home/chip/boje/depth.py')
depth=0;

# Fasse zusammen
data = [oxy T0 T1 T2 T3 T4 T5 T6 T7 T8 TL PL HL S U_batt depth];
