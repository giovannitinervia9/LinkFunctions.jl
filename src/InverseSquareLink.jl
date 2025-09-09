# Establish existence of InverseSquareLink link
struct InverseSquareLink <: Link end

# linkfun
linkfun(::InverseSquareLink, θ::Real) = inv(abs2(θ))

# eta_theta
eta_theta(::InverseSquareLink, θ::Real) = -2/θ^3

# eta2_theta2
eta2_theta2(::InverseSquareLink, θ::Real) = 6/θ^4

# linkinv
linkinv(::InverseSquareLink, η::Real) = inv(sqrt(η))

# theta_eta
theta_eta(::InverseSquareLink, η::Real) = -0.5/(η^(1.5))

# theta2_eta2
theta2_eta2(::InverseSquareLink, η::Real) = 0.75/(η^(2.5))

