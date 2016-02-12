let $input := doc("../xml/SAXION_2013-2014.XML")/DATA
for $teacher in distinct-values($input/NAME/DATE/TEACHER)
let $lessons := count($input/NAME/DATE/distinct-values(TEACHER[text() eq $teacher]))
return <DATA teacher="{$teacher}" lessons="{$lessons}" />