let $input := doc("../xml/ut/UT_SCHEDULES.xml")/DATA
for $lectures in $input/NAME_ACTIVITY/@name_activity
let $requested := distinct-values($input/NAME_ACTIVITY[@name_activity = $lectures]/DATE/SIZE_REQUEST)
let $capacity := distinct-values($input/NAME_ACTIVITY[@name_activity = $lectures]/DATE/CAP_LECTURES)
let $measure := distinct-values($input/NAME_ACTIVITY[@name_activity = $lectures]/DATE/MEASURE)
return if($requested != "" and $measure != "") 
then <DATA name="{$lectures}" requested="{$requested}" delivered="{$capacity}" count="{$measure}" />
else()