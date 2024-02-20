require "test_helper"

class EncomendaTest < ActiveSupport::TestCase
  test "should create shipment" do
    assert_difference('Shipment.count') do
      Shipment.create(peso: 2.5,
                      status: "Em rota",
                      data_entrega: Date.today,
                      destinatario_id: 1,
                      remetente_id: 1)
    end
  end

  test "should update shipment" do
    shipment = Shipment.create(peso: 2.5,
                               status: "Em rota",
                               data_entrega: Date.today,
                               destinatario_id: 1,
                               remetente_id: 1)
    shipment.update(peso: 3.5)
    assert_equal 3.5, shipment.peso
  end

  test "should read shipment" do
    shipment = Shipment.create(peso: 2.5,
                               status: "Em rota",
                               data_entrega: Date.today,
                               destinatario_id: 1,
                               remetente_id: 1)
    assert_equal 2.5, shipment.peso
  end

  test "should delete shipment" do
    shipment = Shipment.create(peso: 2.5,
                               status: "Em rota",
                               data_entrega: Date.today,
                               destinatario_id: 1,
                               remetente_id: 1)
    assert_difference('Shipment.count', -1) do
      shipment.destroy
    end
end
