# Establish existence of LogLink link
struct LogLink <: Link end

# linkfun
linkfun(::LogLink, θ::Real) = log(θ)

# eta_theta
eta_theta(::LogLink, θ::Real) = 1/θ

# eta2_theta2
eta2_theta2(::LogLink, θ::Real) = -1/θ^2

# linkinv
linkinv(::LogLink, η::Real) = exp(η)

# theta_eta
theta_eta(::LogLink, η::Real) = exp(η)

# theta2_eta2
theta2_eta2(::LogLink, η::Real) = exp(η)

