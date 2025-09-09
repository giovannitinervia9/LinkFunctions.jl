# Establish existence of InverseLink link
struct InverseLink <: Link end

# linkfun
linkfun(::InverseLink, θ::Real) = inv(θ)

# eta_theta
eta_theta(::InverseLink, θ::Real) = -1/θ^2

# eta2_theta2
eta2_theta2(::InverseLink, θ::Real) = 2/θ^3

# linkinv
linkinv(::InverseLink, η::Real) = inv(η)

# theta_eta
theta_eta(::InverseLink, η::Real) = -1/η^2

# theta2_eta2
theta2_eta2(::InverseLink, η::Real) = 2/η^3