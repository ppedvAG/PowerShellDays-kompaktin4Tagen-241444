class Fahrzeug
{
    [string]$Hersteller

    [string]$Farbe

    [string]$Modell

    [string]$Sitzplätze

    [int]$MaxSpeed
}

class Auto : Fahrzeug
{
    [int]$Räder

    [int]$Leistung

    [int]$türen
    
    [Antriebstechnologie]$Antrieb

    #Konstruktoren , werden ausgeführt beim erstellen einer neuen Objektinstanz
    Auto()
    {
        #Empty Default Konstruktor
    }
    Auto([string]$Hersteller)
    {
        $this.Hersteller = $Hersteller
    }

    [void]Fahre([int]$Strecke)
    {
        [int]$Geschwindigkeit = 0
        [string]$Fahrbahn = "🚗" 

        for($i = 1; $i -le $Strecke; $i++)
        {
            if($i%2 -eq 0)
            {
                $Fahrbahn = "-" + $Fahrbahn
            }
            else
            {
                $Fahrbahn = " " + $Fahrbahn                
            }

            if($Geschwindigkeit -le $this.MaxSpeed)
            {
                $Geschwindigkeit += 15
            }

            Start-Sleep -Milliseconds (300 - $Geschwindigkeit)

            Clear-Host
            Write-Host -Object $Fahrbahn
        }

    }

    #Methode ToString 
    [string]ToString()
    {
        [string]$Ausgabe = "[ " + $this.Hersteller + " | " + $this.Modell + " ]"

        return $Ausgabe
    }

    #Methode To String mit Argument
    [string]ToString([string]$Informationlevel)
    {
        [string]$Ausgabe = ""
        switch($Informationlevel)
        {
            Detailed {$Ausgabe =  "[ " + $this.Hersteller + " | " + $this.Modell + " | " + $this.Leistung + "PS ]" }
            Default {$Ausgabe = $this.ToString()}
        }

        return $Ausgabe
    }
}

enum Antriebstechnologie
{
    Sonstiges
    Benzin
    Diesel
    Elektrisch
    Hybrid
    Wasserstoff
    Feuerstein
}

$MyCar = [Auto]::new("BMW")
$MyCar.Antrieb = [Antriebstechnologie]::Benzin
$MyCar.Farbe = "Grau Metallic"
#Mit Konstruktor ersetzt
#$MyCar.Hersteller = "BMW"
$MyCar.Modell = "F31"
$MyCar.Leistung = 252
$MyCar.Sitzplätze = 5
$MyCar.türen = 5
$MyCar.Räder = 4
$MyCar.MaxSpeed = 260