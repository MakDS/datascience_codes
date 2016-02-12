let $input := doc("../xml/saxion/SAXION_2013-2014.XML")/DATA
for $date in distinct-values($input/NAME/DATE/@date)
for $teacher in distinct-values($input/NAME/DATE[@date eq $date]/TEACHER)
let $st := distinct-values($input/NAME/DATE[@date eq $date and TEACHER[. = $teacher]]/START)
let $et := distinct-values($input/NAME/DATE[@date eq $date and TEACHER[. = $teacher]]/END)
return  file:append("C:\Users\Boaz\Dropbox\Universiteit Twente\Data Science\XMLDataBase\Project Data\results\saxion_2013-2014-teacher-teaching-times.xml",<DATA date="{$date}" teacher="{$teacher}" starttime="{$st}" endtime="{$et}" />)