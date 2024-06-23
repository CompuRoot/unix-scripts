# unix-scripts
Various Unix scripts for administrative tasks

## bin
- `timer_dd-hh-mm-ss.sh` - countdown timer. Accepts timer data as `dd`-for days, `hh`-for hours, `mm`-for minutes, `ss`-for seconds.<br>
  `hh`, `mm`, `ss` are optional, timer can be specified as      
  `timer_dd-hh-mm-ss.sh 365-12` where `mm` and `ss` became 00.<br>
  If running system has `figlet` program, then you can add second parameter that equal 1 to force display countdown in figlet fonts.<br>
  Run `timer_dd-hh-mm-ss.sh` without any parameters to display help.
