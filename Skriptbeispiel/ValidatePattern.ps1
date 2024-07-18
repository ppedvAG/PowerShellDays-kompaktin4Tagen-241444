[cmdletbinding()]
param(
[ValidatePattern("(4)[0-9]{3}")]
$input 
)

#RegEx Eingabe muss mit 4 beginnen und von 3 zahlen zwischen 0-9 gefolgt werden