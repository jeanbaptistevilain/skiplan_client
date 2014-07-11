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

    :auj_ciel_id_matin,

                    - auj_ciel_id_apm,
                    - dem_ciel_id_matin,
                    - dem_ciel_id_apm,
                    - auj_temp_matin,
                    - auj_temp_apm,
                    - dem_temp_matin,
                    - dem_temp_apm,
                    - auj_temp_rst,
                    - auj_vent_kmh,
                    - auj_vent_dir,
                    - auj_vit_rafales,
                    - visibilite,
                    - meteo_jour,
                    - dem_vent_kmh,
                    - dem_vent_dir,
                    - dem_vit_rafales,
                    - dem_visibilite,
                    - meteo_lendemain,
                    - j2_mat_ciel_id,
                    - j2_apm_ciel_id,
                    - j2_temp_matin,
                    - j2_temp_apm,
                    - j2_vent_kmh,
                    - j2_vent_dir,
                    - j2_vit_rafales,
                    - j2_visibilite,
                    - j3_mat_ciel_id,
                    - j3_apm_ciel_id,
                    - j3_temp_matin,
                    - j3_temp_apm,
                    - j3_vent_kmh,
                    - j3_vent_dir,
                    - j3_vit_rafales,
                    - j3_visibilite,
                    - meteo_semaine

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
