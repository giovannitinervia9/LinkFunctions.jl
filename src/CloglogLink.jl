# Establish existence of CloglogLink link
struct CloglogLink <: Link end

# linkfun
linkfun(::CloglogLink, θ::Real) = log(-log(1 - θ))

# eta_theta
eta_theta(::CloglogLink, θ::Real) = 1/((1 - θ)*log(1 - θ))

# eta2_theta2
eta2_theta2(::CloglogLink, θ::Real) = (log(1 - θ) + 1)/((1 - θ)*log(1 - θ))^2

# linkinv
linkinv(::CloglogLink, η::Real) = 1 - exp(-exp(η))

# theta_eta
theta_eta(::CloglogLink, η::Real) = exp(η - exp(η))

# theta2_eta2
theta2_eta2(::CloglogLink, η::Real) = -exp(η - exp(η))*(exp(η) - 1)