# genmon-hacks
This repo contains a few hacks that can be used with the [XFCE *genmon* (generic monitoring) plugin](https://docs.xfce.org/panel-plugins/xfce4-genmon-plugin/start).
All these scripts assume a font size small enough to display two lines of text.

## foocal
*foocal*
(so named because, I think, the Javascript clock I made that displays similar information was originally called *foo*)
displays the current date and time according to several traditional Chinese systems,
the Hebrew system,
and optionally a Western astrological proportional hour system.

The Chinese system for dates is the lunar calendar still in use today;
and for time, pre-1645 centigrade and
hybrid duodecimal–centigrade time systems,
plus a very old (Shang-era) proportional decimal time system.
Centigrade time is assumed to reset at midnight, local time
(instead of, say, as some sources claim, based on sunrise or the high noon);
night watches in the proportional deciday system is assumed to start at sundown and end at sunrise
(instead of, say, as one source claims, 3 centidays after sundown and 3 centidays before sunrise).

The Hebrew system is the Hebrew calendar and proportional time,
both calibrated to begin each day at sundown
(instead of at midnight or at 6pm).
This means that between sundown and midnight,
*foocal* and [*hebcal*](https://github.com/hebcal/hebcal) will disagree on what day it is.

*foocal* currently relies on HKO data for Chinese lunar dates;
it’s supposed to automatically download them but this has not been tested in a long time.
Hebrew date support relies on *hebcal*, which must be installed.

To make the output compatible with *genmon*, the `-g` or `--genmon` argument must be given.
In *genmon* mode, you can hover your mouse over the date and time to read a longer description.

You can also run this script in *sysline* mode (`-w` or `--sysline`);
this will cause the script to reduce its output to a single line,
suitable for use in a .who file.

Example: I use `foocal -m -p all -g --iconic` which means
divide centidays into Sui/Tang 60-part minutes (`-m`),
display Western astrological date and time (`-p all`),
and “always” use icons (`--iconic`)
The script provides a `--help` option that explains all available options.

Note that in the tooltip that you get when you hover your mouse over the date and time,
names the days of the week are not the usual English names but literal translations of what they are called in the original languages.

## tzdate
*tzdate* is a very simple script that takes the name of a timezone code and displays the current date and time in that timezone.

Example: `tzdate Europe/Berlin` displays the current Central European time

## weather
The *weather* script connects to an RSS feed offered by Environment Canada to display current weather conditions.
It will cache the data to avoid overloading Environment Canada’s servers.

To make the output compatible with *genmon*, the `-g` or `--genmon` argument must be given.
In *genmon* mode, you can hover your mouse over the date and time to read a longer description
plus two forecasts.

The script by default pulls weather data for Toronto (which means Pearson, not the city centre, so it’s really Mississauga not Toronto);
if you aren’t anywhere near Toronto or Mississauga you should
[consult Environment Canada’s weather site to figure out the correct code for your city](https://weather.gc.ca/mainmenu/weather_menu_e.html),
then use the `--city` option to specify the correct city.
The code should look something like bc-85 (Victoria), on-143 (Toronto), or qc-147 (Montreal).

You can also run this script in *sysline* mode (`-w` or `--sysline`);
this will cause the script to reduce its output to a single line,
suitable for use in a .who file.
The script provides a `--help` option that explains all available options.

Example: `weather -g --iconic` makes sure icons are used (`--iconic`)
