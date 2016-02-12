let $input := doc("../xml/UT_collaboration-of-teachers.xml")/DATA
let $teacher := distinct-values($input/year/COURSE/TEACHERNAME[.!=""])
for $t0 at $index in $teacher
for $t1 in ($index + 1 to count($teacher))
let $count := count($input/year/COURSE[TEACHERNAME[.=$teacher[$index]] and TEACHERNAME[.=$teacher[$t1]]])
return if ($count > 0) then
(<data teacher1="{$teacher[$index]}" teacher2="{$teacher[$t1]}" count="{$count}" />)
else ()