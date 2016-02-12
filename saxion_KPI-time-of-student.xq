let $input := doc("../xml/saxion/SAXION_2014-2015.XML")/DATA
for $date in distinct-values($input/NAME/DATE/@date)
for $class in distinct-values($input/NAME/DATE[@date eq $date]/CLASS)
let $st := distinct-values($input/NAME/DATE[@date eq $date and CLASS[. = $class]]/START)
let $et := distinct-values($input/NAME/DATE[@date eq $date and CLASS[. = $class]]/END)
return file:append("C:\Users\Boaz\Dropbox\Universiteit Twente\Data Science\XMLDataBase\Project Data\results\saxion_2014-2015-timeslots-of-classes-per-date.xml",<DATA date="{$date}" class="{$class}" starttime="{$st}" endtime="{$et}" />)
