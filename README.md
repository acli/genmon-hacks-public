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
The script provides a `--help` option that explains all available options.

Note that *foocal* gives names the days of the week with a fairly literal translation of what they are actually called,
so these are the names you’ll see in the tooltip when you hover your mouse over the date and time:

| Day of the week | Hebrew system | Chinese system (modern) |
|-----------------|---------------|-----------------|
| Sunday          | 1st day       | Day of the week (星期日) |
| Monday          | 2nd day       | 1-past-the-week (星期一) |
| Tuesday         | 3rd day       | 2-past-the-week (星期二) |
| Wednesday       | 4th day       | 3-past-the-week (星期三) |
| Thursday        | 5th day       | 4-past-the-week (星期四) |
| Friday          | 6th day       | 5-past-the-week (星期五) |
| Saturday        | Shabbat       | 6-past-the-week (星期六) |

Two alternative systems, not supported by *foocal*, are also used in Chinese –
a Protestant-flavoured system used colloquially (even in secular contexts),
and a Catholic-flavour system that’s only occasionally used in Catholic contexts:

| Day of the week | Protestant-flavoured alternative | Catholic-flavoured alternative |
|-----------------|---------------|-----------------|
| Sunday          | Day of worship (禮拜日)     | Day of worship (瞻禮日) |
| Monday          | 1-past-the-worship (禮拜一) | 2nd worship (瞻禮二) |
| Tuesday         | 2-past-the-worship (禮拜二) | 3rd worship (瞻禮三) |
| Wednesday       | 3-past-the-worship (禮拜三) | 4th worship (瞻禮四) |
| Thursday        | 4-past-the-worship (禮拜四) | 5th worship (瞻禮五) |
| Friday          | 5-past-the-worship (禮拜五) | 6th worship (瞻禮六) |
| Saturday        | 6-past-the-worship (禮拜六) | 7th worship (瞻禮七) |

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
The script provides a `--help` option that explains all available options.

Example: `weather -g --iconic` makes sure icons are used (`--iconic`)
