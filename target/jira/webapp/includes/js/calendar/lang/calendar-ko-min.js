Calendar._DN=new Array("\uc77c\uc694\uc77c","\uc6d4\uc694\uc77c","\ud654\uc694\uc77c","\uc218\uc694\uc77c","\ubaa9\uc694\uc77c","\uae08\uc694\uc77c","\ud1a0\uc694\uc77c","\uc77c\uc694\uc77c");Calendar._SDN=new Array("\uc77c","\uc6d4","\ud654","\uc218","\ubaa9","\uae08","\ud1a0","\uc77c");Calendar._MN=new Array("1\uc6d4","2\uc6d4","3\uc6d4","4\uc6d4","5\uc6d4","6\uc6d4","7\uc6d4","8\uc6d4","9\uc6d4","10\uc6d4","11\uc6d4","12\uc6d4");Calendar._SMN=new Array("1\uc6d4","2\uc6d4","3\uc6d4","4\uc6d4","5\uc6d4","6\uc6d4","7\uc6d4","8\uc6d4","9\uc6d4","10\uc6d4","11\uc6d4","12\uc6d4");Calendar._TT={};Calendar._TT["INFO"]="calendar \uc5d0 \ub300\ud574\uc11c";Calendar._TT["ABOUT"]="DHTML Date/Time Selector\n"+"(c) dynarch.com 2002-2005 / Author: Mihai Bazon\n"+"\n"+"\ucd5c\uc2e0 \ubc84\uc804\uc744 \ubc1b\uc73c\uc2dc\ub824\uba74 http://www.dynarch.com/projects/calendar/ \uc5d0 \ubc29\ubb38\ud558\uc138\uc694\n"+"\n"+"GNU LGPL \ub77c\uc774\uc13c\uc2a4\ub85c \ubc30\ud3ec\ub429\ub2c8\ub2e4. \n"+"\ub77c\uc774\uc13c\uc2a4\uc5d0 \ub300\ud55c \uc790\uc138\ud55c \ub0b4\uc6a9\uc740 http://gnu.org/licenses/lgpl.html \uc744 \uc77d\uc73c\uc138\uc694."+"\n\n"+"\ub0a0\uc9dc \uc120\ud0dd:\n"+"- \uc5f0\ub3c4\ub97c \uc120\ud0dd\ud558\ub824\uba74 \xab, \xbb \ubc84\ud2bc\uc744 \uc0ac\uc6a9\ud569\ub2c8\ub2e4\n"+"- \ub2ec\uc744 \uc120\ud0dd\ud558\ub824\uba74 "+String.fromCharCode(8249)+", "+String.fromCharCode(8250)+" \ubc84\ud2bc\uc744 \ub204\ub974\uc138\uc694\n"+"- \uacc4\uc18d \ub204\ub974\uace0 \uc788\uc73c\uba74 \uc704 \uac12\ub4e4\uc744 \ube60\ub974\uac8c \uc120\ud0dd\ud558\uc2e4 \uc218 \uc788\uc2b5\ub2c8\ub2e4.";Calendar._TT["ABOUT_TIME"]="\n\n"+"\uc2dc\uac04 \uc120\ud0dd:\n"+"- \ub9c8\uc6b0\uc2a4\ub85c \ub204\ub974\uba74 \uc2dc\uac04\uc774 \uc99d\uac00\ud569\ub2c8\ub2e4\n"+"- Shift \ud0a4\uc640 \ud568\uaed8 \ub204\ub974\uba74 \uac10\uc18c\ud569\ub2c8\ub2e4\n"+"- \ub204\ub978 \uc0c1\ud0dc\uc5d0\uc11c \ub9c8\uc6b0\uc2a4\ub97c \uc6c0\uc9c1\uc774\uba74 \uc880 \ub354 \ube60\ub974\uac8c \uac12\uc774 \ubcc0\ud569\ub2c8\ub2e4.\n";Calendar._TT["PREV_YEAR"]="\uc9c0\ub09c \ud574 (\uae38\uac8c \ub204\ub974\uba74 \ubaa9\ub85d)";Calendar._TT["PREV_MONTH"]="\uc9c0\ub09c \ub2ec (\uae38\uac8c \ub204\ub974\uba74 \ubaa9\ub85d)";Calendar._TT["GO_TODAY"]="\uc624\ub298 \ub0a0\uc9dc\ub85c";Calendar._TT["NEXT_MONTH"]="\ub2e4\uc74c \ub2ec (\uae38\uac8c \ub204\ub974\uba74 \ubaa9\ub85d)";Calendar._TT["NEXT_YEAR"]="\ub2e4\uc74c \ud574 (\uae38\uac8c \ub204\ub974\uba74 \ubaa9\ub85d)";Calendar._TT["SEL_DATE"]="\ub0a0\uc9dc\ub97c \uc120\ud0dd\ud558\uc138\uc694";Calendar._TT["DRAG_TO_MOVE"]="\ub9c8\uc6b0\uc2a4 \ub4dc\ub798\uadf8\ub85c \uc774\ub3d9 \ud558\uc138\uc694";Calendar._TT["PART_TODAY"]=" (\uc624\ub298)";Calendar._TT["MON_FIRST"]="\uc6d4\uc694\uc77c\uc744 \ud55c \uc8fc\uc758 \uc2dc\uc791 \uc694\uc77c\ub85c";Calendar._TT["SUN_FIRST"]="\uc77c\uc694\uc77c\uc744 \ud55c \uc8fc\uc758 \uc2dc\uc791 \uc694\uc77c\ub85c";Calendar._TT["CLOSE"]="\ub2eb\uae30";Calendar._TT["TODAY"]="\uc624\ub298";Calendar._TT["TIME_PART"]="(Shift-)\ud074\ub9ad \ub610\ub294 \ub4dc\ub798\uadf8 \ud558\uc138\uc694";Calendar._TT["DAY_FIRST"]="Display %s first";Calendar._TT["WEEKEND"]="0,6";Calendar._TT["DEF_DATE_FORMAT"]="%Y-%m-%d";Calendar._TT["TT_DATE_FORMAT"]="%b/%e [%a]";Calendar._TT["WK"]="\uc8fc";Calendar._TT["AM"]="AM";Calendar._TT["PM"]="PM";Calendar._TT["am"]="am";Calendar._TT["pm"]="pm";