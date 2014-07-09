class WeatherObject

  attr_accessor :nom_station,
                :langue,
                :date_heur_maj,
                :zone_nom,
                :zone_altitude,
                :date_maj,
                :reference_zone,
                :rsq_reel,
                :val_risque,
                :lib_risque,
                :temperature_mtn,
                :temperature_apm,
                :temperature_rst,
                :neige,
                :cumul,
                :neige_horspiste,
                :lib_qualite,
                :id_qualite,
                :id_qualitehorspiste,
                :date_dern_neige,
                :vitesse_vent,
                :direction_vent,
                :rafales_vent,
                :visibilite,
                :id_ciel_mtn,
                :id_ciel_apm,
                :indice_uv,
                :risque_orage,
                :commentaire,
                :meteo_jour,
                :meteo_lendemain,
                :meteo_semaine,
                :auj_ciel_id_matin,
                :auj_ciel_id_apm,
                :dem_ciel_id_matin,
                :dem_ciel_id_apm

  def initialize(attributes = {})
                  @nom = attributes[:nom_station]
                  @langue = attributes[:langue]
                  @dateheur = attributes[:date_heur_maj]
                  @zonenom = attributes[:zone_nom]
                  @zonealtitude = attributes[:zone_altitude]
                  @datemaj = attributes[:date_maj]
                  @reference = attributes[:reference_zone]
                  @wrsqreel = attributes[:rsq_reel]
                  @valrisque = attributes[:val_risque]
                  @librisque = attributes[:lib_risque]
                  @temperaturemtn = attributes[:temperature_mtn]
                  @temperatureapm = attributes[:temperature_apm]
                  @temperaturerst = attributes[:temperature_rst]
                  @neige = attributes[:neige]
                  @cumul = attributes[:cumul]
                  @neigehorspiste = attributes[:neige_horspiste]
                  @libqualite = attributes[:lib_qualite]
                  @idqualite = attributes[:id_qualite]
                  @idqualitehorspiste = attributes[:id_qualitehorspiste]
                  @datelastsnow = attributes[:date_dern_neige]
                  @vitesse = attributes[:vitesse_vent]
                  @direction = attributes[:direction_vent]
                  @rafales = attributes[:rafales_vent]
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

  end
end