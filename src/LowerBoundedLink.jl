"""
    LowerBoundedLink(a)

Link function for parameters constrained to the interval (a, ∞).

This link function maps parameters θ ∈ (a, ∞) to the real line η ∈ (-∞, ∞) 
using a logarithmic transformation. It's useful when the response variable 
or parameter has a natural lower bound but no upper limit.

# Mathematical Definition
- **Link function**: η = log(θ - a)
- **Inverse link**: θ = a + exp(η)

# Fields
- `a::Float64`: Lower bound (θ > a)
"""
# Establish existence of LowerBoundedLink link
# parameters in (a, ∞)
struct LowerBoundedLink <: Link
    a::Float64
end

# linkfun
linkfun(link::LowerBoundedLink, θ::Real) = log(θ - link.a)

# eta_theta
eta_theta(link::LowerBoundedLink, θ::Real) = inv(θ - link.a)

# eta2_theta2
eta2_theta2(link::LowerBoundedLink, θ::Real) = -inv(θ - link.a)^2

# linkinv
linkinv(link::LowerBoundedLink, η::Real) = link.a + exp(η)

# theta_eta
theta_eta(link::LowerBoundedLink, η::Real) = exp(η)

# theta2_eta2
theta2_eta2(link::LowerBoundedLink, η::Real) = exp(η)

