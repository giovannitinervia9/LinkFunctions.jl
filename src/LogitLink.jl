# Establish existence of LogitLink link
struct LogitLink <: Link end

# linkfun
linkfun(::LogitLink, θ::Real) = logit(θ)

# eta_theta
eta_theta(::LogitLink, θ::Real) = inv(θ - θ^2)

# eta2_theta2
eta2_theta2(::LogitLink, θ::Real) = (2*θ - 1)/(θ*(1 - θ))^2

# linkinv
linkinv(::LogitLink, η::Real) = logistic(η)

# theta_eta
theta_eta(::LogitLink, η::Real) = exp(η)/(1 + exp(η))^2

# theta2_eta2
theta2_eta2(::LogitLink, η::Real) = -exp(η)*(exp(η) - 1)/(exp(η) + 1)^3

