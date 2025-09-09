# Establish existence of CauchitLink link
struct CauchitLink <: Link end

# linkfun
linkfun(::CauchitLink, θ::Real) = tan(π * (θ - oftype(θ, 1/2)))

# eta_theta
eta_theta(::CauchitLink, θ::Real) =  π * csc(π*θ)^2

# eta2_theta2
eta2_theta2(::CauchitLink, θ::Real) = -2*π^2*cot(π*θ)*csc(π*θ)^2

# linkinv
linkinv(::CauchitLink, η::Real) = oftype(η, 1/2) + atan(η) / π

# theta_eta
theta_eta(::CauchitLink, η::Real) = 1/(π*η^2 + π)

# theta2_eta2
theta2_eta2(::CauchitLink, η::Real) = -(2*η)/(π*(η^2 + 1)^2)

