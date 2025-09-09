using LinkFunctions
using Test

@testset "LinkFunctions.jl" begin
    
    @testset "Link-Inverse Relationship Tests" begin
        # Test that linkfun and linkinv are inverses
        # For each link, test: θ = linkinv(linkfun(θ)) and η = linkfun(linkinv(η))
        
        @testset "IdentityLink" begin
            link = IdentityLink()
            
            # Test values in valid domain
            test_values = [-5.0, -1.0, 0.0, 1.0, 5.0, 10.0]
            
            for θ in test_values
                η = linkfun(link, θ)
                θ_recovered = linkinv(link, η)
                @test θ_recovered ≈ θ atol=1e-12
                
                # Test reverse direction
                η_recovered = linkfun(link, θ_recovered)
                @test η_recovered ≈ η atol=1e-12
            end
        end
        
        @testset "LogitLink" begin
            link = LogitLink()
            
            # Test values in valid domain (0, 1)
            test_values = [0.01, 0.1, 0.25, 0.5, 0.75, 0.9, 0.99]
            
            for θ in test_values
                η = linkfun(link, θ)
                θ_recovered = linkinv(link, η)
                @test θ_recovered ≈ θ atol=1e-12
                
                # Test reverse direction with eta values
                η_test_values = [-5.0, -1.0, 0.0, 1.0, 5.0]
                for η in η_test_values
                    θ = linkinv(link, η)
                    η_recovered = linkfun(link, θ)
                    @test η_recovered ≈ η atol=1e-12
                end
            end
        end
        
        @testset "LogLink" begin
            link = LogLink()
            
            # Test values in valid domain (0, ∞)
            test_values = [0.001, 0.1, 0.5, 1.0, 2.0, 10.0, 100.0]
            
            for θ in test_values
                η = linkfun(link, θ)
                θ_recovered = linkinv(link, η)
                @test θ_recovered ≈ θ atol=1e-12
                
                # Test reverse direction
                η_recovered = linkfun(link, θ_recovered)
                @test η_recovered ≈ η atol=1e-12
            end
        end
        
        @testset "InverseLink" begin
            link = InverseLink()
            
            # Test values in valid domain (avoid zero)
            test_values = [-10.0, -1.0, -0.1, 0.1, 1.0, 2.0, 10.0]
            
            for θ in test_values
                η = linkfun(link, θ)
                θ_recovered = linkinv(link, η)
                @test θ_recovered ≈ θ atol=1e-12
                
                # Test reverse direction
                η_recovered = linkfun(link, θ_recovered)
                @test η_recovered ≈ η atol=1e-12
            end
        end
        
        @testset "InverseSquareLink" begin
            link = InverseSquareLink()
            
            # Test values in valid domain (0, ∞)
            test_values = [0.01, 0.1, 1.0, 2.0, 10.0]
            
            for θ in test_values
                η = linkfun(link, θ)
                θ_recovered = linkinv(link, η)
                @test θ_recovered ≈ θ atol=1e-12
                
                # Test reverse direction
                η_recovered = linkfun(link, θ_recovered)
                @test η_recovered ≈ η atol=1e-12
            end
        end
        
        @testset "SqrtLink" begin
            link = SqrtLink()
            
            # Test values in valid domain (0, ∞)
            test_values = [0.001, 0.1, 0.5, 1.0, 2.0, 10.0, 100.0]
            
            for θ in test_values
                η = linkfun(link, θ)
                θ_recovered = linkinv(link, η)
                @test θ_recovered ≈ θ atol=1e-12
                
                # Test reverse direction
                η_recovered = linkfun(link, θ_recovered)
                @test η_recovered ≈ η atol=1e-12
            end
        end
        
        @testset "CauchitLink" begin
            link = CauchitLink()
            
            # Test values in valid domain (0, 1)
            test_values = [0.01, 0.1, 0.25, 0.5, 0.75, 0.9, 0.99]
            
            for θ in test_values
                η = linkfun(link, θ)
                θ_recovered = linkinv(link, η)
                @test θ_recovered ≈ θ atol=1e-12
                
                # Test reverse direction
                η_recovered = linkfun(link, θ_recovered)
                @test η_recovered ≈ η atol=1e-12
            end
        end
        
        @testset "CloglogLink" begin
            link = CloglogLink()
            
            # Test values in valid domain (0, 1)
            test_values = [0.01, 0.1, 0.25, 0.5, 0.75, 0.9, 0.99]
            
            for θ in test_values
                η = linkfun(link, θ)
                θ_recovered = linkinv(link, η)
                @test θ_recovered ≈ θ atol=1e-12
                
                # Test reverse direction
                η_recovered = linkfun(link, θ_recovered)
                @test η_recovered ≈ η atol=1e-12
            end
        end
        
        @testset "BoundedLink" begin
            link = BoundedLink(0.0, 10.0)
            
            # Test values in valid domain (0, 10)
            test_values = [0.1, 1.0, 2.5, 5.0, 7.5, 9.0, 9.9]
            
            for θ in test_values
                η = linkfun(link, θ)
                θ_recovered = linkinv(link, η)
                @test θ_recovered ≈ θ atol=1e-12
                
                # Test reverse direction
                η_recovered = linkfun(link, θ_recovered)
                @test η_recovered ≈ η atol=1e-12
            end
        end
        
        @testset "LowerBoundedLink" begin
            link = LowerBoundedLink(2.0)
            
            # Test values in valid domain (2, ∞)
            test_values = [2.1, 3.0, 5.0, 10.0, 50.0, 100.0]
            
            for θ in test_values
                η = linkfun(link, θ)
                θ_recovered = linkinv(link, η)
                @test θ_recovered ≈ θ atol=1e-12
                
                # Test reverse direction
                η_recovered = linkfun(link, θ_recovered)
                @test η_recovered ≈ η atol=1e-12
            end
        end
        
        @testset "UpperBoundedLink" begin
            link = UpperBoundedLink(5.0)
            
            # Test values in valid domain (-∞, 5)
            test_values = [-100.0, -10.0, -1.0, 0.0, 2.0, 4.0, 4.9]
            
            for θ in test_values
                η = linkfun(link, θ)
                θ_recovered = linkinv(link, η)
                @test θ_recovered ≈ θ atol=1e-12
                
                # Test reverse direction
                η_recovered = linkfun(link, θ_recovered)
                @test η_recovered ≈ η atol=1e-12
            end
        end
        
        @testset "PowerLink" begin
            link = PowerLink(2.0)  # Quadratic link
            
            # Test values in valid domain for positive power (0, ∞)
            test_values = [0.1, 0.5, 1.0, 2.0, 5.0, 10.0]
            
            for θ in test_values
                η = linkfun(link, θ)
                θ_recovered = linkinv(link, η)
                @test θ_recovered ≈ θ atol=1e-12
                
                # Test reverse direction
                η_recovered = linkfun(link, θ_recovered)
                @test η_recovered ≈ η atol=1e-12
            end
        end
    end
    
    @testset "Vectorized Operations" begin
        # Test that link functions work with vectors
        @testset "Broadcasting" begin
            link = LogitLink()
            θ_vec = [0.1, 0.3, 0.5, 0.7, 0.9]
            
            # Test vectorized linkfun
            η_vec = linkfun.(link, θ_vec)
            @test length(η_vec) == length(θ_vec)
            
            # Test vectorized linkinv
            θ_recovered = linkinv.(link, η_vec)
            @test θ_recovered ≈ θ_vec atol=1e-12
        end
    end
end