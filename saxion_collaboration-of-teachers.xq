let $input := doc("../xml/saxion_2014-2015-collaboration-of-teachers.xml")/FILE
let $teacher := distinct-values(tokenize(string-join($input/DATA/@teacher,"; "),"; "))[.!=""]
for $t1 at $index in $teacher
for $t2 in ($index +1 to count($teacher))
let $count := count($input/DATA/@teacher[contains(.,$teacher[$index]) and contains(.,$teacher[$t2])])
return if($count > 0)
then (<data teacher1="{$teacher[$index]}" teacher2="{$teacher[$t2]}" count="{$count}" />)
else ()