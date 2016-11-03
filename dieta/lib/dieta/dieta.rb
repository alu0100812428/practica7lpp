class Menu
    attr_reader :titulo, :porcentaje, :descripcion, :porciones, :ingesta, :platos, :calorias,:proteinas,:grasas,:hidratos
    def initialize(titulo,porcentaje,desc,porc,gramos,calorias,proteinas,grasas,hidratos)
        #Titulo
        regexp = /\s*(\w*)\s*(DESAYUNO|MEDIO MAÑANA|ALMUERZO|MERIENDA|CENA)\s*(\w*)\s*/
        resultado = regexp.match(titulo)
        
        if (resultado == nil )
            raise "Titulo no válido"
        elsif ((resultado[1] != "") || (resultado[3] != ""))
            raise "Titulo no válido"
        end
        
        @titulo = resultado[2]
        
        #Porcentaje
        if !porcentaje.is_a?(Array) 
            raise "El porcentaje no es un array"
        elsif porcentaje.length > 2
            raise "El rango del porcentaje tiene que estar entre dos numeros,se han especificado 3 o mas"
        elsif (porcentaje.length == 2) && !(porcentaje[0].is_a?(Integer) && porcentaje[1].is_a?(Integer))
           raise "Uno de los numeros del rango no es un entero"
        elsif (porcentaje.length) == 1 && !(porcentaje[0].is_a?(Integer))
            raise "El porcentaje no es un entero"
        elsif porcentaje.length == 0
            raise "El porcentaje no se ha especificado"
        end
        
        @porcentaje = porcentaje
        
        #Descripcion de un plato
        if !desc.is_a?(Array)
            raise "Las descripciones de plato no estan en un array"
        elsif desc.length >= 1
            desc.each{ |descripcion|
                if !descripcion.is_a?(String)
                    raise "Las descripciones de plato deben ser cadena sde caracteres"
                end
            }
        elsif desc.length == 0
            raise "Las descripciones de plato no han sido especificadas"
        end
        
        @descripcion = desc
        
        #Porcion recomendada de un plato
        if !porc.is_a?(Array)
            raise "Las porciones de plato no estan en un array"
        elsif porc.length >= 1
            porc.each{ |porcion|
                if !porcion.is_a?(String)
                    raise "Las porciones de plato deben ser cadenas de caracteres"
                end
            }
        elsif porc.length == 0
            raise "Las descripciones de plato no han sido especificadas"
        end
        
        @porciones = porc
        
        #Ingesta de un plato
        if !gramos.is_a?(Array)
            raise "Las ingestas de plato no estan en un array"
        elsif gramos.length >= 1
            gramos.each{ |ingesta|
                if !ingesta.is_a?(Integer)
                    raise "Las ingestas de plato deben ser numeros"
                end
            }
        elsif gramos.length == 0
            raise "Las ingestas de plato no han sido especificadas"
        end
        
        @ingesta = gramos
        
        #Platos. Calculo del numero de platos y estructura correcta de sus datos
        #platos,calorias,proteinas,grasas,hidratos
        
        @platos = @descripcion.length
        if  @porciones.length != @platos
            raise "Los datos de los platos estan incompletos"
        elsif @ingesta.length != @platos
            raise "Los datos de los platos estan incompletos"
        end
        
        #Calorias
        if !calorias.is_a?(Float)
            raise "Las calorias deben ser de tipo flotante"
        end
        
        @calorias = calorias
        
        #Proteinas
        if !proteinas.is_a?(Integer)
            raise "Las proteinas deben ser de tipo entero"
        end
        
        @proteinas = proteinas
        
        #Grasas
        if !grasas.is_a?(Integer)
            raise "Las grasas deben ser de tipo entero"
        end
        
        @grasas = grasas
        
        #Hidratos de carbono
        if !hidratos.is_a?(Integer)
            raise "Los hidratos deben ser de tipo entero"
        end
        
        @hidratos = hidratos

    end
    
    #Metodo para obtener el titulo
    def get_titulo
       "#{@titulo}" 
    end
    
    #Metodo para obtener el porcentaje
    def get_porcentaje
       if @porcentaje.length==1
           "(#{@porcentaje[0]}%)"
       else
           "(#{@porcentaje[0]} - #{@porcentaje[1]}%)"
       end
               
    end
    
    #Metodo para obtener la descripcion del plato
    def get_descripcion(num_plato)
        if (num_plato<0)&&(num_plato>@platos)
            raise "El plato no existe"
        else
            "#{@descripcion[num_plato]}"
        end
    end
    
    #Metodo para obtener un plato
    def get_plato(num_plato)
        if (num_plato<0)&&(num_plato>@platos)
            raise "El plato no existe"
        else
            "- #{get_descripcion(num_plato)}, #{@porciones[num_plato]}, #{@ingesta[num_plato]} g"
        end
    end
    
    #Metodo para obtener el conjunto de platos
    def get_conjunto_platos
        i=0
        cadena=""
        while(i<@platos)
            cadena=cadena+"#{get_plato(i)}"
            if(i!=@platos-1)    #if para que no se añada \n en el ultimo plato
                cadena=cadena+"\n"
            end
            i=i+1
        end
        cadena
    end
    
end