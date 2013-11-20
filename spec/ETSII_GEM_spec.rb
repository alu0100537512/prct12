require 'lib/ETSII_GEM.rb'

describe ETSII_GEM do
  
        before :each do
                @a = ETSII_GEM::Densa.new(2,2)
                @a[0][0] = ETSII_GEM::Fraccion.new(1,1)
                @a[0][1] = ETSII_GEM::Fraccion.new(2,1)
                @a[1][0] = ETSII_GEM::Fraccion.new(3,1)
                @a[1][1] = 4

                @b = ETSII_GEM::Dispersa.new(2,2,0 => { 0 => 1, 1 => 2})
        end

        describe "\n INFO de matrices \n" do
                it "La matriz densa tiene guardado el numero de filas" do
                        @a.rows.should eq(2)
                end

                it "La matriz densa tiene guardado el numero de columnas " do
                        @a.cols.should eq(2)
                end

                it "La matriz dispersa tiene guardado el numero de filas" do
                        @b.rows.should eq(2)
                end

                it "La matriz dispersa tiene guardado el numero de columnas" do
                        @b.cols.should eq(2)
                end
        end

        describe "\n OPERANDO CON MATRICES DENSAS" do
                describe "\n SUMA \n" do
                        it "Es posible sumar matrices de igual tamano" do
                                x = ETSII_GEM::Densa.new(2,2)

                                x[0][0] = 1
                                x[0][1] = 2
                                x[1][0] = 3
                                x[1][1] = 4

                                y = @a + x

                                y[0][0].should eq(2)
                                y[0][1].should eq(4)
                                y[1][0].should eq(6)
                                y[1][1].should eq(8)
                        end

                        it "No es posible sumar matrices de tamanos diferentes" do
                                x = ETSII_GEM::Densa.new(2,1)

                                x[0][0] = 1
                                x[1][0] = 3

                                expect {@a + x}.to raise_error(ArgumentError)
                        end

                        it "Al sumar dos matrices densas se debe obtener otra matriz densa" do
                                x = ETSII_GEM::Densa.new(2,2)

                                x[0][0] = 1
                                x[0][1] = 2
                                x[1][0] = 3
                                x[1][1] = 4

                                y = @a + x

                                y.should be_an_instance_of ETSII_GEM::Densa
                        end

                end

                describe "\n RESTA \n" do
                        it "Es posible restar matrices de igual tamano" do
                                x = ETSII_GEM::Densa.new(2,2)

                                x[0][0] = ETSII_GEM::Fraccion.new(1,1)
                                x[0][1] = ETSII_GEM::Fraccion.new(2,1)
                                x[1][0] = ETSII_GEM::Fraccion.new(3,1)
                                x[1][1] = ETSII_GEM::Fraccion.new(4,1)

                                y = @a - x

                                y[0][0].should eq(ETSII_GEM::Fraccion.new(0,1))
                                y[0][1].should eq(ETSII_GEM::Fraccion.new(0,1))
                                y[1][0].should eq(ETSII_GEM::Fraccion.new(0,1))
                                y[1][1].should eq(ETSII_GEM::Fraccion.new(0,1))
                        end

                        it "No es posible restar matrices de tamanos diferentes" do
                                x = ETSII_GEM::Densa.new(2,1)

                                x[0][0] = ETSII_GEM::Fraccion.new(1,1)
                                x[1][0] = ETSII_GEM::Fraccion.new(3,1)

                                expect {@a - x}.to raise_error(ArgumentError)
                        end

                        it "Al restar dos matrices densas se debe obtener otra matriz densa" do
                                x = ETSII_GEM::Densa.new(2,2)

                                x[0][0] = 1
                                x[0][1] = 2
                                x[1][0] = 3
                                x[1][1] = 4

                                y = @a - x

                                y.should be_an_instance_of ETSII_GEM::Densa
                        end

                end

                describe "\n MULTIPLICACION \n" do
                        it "Dos matrices son multiplicables si el numero de columnas de la 1ª coincide con el numero de filas de la 2ª" do
                                x = ETSII_GEM::Densa.new(2,5)

                                x[0][0] = ETSII_GEM::Fraccion.new(1,1)
                                x[0][1] = ETSII_GEM::Fraccion.new(2,1)
                                x[0][2] = ETSII_GEM::Fraccion.new(3,1)
                                x[0][3] = ETSII_GEM::Fraccion.new(4,1)
                                x[0][4] = ETSII_GEM::Fraccion.new(5,1)
                                x[1][0] = ETSII_GEM::Fraccion.new(6,1)
                                x[1][1] = ETSII_GEM::Fraccion.new(7,1)
                                x[1][2] = ETSII_GEM::Fraccion.new(8,1)
                                x[1][3] = ETSII_GEM::Fraccion.new(9,1)
                                x[1][4] = ETSII_GEM::Fraccion.new(10,1)

                                y = @a * x

                                y[0][0].should eq(ETSII_GEM::Fraccion.new(13,1))
                                y[0][1].should eq(ETSII_GEM::Fraccion.new(16,1))
                                y[0][2].should eq(ETSII_GEM::Fraccion.new(19,1))
                                y[0][3].should eq(ETSII_GEM::Fraccion.new(22,1))
                                y[0][4].should eq(ETSII_GEM::Fraccion.new(25,1))
                                y[1][0].should eq(ETSII_GEM::Fraccion.new(27,1))
                                y[1][1].should eq(ETSII_GEM::Fraccion.new(34,1))
                                y[1][2].should eq(ETSII_GEM::Fraccion.new(41,1))
                                y[1][3].should eq(ETSII_GEM::Fraccion.new(48,1))
                                y[1][4].should eq(ETSII_GEM::Fraccion.new(55,1))
                        end

                        it "No se pueden multiplicar dos matrices si el numero de columnas de la 1ª es diferente al numero de filas de la 2ª" do
                                x = ETSII_GEM::Densa.new(1,2)

                                x[0][0] = 1
                                x[0][1] = ETSII_GEM::Fraccion.new(2,1)

                                expect {@a * x}.to raise_error(ArgumentError)
                        end

                        it "Una matriz densa se puede multiplicar por un valor determinado" do
                                @a.x(2)

                                @a[0][0].should eq(2)
                                @a[0][1].should eq(4)
                                @a[1][0].should eq(6)
                                @a[1][1].should eq(8)
                        end
                end

        describe "\n VALORES MAX Y MIN DE UNA MATRIZ \n" do
                it "Valor maximo" do
                        @a.max.should eq(4)
                end

                it "Valor minimo" do
                        @a.min.should eq(1)
                end
        end

        describe "\n OPERANDO CON MATRICES DISPERSAS \n" do
                it "Es posible sumar dos matrices dispersas" do
                        x = ETSII_GEM::Dispersa.new(2,2,0 => { 0 => 1, 1 => 2}, 1 => { 0 => 3, 1 => 4})
                        y = ETSII_GEM::Dispersa.new(2,2,0 => { 0 => 1, 1 => 2}, 1 => { 0 => 3, 1 => 4})

                        z = x + y

                        z[0][0].should eq(2)
                        z[0][1].should eq(4)
                        z[1][0].should eq(6)
                        z[1][1].should eq(8)
                end

                it "Es posible sumar una matriz dispersa y una densa" do
                        x = ETSII_GEM::Dispersa.new(2,2,0 => { 0 => 1, 1 => 2}, 1 => { 0 => 3, 1 => 4})

                        y = @a + x

                        y[0][0].should eq(2)
                        y[0][1].should eq(4)
                        y[1][0].should eq(6)
                        y[1][1].should eq(8)
                end

                it "Es posible multiplicar una matriz dispersa y una densa" do
                        x = ETSII_GEM::Dispersa.new(2,2,0 => { 0 => ETSII_GEM::Fraccion.new(5,1), 1 => 6})

                        y = @a * x

                        y[0][0].should eq(5)
                        y[0][1].should eq(6)
                        y[1][0].should eq(15)
                        y[1][1].should eq(ETSSI_GEM::Fraccion.new(18,1))
                end

        end
end
