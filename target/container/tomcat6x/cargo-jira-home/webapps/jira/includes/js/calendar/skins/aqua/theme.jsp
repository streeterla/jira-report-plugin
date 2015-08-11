<%@ page contentType="text/css" %><% response.setContentType("text/css"); %>
/* Distributed as part of The Coolest DHTML Calendar
   Author: Mihai Bazon, www.bazon.net/mishoo
   Copyright Dynarch.com 2005, www.dynarch.com
*/

<%
    String path = request.getContextPath() + "/includes/js/calendar/skins/aqua";
%>
/* The main calendar widget.  DIV containing a table. */

div.calendar { position: relative; }

.calendar, .calendar table {
  border: 1px solid #bdb2bf;
  font-size: 11px;
  color: #000;
  cursor: default;
  background: url("<%= path %>/normal-bg.gif");
  font-family: "trebuchet ms",verdana,tahoma,sans-serif;
}

.calendar {
  border-color: #797979;
}

/* Header part -- contains navigation buttons and day names. */

.calendar .button { /* "<<", "<", ">", ">>" buttons have this class */
  text-align: center;    /* They are the navigation buttons */
  padding: 2px;          /* Make the buttons seem like they're pressing */
  background: url("<%= path %>/title-bg.gif") repeat-x 0 100%; color: #000;
  font-weight: bold;
}

.calendar .nav {
  font-family: verdana,tahoma,sans-serif;
}

.calendar .nav div {
  background: transparent url("<%= path %>/menuarrow.gif") no-repeat 100% 100%;
}

.calendar thead tr { background: url("<%= path %>/title-bg.gif") repeat-x 0 100%; color: #000; }

.calendar thead .title { /* This holds the current "month, year" */
  font-weight: bold;      /* Pressing it will take you to the current date */
  text-align: center;
  padding: 2px;
  background: url("<%= path %>/title-bg.gif") repeat-x 0 100%; color: #000;
}

.calendar thead .headrow { /* Row <TR> containing navigation buttons */
}

.calendar thead .name { /* Cells <TD> containing the day names */
  border-bottom: 1px solid #797979;
  padding: 2px;
  text-align: center;
  color: #000;
}

.calendar thead .weekend { /* How a weekend day name shows in header */
  color: #c44;
}

.calendar thead .hilite { /* How do the buttons in header appear when hover */
  background: url("<%= path %>/hover-bg.gif");
  border-bottom: 1px solid #797979;
  padding: 2px 2px 1px 2px;
}

.calendar thead .active { /* Active (pressed) buttons in header */
  background: url("<%= path %>/active-bg.gif"); color: #fff;
  padding: 3px 1px 0px 3px;
  border-bottom: 1px solid #797979;
}

.calendar thead .daynames { /* Row <TR> containing the day names */
  background: url("<%= path %>/dark-bg.gif");
}

/* The body part -- contains all the days in month. */

.calendar tbody .day { /* Cells <TD> containing month days dates */
  font-family: verdana,tahoma,sans-serif;
  width: 2em;
  color: #000;
  text-align: right;
  padding: 2px 4px 2px 2px;
}
.calendar tbody .day.othermonth {
  font-size: 80%;
  color: #999;
}
.calendar tbody .day.othermonth.oweekend {
  color: #f99;
}

.calendar table .wn {
  padding: 2px 3px 2px 2px;
  border-right: 1px solid #797979;
  background: url("<%= path %>/dark-bg.gif");
}

.calendar tbody .rowhilite td,
.calendar tbody .rowhilite td.wn {
  background: url("<%= path %>/rowhover-bg.gif");
}

.calendar tbody td.today { font-weight: bold; /* background: url("<%= path %>/today-bg.gif") no-repeat 70% 50%; */ }

.calendar tbody td.hilite { /* Hovered cells <TD> */
  background: url("<%= path %>/hover-bg.gif");
  padding: 1px 3px 1px 1px;
  border: 1px solid #bbb;
}

.calendar tbody td.active { /* Active (pressed) cells <TD> */
  padding: 2px 2px 0px 2px;
}

.calendar tbody td.weekend { /* Cells showing weekend days */
  color: #c44;
}

.calendar tbody td.selected { /* Cell showing selected date */
  font-weight: bold;
  border: 1px solid #797979;
  padding: 1px 3px 1px 1px;
  background: url("<%= path %>/active-bg.gif"); color: #fff;
}

.calendar tbody .disabled { color: #999; }

.calendar tbody .emptycell { /* Empty cells (the best is to hide them) */
  visibility: hidden;
}

.calendar tbody .emptyrow { /* Empty row (some months need less than 6 rows) */
  display: none;
}

/* The footer part -- status bar and "Close" button */

.calendar tfoot .footrow { /* The <TR> in footer (only one right now) */
  text-align: center;
  background: #565;
  color: #fff;
}

.calendar tfoot .ttip { /* Tooltip (status bar) cell <TD> */
  padding: 2px;
  background: url("<%= path %>/status-bg.gif") repeat-x 0 0; color: #000;
}

.calendar tfoot .hilite { /* Hover style for buttons in footer */
  background: #afa;
  border: 1px solid #084;
  color: #000;
  padding: 1px;
}

.calendar tfoot .active { /* Active (pressed) style for buttons in footer */
  background: #7c7;
  padding: 2px 0px 0px 2px;
}

/* Combo boxes (menus that display months/years for direct selection) */

.calendar .combo {
  position: absolute;
  display: none;
  top: 0px;
  left: 0px;
  width: 4em;
  cursor: default;
  border-width: 0 1px 1px 1px;
  border-style: solid;
  border-color: #797979;
  background: url("<%= path %>/normal-bg.gif"); color: #000;
  z-index: 100;
  font-size: 90%;
}

.calendar .combo .label,
.calendar .combo .label-IEfix {
  text-align: center;
  padding: 1px;
}

.calendar .combo .label-IEfix {
  width: 4em;
}

.calendar .combo .hilite {
  background: url("<%= path %>/hover-bg.gif"); color: #000;
}

.calendar .combo .active {
  background: url("<%= path %>/active-bg.gif"); color: #fff;
  font-weight: bold;
}

.calendar td.time {
  border-top: 1px solid #797979;
  padding: 1px 0px;
  text-align: center;
  background: url("<%= path %>/dark-bg.gif");
}

.calendar td.time .hour,
.calendar td.time .minute,
.calendar td.time .ampm {
  padding: 0px 5px 0px 6px;
  font-weight: bold;
  background: url("<%= path %>/normal-bg.gif"); color: #000;
}

.calendar td.time .hour,
.calendar td.time .minute {
  font-family: monospace;
}

.calendar td.time .ampm {
  text-align: center;
}

.calendar td.time .colon {
  padding: 0px 2px 0px 3px;
  font-weight: bold;
}

.calendar td.time span.hilite {
  background: url("<%= path %>/hover-bg.gif"); color: #000;
}

.calendar td.time span.active {
  background: url("<%= path %>/active-bg.gif"); color: #fff;
}
