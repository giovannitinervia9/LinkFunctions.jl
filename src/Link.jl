"""
    Link

Abstract type for link functions used in generalized linear models.

All concrete subtypes must implement the core interface functions:
- [`linkfun`](@ref): Forward link transformation η = g(θ)
- [`linkinv`](@ref): Inverse link transformation θ = g⁻¹(η) 
- [`theta_eta`](@ref): First derivative ∂θ/∂η
- [`theta2_eta2`](@ref): Second derivative ∂²θ/∂η²
- [`eta_theta`](@ref): First derivative ∂η/∂θ
- [`eta2_theta2`](@ref): Second derivative ∂²η/∂θ²

# Broadcasting
Link objects broadcast as scalars, allowing vectorized operations like:
```julia
linkfun.(link, θ_vector)
```
"""

abstract type Link end

# Make links broadcast like a scalar
Base.Broadcast.broadcastable(l::Link) = Ref(l)

# Establish existence of linkfun() function
"η = g(θ)"
function linkfun end

# Establish existence of linkinv() function
"θ = g⁻¹(η)"
function linkinv end

# Establish existence of theta_eta() function

function theta_eta end

# Establish existence of theta2_eta2() function
"∂²θ²/∂²η²"
function theta2_eta2 end

# Establish existence of eta_theta() function
"∂η/∂θ"
function eta_theta end

# Establish existence of eta2_theta2() function
"∂²η²/∂²θ²"
function eta2_theta2 end



