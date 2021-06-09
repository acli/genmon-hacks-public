# genmon-hacks
This repo contains a few hacks that can be used with the [XFCE *genmon* (generic monitoring) plugin](https://docs.xfce.org/panel-plugins/xfce4-genmon-plugin/start).
All these scripts assume a font size small enough to display two lines of text.

## foocal
*foocal*
(so named because the Javascript clock I made that displays similar information was originally called *foo*)
displays the current date and time according to several traditional Chinese systems,
the Hebrew system,
and optionally a Western astrological proportional hour system.

The Chinese system for dates is the lunar calendar still in use today;
and for time, pre-1645 centigrade and
hybrid duodecimal–centigrade time systems,
plus a very old proportional decimal time system.
Centigrade time is assumed to reset at midnight, local time
(instead of, say, as some sources claim, based on sunrise or the high noon);
night watches in the proportional deciday system is assumed to start at sundown and end at sunrise
(instead of, say, as one source claims, 3 centidays after sundown and 3 centidays before sunrise).

The Hebrew system is the Hebrew calendar and proportional time,
both calibrated to begin each day at sundown
(instead of at midnight or at 6pm).
Note that this means that between sundown and midnight,
*foocal* and *hebcal* will disagree on what day it is.

*foocal* currently relies on HKO data for Chinese lunar dates;
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

<figure>
<table><thead>
<tr><th rowspan=2> Day of the week <th rowspan=2> Hebrew system <th rowspan=2> Chinese system <th colspan=2> Alternative Chinese systems (not used)
<tr><th>Protestant-flavoured¹<th>Catholic-flavoured²
  </thead><tbody>
<tr><td>Sunday          <td>1st day       <td>Day of the week (星期日)  <td>Day of worship (禮拜日)      <td> Day of worship (瞻禮日)
<tr><td>Monday          <td>2nd day       <td>1-past-the-week (星期一)³ <td>1-past-the-worship (禮拜一)³ <td> 2nd worship (瞻禮二)
<tr><td>Tuesday         <td>3rd day       <td>2-past-the-week (星期二)  <td>2-past-the-worship (禮拜二)  <td> 3rd worship (瞻禮三)
<tr><td>Wednesday       <td>4th day       <td>3-past-the-week (星期三)  <td>3-past-the-worship (禮拜三)  <td> 4th worship (瞻禮四)
<tr><td>Thursday        <td>5th day       <td>4-past-the-week (星期四)  <td>4-past-the-worship (禮拜四)  <td> 5th worship (瞻禮五)
<tr><td>Friday          <td>6th day       <td>5-past-the-week (星期五)  <td>5-past-the-worship (禮拜五)  <td> 6th worship (瞻禮六)
<tr><td>Saturday        <td>Shabbat       <td>6-past-the-week (星期六)  <td>6-past-the-worship (禮拜六)  <td> 7th worship (瞻禮七)
</tbody></table>
<figcaption>Notes:
<ol><li>Used colloquially even in secular contexts</li>
<li>Only used in Catholic contexts and rarely</li>
<li>Or alternatively, 1-of-the-week, etc., which treats Sunday as the last day instead of first day of the week</li>
</ol></figcaption>
</figure>
  
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
