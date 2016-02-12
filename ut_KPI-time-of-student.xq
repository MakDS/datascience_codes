let $input := doc("../xml/ut/UT_SCHEDULES.XML")/DATA
for $date in distinct-values($input/NAME_ACTIVITY/DATE/@date)
for $sets in distinct-values(tokenize(string-join($input/NAME_ACTIVITY/DATE[@date eq $date]/STUDENTSETS[.!=""],";"),";"))
let $st := distinct-values($input/NAME_ACTIVITY/DATE[@date eq $date and contains(string-join(STUDENTSETS,";"), $sets)]/START_TIME[.!=""])
let $et := distinct-values($input/NAME_ACTIVITY/DATE[@date eq $date and contains(string-join(STUDENTSETS,";"), $sets)]/END_TIME[.!=""])
return file:append("C:\Users\Boaz\Dropbox\Universiteit Twente\Data Science\XMLDataBase\Project Data\results\ut_classes-and-lectures.xml",<DATA date="{$date}" class="{$sets}" starttime="{$st}" endtime="{$et}" />)