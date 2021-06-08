# genmon-hacks
This repo contains a few hacks that can be used with the [XFCE *genmon* (generic monitoring) plugin](https://docs.xfce.org/panel-plugins/xfce4-genmon-plugin/start).
All these scripts assume a font size small enough to display two lines of text.

## foocal
*foocal* displays the current date and time according to traditional Chinese and Hebrew systems
(Chinese lunar calendar with time in pre-1645 centigrade and
mixed duodecimal–centigrade time,
plus a very old proportional decimal time system;
plus Hebrew date and proportional time),
and optionally a Western astrological proportional hour system.
Chinese lunar dates currently relies on HKO data;
it’s supposed to automatically download them but this has not been tested in a long time.
Hebrew date support relies on [*hebcal*](https://github.com/hebcal/hebcal), which must be installed.

To make the output compatible with *genmon*, the `-g` or `--genmon` argument must be given.
In *genmon* mode, you can hover your mouse over the date and time to read a longer description.

You can also run this script in *sysline* mode (`-w` or `--sysline`);
this will cause the script to reduce its output to a single line,
suitable for use in a .who file.

Example: I use `foocal -m -p all -g --iconic` which means
divide centidays into Sui/Tang 60-part minutes (`-m`),
display Western astrological date and time (`-p all`),
and “always” use icons (`--iconic`)

## tzdate
*tzdate* is a very simple script that takes the name of a timezone code and displays the current date and time in that timezone.

Example: `tzdate Europe/Berlin` displays the current Central European time

## weather
The *weather* script connect to an RSS feed offered by Environment Canada to display current weather conditions.
It will cache the data to avoid overloading Environment Canada’s servers.

To make the output compatible with *genmon*, the `-g` or `--genmon` argument must be given.
In *genmon* mode, you can hover your mouse over the date and time to read a longer description
plus two forecasts.

The script is currently hard-coded for Toronto (which means Pearson, not the city centre, so it’s really Mississauga);
if you aren’t anywhere near Toronto or Mississauga you must change the `$city` variable in the script
after consulting the Environment Canada site to figure out the correct code to use for your city.

You can also run this script in *sysline* mode (`-w` or `--sysline`);
this will cause the script to reduce its output to a single line,
suitable for use in a .who file.

Example: `weather -g --iconic` makes sure icons are used (`--iconic`)
