
"""
    BoundedLink(a, b)

Link function for parameters constrained to the interval (a, b).

This link function maps parameters θ ∈ (a, b) to the real line η ∈ (-∞, ∞) 
using a logistic-type transformation. It's useful when the response variable 
or parameter has natural bounds.

# Mathematical Definition
- **Link function**: η = log((θ - a)/(b - θ))
- **Inverse link**: θ = (a + b·exp(η))/(1 + exp(η))

# Fields
- `a::Float64`: Lower bound (θ > a)
- `b::Float64`: Upper bound (θ < b)

# Requirements
- Must have a < b for a valid bounded interval
"""
# Establish existence of BoundedLink link
# parameters in (a, b)
struct BoundedLink <: Link
    a::Float64
    b::Float64
end

# linkfun
linkfun(link::BoundedLink, θ::Real) = log((θ - link.a)/(link.b - θ))

# eta_theta
eta_theta(link::BoundedLink, θ::Real) = (link.b - link.a)/((θ - link.a)*(link.b - θ))

# eta2_theta2
eta2_theta2(link::BoundedLink, θ::Real) = ((link.a - link.b)*(link.a + link.b - 2*θ))/((θ - link.a)*(link.b - θ))^2

# linkinv
linkinv(link::BoundedLink, η::Real) = (link.a + link.b*exp(η))/(1 + exp(η))

# theta_eta
theta_eta(link::BoundedLink, η::Real) = exp(η)*(link.b - link.a)/(1 + exp(η))^2

# theta2_eta2
theta2_eta2(link::BoundedLink, η::Real) = exp(η)*(exp(η) - 1)*(link.a - link.b)/(1 + exp(η))^3

