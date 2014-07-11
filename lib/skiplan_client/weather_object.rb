class WeatherObject

  attr_accessor :auj_ciel_id_matin,
                :auj_ciel_id_apm,
                :dem_ciel_id_matin,
                :dem_ciel_id_apm,
                :auj_temp_matin,
                :auj_temp_apm,
                :dem_temp_matin,
                :dem_temp_apm,
                :auj_temp_rst,
                :auj_vent_kmh,
                :auj_vent_dir,
                :auj_vit_rafales,
                :visibilite,
                :meteo_jour,
                :dem_vent_kmh,
                :dem_vent_dir,
                :dem_vit_rafales,
                :dem_visibilite,
                :meteo_lendemain,
                :j2_mat_ciel_id,
                :j2_apm_ciel_id,
                :j2_temp_matin,
                :j2_temp_apm,
                :j2_vent_kmh,
                :j2_vent_dir,
                :j2_vit_rafales,
                :j2_visibilite,
                :j3_mat_ciel_id,
                :j3_apm_ciel_id,
                :j3_temp_matin,
                :j3_temp_apm,
                :j3_vent_kmh,
                :j3_vent_dir,
                :j3_vit_rafales,
                :j3_visibilite,
                :meteo_semaine


  def initialize(attributes = {})
                                  @auj_ciel_id_matin = attributes[:auj_ciel_id_matin]
                                  @auj_ciel_id_apm = attributes[:auj_ciel_id_apm]
                                  @dem_ciel_id_matin = attributes[:dem_ciel_id_matin]
                                  @dem_ciel_id_apm = attributes[:dem_ciel_id_apm]
                                  @auj_temp_matin = attributes[:auj_temp_matin]
                                  @auj_temp_apm = attributes[:auj_temp_apm]
                                  @dem_temp_matin = attributes[:dem_temp_matin]
                                  @dem_temp_apm = attributes[:dem_temp_apm]
                                  @auj_temp_rst = attributes[:auj_temp_rst]
                                  @auj_vent_kmh = attributes[:auj_vent_kmh]
                                  @auj_vent_dir = attributes[:auj_vent_dir]
                                  @auj_vit_rafales = attributes[:auj_vit_rafales]
                                  @visibilite = attributes[:visibilite]
                                  @meteo_jour = attributes[:meteo_jour]
                                  @dem_vent_kmh = attributes[:dem_vent_kmh]
                                  @dem_vent_dir = attributes[:dem_vent_dir]
                                  @dem_vit_rafales = attributes[:dem_vit_rafales]
                                  @dem_visibilite = attributes[:dem_visibilite]
                                  @meteo_lendemain = attributes[:meteo_lendemain]
                                  @j2_mat_ciel_id = attributes[:j2_mat_ciel_id]
                                  @j2_apm_ciel_id = attributes[:j2_apm_ciel_id]
                                  @j2_temp_matin = attributes[:j2_temp_matin]
                                  @j2_temp_apm = attributes[:j2_temp_apm]
                                  @j2_vent_kmh = attributes[:j2_vent_kmh]
                                  @j2_vent_dir = attributes[:j2_vent_dir]
                                  @j2_vit_rafales = attributes[:j2_vit_rafales]
                                  @j2_visibilite = attributes[:j2_visibilite]
                                  @j3_mat_ciel_id = attributes[:j3_mat_ciel_id]
                                  @j3_apm_ciel_id = attributes[:j3_apm_ciel_id]
                                  @j3_temp_matin = attributes[:j3_temp_matin]
                                  @j3_temp_apm = attributes[:j3_temp_apm]
                                  @j3_vent_kmh = attributes[:j3_vent_kmh]
                                  @j3_vent_dir = attributes[:j3_vent_dir]
                                  @j3_vit_rafales = attributes[:j3_vit_rafales]
                                  @j3_visibilite = attributes[:j3_visibilite]
                                  @meteo_semaine = attributes[:meteo_semaine]

  end
end