require 'test/unit'
require './lib/ETSII_GEM.rb'

class Test_ETSII_GEM < Test::Unit::TestCase
        def setup
                @a = EtsiiGem::Densa.new(2,2)
                @a[0][0] = EtsiiGem::Fraccion.new(1,1)
                @a[0][1] = EtsiiGem::Fraccion.new(2,1)
                @a[1][0] = EtsiiGem::Fraccion.new(3,1)
                @a[1][1] = 4

                @b = EtsiiGem::Densa.new(2,2)
                @b[0][0] = EtsiiGem::Fraccion.new(5,1)
                @b[0][1] = EtsiiGem::Fraccion.new(6,1)
                @b[1][0] = 7
                @b[1][1] = 8

                @c = EtsiiGem::Dispersa.new(2,3,0 => { 0 => EtsiiGem::Fraccion.new(5,1), 1 => 6})
        end

        def test_rows
                assert_equal(2,@a.rows)
                assert_equal(2,@b.rows)
                assert_not_equal(3,@a.rows)
                assert_not_equal(3,@b.rows)
        end

        def test_cols
                assert_equal(2,@a.cols)
                assert_equal(2,@b.cols)
                assert_not_equal(3,@a.cols)
                assert_not_equal(3,@b.cols)
        end

        def test_values
                assert_equal(EtsiiGem::Fraccion.new(1,1),@a[0][0])
                assert_equal(EtsiiGem::Fraccion.new(2,1),@a[0][1])
                assert_equal(3,@a[1][0])
                assert_equal(4,@a[1][1])
        end

        def test_plus
                d = @a + @b
                assert_equal(2,d.rows)
                assert_equal(2,d.cols)
                assert_equal(6,d[0][0])
                assert_equal(8,d[0][1])
                assert_equal(10,d[1][0])
                assert_equal(EtsiiGem::Fraccion.new(12,1),d[1][1])

                assert_raise(ArgumentError) {@a + @c}
        end

        def test_minus
                d = @a - @b
                assert_equal(2,d.rows)
                assert_equal(2,d.cols)
                assert_equal(-4,d[0][0])
                assert_equal(-4,d[0][1])
                assert_equal(-4,d[1][0])
                assert_equal(EtsiiGem::Fraccion.new(4,-1),d[1][1])

                assert_raise(ArgumentError) {@a - @c}
        end

        def test_product
                d = @a * @c
                assert_equal(2,d.rows)
                assert_equal(3,d.cols)
                assert_equal(5,d[0][0])
                assert_equal(6,d[0][1])
                assert_equal(0,d[0][2])
                assert_equal(15,d[1][0])
                assert_equal(18,d[1][1])
                assert_equal(0,d[1][2])
        end

        def test_max
                assert_equal(4,@a.max)
                assert_equal(6,@c.max)
        end

        def test_min
                assert_equal(EtsiiGem::Fraccion.new(1,1),@a.min)
                assert_equal(EtsiiGem::Fraccion.new(0,1),@c.min)
        end
end
