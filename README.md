#gino-shell
Shell script per automatizzare dei task di sviluppo in gino.    
Attenzione, questa utility è pensata per gli sviluppatori che intendono creare nuove applicazioni per gino, non per un utilizzo base del CMS.    
Lo script _gino.sh_ deve stare all'interno della root directory di gino, ed avere permessi di esecuzione.    
Il contenuto della directory _doc_ deve stare all'interno della directory doc di gino.

##Utilizzo

    $./gino.sh subcommand [args]

Per visualizzare l'help lanciare il comando

    $./gino.sh help

Per visualizzare l'help di un subcommand lanciare

    $./gino help subcommand

##Subcommands disponibili
Elenco dei subcommands disponibili.
###help
Mostra l'help generale o del subcommand passato:

    $./gino.sh help
    $./gino.sh help help
    $./gino.sh help startapp

###startapp
Inizializza un'applicazione istanziabile:

    $./gino.sh startapp blog

I file vengono scaricati direttamente dal repository gino-seed (http://github.com/otto-torino/gino-seed)    
Lo script crea una cartella all'interno della folder _app_ di gino con un controller, un model, un css, un js, un less, un file di configurazione ed una vista.    
Lo script sistema i nomi dei file e il nome della classe controller all'interno di essi, il modello e la vista mantengono i nomi del seed.

