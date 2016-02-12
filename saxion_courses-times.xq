let $input := doc("../xml/saxion/SAXION_2013-2014.XML")/DATA
for $course in distinct-values($input/NAME/@name)
let $times := $input/NAME[@name eq $course]
let $duration := (for $t in $times 
let $st := tokenize($t/DATE/START,":")
let $et := tokenize($t/DATE/END,":")
let $minutes :=  xs:integer($et[1])*60 + xs:integer($et[2]) - xs:integer($st[1])*60 - xs:integer($st[2])
return $minutes)
let $min := min($duration)
let $max := max($duration)
let $avg := avg($duration)
let $count := count($duration)
return  <DATA name="{$course}" min="{$min}" max="{$max}" avg="{$avg}" nrofclasses="{$count}"/>