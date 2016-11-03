require "spec_helper"
require "dieta/dieta"

describe Menu do
 
 before :each do
  desc=["Macarrones con salsa de tomate y queso parmesano","Escalope de ternera","Ensalada básica con zanahoria rallada","Mandarina","Pan de trigo integral"]
  porc=["1 1/2 cucharón","1 bistec mediano","guarnición","1 grande","1 rodaja"]
  gramos=[200,100,120,180,20]
  @dieta=Menu.new("ALMUERZO",[30,35],desc,porc,gramos,785.9,19,34,47)
 end
 
  it "Debe existir la clase Dieta" do
    expect(@dieta.is_a?(Menu)).to eq(true)
  end
  
  it "Debe existir un título para el menú" do
    expect(@dieta.titulo).to eq("ALMUERZO")
  end
  
  it "Debe existir el porcetaje que el menú representa de la ingesta diaria." do
    expect(@dieta.porcentaje).to eq([30,35])
  end
  
  it "Debe existir la descripción de un plato." do
    expect(@dieta.descripcion[0]).to eq("Macarrones con salsa de tomate y queso parmesano")
    expect(@dieta.descripcion[1]).to eq("Escalope de ternera")
    expect(@dieta.descripcion[2]).to eq("Ensalada básica con zanahoria rallada")
    expect(@dieta.descripcion[3]).to eq("Mandarina")
    expect(@dieta.descripcion[4]).to eq("Pan de trigo integral")
  end
  
  it "Debe existir la porción recomendada de un plato." do
    expect(@dieta.porciones[0]).to eq("1 1/2 cucharón")
    expect(@dieta.porciones[1]).to eq("1 bistec mediano")
    expect(@dieta.porciones[2]).to eq("guarnición")
    expect(@dieta.porciones[3]).to eq("1 grande")
    expect(@dieta.porciones[4]).to eq("1 rodaja")
  end
  
  it "Debe existir la ingesta en gramos de un plato." do
    expect(@dieta.ingesta[0]).to eq(200)
    expect(@dieta.ingesta[1]).to eq(100)
    expect(@dieta.ingesta[2]).to eq(120)
    expect(@dieta.ingesta[3]).to eq(180)
    expect(@dieta.ingesta[4]).to eq(20)
  end
  
  it "Debe existir un conjunto de platos." do
    expect(@dieta.platos).to eq(5)
  end
  
  it "Debe existir un Valor Calórico Total (V.C.T) del conjunto de platos expresado en Kilocalorías." do
    expect(@dieta.calorias).to eq(785.9)
  end
  
  it "Debe existir el porcentaje de proteínas de un conjunto de platos." do
    expect(@dieta.proteinas).to eq(19)
  end
  
  it "Debe existir el porcentaje de grasas de un conjunto de platos." do
    expect(@dieta.grasas).to eq(34)
  end
  
  it "Debe existir el porcentaje de hidrados de carbono de un conjunto de platos." do
    expect(@dieta.hidratos).to eq(47)
  end
  
  #Pruebas de metodos
  it "Existe un metodo para obtener el titulo del menu" do
    expect(@dieta.get_titulo).to eq("ALMUERZO")
  end
  
  it "Existe un metodo para el porcentaje de la ingesta diarias" do
    expect(@dieta.get_porcentaje).to eq("(30 - 35%)")
  end
  
  it "Existe un metodo para obtener la descripcion del menu" do
    expect(@dieta.get_descripcion(4)).to eq("Pan de trigo integral")
  end
  
  it "Existe un metodo para obtener un plato del menu" do
    expect(@dieta.get_plato(0)).to eq("- Macarrones con salsa de tomate y queso parmesano, 1 1/2 cucharón, 200 g")
  end
  
  it "Existe un metodo para obtener el conjunto de platos del menu" do
    expect(@dieta.get_conjunto_platos).to eq("- Macarrones con salsa de tomate y queso parmesano, 1 1/2 cucharón, 200 g\n- Escalope de ternera, 1 bistec mediano, 100 g\n- Ensalada básica con zanahoria rallada, guarnición, 120 g\n- Mandarina, 1 grande, 180 g\n- Pan de trigo integral, 1 rodaja, 20 g")
  end
  
  
  
  
end
