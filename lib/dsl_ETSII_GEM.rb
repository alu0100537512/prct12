=begin
class MatrixDSL
require "./ETSII_GEM.rb"

	attr_accessor :oper, :name, :opt
	
	def initialize(name,&block)
		self.name = name
		self.oper = EtsiiGem::Densa.new(3,3)
		self.opt = ""
		instance_eval &block
	end
	
	def to_s
		if opt == "console"
			console = name
			console << " = "
			console << "#{oper[0] + oper[1]}"
			console
		else	
			puts "No ha especificado console"
		end
	end

	def option(option)
		self.opt << option
	end
	
	def operand(matriz)
		self.oper << matriz
	end

end

ejemplo = MatrixDSL.new("Suma") do
	option "console"
	matriz1 = EtsiiGem::Densa.new(3,3)
	matriz1[0][0] = 1
	matriz1[0][1] = 2
	matriz1[0][2] = 3
	matriz1[1][0] = 4
	matriz1[1][1] = 5
	matriz1[1][2] = 6
	matriz1[2][0] = 7
	matriz1[2][1] = 8
	matriz1[2][2] = 9
	matriz2 = EtsiiGem::Densa.new(3,3)
	matriz2[0][0] = 1
	matriz2[0][1] = 1
	matriz2[0][2] = 1
	matriz2[1][0] = 1
	matriz2[1][1] = 1
	matriz2[1][2] = 1
	matriz2[2][0] = 1
	matriz2[2][1] = 1
	matriz2[2][2] = 1
	operand (matriz1)
	operand (matriz2)
end

puts ejemplo
=end

require './ETSII_GEM.rb'

class MatrizDSL < EtsiiGem::Matriz
  attr_accessor :resultado
  
  def initialize(tipo_operacion, &block)

      @operandos = []
      @resultado = nil
      @tipo_resultado = :densa
      @operacion = :nada
      
      case tipo_operacion
        when "suma"
          @operacion = :suma
        when "resta"
          @operacion = :resta
        when "multiplicacion"
          @operacion = :multiplicacion
        else
          puts "Tipo de operacion inválido", tipo_operacion
      end

      if block_given?
        if block.arity == 1
          yield self
        else
          instance_eval &block
        end
      end
  end

   def operando(mat)
      @operandos << Densa.new(mat)
   end
end

