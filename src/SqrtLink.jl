# Establish existence of SqrtLink link
struct SqrtLink <: Link end

# linkfun
linkfun(::SqrtLink, θ::Real) = sqrt(θ)

# eta_theta
eta_theta(::SqrtLink, θ::Real) = 0.5/sqrt(θ)

# eta2_theta2
eta2_theta2(::SqrtLink, θ::Real) = -0.25/(θ^(1.5))

# linkinv
linkinv(::SqrtLink, η::Real) = abs2(η)

# theta_eta
theta_eta(::SqrtLink, η::Real) = 2.0*η

# theta2_eta2
theta2_eta2(::SqrtLink, η::Real) = 2.0