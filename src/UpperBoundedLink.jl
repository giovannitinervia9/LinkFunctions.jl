"""
    UpperBoundedLink(b)

Link function for parameters constrained to the interval (-∞, b).

This link function maps parameters θ ∈ (-∞, b) to the real line η ∈ (-∞, ∞) 
using a logarithmic transformation of the distance from the upper bound. It's 
useful when the response variable or parameter has a natural upper bound but 
no lower limit.

# Mathematical Definition
- **Link function**: η = log(b - θ)
- **Inverse link**: θ = b - exp(η)

# Fields
- `b::Float64`: Upper bound (θ < b)
"""
# Establish existence of UpperBoundedLink link
# parameters in (-∞, b)
struct UpperBoundedLink <: Link
    b::Float64
end

# linkfun
linkfun(link::UpperBoundedLink, θ::Real) = log(link.b - θ)

# eta_theta
eta_theta(link::UpperBoundedLink, θ::Real) = inv(link.b - θ)

# eta2_theta2
eta2_theta2(link::UpperBoundedLink, θ::Real) = -inv(link.b - θ)^2

# linkinv
linkinv(link::UpperBoundedLink, η::Real) = link.b - exp(η)

# theta_eta
theta_eta(link::UpperBoundedLink, η::Real) = -exp(η)

# theta2_eta2
theta2_eta2(link::UpperBoundedLink, η::Real) = -exp(η)

