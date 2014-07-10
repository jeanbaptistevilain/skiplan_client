class WeatherObject

  attr_accessor :auj_ciel_id_matin,
                :auj_ciel_id_apm,
                :dem_ciel_id_matin,
                :dem_ciel_id_apm,
                :auj_temp_matin,
                :auj_temp_apm,
                :dem_temp_matin,
                :dem_temp_apm,
                :zone_nom,
                :zone_altitude,
                :date_heur_maj,
                :auj_temp_rst,
                :auj_vent_kmh,
                :auj_vent_dir,
                :auj_vit_rafales,
                :visibilite,
                :commentaire,
                :meteo_jour,
                :meteo_lendemain,
                :meteo_semaine,
                :neige,
                :cumul,
                :neige_horspiste,
                :lib_qualite,
                :id_qualite,
                :id_qualitehorspiste,
                :date_dern_neige,
                :indice_uv,
                :risque_orage,
                :rsq_reel,
                :val_risque,
                :lib_risque

  def initialize(attributes = {})
                  @nom = attributes[:name]
                  @langue = attributes[:langue]
                  @dateheur = attributes[:date_heur_maj]
                  @zonenom = attributes[:zone_nom]
                  @zonealtitude = attributes[:zone_altitude]
                  @datemaj = attributes[:date_heur_maj]
                  @reference = attributes[:reference_zone]
                  @wrsqreel = attributes[:rsq_reel]
                  @valrisque = attributes[:val_risque]
                  @librisque = attributes[:lib_risque]
                  @temperaturemtn = attributes[:temperature_mtn]
                  @temperatureapm = attributes[:temperature_apm]
                  @auj_temp_rst = attributes[:auj_temp_rst]
                  @neige = attributes[:neige]
                  @cumul = attributes[:cumul]
                  @neigehorspiste = attributes[:neige_horspiste]
                  @libqualite = attributes[:lib_qualite]
                  @idqualite = attributes[:id_qualite]
                  @idqualitehorspiste = attributes[:id_qualitehorspiste]
                  @datelastsnow = attributes[:date_dern_neige]
                  @auj_vent_kmh = attributes[:auj_vent_kmh]
                  @auj_vent_dir = attributes[:auj_vent_dir]
                  @auj_vit_rafales = attributes[:auj_vit_rafales]
                  @visibilite = attributes[:visibilite]
                  @id_ciel_mtn = attributes[:id_ciel_mtn]
                  @id_ciel_apm = attributes[:id_ciel_apm]
                  @indice_uv = attributes[:indice_uv]
                  @risque_orage = attributes[:risque_orage]
                  @commentaire = attributes[:commentaire]
                  @meteo_jour = attributes[:meteo_jour]
                  @meteo_lendemain = attributes[:meteo_lendemain]
                  @meteo_semaine = attributes[:meteo_semaine]
                  @auj_ciel_id_matin = attributes[:auj_ciel_id_matin]
                  @auj_ciel_id_apm = attributes[:auj_ciel_id_apm]
                  @dem_ciel_id_matin = attributes[:dem_ciel_id_matin]
                  @dem_ciel_id_apm = attributes[:dem_ciel_id_apm]
                  @auj_temp_matin = attributes[:auj_temp_matin]
                  @auj_temp_apm = attributes[:auj_temp_apm]
                  @dem_temp_matin = attributes[:dem_temp_matin]
                  @dem_temp_apm =  attributes[:dem_temp_apm]

  end
end