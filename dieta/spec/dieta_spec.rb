require "spec_helper"
require "lib/dieta"

describe Dieta do
  #it "has a version number" do
   # expect(Dieta::VERSION).not_to be nil
  #end

  #it "does something useful" do
   # expect(false).to eq(true)
  #end
  before :each do
  end
  
  it "Debe existir la clase Dieta" do
    expect(Dieta.new().is_a?(Dieta)).to eq(true)
  end
  
  it "Debe existir un título para el menú" do
    expect(Dieta.new("")).to raise_error("Titulo no válido")
    expect(Dieta.new("papa")).to raise_error("Titulo no válido")
  end
  
  
  it "Debe existir el porcetaje que el menú representa de la ingesta diaria" do
    expect(Dieta.new("ALMUERZO",[30,35,40])).to raise_error("Porcentaje no válido. Intervalo incorrecto.")
    expect(Dieta.new("ALMUERZO",[])).to raise_error("Porcentaje no válido. No se ha especificado.")
  end
end
