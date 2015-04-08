# encoding : UTF-8
require 'rubygems'
gem 'shoulda'
require 'test/unit'
require 'shoulda'
require 'skiplan_client/zone'

class ZoneTest < Test::Unit::TestCase

  setup do
    attributes = {'nom' => 'ALPIN CHINAILLON',
                  'REMONTEE' => [{'nom' => 'TS LA FLORIA', 'etat' => 'O', 'type' => 'TS', 'msg' => 'Fermee pour la saison', 'heuredeb' => '09:00', 'heurefin' => '16:45'},
                                 {'nom' => 'TK LE STADE', 'etat' => 'F', 'type' => 'TK', 'msg' => 'Fermee pour la saison', 'heuredeb' => '09:00', 'heurefin' => '16:00'}],
                  'PISTE' => [{'nom' => 'LA SERPENTINE', 'etat' => 'F', 'type' => 'A', 'msg' => 'Piste de retour au Village', 'niveau' => 'V'},
                              {'nom' => 'LE VENAY', 'etat' => 'O', 'type' => 'A', 'msg' => '', 'niveau' => 'V'}]
    }
    @zone = Zone.new(attributes)
  end

  should 'retrieve the data for a given zone' do
    assert_equal 'ALPIN CHINAILLON', @zone.name
    assert_equal [{'nom' => 'TS LA FLORIA', 'etat' => 'O', 'type' => 'TS', 'msg' => 'Fermee pour la saison', 'heuredeb' => '09:00', 'heurefin' => '16:45'},
                  {'nom' => 'TK LE STADE', 'etat' => 'F', 'type' => 'TK', 'msg' => 'Fermee pour la saison', 'heuredeb' => '09:00', 'heurefin' => '16:00'}], @zone.skilifts
    assert_equal [{'nom' => 'LA SERPENTINE', 'etat' => 'F', 'type' => 'A', 'msg' => 'Piste de retour au Village', 'niveau' => 'V'},
                  {'nom' => 'LE VENAY', 'etat' => 'O', 'type' => 'A', 'msg' => '', 'niveau' => 'V'}], @zone.slopes
  end

  should 'return the ratio of open skilifts' do
    assert_equal '1/2', @zone.ratio(@zone.skilifts)
  end

  should 'return the ratio of open slopes' do
    assert_equal '1/2', @zone.ratio(@zone.slopes)
  end
end