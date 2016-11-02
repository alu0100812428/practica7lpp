require "spec_helper"
require "dieta/dieta"

describe Menu do
 
 before :each do
  @dieta=Menu.new("ALMUERZO")
 end
 
  it "Debe existir la clase Dieta" do
    expect(@dieta.is_a?(Menu)).to eq(true)
  end
  
  it "Debe existir un título para el menú" do
    expect(@dieta.titulo).to eq("ALMUERZO")
  end
end
