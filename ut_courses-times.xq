let $input := doc("../xml/ut/UT_SCHEDULES.XML")/DATA
for $course in distinct-values($input/NAME_ACTIVITY/DATE/COURSECODE[.!=""])
let $coursename := distinct-values($input/NAME_ACTIVITY/DATE[COURSECODE eq $course]/COURSENAME)
let $times := $input/NAME_ACTIVITY/DATE[COURSECODE eq $course]
let $duration := (for $t in $times 
let $st := tokenize($t/START_TIME,":")
let $et := tokenize($t/END_TIME,":")
let $minutes :=  xs:integer($et[1])*60 + xs:integer($et[2]) - xs:integer($st[1])*60 - xs:integer($st[2])
return $minutes)
let $min := min($duration)
let $max := max($duration)
let $avg := avg($duration)
let $count := count($duration)
return <DATA code="{$course}" name="{$coursename}" min="{$min}" max="{$max}" avg="{$avg}" count="{$count}"/>