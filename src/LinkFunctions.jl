"""
# LinkFunctions.jl

A Julia module providing link functions for Generalized Linear Models (GLMs) and other statistical modeling contexts.

## Exports

### Abstract Type
- [`Link`](@ref): Abstract base type for all link functions

### Interface Functions
- [`linkfun`](@ref): Forward link transformation η = g(θ)
- [`linkinv`](@ref): Inverse link transformation θ = g⁻¹(η)
- [`theta_eta`](@ref): First derivative ∂θ/∂η
- [`theta2_eta2`](@ref): Second derivative ∂²θ/∂η²
- [`eta_theta`](@ref): First derivative ∂η/∂θ
- [`eta2_theta2`](@ref): Second derivative ∂²η/∂θ²

### Concrete Link Types
- [`BoundedLink`](@ref): For parameters in (a, b)
- [`CauchitLink`](@ref): For parameters in (0, 1) using inverse tangent
- [`IdentityLink`](@ref): For unrestricted parameters η = θ
- [`InverseLink`](@ref): For positive parameters using η = 1/θ
- [`InverseSquareLink`](@ref): For positive parameters using η = 1/θ²
- [`LogitLink`](@ref): For parameters in (0, 1)
- [`LowerBoundedLink`](@ref): For parameters in (a, ∞)
- [`PowerLink`](@ref): For positive parameters using η = θᵖ
- [`SqrtLink`](@ref): For positive parameters using η = √θ
- [`UpperBoundedLink`](@ref): For parameters in (-∞, b)

## Example Usage

```julia
using LinkFunctions

# Create different link functions
logit_link = LogitLink()
bounded_link = BoundedLink(0.1, 0.9)
lower_link = LowerBoundedLink(0.0)

# Apply transformations
θ = 0.7
η = linkfun(logit_link, θ)
θ_recovered = linkinv(logit_link, η)

# Compute derivatives for optimization
dθ_dη = theta_eta(logit_link, η)
d²θ_dη² = theta2_eta2(logit_link, η)
```
"""
module LinkFunctions

using LogExpFunctions
using Distributions

# Export all public interface
export Link,
       linkfun, linkinv, theta_eta, theta2_eta2, eta_theta, eta2_theta2,
       BoundedLink, CauchitLink, CloglogLink, IdentityLink, InverseLink, InverseSquareLink,
       LogitLink, LogLink, LowerBoundedLink, PowerLink, SqrtLink, UpperBoundedLink

# Include all the source files
include("Link.jl")
include("BoundedLink.jl")
include("CauchitLink.jl")
include("CloglogLink.jl")
include("IdentityLink.jl")
include("InverseLink.jl")
include("InverseSquareLink.jl")
include("LogitLink.jl")
include("LogLink.jl")
include("LowerBoundedLink.jl")
include("PowerLink.jl")
include("ProbitLink.jl")
include("SqrtLink.jl")
include("UpperBoundedLink.jl")
end # module LinkFunctions