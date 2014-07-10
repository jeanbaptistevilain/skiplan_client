# SkiplanClient

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'skiplan_client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install skiplan_client

## Usage

Get an XML file :

parameter :
    - $country : Country of the ski resort
    - $region : Region of the ski resort
    - $station : name of the ski resort
    - $v : version number

    example : http://www.skiplan.com/php/genererXml.php?pays=france&region=alpes&station=tignes&v=1

    Element you can get : (current version)

    - auj_ciel_id_matin         # return an id describing the weather during the morning of the current day
    - auj_ciel_id_apm           # return an id describing the weather during the afternoon of the current day
    - dem_ciel_id_matin         # return an id describing the weather during the morning of the next day
    - dem_ciel_id_apm           # return an id describing the weather during the afternoon of the next day

    ______________________ Next Version ________________________________________________________

    - name                      # Nom de station associée aux données
    - lang,                     # Langue usuelle de la station
    - dateheur,                 # jj/mm/aaaa hh:mm
    - zonename,                 # nom de la zone
    - zonealtitude,             # Altitude de la zone d'observation
    - datemaj,                  # Date et heure de dernière modification des observations météo # H24 jj/mm/aaaaa hh:mm
    - reference,                # Nom de la zone d’observation principale (météo du jour) lorsque la zone décrit une prévision à J+n
    - rsqreel,                  # indique s'il existe un réel risque d'avalanche (valeur 1) ou non (valeur 0)
    - valrisque,                # risque d'avalanche entre 0 et 5
    - librisque,                # libellé risque d'avalanche, non spécifié si 0
    - temperaturemtn,           # température le matin  pour  la zone d'observation associée
    - temperatureapm,           # temperature de l'après midi
    - temperaturerst,           # temperature ressentie
    - neige,                    # hauteur de neige fraîche de la zone d'observation associée
    - cumul,                    # hauteur de neige totale
    - neigehorspiste,           # hauteur de neige totale hors piste
    - libqualite,               # libellé de la qualité de neige
    - idqualite,                # id qualité de neige (100 si non spécifié)
    - idqualitehorspiste,       # id qualité de la neige hors piste (100 si non spécifié)
    - datelastsnow,             # date de la dernière chute de neige, au format H24 : jj/mm/aaaa hh:mm
    - vitesse,                  # vitesse du vent
    - direction,                # direction du vent
    - rafales,                  # vitesse maximale du vent en rafale
    - visibilite,               # pourcentage de visibilité de la zone d'observation
    - id_ciel_mtn,              # identifiant de l'état du ciel le matin
    - id_ciel_apm,              # identifiant de l'état du ciel l'après midi'
    - indice_uv,                #’intensité de rayonnement UV pour la zone. Valeur entre 0 et 10
    - risque_orage,             # indice risque d'orage entre 0 et 3
    - commentaire,              # conseil du jour
    - meteo_jour,               # Bulletin météo du jour
    - meteo_lendemain,          # Prévision du lendemain
    - meteo_semaine             # Tendances de la semaine

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
