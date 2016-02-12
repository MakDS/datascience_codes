let $input := doc("../xml/ut/UT_SCHEDULES.XML")/DATA
for $date in distinct-values($input/NAME_ACTIVITY/DATE/@date)
for $teacher in distinct-values($input/NAME_ACTIVITY/DATE[@date eq $date]/TEACHER_LASTNAME[.!=""])
let $st := distinct-values($input/NAME_ACTIVITY/DATE[@date eq $date and TEACHER_LASTNAME[.=$teacher]]/START_TIME[.!=""])
let $et := distinct-values($input/NAME_ACTIVITY/DATE[@date eq $date and TEACHER_LASTNAME[.=$teacher]]/END_TIME[.!=""])
return <DATA date="{$date}" teacher="{$teacher}" starttime="{$st}" endtime="{$et}" />